import flask
import flask.ext.sqlalchemy
import flask.ext.restless

app = flask.Flask(__name__)
app.config.from_object('config')
db = flask.ext.sqlalchemy.SQLAlchemy(app)

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

# Start flask
app.run(host='0.0.0.0', port=12345)
