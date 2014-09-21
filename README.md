Using virtualenv to run flask api server

# Pre-steps
1. [sudo] easy_install pip
2. [sudo] pip install virtualenv

# Post-install steps
1. source env/bin/activate
2. pip install -r requirements.txt
3. when you're done, run `deactivate`

# Some useful heroku commands
`heroku pg:psql`
`heroku run bash`
`heroku run python`
`heroku ps:scale web=1` or `heroku ps:scale web=0`

Then, in a python console...

    >>> import json  # import simplejson as json, if on Python 2.5
    >>> import requests  # python-requests is installable from PyPI...
    >>> newuser = {'id': 1, 'name': u'each3ric', 'message': u'hello, world'}
    >>> r = requests.post('http://mir-htn.herokuapp.com/api/user', data=json.dumps(newuser), headers={'content-type': 'application/json'})

Then go to http://mir-htn.herokuapp.com/api/user/1 in a browser to check it out
