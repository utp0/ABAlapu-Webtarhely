const fs = require('fs');

const storagePath = './storage/';

function mkdir(path){
    fs.mkdirSync(storagePath + path, {recursive: true});
}

function writeFile(path, data) {
    mkdir(path.substr(0, path.lastIndexOf('/')));
    fs.writeFileSync(storagePath + path, data);
}

function serveFile(path, res) {
    res.download(storagePath + path);
}

module.exports = {
    mkdir, writeFile, serveFile
};
