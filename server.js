const express = require("express");
const path = require("path");
require("dotenv").config();

const app = express();
const staticRoutes = require("./routes/static");

// Middleware para analizar formularios (opcional, útil si usas POST más adelante)
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Configuración de EJS
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Archivos estáticos
app.use(express.static(path.join(__dirname, "public")));

// Rutas principales
app.use("/", staticRoutes);

// Manejo de rutas no encontradas (404) - opcional
app.use((req, res) => {
  res.status(404).render("404"); // Crea views/404.ejs si activas esto
});

// Puerto y host
const port = process.env.PORT || 3000;
const host = process.env.HOST || "localhost";

// Iniciar servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://${host}:${port}`);
});
