const bcrypt = require('bcryptjs');

const db = require('./dbconn.js');

async function listUsers() {
    return await db('SELECT nev FROM felhasznalo', []);
}

async function objUserByName(nev) {
    let users = await db('SELECT * FROM felhasznalo WHERE nev = :nev', {nev: nev});
    return users[0];
}

async function objLogin(nev, jelszo) {
    let user = await objUserByName(nev);
    if(!user) return;
    if(!bcrypt.compareSync(jelszo, user.JELSZO)) return;

    await db('UPDATE felhasznalo SET belepes = :datum WHERE nev = :nev', {datum: new Date(), nev: nev});

    return user;
}

async function boolRegister(nev, email, jogosultsag, jelszo) {
    if(await objUserByName(nev)) return false;
    let pwdhash = bcrypt.hashSync(jelszo, 10);
    let alapcsomag = (await db('SELECT nev FROM szolgaltatas WHERE ar = :ar', [ar]))[0].NEV;
    await db('INSERT INTO felhasznalo (nev, jelszo, email, belepes, regisztracio, jogosultsag, elofizetes) VALUES (:nev, :jelszo, :email, :belepes, :regisztracio, :jogosultsag, :elofizetes)', {nev: nev, jelszo: pwdhash, email: email, belepes: null, regisztracio: new Date(), jogosultsag: jogosultsag, elofizetes: alapcsomag});
    return true;
}

async function listFiles(path) {
    return await db('SELECT * FROM fajl WHERE (utvonal = :path OR (utvonal IS NULL AND :path IS NULL))', {path: path});
}

async function objFile(path, filename) {
    return (await db('SELECT * FROM fajl WHERE (utvonal = :path OR (utvonal IS NULL AND :path IS NULL)) AND fajlnev = :fajlnev', {path: path, fajlnev: filename}))[0];
}

async function idNewFile(path, filename, meret, mappa) {
    await db('INSERT INTO fajl (utvonal, fajlnev, meret, mappa) VALUES (:path, :fajlnev, :meret, :mappa)', [path, filename, meret, mappa]);
    return (await db('SELECT id FROM fajl WHERE (utvonal = :path OR (utvonal IS NULL AND :path IS NULL)) AND fajlnev = :fajlnev', {path: path, fajlnev: filename}))[0].ID;
}

async function listComments(fajlid) {
    return await db('SELECT irta, szoveg FROM komment WHERE fajl = :fajlid', {fajlid: fajlid});
}

async function listSzolgaltatasok() {
    return await db('SELECT * FROM szolgaltatas', []);
}

async function objSzolgaltatasByName(name) {
    return (await db('SELECT * FROM szolgaltatas WHERE nev = :nev', [name]))[0];
}

async function noneFelhasznaloUjSzolgaltatas(username, csomag) {
    await db('UPDATE felhasznalo SET elofizetes = :csomag WHERE nev = :nev', {csomag: csomag, nev: username});
}

async function noneSzolgaltatasHozzaad(nev, leiras, ar, meret) {
    await db('INSERT INTO szolgaltatas (nev, leiras, ar, meret) VALUES (:nev, :leiras, :ar, :meret)', {nev: nev, leiras: leiras, ar: ar, meret: meret});
}
async function noneSzolgaltatasModosit(nev, leiras, ar, meret) {
    let sql_leiras = leiras ? 'leiras = :leiras' : '';
    let sql_ar = ar ? 'ar = :ar' : '';
    let sql_meret = meret ? 'meret = :meret' : '';
    let sql = [sql_leiras, sql_ar, sql_meret].filter(s => s).join(', ');

    let p1 = {leiras: leiras, ar: ar, meret: meret};
    let p2 = {nev: nev};
    Object.keys(p1).filter(k => p1[k]).forEach(k => {p2[k] = p1[k]});
    
    await db(`UPDATE szolgaltatas SET ${sql} WHERE nev = :nev`, p2);
}
async function noneSzolgaltatasTorol(nev) {
    await db('DELETE FROM szolgaltatas WHERE nev = :nev', [nev]);
}

module.exports = {
    listUsers, objUserByName, objLogin, boolRegister, noneFelhasznaloUjSzolgaltatas,
    listFiles, idNewFile, objFile,
    listSzolgaltatasok, objSzolgaltatasByName,
    noneSzolgaltatasHozzaad, noneSzolgaltatasModosit, noneSzolgaltatasTorol
};
