
const rectOutOfBound = (rect) => {
    return rect.right < 0 || rect.bottom < 0 || rect.left > 2000 || rect.top > 2000;
}


const moveEntity = (e) => {
    // console.log(e);

    const velx = parseFloat(e.getAttribute('data-velx'));
    const vely = parseFloat(e.getAttribute('data-vely'));

    const rect = e.getBoundingClientRect();
    if(rectOutOfBound(rect)) {
        console.log('rekt');
        e.remove();
        return;
    }

    e.style.borderColor = `rgb(170,${rect.left % 255},153)`
    e.style.borderWidth = ((rect.left / 30) % 26) + 'px';


    e.style.left = (rect.left + velx) + "px";
    e.style.top = (rect.top + vely) + 'px';

    e.setAttribute('data-velx', velx + (Math.random() / 2 - 0.25)/4);
    e.setAttribute('data-vely', vely + (Math.random() / 2 - 0.25)/4);
}



const moveEntities = () => {


    document.body.querySelectorAll('.entity').forEach((e) => {
        // console.log(e)
        moveEntity(e);
    });

}

window.addEventListener('load', (e) => {
    setInterval(() => {
        moveEntities();
    }, 10);
})