from flask import Blueprint, request, jsonify, make_response
import json
from src import db


customers = Blueprint('countries', __name__)

# Get all customers from the DB


@customers.route('/countries', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute(''' select * from Player where CountryName = 'China' ''')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer detail for customer with particular userID


@customers.route('/countries/<CountryName>', methods=['GET'])
def get_customer(CountryName):
    cursor = db.get_db().cursor()
    cursor.execute(
        ''' select * from Player where CountryName = '{}' '''.format(CountryName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
