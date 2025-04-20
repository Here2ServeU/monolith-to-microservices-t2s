const express = require('express');
const app = express();
app.use(express.json());

app.get('/', (req, res) => {
    res.send("Welcome to the Auth Service");
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log('Auth Service running on port ' + PORT));
