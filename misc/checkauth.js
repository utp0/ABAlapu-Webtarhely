const msgAdmin = 'Ezt csak admin felhasználók érhetik el!';
const msgUser  = 'Ezt csak bejelentkezett felhasználók érhetik el!';

function isAdmin(req) {
    return req.session.jogosultsag >= 2;
}
function requireAdmin(req, res, next) {
    if (isAdmin(req)) {
        next();
    } else {
	req.session.status = msgAdmin;
        res.redirect('/');
    }
}
function isUser(req) {
    return req.session.jogosultsag >= 1;
}
function requireUser(req, res, next) {
    if (isUser(req)) {
        next();
    } else {
	req.session.status = msgUser;
        res.redirect('/');
    }
}

module.exports = {
    msgAdmin, isAdmin, requireAdmin,
    msgUser, isUser, requireUser
}
