#!/usr/bin/env node
/**
 * Darryl Pogue, 2012
 *
 * A cordova-client hook to compile ./www/jade/index.jade to ./www/index.html as part of the build process.
 * Requires node.js and jade to be installed.
 *
 * Copy this into the .cordova/hooks/before_build folder of your project, and make it executable.
 
 * chmod +x hooks/before_build/*

 */
var fs = require('fs');
var path = require('path');
 
function compile_jade(src, dst) {
    var jade = require('jade');
    var options = {
        filename: src,
        pretty: true
    };
 
    try {
        var stat = fs.lstatSync(src);
        if (stat.isFile()) {
            var str = fs.readFileSync(src, 'utf8');
            var fn = jade.compile(str, options);
            fs.writeFileSync(dst, fn(options));
        }
    } catch (e) {
        throw e;
    }
}
 
var assets = path.join('.', 'www');
 
// If ./www/jade/ exists, compile the jade files
var jade_index = path.join(assets, 'jade', 'index.jade');
if (fs.existsSync(jade_index)) {
    compile_jade(jade_index, path.join(assets, 'index.html'));
}