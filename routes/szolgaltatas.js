const express = require('express');
const router = express.Router();

const dao = require('../dao/dao.js');

router.get('/szolgaltatas', async (req, res) => {
    res.render('szolgaltatas', {...pop(req.session),
	szolgaltatasok: await dao.listSzolgaltatasok(),
    });
});

router.post('/szolgaltatas', async (req, res) => {
    let szolgaltatas = await dao.objSzolgaltatasByName(req.body.aktival);
    if(!szolgaltatas) {res.redirect('/'); return;}
    await dao.noneFelhasznaloUjSzolgaltatas(req.session.nev, szolgaltatas.NEV);
    req.session.kapacitas = szolgaltatas.MERET;
    req.session.elofizetes = szolgaltatas.NEV;
    res.redirect('/szolgaltatas');
});

router.post('/szolgaltatasmod', async (req, res) => {
    let nev = req.body.nev;
    let leiras = req.body.leiras;
    let ar = req.body.ar;
    let meret = req.body.meret;

    if(nev) {
	if(!leiras && !ar && !meret){//D
	    await dao.noneSzolgaltatasTorol(nev);
	    req.session.status = 'Szolgaltatas torolve!';
	}
	if(leiras || ar || meret){//CU
	    let szolgaltatas = await dao.objSzolgaltatasByName(nev);
	    if(szolgaltatas){//U
		await dao.noneSzolgaltatasModosit(nev, leiras, ar, meret);
		req.session.status = 'Szolgaltatas modositva!';
	    } else {//C
		await dao.noneSzolgaltatasHozzaad(nev, leiras, ar, meret);
		req.session.status = 'Szolgaltatas letrehozva!';
	    }
	}
    }

    res.redirect('/szolgaltatas');
});

module.exports = router;
