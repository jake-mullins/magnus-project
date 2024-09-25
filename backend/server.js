const express       = require("express");
const bodyParser    = require("body-parser");
require("dotenv").config();

const pg  = require("pg");
const { Pool }  = pg;

// Routes
const apiRoutes  = require('./routes/api.js');

const app   = express();

app.use(bodyParser.json())

app.use('/api', apiRoutes);

const PORT  = process.env.PORT;

app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

// CRUD Signals
// CRUD IncidentLocal
// CRUD Accounts

app.listen(PORT, "0.0.0.0", () => {
    console.log(`App is running on ${PORT}`)
})
