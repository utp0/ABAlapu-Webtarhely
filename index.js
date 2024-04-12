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
	
	let result = db.execute('SELECT * FROM felhasznalok WHERE nev = :nev', [nev]);
	if(result.length < 1){
		req.session.status = msg['login-fail'];
		return res.redirect('/login');
	}
	let user = result[0];

	let pwdmatch = bcrypt.compareSync(jelszo, user.jelszo);
	if(!pwdmatch){
		req.session.status = msg['login-fail'];
		return res.redirect('/login');
	}

	req.session.nev          = user.nev;
	req.session.email        = user.email;
	req.session.jogusultsag  = user.jogusultsag;
	req.session.belepes      = user.belepes;
	req.session.regisztracio = user.regisztracio;

	db.execute('UPDATE felhasznalok SET belepes = CURRENT_TIMESTAMP WHERE nev = :nev', [nev]);

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

	let result = db.execute('SELECT nev FROM felhasznalok WHERE nev = :nev', [nev]);
	if(result.length >= 1){
		req.session.status = msg['reg-userex'];
		return res.redirect('/register');
	}

	let hash = bcrypt.hashSync(jelszo1, 10);
	db.execute('INSERT INTO felhasznalok (nev, email, jogusultsag, jelszo, belepes, regisztracio) VALUES (:nev, :email, :jogusultsag, :jelszo, NULL, current_timestamp())', [nev, email, 1, hash]);

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
