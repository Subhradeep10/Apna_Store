const express = require('express');
const User = require('../models/user');
const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ error: 'User already exists' });
        }
        let user = new User({
            name,
            email,
            password
        })
        user = await user.save();
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }

});
module.exports = authRouter;