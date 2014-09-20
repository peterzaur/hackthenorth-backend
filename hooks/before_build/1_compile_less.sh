#!/bin/bash

# make sure to run npm install less -g and chmod +x hooks/before_build/* before this

lessc www/less/index.less > www/css/index.css