const express   = require("express");
const session   = require("express-session")
const bodyParser    = require("body-parser");

require("dotenv").config();
require("./auth.js");

// Routes import
const apiRoutes  = require('./routes/api.js');
const authRoutes = require('./routes/auth.js')

const app   = express();

// Session cookie
const sess = {
    secret: process.env.SECRET_KEY,
    cookie: {}
}

if (process.env.SECRET_KEY === 'prod') {
    app.set('trust proxy', 1)
    sess.cookie.secure  = treu
}

// Middleware
app.use(bodyParser.json())
app.use(session(sess))

// Routes
app.use('/api', apiRoutes);
app.use('/auth', authRoutes)

const PORT  = process.env.PORT;

app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())

// CRUD Signals
// CRUD IncidentLocal
// CRUD Accounts

app.listen(PORT, "0.0.0.0", () => {
    console.log(`App is running on ${PORT}`)
})

module.exports.app  = app
