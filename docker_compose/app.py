from flask import Flask, render_template, request, jsonify
import mysql.connector
import os

app = Flask(__name__)

cnx = mysql.connector.connect(
  host=os.getenv('MYSQL_HOST'),
  user="root",
  password=os.getenv('MYSQL_ROOT_PASSWORD'),
  database=os.getenv('MYSQL_DATABASE')
)

cur = cnx.cursor(buffered=True)
cur.execute("CREATE TABLE IF NOT EXISTS user (name VARCHAR(100))")

@app.route("/", methods=['GET', 'POST'])
def index():
  if request.method == 'POST':
    name = request.form['name']
    
    # insertion en db
    query = "INSERT INTO user (name) VALUES ('%s')" % (name)
    cur.execute(query)
    cnx.commit()
    
    return name
  return render_template('index.html')

@app.route("/user", methods=['GET'])
def user_all():
  cur.execute("SELECT * FROM user")
  users = cur.fetchall()
  return jsonify(users)