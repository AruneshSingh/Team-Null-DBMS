#Driver -->route for gas station from given station
import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,driver_id,amount,reason):
  db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
  project=db.cursor()
  project.execute("Select count(*) from challan")
  id=0
  for i in project:
    id=i[0]+1
  q = "Insert into challan(challan_ID,driver_ID,amount,reason) VALUES ('"+str(id)+"','"+str(driver_id)+"','"+str(amount)+"','"+reason+"')"
  print(q)
  project.execute (q)
  db.commit()
  return "Succefully Executed"
  
if __name__ == '__main__':
  if(len(sys.argv) == 1):
    print(query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter driver_id  -> ")),int(input("Amount    -> ")),input("Reason  ->")))
  else:
    print(query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter driver_id  -> ")),int(input("Amount    -> ")),input("Reason  ->")))