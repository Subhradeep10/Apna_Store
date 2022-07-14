const express = require('express');
const app = express();
const PORT = 3000;
const authRouter = require('./routes/auth');

app.use(authRouter);

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Server is listening on port ${PORT}`);
})