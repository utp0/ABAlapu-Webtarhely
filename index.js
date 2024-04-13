const msg = {
	'auth-admin': 'Ezt csak admin felhasználók érhetik el!',
	'auth-user':  'Ezt csak bejelentkezett felhasználók érhetik el!',
	'login-fail': 'Hibás felhasználónév vagy jelszó!',
	'reg-pwdmm':  'A két jelszó nem azonos!',
	'reg-userex': 'Ilyen nevű felhasználó már létezik!',
	'reg-ok':     'Sikeres regisztráció!',
}

var bcrypt = require('bcryptjs');
const db = require('./dao/dao');

const express = require('express');
const app = express();

const session = require('express-session');

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

app.use(session({
	secret: 'bSs9AtYngrZtZeWKbKxlm6bEE8wviB0Zm4B+l+BNd9Q=',
	resave: true,
	saveUninitialized: true,
	cookie: {
		maxAge: 3600000
	}
}));

function isAdmin(req) { return req.session.jogusultsag >= 2; }
function isUser(req)  { return req.session.jogusultsag >= 1; }

function requireAdmin(req, res, next) {
	if (isAdmin(req)) {
		next();
	} else {
		req.session.status = msg['auth-admin'];
		res.redirect('/');
	}
}
function requireUser(req, res, next) {
	if (isUser(req)) {
		next();
	} else {
		req.session.status = msg['auth-user'];
		res.redirect('/');
	}
}

// TODO: remove
app.get('/d', (req, res) => {
    return res.json(req.session)
})

app.get('/login', function(req, res) {
	let status = req.session.status;
	req.session.status = undefined;
	return res.render('login', {
		status:  status,
		session: req.session
	});
});
app.post('/login', async function (req, res) {
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

app.get('/logout', function(req, res) {
	req.session.destroy(function(err) {
		if(err) throw err;
	});
	return res.redirect('/');
});

app.get('/register', function(req, res) {
	status = req.session.status;
	req.session.status = undefined;
	return res.render('register', {
		status:  status,
		session: req.session
	});
});
app.post('/register', async function (req, res) {
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

app.get('/', function(req, res) {
	status = req.session.status;
	req.session.status = undefined;
	return res.render('index', {
		status:  status,
		session: req.session
	});
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
    console.log(`Running on port ${PORT}.`);
});
