import flask
import flask.ext.sqlalchemy
import flask.ext.restless
from flask_mail import Mail
from flask_mail import Message

app = flask.Flask(__name__)
app.config.from_object('config')
db = flask.ext.sqlalchemy.SQLAlchemy(app)
mail = Mail(app)

# Create Flask-SQLAlchemy models
class User(db.Model):
   id = db.Column(db.Integer, primary_key=True)
   username = db.Column(db.String)
   message = db.Column(db.String)

# Create db tables
db.create_all()

# Init Flask-Restless API manager, create endpoint (at <host>/api/<tablename>)
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)
manager.create_api(User, methods=['GET', 'POST', 'DELETE'])

@app.route("/", methods=['GET'])
def sendemail():
   return send()

def send(): 
   msg = Message("Hello", sender="nolan@rocks.com", recipients=["liu.peter.j@gmail.com"])
   mail.send(msg)

# Start flask
app.run()
