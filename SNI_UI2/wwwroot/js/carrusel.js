let currentIndex = 0;
const totalEmployees = document.querySelectorAll('.employee').length;

function showSlide(index) {
    const carousel = document.getElementById('carousel');
    const offset = -index * 100 + '%';
    carousel.style.transform = 'translateX(' + offset + ')';
}

function nextSlide() {
    currentIndex = (currentIndex + 1) % totalEmployees;
    showSlide(currentIndex);
}

function prevSlide() {
    currentIndex = (currentIndex - 1 + totalEmployees) % totalEmployees;
    showSlide(currentIndex);
}

// Mostrar el primer slide al cargar la página
showSlide(currentIndex);
