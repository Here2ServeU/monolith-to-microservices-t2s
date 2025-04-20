const express = require('express');
const app = express();
app.use(express.json());

app.get('/', (req, res) => {
    res.send("Welcome to the Enrollment Service");
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log('Enrollment Service running on port ' + PORT));
