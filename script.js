//📌 Define la URL base del backend para todas las peticiones fetch.
const API_URL = "http://localhost:3000";

// 🔹 Mostrar pantalla de login
function mostrarLogin() {
  document.getElementById("welcomePage").style.display = "none";
  document.getElementById("loginPage").style.display = "block";
}

// 🔹 Manejar login
document.getElementById("loginForm").addEventListener("submit", function (e) {
  e.preventDefault();

  const username = document.getElementById("username").value;
  const password = document.getElementById("password").value;

  if (username === "admin_ucc" && password === "123") {
    document.getElementById("loginPage").style.display = "none";
    document.getElementById("menuPage").style.display = "block";
  } else {
    alert("Credenciales incorrectas");
  }
});

// 🔹 Mostrar formulario alumno
document.getElementById("btnAlumno").addEventListener("click", function () {
  document.getElementById("menuPage").style.display = "none";
  document.getElementById("alumnoPage").style.display = "block";
});

// 🔹 Función para enviar el formulario del alumno (con validación de matrícula)
document.getElementById("formAlumno").addEventListener("submit", async function (e) {
  e.preventDefault();

  const nombre = document.getElementById("nombre").value.trim();
  const apellidos = document.getElementById("apellidos").value.trim();
  const matricula = document.getElementById("matricula").value.trim();
  const telefono = "";

  const placa = document.getElementById("placa").value.trim();
  const color = document.getElementById("color").value.trim();
  const marcaSeleccionada = document.getElementById("marca").value;

  const nombreCompleto = `${nombre} ${apellidos}`;
  const ID_Tipo_Usuario = 2;

  let idMarca = 0;
  switch (marcaSeleccionada) {
    case "Toyota": idMarca = 1; break;
    case "Honda": idMarca = 2; break;
    case "Chevrolet": idMarca = 3; break;
    case "Mercedes-Benz": idMarca = 4; break;
    default:
      alert("Selecciona una marca válida.");
      return;
  }

  if (!nombre || !apellidos || !matricula || !placa || !color) {
    alert("Por favor, completa todos los campos obligatorios.");
    return;
  }

  try {
    const resUsuarios = await fetch(`${API_URL}/usuarios`);
    const usuarios = await resUsuarios.json();

    const existeMatricula = usuarios.some(u => u.Matricula === matricula);
    if (existeMatricula) {
      alert("Ya existe un usuario con esa matrícula.");
      return;
    }

    const usuarioPayload = {
      Nombre_Completo: nombreCompleto,
      ID_Tipo_Usuario,
      Matricula: matricula
    };

    const resUsuario = await fetch(`${API_URL}/usuarios`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(usuarioPayload)
    });

    const usuarioData = await resUsuario.json();
    if (!resUsuario.ok) {
      throw new Error(usuarioData.error?.sqlMessage || "Error al registrar usuario");
    }

    const ID_Usuario = usuarioData.userId;

    const resVehiculo = await fetch(`${API_URL}/vehiculos`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ID_Usuario,
        Placa: placa,
        ID_Marca: idMarca,
        Modelo: "",
        Color: color,
        ID_Discapacidad: null
      })
    });

    const vehiculoData = await resVehiculo.json();
    if (!resVehiculo.ok) {
      throw new Error(vehiculoData.error?.sqlMessage || "Error al registrar vehículo");
    }

    alert("Alumno y vehículo registrados con éxito 🎉");
    document.getElementById("formAlumno").reset();
  } catch (error) {
    console.error("🚨 Error:", error);
    alert("Ocurrió un error: " + error.message);
  }
});

function cancelarAlumno() {
  document.getElementById("alumnoPage").style.display = "none";
  document.getElementById("menuPage").style.display = "block";
}

// 🔹 Mostrar formulario catedrático
document.getElementById("btnEmpleado").addEventListener("click", function () {
  document.getElementById("menuPage").style.display = "none";
  document.getElementById("empleadoPage").style.display = "block";
});

