from flask import Flask
from flask.ext import restful
from flask.ext.sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('config')
api = restful.Api(app)
db = SQLAlchemy(app)
db.init_app(ap:qp)
with app.app_context():
   db.create_all()

from models import *

class HelloWorld(restful.Resource):
   def get(self, user_id):
      return {'hello': 'world'}

api.add_resource(HelloWorld, '/')

if __name__ == "__main__":
   app.run()
