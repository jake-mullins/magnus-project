const express   = require('express');
const router    = express.Router();
const profileController = require("../controllers/profileController.js")

router.get('/self', profileController.selfProfileInfo);

module.exports  = router;
