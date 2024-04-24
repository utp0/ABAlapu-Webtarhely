const express = require('express');
const router = express.Router();

const dao = require('../dao/dao.js');

router.get('/login', (req, res) => {
    res.render('login', {
	status:  pop(req.session),
	session: req.session
    });
});
router.post('/login', async (req, res) => {
    let user = await dao.objLogin(req.body.nev, req.body.jelszo);

    if(!user){
	req.session.status = 'Hibás felhasználónév vagy jelszó!';
        res.redirect('/login');
	return;
    }

    req.session.nev          = user.NEV;
    req.session.email        = user.EMAIL;
    req.session.jogosultsag  = user.JOGOSULTSAG;
    req.session.belepes      = user.BELEPES;
    req.session.regisztracio = user.REGISZTRACIO;

    res.redirect('/');
});

module.exports = router
