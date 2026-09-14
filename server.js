const express = require('express');
const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
    res.send('Aplicacao rodando em conteiner Docker!');
});

app.listen(PORT, () => {
    console.log(`servidor rodando na porta ${PORT}`);
});
