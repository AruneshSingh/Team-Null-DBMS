# Police--> Where are my friends right now?
# input will be police
# output will be places location where friends are there 

import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,officer_id):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()

  # get edges/roads from table 'road'
  project.execute ("Select F.fellow_officer_ID,T.place_Name,T.location from fellow_police as F,police as P,place as T where "+str(officer_id)+"= F.officer_ID and T.place_ID= P.location_ID and F.fellow_officer_ID=P.officer_ID")
  my_friends = []
  for i in project:
    my_friends.append(str(i[0])+","+i[1]+","+i[2])
  if(my_friends==[]):
  	my_friends.append("No fellow officers nearby")
  return my_friends

if __name__ == '__main__':
  if(len(sys.argv) == 1):
    print(query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter officer_id        -> "))))
  else:
    print(query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter officer_id        -> "))))