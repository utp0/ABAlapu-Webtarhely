function isAdmin(req) {
    return req.session.jogosultsag >= 2;
}
function requireAdmin(req, res, next) {
    if (isAdmin(req)) {
        next();
    } else {
	req.session.status = 'Ezt csak admin felhasználók érhetik el!';
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
	req.session.status = 'Ezt csak bejelentkezett felhasználók érhetik el!';
        res.redirect('/');
    }
}

module.exports = {
    isAdmin, requireAdmin,
    isUser, requireUser
}