// 🔹 Función para enviar el formulario del catedrático (con validación de matrícula)
document.getElementById("formEmpleado").addEventListener("submit", async function (e) {
  e.preventDefault();

  const nombre = document.getElementById("nombre_empl").value.trim();
  const apellidos = document.getElementById("apellidos_empl").value.trim();
  const matricula = document.getElementById("matricula_empl").value.trim();
  const telefono = "";

  const placa = document.getElementById("placa_empl").value.trim();
  const color = document.getElementById("color_empl").value.trim();
  const marcaSeleccionada = document.getElementById("marca_empl").value;

  const nombreCompleto = `${nombre} ${apellidos}`;
  const ID_Tipo_Usuario = 3;

  let idMarca = 0;
  switch (marcaSeleccionada) {
    case "Toyota": idMarca = 1; break;
    case "Honda": idMarca = 2; break;
    case "Chevrolet": idMarca = 3; break;
    case "Mercedes-Benz": idMarca = 4; break;
    default:
      alert("Selecciona una marca válida.");
      return;
  }

  if (!nombre || !apellidos || !matricula || !placa || !color) {
    alert("Por favor, completa todos los campos obligatorios.");
    return;
  }

  try {
    const resUsuarios = await fetch(`${API_URL}/usuarios`);
    const usuarios = await resUsuarios.json();

    const existeMatricula = usuarios.some(u => u.Matricula === matricula);
    if (existeMatricula) {
      alert("Ya existe un usuario con esa matrícula.");
      return;
    }

    const usuarioPayload = {
      Nombre_Completo: nombreCompleto,
      ID_Tipo_Usuario,
      Matricula: matricula
    };

    const resUsuario = await fetch(`${API_URL}/usuarios`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(usuarioPayload)
    });

    const usuarioData = await resUsuario.json();
    if (!resUsuario.ok) {
      throw new Error(usuarioData.error?.sqlMessage || "Error al registrar usuario");
    }

    const ID_Usuario = usuarioData.userId;

    const resVehiculo = await fetch(`${API_URL}/vehiculos`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ID_Usuario,
        Placa: placa,
        ID_Marca: idMarca,
        Modelo: "",
        Color: color,
        ID_Discapacidad: null
      })
    });

    const vehiculoData = await resVehiculo.json();
    if (!resVehiculo.ok) {
      throw new Error(vehiculoData.error?.sqlMessage || "Error al registrar vehículo");
    }

    alert("Empleado y vehículo registrados con éxito 🎉");
    document.getElementById("formEmpleado").reset();
  } catch (error) {
    console.error("🚨 Error:", error);
    alert("Ocurrió un error: " + error.message);
  }
});

function cancelarEmpleado() {
  document.getElementById("empleadoPage").style.display = "none";
  document.getElementById("menuPage").style.display = "block";
}

document.getElementById("formTemporal").addEventListener("submit", async function (e) {
  e.preventDefault();

  const nombre = document.getElementById("nombre_temp").value.trim();
  const apellidos = document.getElementById("apellidos_temp").value.trim();
  const motivo = document.getElementById("motivo_visita").value.trim();

  const placa = document.getElementById("placa_temp").value.trim();
  const color = document.getElementById("color_temp").value.trim();
  const marcaSeleccionada = document.getElementById("marca_temp").value;

  const nombreCompleto = `${nombre} ${apellidos}`;
  const ID_Tipo_Usuario = 4;

  let idMarca = 0;
  switch (marcaSeleccionada) {
    case "Toyota": idMarca = 1; break;
    case "Honda": idMarca = 2; break;
    case "Chevrolet": idMarca = 3; break;
    case "Mercedes-Benz": idMarca = 4; break;
    default:
      alert("Selecciona una marca válida.");
      return;
  }

  if (!nombre || !apellidos || !motivo || !placa || !color) {
    alert("Por favor, completa todos los campos.");
    return;
  }

  try {
    const usuarioPayload = {
      Nombre_Completo: nombreCompleto,
      ID_Tipo_Usuario,
      Matricula: `Visita: ${motivo}`
    };

    const resUsuario = await fetch(`${API_URL}/usuarios`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(usuarioPayload)
    });

    const usuarioData = await resUsuario.json();
    if (!resUsuario.ok) throw new Error(usuarioData.error?.sqlMessage || "Error al registrar usuario");

    const ID_Usuario = usuarioData.userId;

    const resVehiculo = await fetch(`${API_URL}/vehiculos`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ID_Usuario,
        Placa: placa,
        ID_Marca: idMarca,
        Modelo: "",
        Color: color,
        ID_Discapacidad: null
      })
    });

    const vehiculoData = await resVehiculo.json();
    if (!resVehiculo.ok) throw new Error(vehiculoData.error?.sqlMessage || "Error al registrar vehículo");

    alert("Usuario temporal y vehículo registrados con éxito 🎉");
    document.getElementById("formTemporal").reset();
  } catch (error) {
    console.error("🚨 Error:", error);
    alert("Ocurrió un error: " + error.message);
  }
});



