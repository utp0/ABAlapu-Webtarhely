function parse(input) {
    let path = input;
    if(path[0] === '/'){
	path = path.substr(path.substr(1).indexOf('/') + 2);
    }
    let pos = path.lastIndexOf('/')
    let filename = path.substr(pos+1);
    path = path.substr(0, pos);
    return {
	path: path,
	name: filename,
	fullpath: path ? `${path}/${filename}` : filename
    }
}

module.exports = parse;
