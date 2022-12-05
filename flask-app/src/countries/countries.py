from flask import Blueprint, request, jsonify, make_response
import json
from src import db


countries = Blueprint('countries', __name__)


@countries.route('/countries', methods=['GET'])
def get_countries():
    cursor = db.get_db().cursor()
    cursor.execute(''' select CountryName from Country ''')
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


@countries.route('/countries/players/<CountryName>', methods=['GET'])
def get_players(CountryName):
    cursor = db.get_db().cursor()
    cursor.execute(
        ''' select FirstName, LastName, JerseyNum from Player where CountryName = '{}' '''.format(CountryName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@countries.route('/countries/stats/<CountryName>', methods=['GET'])
def get_stats(CountryName):
    cursor = db.get_db().cursor()
    cursor.execute(
        ''' select Ranking, LastChampionshipDate, NumberOfCups from Country where CountryName = '{}' '''.format(CountryName))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@countries.route('/countries/<CountryName>/<JerseyNum>', methods=['GET'])
def get_player(CountryName, JerseyNum):
    cursor = db.get_db().cursor()
    cursor.execute(
        ''' select * 
            from Player 
            where CountryName = '{0}' and JerseyNum = {1}'''.format(CountryName, JerseyNum))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@countries.route('/countries/players/<CountryName>', methods=['POST'])
def add_player(CountryName):
    cursor = db.get_db().cursor()
    first = request.form['first']
    last = request.form['last']
    age = request.form['age']
    num = request.form['num']
    pos = request.form['pos']
    cob = request.form['cob']
    team = request.form['team']
    goals = request.form['goals']
    assists = request.form['assists']
    cursor.execute(
        f''' 
            INSERT INTO Player(FirstName, LastName, Age, JerseyNum, Position, CityOfBirth, ClubTeam, CareerGoals, CareerAssists, CountryName)
            VALUES ('{first}', '{last}', '{age}', '{num}', '{pos}', '{cob}', '{team}', '{goals}', '{assists}', '{CountryName}')
        ''')
    db.get_db().commit()
    return "Success"
