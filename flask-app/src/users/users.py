from flask import Blueprint, request, jsonify, make_response
import json
from src import db


users = Blueprint('users', __name__)


@users.route('/panini', methods=['GET'])
def panini():
    cursor = db.get_db().cursor()
    cursor.execute(''' select CompanyName from AlbumCompany 
                        where CompanyName = 'Panini'           
                    ''')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@users.route('/getOrders', methods=['GET'])
def get_orders():
    cursor = db.get_db().cursor()
    cursor.execute(''' select * from Orders          
                    ''')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@users.route('/order', methods=['POST'])
def add_order():
    cursor = db.get_db().cursor()
    ship = request.form['ship']
    quant = request.form['quant']
    cursor.execute(
        f''' 
            insert into Orders (ShipAddress, Quantity, TotalPrice, OrderDate)
            VALUES ('{ship}', '{quant}', 15, '12/7/2022')
        ''')
    db.get_db().commit()
    return "Success"
