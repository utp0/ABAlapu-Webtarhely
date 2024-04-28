const fs = require('fs');

const storagePath = './storage';

// function mkdir(path){
//     fs.mkdirSync(storagePath + path, {recursive: true});
// }
//
// function writeFile(path, data) {
//     mkdir(path.substr(0, path.lastIndexOf('/')));
//     fs.writeFileSync(storagePath + path, data);
// }
//
// function serveFile(path, res) {
//     res.download(storagePath + path);
// }

function writeFile(id, data) {
    fs.writeFileSync(`${storagePath}/${id}`, data);
}

function serveFile(id, res) {
    res.download(`${storagePath}/${id}`);
}

module.exports = {
    writeFile, serveFile
};
