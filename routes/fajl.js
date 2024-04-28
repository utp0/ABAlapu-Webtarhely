const express = require('express');
const router = express.Router();

const fileupload = require('multer')();

const dao = require('../dao/dao.js');
const storage = require('../misc/storage.js');
const pparse = require('../misc/pathparse.js');

router.get('/fajlok/*', async (req, res) => {
    let cdir_loc = pparse(req.path);
    let cdir = await dao.objFile(cdir_loc.path, cdir_loc.name);
    if(!cdir) {res.redirect('/'); return;}
    let pdir_loc = pparse(cdir_loc.path);
    let pdir = await dao.objFile(pdir_loc.path, pdir_loc.name);

    res.render('fajlok', {...pop(req.session),
	cdir: cdir,
	files:   [
	    {...cdir, FAJLNEV: '.'},
	    {...pdir, FAJLNEV: '..'},
	    ...(await dao.listFiles(cdir_loc.fullpath))
	]
    });
 //    if(file && file.MAPPA === 0){
	// res.render('fajlok_file', {
	//     status:  pop(req.session),
	//     session: req.session,
	//     file:    file,
	//     comments:await dao.listComments(file.ID)
	// });
	// return;
 //    }
});

router.get('/fajldl/*', async (req, res) => {
    let location = pparse(req.path);
    let file = dao.objFile(location.path, location.name);
    storage.serveFile(file.ID, res);
});

// const repl = require('node:repl');
// repl.start().context.req = req;

router.post('/fajlul/*', fileupload.array('file'), async (req, res) => {
    let location = pparse(req.path);
    for(const ufile of req.files){
	let id = await dao.idNewFile(location.fullpath, ufile.originalname, ufile.size, 0);
	storage.writeFile(id, ufile.buffer);
    }
    res.redirect(`/fajlok/` + location.fullpath);
});

router.post('/fajlml/*', async (req, res) => {
    let location = pparse(req.path);
    await dao.idNewFile(location.fullpath, req.body.mappanev, -1, 1);
    res.redirect('/fajlok/' + location.fullpath);
});

module.exports = router;
