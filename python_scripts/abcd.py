from flask import Flask,request,jsonify
import query1,query2,query3,query4,query5,query6, query7,query8,query9,query10,query11,query12,query13,query14,query15,query16,query17,query18, query19,query20
app = Flask(__name__)

@app.route('/query1', methods=['GET'])
def run():
	d={}
	d['num1']=str(request.args['num1'])
	d['num2']=str(request.args['num2'])
	path=query1.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']),int(d['num2']))
	print(jsonify(path))
	return jsonify(path)

@app.route('/query2', methods=['GET'])
def run2():
	d={}
	d['num1']=str(request.args['num1'])
	path=query2.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	print(jsonify(path))
	return jsonify(path)

@app.route('/query3', methods=['GET'])
def run3():
	d={}
	d['num1']=str(request.args['num1'])
	path=query3.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query4', methods=['GET'])
def run4():
	d={}
	d['num1']=str(request.args['num1'])
	path=query4.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query5', methods=['GET'])
def run5():
	d={}
	d['num1']=str(request.args['num1'])
	path=query5.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query6', methods=['GET'])
def run6():
	d={}
	d['num1']=str(request.args['num1'])
	d['num2']=str(request.args['num2'])
	d['num3']=str(request.args['num3'])
	d['num4']=str(request.args['num4'])
	path=query6.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']),int(d['num2']),str(d['num3']),int(d['num4']))
	
	return jsonify(path)

@app.route('/query7',methods=['GET'])
def run7():
	
	path=query7.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query8',methods=['GET'])
def run8():
	
	path=query8.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query9',methods=['GET'])
def run9():
	
	path=query9.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query10',methods=['GET'])
def run10():
	
	path=query10.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query11',methods=['GET'])
def run11():
	
	path=query11.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query12',methods=['GET'])
def run12():
	
	path=query12.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query13', methods=['GET'])
def run13():
	d={}
	d['num1']=str(request.args['num1'])
	path=query13.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query14',methods=['GET'])
def run14():
	
	path=query14.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query15', methods=['GET'])
def run15():
	d={}
	d['num1']=str(request.args['num1'])
	path=query15.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query16',methods=['GET'])
def run16():
	
	path=query16.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv')
	
	return jsonify(path)

@app.route('/query17', methods=['GET'])
def run17():
	d={}
	d['num1']=str(request.args['num1'])
	path=query17.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query18', methods=['GET'])
def run18():
	d={}
	d['num1']=str(request.args['num1'])
	path=query18.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']))
	
	return jsonify(path)

@app.route('/query19', methods=['GET'])
def run19():
	d={}
	d['num1']=str(request.args['num1'])
	d['num2']=str(request.args['num2'])
	d['num3']=str(request.args['num3'])

	path=query19.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']),int(d['num2']),str(d['num3']))
	
	return jsonify(path)

@app.route('/query20', methods=['GET'])
def run20():
	d={}
	d['num1']=str(request.args['num1'])
	d['num2']=str(request.args['num2'])
	path=query20.query('37.59.55.185','OH7hLHUPZv','PCYgN41QXH','OH7hLHUPZv',int(d['num1']),int(d['num2']))
	print(jsonify(str(path)))
	return jsonify(str(path))

app.run()