const express = require("express")
const {requireUser, msg} = require("../misc-funcs");
const db = require("../dao/dao")

const router = express.Router();

router.get('/fajl', async function(req, res) {
	let file = await db.execute("SELECT * FROM FAJLOK WHERE fajlok.id = :id", [req.query.id]);
	//let user = await db.execute("SELECT nev_felhasznalo FROM FELTOLTOTTE WHERE id_fajl = :id", [req.query.id]);
	let comments = await db.execute("SELECT kommentek.*, irta.nev_felhasznalo FROM kommentek, fajlhoz, irta WHERE fajlhoz.id_fajl = :id AND fajlhoz.id_komment = kommentek.id AND kommentek.id = irta.id_komment", [req.query.id])

	status = req.session.status;
	req.session.status = undefined;
	return res.render('fajl', {
		status:  status,
		session: req.session,
		file:    file.rows[0],
		//user:    user.rows[0],
		comments:comments.rows,
		fajlid:  req.query.id
	})
})

router.post("/ujkomment", requireUser, async function(req, res) {
	let result = await db.execute("INSERT INTO KOMMENTEK (SZOVEG) VALUES (:szoveg)", [req.body.szoveg]);
        let result2= await db.execute("SELECT ID FROM KOMMENTEK WHERE ROWID = :id", [result.lastRowid]);
	let kommid = result2.rows[0]["ID"];
	await db.execute("INSERT INTO FAJLHOZ (ID_FAJL, ID_KOMMENT) VALUES (:idfajl, :idkomm)", [req.query.q, kommid]);
	await db.execute("INSERT INTO IRTA (NEV_FELHASZNALO, ID_KOMMENT) VALUES (:username, :idkomm)", [req.session.nev, kommid]);

        return res.redirect("/fajl?id=" + req.query.q);
})

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
