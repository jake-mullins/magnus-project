const pool  = require("../db.js")

// CRUD
// CREATE
exports.createSignal    = async (req, res) => {
    console.log(req.body);
}

// UPDATE
exports.updateSignal    = async (req, res) => {
    console.log(req.body);
}

// DELETE
exports.deleteSignal    = async (req, res) => {
    console.log(req.body);
}

// READ
exports.getAllSignals   = async (req, res) => { 
    console.log(`${req.path} ${req.method}`);
    try { 
        const result = await pool.query('SELECT * FROM "Signal";');
        res.send(result.rows);
    } catch (error) {
        console.log(error);
        res.sendStatus(404);
    }
}

exports.getSignalByLocalIncident    = async (req, res) => {
    console.log(`${req.path} ${req.method}`);
    try { 
        const result    = await pool.query(`SELECT * FROM "Signal" WHERE "idincidentlocal" = ${req.params.id};`);
        res.send(result.rows);
    } catch (error) {
        console.log(error);
        res.sendStatus(404);
    }
}

exports.getSignalByUser = async (req, res) => {
    console.log(req.body);
    res.send("Function not implemented");
}
