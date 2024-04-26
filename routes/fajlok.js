const express = require('express');
const router = express.Router();

const fileupload = require('multer')();

const dao = require('../dao/dao.js');
const storage = require('../misc/storage.js');

router.get('/fajlok/*', async (req, res) => {
    let path = req.path.substr('/fajlok/'.length);
    let file = await dao.objFile(path);
    console.log(file);

    if(file.MAPPA === 1){
	res.render('fajlok_dir', {
	    status:  pop(req.session),
	    session: req.session,
	    path:    path,
	    files:   await dao.listFiles(path)
	});
	return;
    }
    if(file.MAPPA === 0){
	res.render('fajlok_file', {
	    status:  pop(req.session),
	    session: req.session,
	    path:    path,
	    file:    file,
	    comments:await dao.listComments(file.ID)
	});
	return;
    }
    res.redirect('/');
});

// const repl = require('node:repl');
// repl.start().context.req = req;

router.post('/fajlok/*', fileupload.array('file'), async (req, res) => {
    let path = req.path.substr('/fajlok/'.length);
    for(const file of req.files){
	let filepath = `${path}/${file.originalname}`;
	await dao.boolNewFile(filepath, file.size, 0);
	storage.writeFile(filepath, file.buffer);
    }
    res.redirect(req.path);
});

module.exports = router;
