const msg = {
    'auth-admin': 'Ezt csak admin felhasználók érhetik el!',
    'auth-user':  'Ezt csak bejelentkezett felhasználók érhetik el!',
    'login-fail': 'Hibás felhasználónév vagy jelszó!',
    'reg-pwdmm':  'A két jelszó nem azonos!',
    'reg-userex': 'Ilyen nevű felhasználó már létezik!',
    'reg-ok':     'Sikeres regisztráció!',
    'db-err':     'Adatbázis hiba!',
    'no-filesel': 'Nincs fájl kiválasztva!',
    'upl-error':  'Hiba történt feltöltés közben!',
}

function isAdmin(req) {
    return req.session.jogosultsag >= 2;
}

function isUser(req) {
    return req.session.jogosultsag >= 1;
}

function requireAdmin(req, res, next) {
    if (isAdmin(req)) {
        next();
    } else {
        req.session.status = msg['auth-admin'];
        return res.redirect('/');
    }
}

function requireUser(req, res, next) {
    if (isUser(req)) {
        next();
    } else {
        req.session.status = msg['auth-user'];
        return res.redirect('/');
    }
}

module.exports = {
    msg,
    isAdmin,
    isUser,
    requireAdmin,
    requireUser
}