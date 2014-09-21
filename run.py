import flask
import flask.ext.sqlalchemy
import flask.ext.restless
import json
# import os
# import psycopg2
# import urlparse

# urlparse.uses_netloc.append("postgres")
# url = urlparse.urlparse(os.environ["DATABASE_URL"])
# conn = psycopg2.connect(
   # database=url.path[1:],
   # user=url.username,
   # password=url.password,
   # host=url.hostname,
   # port=url.port
# )

app = flask.Flask(__name__)
app.config.from_object('config')
db = flask.ext.sqlalchemy.SQLAlchemy(app)

# Create Flask-SQLAlchemy models
class Users(db.Model):
   id = db.Column(db.String, primary_key=True)
   password = db.Column(db.String)

# Create db tables
db.create_all()

# Init Flask-Restless API manager, create endpoint (at <host>/api/<tablename>)
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)
manager.create_api(Users, methods=['GET', 'POST', 'PUT'])

@app.route('/getloginstatus/<user>', methods=['POST'])
def getLoginStatus(user):
    data = flask.request.json
    email_address = data['email']
    #s = text("SELECT password FROM users WHERE id = " + email_address)
    #print(s)
    bar = db.session.query(Users).get(user)
    #print(email) 
    return "User: derp"

# Start flask
if __name__ == '__main__':
    app.run(debug = True)
