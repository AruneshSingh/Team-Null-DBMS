
# Driver first query----> What is route from A to B?
# input will be source and destination
# Compile ---> python3 query1.py local for local server otherwise python3 query1.py

import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,source,destination):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()

  # get edges/roads from table 'road'
  project.execute ("Select placeA_ID,placeB_ID from road")
  number_of_places = 150
  adjacency_list = [[] for i in range(number_of_places + 1)]

  for i in project:
    adjacency_list[i[0]].append(i[1])
    adjacency_list[i[1]].append(i[0])

  path = bfs(adjacency_list,source,destination,number_of_places)
  return insert_landmarks(path,project,number_of_places)

def insert_landmarks(path,project,number_of_places):
  project.execute("Select R.placeA_ID,R.placeB_ID,L.name from landmarks L,road R where L.road_ID=R.road_ID")
  dictionary ={}
  for i in range(1,number_of_places+1):
    dictionary[i] = {}

  for i in project:
    (dictionary[i[0]])[i[1]] = list(i[2].split(';'))
    (dictionary[i[1]])[i[0]] = (dictionary[i[0]])[i[1]][::-1]
  ans = []
  for i in range(0,len(path)-1):
    ans.append("You are at "+str(path[i]))
    ans.extend(dictionary[path[i]][path[i+1]])
  ans.append("You reached the destination "+str(path[-1]))
  return ans
  
def bfs(adjacency_list,source,destination,number_of_places):
  
  q = queue.Queue()
  par = [0] * (number_of_places + 1)
  root = par[source] = source
  q.put(root)

  while(not q.empty()):
    root = q.get()
    for i in adjacency_list[root]:
      if( par[i] == 0):
        par[i] = root
        q.put(i)

  path = [destination]
  while (destination != source):
    destination = par[destination]
    path.append(destination)
  return path[::-1]

if __name__ == '__main__':
  if(len(sys.argv) == 1):
    print(query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter source        -> ")),int(input("Enter destination   -> "))))
  else:
    print(query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter source        -> ")),int(input("Enter destination   -> "))))