// 🔹 Mostrar formulario de usuario temporal
document.getElementById("btnTemporal").addEventListener("click", function () {

  document.getElementById("menuPage").style.display = "none";
  document.getElementById("temporalPage").style.display = "block";
});

// 🔹 Cancelar temporal
function cancelarTemporal() {
  document.getElementById("temporalPage").style.display = "none";
  document.getElementById("menuPage").style.display = "block";
}




// Botón ver registros
document.getElementById("btnVerRegistros").addEventListener("click", async function () {
  document.getElementById("menuPage").style.display = "none";
  document.getElementById("registrosPage").style.display = "block";

  try {
    const res = await fetch(`${API_URL}/usuarios`);
    const data = await res.json();

    if (!Array.isArray(data)) {
      throw new Error("Formato inesperado de respuesta");
    }

    const registrosBody = document.getElementById("registrosBody");
    registrosBody.innerHTML = "";

    data.forEach(usuario => {
      const tipo = usuario.ID_Tipo_Usuario === 2 ? "Alumno" :
             usuario.ID_Tipo_Usuario === 3 ? "Empleado" :
             usuario.ID_Tipo_Usuario === 4 ? "Temporal" :
             usuario.ID_Tipo_Usuario === 5 ? "Visitante" :
             "Otro";

      const row = `
        <tr>
          <td>${usuario.ID_Usuario}</td>
          <td>${usuario.Nombre_Completo}</td>
          <td>${usuario.Matricula || "-"}</td>
          <td>${tipo}</td>
          <td>${usuario.Placa || "-"}</td>
          <td>${usuario.Marca || "-"}</td>
          <td>${usuario.Color || "-"}</td>
          <td>
            <button class="btn-rojo-mini" onclick="eliminarUsuario(${usuario.ID_Usuario})">Eliminar</button>
          </td>
        </tr>
      `;
      registrosBody.insertAdjacentHTML("beforeend", row);
    });
  } catch (error) {
    console.error("Error al cargar registros:", error);
    alert("No se pudieron cargar los registros.");
  }
});

function volverAlMenu() {
  document.getElementById("registrosPage").style.display = "none";
  document.getElementById("menuPage").style.display = "block";
}

async function eliminarUsuario(id) {
  const confirmado = confirm("¿Estás seguro de que deseas eliminar este usuario?");
  if (!confirmado) return;

  try {
    const res = await fetch(`${API_URL}/usuarios/${id}`, {
      method: "DELETE"
    });

    const data = await res.json();

    if (!res.ok) {
      throw new Error(data.error || "No se pudo eliminar");
    }

    alert("Usuario eliminado correctamente");
    document.getElementById("btnVerRegistros").click();
  } catch (err) {
    console.error("Error al eliminar usuario:", err);
    alert("Error al eliminar el registro.");
  }
}

// Mostrar pantalla de verificación
document.getElementById("btnIngreso").addEventListener("click", function () {
  document.getElementById("menuPage").style.display = "none";
  document.getElementById("verificacionPage").style.display = "flex";
});

function cancelarVerificacion() {
  document.getElementById("verificacionPage").style.display = "none";
  document.getElementById("menuPage").style.display = "block";
  document.getElementById("placaVerificar").value = "";
  document.getElementById("resultadoVerificacion").innerText = "";
}

async function verificarPlaca() {
  const placa = document.getElementById("placaVerificar").value.trim();
  const resultado = document.getElementById("resultadoVerificacion");

  if (!placa) {
    alert("Por favor ingresa una placa.");
    return;
  }

  try {
    const res = await fetch(`${API_URL}/vehiculos`);
    const data = await res.json();

    const vehiculo = data.find(v => v.Placa.toUpperCase() === placa.toUpperCase());

    if (vehiculo) {
      resultado.innerText = "✅ Vehículo registrado. Acceso permitido.";
      resultado.style.color = "green";
    } else {
      resultado.innerText = "❌ Vehículo NO registrado.";
      resultado.style.color = "red";
    }
  } catch (error) {
    console.error("Error al verificar placa:", error);
    alert("Ocurrió un error al verificar.");
  }
}

