import { Server } from 'node-osc';

const server = new Server(6449, '0.0.0.0', () => {
    console.log('OSC Server is listening on port 6449');
});

server.on('message', (msg, rinfo) => {
  console.log('Message:', msg, 'from:', rinfo);
});
