let activeForm = null; // Variable para rastrear el formulario activo

function toggleForm(formId) {
    let form = document.getElementById(formId);

    // Si el formulario ya está activo, lo cerramos
    if (activeForm === form) {
        form.style.display = "none";
        form.querySelectorAll("input").forEach(input => input.value = ""); // Limpia los campos
        activeForm = null;
    } else {
        // Ocultar cualquier formulario activo antes de abrir otro
        if (activeForm) {
            activeForm.style.display = "none";
            activeForm.querySelectorAll("input").forEach(input => input.value = "");
        }

        // Mostrar el nuevo formulario y actualizar la variable activa
        form.style.display = "block";
        activeForm = form;
    }
}

// Cierra el formulario si el usuario hace clic fuera de él
document.body.addEventListener("click", function (e) {
    if (!e.target.closest(".formulario") && !e.target.closest(".buttons button")) {
        if (activeForm) {
            activeForm.style.display = "none";
            activeForm.querySelectorAll("input").forEach(input => input.value = "");
            activeForm = null;
        }
    }
});
