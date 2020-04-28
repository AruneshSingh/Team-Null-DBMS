
# Traveller first query----> I have limited time/money/interest. What can I go in the city?
# input will be source and destination
import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,time,money,interest,position):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()

  project.execute("Select P.place_ID from place P where P.category='"+interest+"'")
  available_places = []
  for i in project:
    available_places.append(i[0])

  project.execute ("Select placeA_ID,placeB_ID,time_to_travel_by,price from road")
  number_of_places = 150
  adjacency_list = [{} for i in range(number_of_places + 1)]

#time,money for road
  for i in project:
    adjacency_list[i[0]][i[1]]=[i[2],i[3]]
    adjacency_list[i[1]][i[0]]=[i[2],i[3]]

  return bfs(adjacency_list,position,available_places,number_of_places,time,money,project)

def bfs(adjacency_list,source,available_places,number_of_places,time,money,project):
  #time taken,money req, number of category of interset
  q = queue.Queue()
  par = [[] for i in range(number_of_places+1)]
  parents =[0]*(number_of_places +  1)
  root = parents[root] = source
  par[root] = [0,0,0]
  q.put(root)

  while(not q.empty()):
    root = q.get()
    for i in adjacency_list[root]:
      if( par[i] == []):
        par[i] = [par[root][0] + 2 * adjacency_list[root][i][0], par[root][1] + 2 * adjacency_list[root][i][1], par[root][2]]
        if i in available_places:
          par[i][2] += 1
        parents[i] = root
        q.put(i)

  possible_to_go = []

  for i in available_places:
    if(par[i][0] <= time and par[i][1] <= money):
      par[i].append(i)
      possible_to_go.append(par[i])

  possible_to_go = sorted(possible_to_go, key = lambda x:(x[2],-x[0],-x[1]),reverse=True)
  
  if possible_to_go==[]:
    return "Not Possible To Go"

  else:
    project.execute("Select place_Name from place where place_ID='"+str(possible_to_go[0][3])+"'")
    for i in project:
      destination = i[0]
    return "Visit "+i[0]+" with place_ID "+str(possible_to_go[0][3])



if __name__ == '__main__':
  if(len(sys.argv) == 1):
    print(query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter time in minutes        -> ")),int(input("Enter money   -> ")),input("Enter category    -> "),int(input("Enter current location -> "))))
  else:
    print(query('127.0.0.1','shubham','randomNULL_123','Project',int(input("Enter time in minutes        -> ")),int(input("Enter money   -> ")),input("Enter category    -> "),int(input("Enter current location -> "))))