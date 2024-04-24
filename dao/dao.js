const bcrypt = require('bcryptjs');

const db = require('./dbconn.js');

async function listUsers() {
    return await db('SELECT nev FROM felhasznalok', []);
}

async function objUserByName(nev) {
    let users = await db('SELECT * FROM felhasznalok WHERE nev = :nev', [nev]);
    if(users.length < 1) return;
    return users[0];
}

async function objLogin(nev, jelszo) {
    let user = await objUserByName(nev);
    if(!user) return;
    if(!bcrypt.compareSync(jelszo, user.JELSZO)) return;

    await db('UPDATE felhasznalok SET belepes = :datum WHERE nev = :nev', [new Date(), nev]);

    return user;
}

async function boolRegister(nev, email, jogusultsag, jelszo) {
    if(await objUserByName(nev)) return false;
    let pwdhash = bcrypt.hashSync(jelszo, 10);
    await db('INSERT INTO felhasznalok (nev, email, jogosultsag, jelszo, belepes, regisztracio) VALUES (:nev, :email, :jogosultsag, :jelszo, :belepes, :regisztracio)', [nev, email, jogusultsag, pwdhash, null, new Date()]);
    return true;
}

module.exports = {
    listUsers, objUserByName, objLogin, boolRegister
};
