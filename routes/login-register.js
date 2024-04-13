const db = require("../dao/dao");
const bcrypt = require("bcryptjs");
const express = require("express")
const {msg} = require("../misc-funcs");

const router = express.Router();

router.get('/login', function(req, res) {
    let status = req.session.status;
    req.session.status = undefined;
    return res.render('login', {
        status:  status,
        session: req.session
    });
});
router.post('/login', async function (req, res) {
    let nev = req.body.nev;
    let jelszo = req.body.jelszo;
    //TODO: validate

    let result = await db.execute('SELECT * FROM felhasznalok WHERE nev = :nev', [nev]);
    if (result.rows.length < 1) {
        req.session.status = msg['login-fail'];
        return res.redirect('/login');
    }
    let user = result.rows[0];

    let pwdmatch = bcrypt.compareSync(jelszo, user["JELSZO"]);
    if (!pwdmatch) {
        req.session.status = msg['login-fail'];
        return res.redirect('/login');
    }

    req.session.nev = user["NEV"];
    req.session.email = user["EMAIL"];
    req.session.jogosultsag = user["JOGOSULTSAG"];
    req.session.belepes = user["BELEPES"];
    req.session.regisztracio = user["REGISZTRACIO"];

    db.execute('UPDATE felhasznalok SET belepes = :datum WHERE nev = :nev', [new Date(), nev])
        .catch((e) => {
                console.error("Belépés idejének frissítése sikertelen.")
                console.error(e)
            }
        )

    return res.redirect('/');
});

router.get('/logout', function(req, res) {
    req.session.destroy(function(err) {
        if(err) throw err;
    });
    return res.redirect('/');
});

router.get('/register', function(req, res) {
    status = req.session.status;
    req.session.status = undefined;
    return res.render('register', {
        status:  status,
        session: req.session
    });
});
router.post('/register', async function (req, res) {
    let nev = req.body.nev;
    let email = req.body.email;
    let jelszo1 = req.body.jelszo1;
    let jelszo2 = req.body.jelszo2;
    //TODO: validate

    if (jelszo1 !== jelszo2) {
        req.session.status = msg['reg-pwdmm'];
        return res.redirect('/register');
    }

    let result = await db.execute('SELECT nev FROM felhasznalok WHERE nev = :nev', [nev]);
    if (result.rows.length >= 1) {
        req.session.status = msg['reg-userex'];
        return res.redirect('/register');
    }

    let hash = bcrypt.hashSync(jelszo1, 10);
    await db.execute('INSERT INTO felhasznalok (nev, email, jogosultsag, jelszo, belepes, regisztracio) VALUES (:nev, :email, :jogosultsag, :jelszo, NULL, :regisztracio)', [nev, email, 1, hash, new Date()]);

    req.session.status = msg['reg-ok'];
    return res.redirect('/login')
});

module.exports = router
