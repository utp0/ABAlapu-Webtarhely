const express = require('express');
const router = express.Router();

const dao = require('../dao/dao.js');

router.get('/login', (req, res) => {
    res.render('login', pop(req.session)); 
});

router.post('/login', async (req, res) => {
    let user = await dao.objLogin(req.body.nev, req.body.jelszo);

    if(!user){
	req.session.status = 'Hibás felhasználónév vagy jelszó!';
        res.redirect('/login');
	return;
    }

    Object.keys(user).forEach(prop => {req.session[prop.toLowerCase()] = user[prop]});
    req.session.kapacitas = (await dao.objSzolgaltatasByName(req.session.elofizetes)).MERET;

    res.redirect('/');
});

module.exports = router
