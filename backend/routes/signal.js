const express   = require('express');
const router    = express.Router();
const signalsController = require('../controllers/signalsController.js');

router.get('/',     signalsController.getAllSignals);
router.get('/:id',  signalsController.getSignalByLocalIncident);
// router.get('/signal', signalsRouter.getSignalByUser);

router.post('/',        signalsController.createSignal);
router.post('/update',  signalsController.updateSignal);
router.post('/delete',  signalsController.deleteSignal);

module.exports  = router;
