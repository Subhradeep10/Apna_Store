const express = require('express');
const User = require('../models/user');
const authRouter = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

//Signup route
authRouter.post('/api/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ error: 'User already exists' });
        }
        const hashedPassword = await bcrypt.hash(password, 12);

        let user = new User({
            name,
            email,
            password: hashedPassword,
        })
        user = await user.save();
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }

});

//Signin route
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ error: 'User with this email does not exist' });
        }
        const isPasswordValid = await bcrypt.compare(password, user.password);
        if (!isPasswordValid) {
            return res.status(400).json({ error: 'Invalid credentials' });
        }
        res.json({
            token: jwt.sign({ id: user._id }, 'secret', { expiresIn: '10d' }),
            user: {
                name: user.name,
                email: user.email,
                id: user._id,
            }
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

authRouter.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if (!token) {
            return res.json(false);
        }
        const verified = jwt.verify(token, 'secret');
        if (!verified) {
            return res.json(false);
        }
        const user = await User.findById(verified.id);
        if (!user) {
            return res.json(false);
        }
        res.json(true);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

//Get User Data
authRouter.get('/', auth);


module.exports = authRouter;