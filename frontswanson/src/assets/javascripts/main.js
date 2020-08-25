import Amber from 'amber';
import Logo from '../images/logo.svg';


function createEntity(htmlString) {
    const body = document.querySelector('body'); 

    const container = document.createElement('div');
    container.innerHTML = htmlString;
    const el = container.firstChild;

    document.body.appendChild(el);

    return el;
}


import './fly.js'

window.addEventListener('load', (e) => {
    const socket = new Amber.Socket('/rpc');

    socket.connect().then(function() {
        let channel = socket.channel('rpc');
        channel.join();


        channel.push('message_new', {
            message: "Hello Amber from frontswanson js rpc"
        });

        channel.on('message_new', (payload) => {
            const e = createEntity(payload.html);
            console.log(payload);
            e.setAttribute('data-velx', payload.velx);
            e.setAttribute('data-vely', payload.vely);
        });
    });
});

