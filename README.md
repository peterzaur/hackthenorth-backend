Fork the repo
Install XCode Developer tools
Install npm/node

sudo npm install -g cordova

git clone https://git-wip-us.apache.org/repos/asf/cordova-plugman.git
cd cordova-plugman
npm install
sudo npm link
cd ..
git clone https://git-wip-us.apache.org/repos/asf/cordova-cli.git
cd cordova-cli
npm install
sudo npm link
npm link plugman
cd ..

sudo npm install -g less
sudo npm install -g jade

sudo npm install .

cordova build ios
cordova emulate ios
cordova run ios