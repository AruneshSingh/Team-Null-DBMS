# Travellers Where are my friends right now?
# input will be person id
# output will be places location where friends are there 

import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,person_id):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()

  # get edges/roads from table 'road'
  project.execute ("Select T.name,T.location from friend as F,traveller as T where "+str(person_id)+"= F.person_ID and T.traveller_ID= F.friend_ID")
  my_friends = []
  for i in project:
    my_friends.append(str(i[0])+","+i[1])
  if(my_friends==[]):
  	my_friends = "No friends nearby"
  return my_friends

if __name__ == '__main__':
  if(len(sys.argv) == 1):
    print(query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter person_ID        -> "))))
  else:
    print(query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter person_ID        -> "))))