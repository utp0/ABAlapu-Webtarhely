const express = require('express');
const router = express.Router();

const dao = require('../dao/dao.js');

router.get('/register', (req, res) => {
    res.render('register', {
	status:  pop(req.session),
        session: req.session
    });
});
router.post('/register', async (req, res) => {
    if (req.body.jelszo1 !== req.body.jelszo2) {
        req.session.status = 'A két jelszó nem azonos!';
        res.redirect('/register');
	return;
    }

    let success = await dao.boolRegister(req.body.nev, req.body.email, 1, req.body.jelszo1);
    if(!success){
	req.session.status = 'Ilyen nevű felhasználó már létezik!';
    } else {
	req.session.status = 'Sikeres regisztráció!';
    }
    res.redirect('/login')
});

module.exports = router
