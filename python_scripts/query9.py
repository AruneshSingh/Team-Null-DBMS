#What is the best road to improve street lighting
import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()
  project.execute ("Select road_ID from road where ambience_level=(Select MIN(ambience_level) from road)")
  k=0
  k=int(k)
  for i in project:
    k+=i[0];
  print(k)
  return k
if __name__ == '__main__':
  if(len(sys.argv) == 1):
    query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
  else:
    query('127.0.0.1','shubham','randomNULL_123','tut1')
