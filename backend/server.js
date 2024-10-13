const bodyParser    = require("body-parser");
const express   = require("express");
const session   = require("express-session");

const middleware    = require('./middleware.js')
const passport      = require("./auth.js");

require("dotenv").config();

// Routes import
const apiRoutes  = require('./routes/api.js');
const authRoutes = require('./routes/auth.js');
const profileRoutes = require('./routes/profile.js');

const app   = express();

// Session cookie
const sess = {
    secret: process.env.SECRET_KEY,
    resave: false,
    saveUninitialized: true,
    cookie: {}
}

if (process.env.SECRET_KEY === 'prod') {
    app.set('trust proxy', 1)
    sess.cookie.secure  = treu
}

// Middleware
app.use(bodyParser.json());
app.use(session(sess));

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use(passport.initialize());
app.use(passport.session());

app.use(middleware.logRequest);
app.use(middleware.isAuthenticated);

// Routes
app.use('/api', apiRoutes);
app.use('/auth', authRoutes);
app.use('/profile', profileRoutes);

const PORT  = process.env.PORT;

// CRUD Signals
// CRUD IncidentLocal
// CRUD Accounts

app.listen(PORT, "0.0.0.0", () => {
    console.log(`App is running on ${PORT}`)
})

module.exports  = app
