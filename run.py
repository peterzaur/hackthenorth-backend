import flask
import flask.ext.sqlalchemy
import flask.ext.restless

app = flask.Flask(__name__)
app.config.from_object('config')
db = flask.ext.sqlalchemy.SQLAlchemy(app)

# Create Flask-SQLAlchemy models
class Users(db.Model):
   id = db.Column(db.Integer, primary_key=True)
   email = db.Column(db.String)
   password = db.Column(db.String)

# Create db tables
db.create_all()

# Init Flask-Restless API manager, create endpoint (at <host>/api/<tablename>)
manager = flask.ext.restless.APIManager(app, flask_sqlalchemy_db=db)
manager.create_api(Users, methods=['GET', 'POST'])

# Start flask
if __name__ == '__main__':
    app.run(debug = True)
