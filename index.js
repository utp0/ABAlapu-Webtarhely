const msg = {
	'auth-admin': 'Ezt csak admin felhasználók érhetik el!',
	'auth-user':  'Ezt csak bejelentkezett felhasználók érhetik el!',
	'login-fail': 'Hibás felhasználónév vagy jelszó!',
	'reg-pwdmm':  'A két jelszó nem azonos!',
	'reg-userex': 'Ilyen nevű felhasználó már létezik!',
	'reg-ok':     'Sikeres regisztráció!',
}

var bcrypt = require('bcryptjs');
const {db} = require('./dbconfig.js');

const express = require('express');
const app = express();

const session = require('express-session');
app.use(session({
	secret: 'bSs9AtYngrZtZeWKbKxlm6bEE8wviB0Zm4B+l+BNd9Q=',
	resave: true,
	saveUninitialized: true
}));

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.static('public'));
//app.use(express.urlencoded({ extended: true }));

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

app.get('/login', function(req, res) {
	let status = req.session.status;
	req.session.status = undefined;
	return res.render('login', {
		status:  status,
		session: req.session
	});
});
app.post('/login', function(req, res) {
	let nev    = req.body.nev;
	let jelszo = req.body.jelszo;
	//TODO: validate
	db.query('SELECT * FROM felhasznalok WHERE nev = ?', [nev], function (error, results, fields) {
		if(error) throw error;
		if(results.length < 1) {
			req.session.status = msg['login-fail'];
			return res.redirect('/login');
		}
		let result = results[0];

		bcrypt.compare(jelszo, result.jelszo, function(error, result){
			if(!error && result){
				req.session.nev         = result.nev;
				req.session.email       = result.email;
				req.session.jogusultsag = result.jogusultsag;
				req.session.belepes     = result.belepes;
				req.session.regisztracio= result.regisztracio;

				db.query('UPDATE felhasznalok SET belepes = CURRENT_TIMESTAMP WHERE nev = ?', [nev], function (error, results, fields) {
					if(error) throw error;
				});
				return res.redirect('/');
			} else {
				req.session.status = msg['login-fail'];
				return res.redirect('/login');
			}
		});
	});
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
app.post('/register', function(req, res) {
	nev         = req.body.nev;
	email       = req.body.email;
	jelszo1     = req.body.jelszo1;
	jelszo2     = req.body.jelszo2;
	//TODO: validate

	if(jelszo1 !== jelszo2){
		req.session.status = msg['reg-pwdmm'];
		return res.redirect('/register');
	}

	db.query('SELECT nev FROM felhasznalok WHERE nev = ?', [nev], function (error, results, fields) {
		if(error) throw error;
		if(results.length >= 1){
			req.session.status = msg['reg-userex'];
			return res.redirect('/register');
		}
		bcrypt.hash(jelszo1, 10, function(error, hash) {
			if(error) throw error;
			db.query('INSERT INTO felhasznalok (nev, email, jogusultsag, jelszo, belepes, regisztracio) VALUES (?, ?, ?, ?, NULL, current_timestamp())', [nev, email, 1, hash], function (error, results, fields) {
				if(error) throw error;
			});
		});
		req.session.status = msg['reg-ok'];
		return res.redirect('/login')
	});
});

app.get('/', function(req, res) {
	status = req.session.status;
	req.session.status = undefined;
	return res.render('index', {
		status:  status,
		session: req.session
		// nev:         req.session.nev,
		// email:       req.session.email,
		// jogusultsag: req.session.jogusultsag,
		// belepes:     req.session.belepes,
		// regisztracio:req.session.regisztracio
	});
});

const PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
    console.log(`Running on port ${PORT}.`);
});
