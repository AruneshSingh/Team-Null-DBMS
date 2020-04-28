#Most challans
import pymysql
import queue
import sys

def query(HOST,USER,PASSWORD,DATABASE):
	db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
	project=db.cursor()
	#project.execute("GRANT ALL")
	project.execute ("select driver_ID, count(*) as challans from challan group by driver_ID order by count(*) desc")
	cnt=0
	cnt=int(cnt)
	out="The driver(s) with most challans is driver number: "
	print("The driver(s) with most challans is driver number: ")
	for i in project:
		cnt+=1
		if(cnt==1):
			out+=str(i[0])
	return out



if __name__ == '__main__':
	if(len(sys.argv) == 1):
		query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	else:
		query('127.0.0.1','shubham','randomNULL_123','tut1')