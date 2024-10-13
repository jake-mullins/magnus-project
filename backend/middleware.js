const express = require('express');
const passport = require('passport');
const session = require('express-session');

function logRequest(req, res, next) {
    const currentDateTime = new Date().toISOString(); // Get the current date and time
    console.log(`[${currentDateTime}] ${req.method} request made to: ${req.originalUrl}`);
    next(); // Call the next middleware or route handler
}

function isAuthed (req, res, next) {
    console.log(req.user);
    if (req.user) {
        return next();
    }

    if (!req.path.startsWith('/auth')) {
        return res.redirect('/auth/google');
    }

    next();
}

// Export the logging middleware
module.exports.logRequest       = logRequest;
module.exports.isAuthenticated  = isAuthed;
