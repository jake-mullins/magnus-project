const pool = require('../db.js')

exports.selfProfileInfo = (req, res) => {
    res.send(req.user.displayName);
}
