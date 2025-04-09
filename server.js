require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Configuración de la base de datos
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

db.connect(err => {
    if (err) {
        console.error('Error al conectar con MySQL:', err);
    } else {
        console.log('Conectado a MySQL');
    }
});

app.get('/usuarios', (req, res) => {
    const query = `
        SELECT u.ID_Usuario, u.Nombre_Completo, u.Matricula, u.ID_Tipo_Usuario,
               v.Placa, m.Marca AS Marca, v.Color
        FROM Usuarios u
        LEFT JOIN Vehiculos v ON u.ID_Usuario = v.ID_Usuario
        LEFT JOIN marca_vehiculos m ON v.ID_Marca = m.ID_Marca
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error("🚨 Error en la consulta:", err);
            return res.status(500).json({ error: err });
        }
        res.json(results);
    });
});




app.post('/usuarios', (req, res) => {
    const { Nombre_Completo, ID_Tipo_Usuario, Matricula, Correo, Telefono } = req.body;
    db.query(
        'INSERT INTO Usuarios (Nombre_Completo, ID_Tipo_Usuario, Matricula, Correo, Telefono) VALUES (?, ?, ?, ?, ?)',
        [Nombre_Completo, ID_Tipo_Usuario, Matricula, Correo, Telefono],
        (err, result) => {
            if (err) return res.status(500).json({ error: err });
            res.json({ message: 'Usuario registrado', userId: result.insertId });
        }
    );
});

// 🚗 Rutas de vehículos
app.get('/vehiculos', (req, res) => {
    db.query('SELECT * FROM Vehiculos', (err, results) => {
        if (err) return res.status(500).json({ error: err });
        res.json(results);
    });
});

app.post('/vehiculos', (req, res) => {
    const { ID_Usuario, Placa, ID_Marca, Modelo, Color, ID_Discapacidad } = req.body;
    db.query(
        'INSERT INTO Vehiculos (ID_Usuario, Placa, ID_Marca, Modelo, Color, ID_Discapacidad) VALUES (?, ?, ?, ?, ?, ?)',
        [ID_Usuario, Placa, ID_Marca, Modelo, Color, ID_Discapacidad],
        (err, result) => {
            if (err) return res.status(500).json({ error: err });
            res.json({ message: 'Vehículo registrado', vehicleId: result.insertId });
        }
    );
});

// 📌 Rutas de cajones
app.get('/cajones', (req, res) => {
    db.query('SELECT * FROM Cajones_Estacionamiento', (err, results) => {
        if (err) return res.status(500).json({ error: err });
        res.json(results);
    });
});

app.post('/asignar-cajon', (req, res) => {
    const { ID_Cajon, ID_Vehiculo } = req.body;
    db.query(
        'INSERT INTO Asignacion_Cajones (ID_Cajon, ID_Vehiculo) VALUES (?, ?)',
        [ID_Cajon, ID_Vehiculo],
        (err, result) => {
            if (err) return res.status(500).json({ error: err });
            res.json({ message: 'Cajón asignado', assignmentId: result.insertId });
        }
    );
});

// ⏳ Registro de accesos
app.get('/accesos', (req, res) => {
    db.query('SELECT * FROM Registros_Acceso', (err, results) => {
        if (err) return res.status(500).json({ error: err });
        res.json(results);
    });
});

app.post('/registrar-acceso', (req, res) => {
    const { ID_Vehiculo, ID_Usuario, Hora_Entrada } = req.body;
    db.query(
        'INSERT INTO Registros_Acceso (ID_Vehiculo, ID_Usuario, Hora_Entrada) VALUES (?, ?, ?)',
        [ID_Vehiculo, ID_Usuario, Hora_Entrada],
        (err, result) => {
            if (err) return res.status(500).json({ error: err });
            res.json({ message: 'Acceso registrado', accessId: result.insertId });
        }
    );
});


// ❌ Eliminar usuario y su vehículo
app.delete('/usuarios/:id', (req, res) => {
    const id = req.params.id;

    // Primero eliminamos el vehículo relacionado con el usuario
    db.query('DELETE FROM Vehiculos WHERE ID_Usuario = ?', [id], (err) => {
        if (err) return res.status(500).json({ error: err });

        // Luego eliminamos el usuario
        db.query('DELETE FROM Usuarios WHERE ID_Usuario = ?', [id], (err2) => {
            if (err2) return res.status(500).json({ error: err2 });
            res.json({ message: 'Usuario y vehículo eliminados correctamente' });
        });
    });
});




// 🏁 Iniciar el servidor
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
