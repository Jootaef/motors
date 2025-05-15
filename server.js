const express = require("express");
const path = require("path");
require("dotenv").config();

const app = express();
const staticRoutes = require("./routes/static");

// Configuración de EJS
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Archivos estáticos
app.use(express.static(path.join(__dirname, "public")));

// Rutas
app.use("/", staticRoutes);

// Puerto y host
const port = process.env.PORT || 3000;
const host = process.env.HOST || "localhost";

// Iniciar servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://${host}:${port}`);
});
