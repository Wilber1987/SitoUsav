const menu = document.querySelector('.menu');
const nave = document.querySelector('.menu-nav');



menu.addEventListener('click', ()=>{
    nave.classList.toggle('spread')
})

window.addEventListener('click', e=>{
    if(nave.classList.contains('spread')&& e.target != nave && e.target !=menu){
        
        nave.classList.toggle('spread')
    }
})