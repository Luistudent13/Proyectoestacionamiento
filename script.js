const loginForm = document.getElementById("loginForm");
const loginPage = document.getElementById("loginPage");
const menuPage = document.getElementById("menuPage");
const welcomePage = document.getElementById("welcomePage");
const alumnoPage = document.getElementById("alumnoPage");

function mostrarLogin() {
  welcomePage.style.display = "none";
  loginPage.style.display = "block";
}

loginForm.addEventListener("submit", function(e) {
  e.preventDefault();
  const user = document.getElementById("username").value.trim();
  const pass = document.getElementById("password").value.trim();

  if (!user || !pass) {
    alert("Por favor llena todos los campos.");
    return;
  }

  // Redirigir al menú (guardia)
  loginPage.style.display = "none";
  menuPage.style.display = "block";
});

// Mostrar pantalla alumno
document.getElementById("btnAlumno").addEventListener("click", () => {
  menuPage.style.display = "none";
  alumnoPage.style.display = "block";
});

function cancelarAlumno() {
  alumnoPage.style.display = "none";
  menuPage.style.display = "block";
}

// Validación de formularios previos (si existiera)
let activeForm = null;

function toggleForm(formId) {
  const form = document.getElementById(formId);

  if (activeForm === form) {
    form.style.display = "none";
    form.querySelectorAll("input").forEach(input => input.value = "");
    activeForm = null;
  } else {
    if (activeForm) {
      activeForm.style.display = "none";
      activeForm.querySelectorAll("input").forEach(input => input.value = "");
    }
    form.style.display = "block";
    activeForm = form;
  }
}

document.body.addEventListener("click", function (e) {
  if (!e.target.closest(".formulario") && !e.target.closest("button")) {
    if (activeForm) {
      activeForm.style.display = "none";
      activeForm.querySelectorAll("input").forEach(input => input.value = "");
      activeForm = null;
    }
  }
});

function formatPlacaInput(event) {
  let valor = event.target.value;
  valor = valor.toUpperCase().replace(/[^A-Z0-9]/g, '');
  event.target.value = valor;
}

document.addEventListener("DOMContentLoaded", () => {
  ['placa', 'matricula_vehiculo', 'placas_visitante'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.addEventListener('input', formatPlacaInput);
  });
});