function formatearPlaca(input) {
  let valor = input.value.toUpperCase().replace(/[^A-Z0-9]/g, '');

  // Limitar a 7 caracteres válidos
  valor = valor.slice(0, 7);

  // Formato: XXX-000-X
  let formateada = '';
  if (valor.length <= 3) {
    formateada = valor;
  } else if (valor.length <= 6) {
    formateada = valor.slice(0, 3) + '-' + valor.slice(3);
  } else {
    formateada = valor.slice(0, 3) + '-' + valor.slice(3, 6) + '-' + valor.slice(6);
  }

  input.value = formateada;
}

function cerrarSesion() {
  document.getElementById("menuPage").style.display = "none";
  document.getElementById("loginPage").style.display = "block";

  // Limpiar campos de login (opcional)
  document.getElementById("username").value = "";
  document.getElementById("password").value = "";
}

function mostrarModalCerrarSesion() {
  document.getElementById("modalCerrarSesion").style.display = "flex";
}

function cancelarCerrarSesion() {
  document.getElementById("modalCerrarSesion").style.display = "none";
}

function confirmarCerrarSesion() {
  document.getElementById("modalCerrarSesion").style.display = "none";
  cerrarSesion(); // esta función ya la tienes
}


document.getElementById("btnVisitante").addEventListener("click", function () {
  document.getElementById("menuPage").style.display = "none";
  document.getElementById("visitantePage").style.display = "block";
});


document.getElementById("formVisitante").addEventListener("submit", async function (e) {
  e.preventDefault();

  const nombre = document.getElementById("nombre_visitante").value.trim();
  const apellidos = document.getElementById("apellidos_visitante").value.trim();
  const evento = document.getElementById("evento_visitante").value.trim();
  const horaEntrada = document.getElementById("hora_ingreso").value;
  const horaSalida = document.getElementById("hora_salida").value;

  const placa = document.getElementById("placa_visitante").value.trim();
  const color = document.getElementById("color_visitante").value.trim();
  const marcaSeleccionada = document.getElementById("marca_visitante").value;

  const nombreCompleto = `${nombre} ${apellidos}`;
  const ID_Tipo_Usuario = 5;

  let idMarca = 0;
  switch (marcaSeleccionada) {
    case "Toyota": idMarca = 1; break;
    case "Honda": idMarca = 2; break;
    case "Chevrolet": idMarca = 3; break;
    case "Mercedes-Benz": idMarca = 4; break;
    default:
      alert("Selecciona una marca válida.");
      return;
  }

  if (!nombre || !apellidos || !evento || !horaEntrada || !horaSalida || !placa || !color) {
    alert("Por favor, completa todos los campos.");
    return;
  }

  try {
    const usuarioPayload = {
      Nombre_Completo: nombreCompleto,
      ID_Tipo_Usuario,
      Matricula: evento,
      Hora_Entrada: horaEntrada,
      Hora_Salida: horaSalida
    };

    const resUsuario = await fetch(`${API_URL}/usuarios`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(usuarioPayload)
    });

    const usuarioData = await resUsuario.json();
    if (!resUsuario.ok) throw new Error(usuarioData.error?.sqlMessage || "Error al registrar visitante");

    const ID_Usuario = usuarioData.userId;

    const resVehiculo = await fetch(`${API_URL}/vehiculos`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        ID_Usuario,
        Placa: placa,
        ID_Marca: idMarca,
        Modelo: "",
        Color: color,
        ID_Discapacidad: null
      })
    });

    const vehiculoData = await resVehiculo.json();
    if (!resVehiculo.ok) throw new Error(vehiculoData.error?.sqlMessage || "Error al registrar vehículo");

    alert("Visitante registrado con éxito 🎉");
    document.getElementById("formVisitante").reset();
  } catch (error) {
    console.error("🚨 Error al registrar visitante:", error);
    alert("Ocurrió un error: " + error.message);
  }
});

function cancelarVisitante() {
  document.getElementById("visitantePage").style.display = "none";
  document.getElementById("menuPage").style.display = "block";
}
