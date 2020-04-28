#Driver -->route for parking from given station
import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,source):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()
  # get edges/roads from table 'road'
  project.execute ("Select P.place_ID from place P where P.place_Name='Parking'")
  available_parking_stations = []
  for i in project:
    available_parking_stations.append(i[0])

  project.execute ("Select placeA_ID,placeB_ID from road")
  number_of_places = 150
  adjacency_list = [[] for i in range(number_of_places + 1)]

  for i in project:
    adjacency_list[i[0]].append(i[1])
    adjacency_list[i[1]].append(i[0])

  place_name = {}
  project.execute("Select place_Id,place_name from place")
  for i in project:
    place_name[i[0]]=i[1]
  path = bfs(adjacency_list,source,available_parking_stations ,number_of_places)
  return [place_name[i] for i in path]

def bfs(adjacency_list,source,available_destinations,number_of_places):
  
  q = queue.Queue()
  par = [0] * (number_of_places + 1)
  root = par[source] = source
  q.put(root)
  destination = -1
  while(not q.empty()):
    root = q.get()
    if(root in available_destinations):
      destination = root
      break
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
    print(query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter source        -> "))))
  else:
    print(query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter source        -> "))))