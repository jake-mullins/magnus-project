const express   = require('express');
const router    = express.Router();
const signalRoutes  = require('./signal.js');

router.use('/signal', signalRoutes);
// router.use('/incident/local', signalRoutes);
// router.use('/auth', signalRoutes);

module.exports  = router;
