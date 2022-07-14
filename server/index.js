const express = require('express');
const app = express();
const PORT = 3000;
const DB = "mongodb+srv://user:<password>@cluster0.k59sm.mongodb.net/?retryWrites=true&w=majority";
const authRouter = require('./routes/auth');
const mongoose = require('mongoose');

app.use(authRouter);

//Connection to MongoDB
mongoose.connect(DB, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => {
    console.log('Connected to MongoDB');
}).catch(err => {
    console.log(err);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is listening on port ${PORT}`);
})