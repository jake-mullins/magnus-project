const passport  = require('passport');
const GoogleStrategy    = require('passport-google-oauth20');

passport.use(new GoogleStrategy({
    clientID:       process.env.GOOGLE_CLIENT_ID,
    clientSecret:   process.env.GOOGLE_CLIENT_SECRET, 
    callbackURL:    '/auth/google/callback',
    scope: ['profile', 'email'],
    state: true
}, (accessToken, refresh, profile, done) => {
    done(null, profile);
}));

passport.serializeUser((user, done) => {
    done(null, user);
});

passport.deserializeUser((obj, done) => {
    done(null, obj);
});
