let velx = 2.3
let vely = 1.1;



const moveEntity = () => {
    const entity = document.body.querySelector(".entity");
    const rect = entity.getBoundingClientRect();

    
    entity.style.borderColor = `rgb(170,${rect.left % 255},153)`
    entity.style.borderWidth = ((rect.left/30) % 26) + 'px';
    // entity.style.transform = `rotate(${-10 + rect.left % 20}deg)`;

    entity.style.left = (rect.left + velx) + "px";
    entity.style.top = rect.top + vely + 'px';

    velx = velx + (Math.random() / 2 - 0.25);
    // console.log(velx)
    vely = vely + (Math.random() / 2 - 0.25);
    // console.log(entity.style);
}

window.addEventListener('load', (e) => {
    setInterval(() => {
        moveEntity();
    }, 10);
})