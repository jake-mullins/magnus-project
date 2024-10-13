const express   = require('express');
const router    = express.Router();
const signalController = require('../controllers/signalController.js');

router.get('/',     signalController.getAllSignals);
router.get('/:id',  signalController.getSignalByLocalIncident);
// router.get('/signal', signalRouter.getSignalByUser);

router.post('/',        signalController.createSignal);
router.post('/update',  signalController.updateSignal);
router.post('/delete',  signalController.deleteSignal);

module.exports  = router;
