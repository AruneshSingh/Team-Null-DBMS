#Least congested place
import pymysql
import queue
import sys
def query(HOST,USER,PASSWORD,DATABASE,time):
	db = pymysql.connect(host=HOST,user=USER,passwd=PASSWORD,database=DATABASE)
	project=db.cursor()
	if(time<7):
		project.execute ("Select place_ID from population where people1 = (Select MIN(people1) from population)")
	elif(time<13):
		project.execute ("Select place_ID from population where people2 = (Select MIN(people2) from population)")
	elif(time<19):
		project.execute ("Select place_ID from population where people3 = (Select MIN(people3) from population)")
	elif(time<25):
		project.execute ("Select place_ID from population where people4 = (Select MIN(people4) from population)")		
	else:
		return ("Invalid time")
	cnt=0
	cnt=int(cnt)
	out="Place_id of the least congested place during this time is :"
	print("Place_id of the least congested place during this time is :",end="")

	for i in project:
		cnt+=1
		if(cnt>1):
			out+=" and "
			print(" and ",end="")
		out+=str(i[0])
		print(i[0], end="")
	return out

if __name__ == '__main__':
	if(len(sys.argv) == 1):
		query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(input("Enter time        -> ")))
	else:
		query('127.0.0.1','shubham','randomNULL_123','tut1',int(input("Enter time        -> ")))