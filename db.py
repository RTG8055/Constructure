import csv
import MySQLdb

flag=0
count =0
# round1 = {}
db  = sql.connect('localhost','root','pass','civicq')
c = db.cursor()

query = " INSERT INTO questions('ques_id','quesiton','ques_image','op1','op2','op3','op4','ans','flag','point_wt','money_wt') VALUES "
with open('Round1.csv') as file:
	readr = csv.reader(file)
	for r in readr:
		# print(', '.join(r))
		# while(r != "Round1"):
			# print(', '.join(r))
		# print(r)
		# x = ' '.join(r)
		# print(x)
		# r = x.split(',')
		# print(r[0])
		# print(type(r))
		# r = r.split(",")
		if(r[0] == "ROUND1"):
			flag =1
			continue;
		if(flag==1):
			count +=1
			# print(', '.join(r))
			# r[1] == ques_id
			# r[2] == ques in quotes
			# r[3] == ques_img 
			# r[4] == op1
			# r[5] ==op2
			# r[6] == op3
			# r[7] == op4
			# r[8] == ans
			# r[9] == pt_wt
			# r[10] == money_wt
			# r[11] == flag
			val = "('" + r[1] +"','" + r[2] +"','" + r[3] +"','"+ r[4] +"','"+ r[5] +"','"+ r[6] +"','"+ r[7] +"','"+ r[8] +"','"+ r[8] +"','"+ r[11] +"','"+ r[9] +"','"+ r[10] +"')"
			print(val)
			try:
			# Execute the SQL command
				print(c.execute(query + val + ";"))
				# c.execute(sql)
				# Commit your changes in the database
				db.commit()

			except:
				# Rollback in case there is any error
				db.rollback()

		if(count == 25):
			flag=0
# disconnect from server
db.close()
