const express = require('express');
const authRouter = express.Router();

authRouter.post('/api/signup', (req, res) => {
    console.log(req.body);
});
module.exports = authRouter;