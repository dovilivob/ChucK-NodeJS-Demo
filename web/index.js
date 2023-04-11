import { Client } from 'node-osc';
import express from 'express';
import body_parser from 'body-parser';
import path from 'path';

const app = express();
const port = 3003;
const osc_client = new Client('0.0.0.0', 6449);

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(body_parser.json())
app.use(body_parser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    res.render('main')
})

app.get('/send/:data', (req, res) => {
    const sound_status = req.params.data;

    for (let i = 0; i < sound_status.length; i++) {
        const letter = sound_status.charAt(i);
        if (letter != '0') {
            osc_client.send(i.toString(), letter, () => {
                console.log('Message sent, ' + i);
            });
        }
    }
    res.send('ok');
    res.end();
})


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})
