const express = require("express")
const {requireUser, msg} = require("../misc-funcs");
const db = require("../dao/dao")

const router = express.Router();

router.get('/fajllista', requireUser, async (req, res) => {
    try {
        let fajlok =
            await db.execute("SELECT fajlok.* FROM FAJLOK, FELTOLTOTTE WHERE fajlok.id = feltoltotte.id_fajl AND feltoltotte.nev_felhasznalo = :nev", [req.session.nev])
        return res.render('fajllista', {
            status: req.session.status,
            session: req.session,
            fajlok: fajlok.rows,
        });
    } catch (e) {
        req.session.status = msg["db-err"]
        return res.render('fajllista', {
            status: req.session.status,
            session: req.session,
        });
    }

})

router.post("/createFile", requireUser, async (req, res) => {
    if (req.body["filename"].trim() === "") {
        req.session.status = msg["no-filesel"]
        return res.redirect("/fajllista")
    }
    let rowid;
    try {
        let result = await db.execute(
            "INSERT INTO FAJLOK (NEV, MAPPA, MERET, PATH) VALUES (:nev, :mappa, :meret, :path)",
            [req.body["filename"].trim(), 0, 0, "/"]
        )
        rowid = result.lastRowid
        result = await db.execute(
            "SELECT * FROM FAJLOK WHERE ROWID = :val",
            [rowid]
        )
        await db.execute(
            "INSERT INTO FELTOLTOTTE (ID_FAJL, NEV_FELHASZNALO) VALUES (:fajlid, :felhasznalonev)",
            [result.rows[0]["ID"], req.session.nev]
        )
    } catch (e) {
        req.session.status = msg["upl-error"]
        console.error(msg["upl-error"] + "ID: " + rowid)
        console.error(e)
    }
    return res.redirect("/fajllista")
})

router.get("/deleteFile", requireUser, async (req, res) => {
    if (typeof req.query["id"] === "undefined" || req.query["id"] === "") {
        return res.redirect("/fajllista")
    }
    try {
        let result = await db.execute("SELECT * FROM FELTOLTOTTE WHERE ID_FAJL = :fajlid AND NEV_FELHASZNALO = :felhasznalonev",
            [req.query["id"].trim(), req.session.nev])
        if (result.rows.length > 0) {
            await db.execute("DELETE FROM FAJLOK WHERE ID = :id", [req.query["id"].trim()])
        }
    } catch (e) {
        req.session.status = msg["del-error"]
        console.error(msg["del-error"])
        console.error(e)
    }
    return res.redirect("/fajllista")
})

module.exports = router
