require("dotenv").config();

const express = require("express");
const app = express();
const fs = require("fs");
const cors = require("cors");
const plantsRoute = require("./routes/plants.js");

const PORT = process.env.PORT || 8080;

// app.use(express.static('public'));
app.use(cors());
app.use(express.json());


app.use("/plant", plantsRoute);


app.listen(PORT, () => {
    console.log("let's get growing 🌱 on port: " + PORT)
});

