const express = require('express');
const router = express.Router();

const dao = require('../dao/dao.js');

router.get('/', async (req, res) => {
    res.render('index', {
	status:  pop(req.session),
	session: req.session,
	users:   await dao.listUsers()
    });
});

module.exports = router;
