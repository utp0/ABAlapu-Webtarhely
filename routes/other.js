const express = require("express")
const {requireUser} = require("../misc-funcs");

const router = express.Router();

router.get('/fajllista', requireUser, (req, res) => {
    res.send("ok")
})

module.exports = router
