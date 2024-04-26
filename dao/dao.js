const bcrypt = require('bcryptjs');

const db = require('./dbconn.js');

async function listUsers() {
    return await db('SELECT nev FROM felhasznalo', []);
}

async function objUserByName(nev) {
    let users = await db('SELECT * FROM felhasznalo WHERE nev = :nev', [nev]);
    return users[0];
}

async function objLogin(nev, jelszo) {
    let user = await objUserByName(nev);
    if(!user) return;
    if(!bcrypt.compareSync(jelszo, user.JELSZO)) return;

    await db('UPDATE felhasznalo SET belepes = :datum WHERE nev = :nev', [new Date(), nev]);

    return user;
}

async function boolRegister(nev, email, jogosultsag, jelszo) {
    if(await objUserByName(nev)) return false;
    let pwdhash = bcrypt.hashSync(jelszo, 10);
    await db('INSERT INTO felhasznalo (nev, jelszo, email, belepes, regisztracio, jogosultsag, elofizetes) VALUES (:nev, :jelszo, :email, :belepes, :regisztracio, :jogosultsag, :elofizetes)', [nev, pwdhash, email, null, new Date(), jogosultsag, null]);
    return true;
}

async function listFiles(path) {
    return await db('SELECT utvonal, mappa, meret FROM fajl WHERE utvonal LIKE :path', [`${path}/%`]);
}

async function objFile(path) {
    let files = await db('SELECT * FROM fajl WHERE utvonal = :path', [path]);
    return files[0];
}

async function boolNewFile(path, meret, mappa) {
    await db('INSERT INTO fajl (utvonal, meret, mappa) VALUES (:path, :meret, :mappa)', [path, meret, mappa]);
    return true;
}

async function listComments(fajlid) {
    return await db('SELECT irta, szoveg FROM komment WHERE fajl = :fajlid', [fajlid]);
}

module.exports = {
    listUsers, objUserByName, objLogin, boolRegister, listFiles, boolNewFile, objFile
};
