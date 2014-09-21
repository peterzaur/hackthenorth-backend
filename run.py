import flask
import flask.ext.sqlalchemy
import flask.ext.restless
import json

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
    ar = db.engine.execute("select * from users)
    for row in result:
        print row['password']
    #print(email) 
    return "User: derp"
    # status = false
    # print(status)
    # print(flask.request.json)
    # return status

# Start flask
if __name__ == '__main__':
    app.run(debug = True)
