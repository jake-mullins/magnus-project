const express       = require("express");
const bodyParser    = require("body-parser");
require("dotenv").config();
require("./auth.js");

// Authentication
const passport  = require('passport');
const GoogleStrategy  = require('passport-google-oauth20');


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
