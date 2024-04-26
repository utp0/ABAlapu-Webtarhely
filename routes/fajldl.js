const express = require('express');
const router = express.Router();

const storage = require('../misc/storage.js');

router.get('fajldl/*', async (req, res) => {
    storage.serveFile(path, res);
});

module.exports = router;
