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

//videos

document.addEventListener("DOMContentLoaded", function () {
    // Obtener el valor del parámetro de la URL
    var videoId = obtenerParametroUrl("videoId");

    // Si hay un videoId, establecer la URL del iframe
    if (videoId) {
        var youtubeUrl = "https://www.youtube.com/embed/" + videoId;
        document.getElementById("youtubeIframe").src = youtubeUrl;
    }
});

// Función para obtener un parámetro de la URL por su nombre
function obtenerParametroUrl(nombre) {
    nombre = nombre.replace(/[[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + nombre + "=([^&#]*)");
    var resultados = regex.exec(location.search);
    return resultados === null ? "" : decodeURIComponent(resultados[1].replace(/\+/g, " "));
}