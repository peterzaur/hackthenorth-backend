Using virtualenv to run flask api server
# Pre-steps
1. [sudo] easy_install pip
2. [sudo] pip install virtualenv

# Post-install steps
1. source env/bin/activate
2. pip install -r requirements.txt
3. when you're done, run `deactive`

# Trying it out
In a python console...
    >>> import json  # import simplejson as json, if on Python 2.5
    >>> import requests  # python-requests is installable from PyPI...
    >>> newuser = {'id': 1, 'name': u'each3ric', 'message': u'hello, world'}
    >>> r = requests.post('/api/person', data=json.dumps(newperson), headers={'content-type': 'application/json'})

Then go to http://0.0.0.0:12345/api/user/1 in a browser to check it out
