const passport  = require('passport');
const GoogleStrategy    = require('passport-google-oauth20');

require("dotenv").config();

passport.use(new GoogleStrategy({
    clientID:       process.env.GOOGLE_CLIENT_ID,
    clientSecret:   process.env.GOOGLE_CLIENT_SECRET, 
    callbackURL:    'http://localhost:8080/auth/google/callback',
    // scope: ['profile', 'email'],
    // state: true
}, (accessToken, refresh, profile, done) => {
    done(null, profile);
}));

passport.serializeUser((user, done) => {
    done(null, user);
});

passport.deserializeUser((obj, done) => {
    done(null, obj);
});

module.exports = passport;
