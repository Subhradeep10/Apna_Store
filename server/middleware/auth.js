const jwt = require('jsonwebtoken');
const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) {
            return res.status(401).json({ msg: 'No token, authorization denied' });
        }
        const decoded = jwt.verify(token, 'secret');
        if (!decoded) {
            return res.status(401).json({ msg: 'Token is not valid' });
        }
        req.user = decoded.id;
        req.token = token;
        next();
    } catch (err) {
        throw err;
    }
};

module.exports = auth;