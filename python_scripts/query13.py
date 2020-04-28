# Travellers How is XYZ Place?
# input will be place id
# output will be the reviews and category of the place

import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE,place_id):
	db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
	project=db.cursor()
	project.execute ("Select category,reason from place p,review r where "+str(place_id)+" = p.place_ID and "+str(place_id)+" = r.place_ID")
	typ=''
	rev=''
	cnt=0
	cnt=int(cnt)
	for i in project:
		cnt+=1
		if(cnt==1):
			typ+=i[0]
		if(cnt>1):
			rev+=" , "
		rev+=i[-1]
	if(cnt==0):
		typ+="no type"
		rev+="no review"
	print("Type of this place is "+typ)
	print("Reviews of this place is "+rev)
	out=["Type of this place is "+typ,"Reviews of this place is "+rev]
	return out

if __name__ == '__main__':
	if(len(sys.argv) == 1):
		query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter place_ID        -> ")))
	else:
		query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter place_ID        -> ")))
