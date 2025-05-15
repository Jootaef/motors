const express = require("express");
const path = require("path");
require("dotenv").config();

const app = express();
const staticRoutes = require("./routes/static");

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// View engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Public folder
app.use(express.static(path.join(__dirname, "public")));

// Routes
app.use("/", staticRoutes);

// Catch-all 404 (opcional)
app.use((req, res) => {
  res.status(404).render("404"); // solo si tienes views/404.ejs
});

// ✅ Render-friendly port setup
const port = process.env.PORT;

app.listen(port, () => {
  console.log(`Servidor corriendo en el puerto ${port}`);
});
