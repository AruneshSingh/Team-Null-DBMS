#can I get a ride to xyz place(checking for road_ID)
import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,place_id):
	db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
	project=db.cursor()
	project.execute ("Select d.driver_ID from drivers d where "+str(place_id)+" = d.road_ID")
	typ=''
	cnt=0
	cnt=int(cnt)
	out="Driver number:"
	print("Driver number:",end="")
	for i in project:
		cnt+=1
		if(cnt>1):
			out+=","
			print(",",end="")
		out+=str(i[0])
		print(i[0],end="");
	if(cnt>=1):
		out+=(" is/are available to pick you up")
	if(cnt==0):
		out+=("No driver in your location")
	return out

if __name__ == '__main__':
	if(len(sys.argv) == 1):
		query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter place        -> ")))
	else:
		query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter place        -> ")))