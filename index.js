const express = require('express');
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
	saveUninitialized: true,
	cookie: {
		maxAge: 3600000
	},
	store: new FileStore({
		ttl: 3600,
	})
}));

app.use(require("./routes/login-register"));
app.use(require("./routes/other"));

// TODO: MF4 remove /d
app.get('/d', (req, res) => {
    return res.json(req.session)
})

app.get('/', function(req, res) {
	status = req.session.status;
	req.session.status = undefined;
	return res.render('index', {
		status:  status,
		session: req.session
	});
});

app.all((req, res) => {
	req.session.save()
})

const PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
    console.log(`Running on port ${PORT}.`);
});
