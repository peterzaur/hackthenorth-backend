# Import the database object (db) from the main application module
from app import db

# Define a User model
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String)
    message = db.Column(db.String)

    def __init__(self, username, message):
        self.name = name
        self.email = email
        self.password = password
