import flask
import flask.ext.sqlalchemy
import flask.ext.restless
from werkzeug.contrib.fixers import ProxyFix

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

app.wsgi_app = ProxyFix(app.wsgi_app)

# Start flask
app.run()
