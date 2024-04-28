process.env.TZ = 'Europe/Budapest';

const express = require('express');
const app = express();
const express_session = require('express-session');
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(express_session({
	secret: 'bSs9AtYngrZtZeWKbKxlm6bEE8wviB0Zm4B+l+BNd9Q=',
	resave: true,
	saveUninitialized: true
}));

global.pop = (reqsession) => {
    const status = reqsession.status;
    reqsession.status = null;
    return {
	status: status,
	session: reqsession
    }
};

app.use(require('./routes/index.js'));
app.use(require('./routes/login.js'));
app.use(require('./routes/logout.js'));
app.use(require('./routes/register.js'));
app.use(require('./routes/fajlok.js'));
//app.use(require('./routes/fajl.js'));
app.use(require('./routes/szolgaltatas.js'));

// TODO: MF4 remove
app.get('/json', (req, res) => {
    return res.json(req.session)
})

const PORT = process.env.PORT || 8080;
app.listen(PORT, function () {
    console.log(`Running on port ${PORT}.`);
});
