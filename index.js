const express = require('express');
const db = require("./dao/dao")
const app = express();

const session = require('express-session');
const FileStore = require('session-file-store')(session);

app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));

app.use(session({
	secret: 'bSs9AtYngrZtZeWKbKxlm6bEE8wviB0Zm4B+l+BNd9Q=',
	resave: true,
	saveUninitialized: false,
	cookie: {
		maxAge: 3600000
	},
	store: new FileStore({
		ttl: 3600,
	}),
}));

app.use(require("./routes/login-register"));
app.use(require("./routes/other"));

// TODO: MF4 remove /d
app.get('/d', (req, res) => {
    return res.json(req.session)
})

app.get('/', async function(req, res) {
	status = req.session.status;
	req.session.status = undefined;

	let result = await db.execute('SELECT NEV FROM FELHASZNALOK', []);

	return res.render('index', {
		status:  status,
		session: req.session,
		users:   result.rows
	});
});

app.all((req, _) => {
	req.session.save()
})

const PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
    console.log(`Running on port ${PORT}.`);
});
