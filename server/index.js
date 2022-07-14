const express = require('express');
const app = express();
const PORT = 3000;
const authRouter = require('./routes/auth');
const mongoose = require('mongoose');

app.use(authRouter);

//Connection to MongoDB
mongoose.connect('', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true
}).then(() => { }).catch(err => { });

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is listening on port ${PORT}`);
})