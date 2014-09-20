import os
basedir = os.path.abspath(os.path.dirname(__file__))

DEBUG = True
SQLALCHEMY_DATABASE_URI = os.environ['DATABASE_URL']
SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')

MAIL_SERVER = 'smtp.gmail.com'
MAIL_PORT = 465
MAIL_USE_TLS = True
MAIL_USE_SSL = True
MAIL_USERNAME =  'makeitrainhtn@gmail.com'
MAIL_PASSWORD = 'wearehackingthenorth'
DEFAULT_MAIL_SENDER = None
MAIL_MAX_EMAILS = None
MAIL_SUPPRESS_SEND = None
