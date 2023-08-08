const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient()

const postPlants = (req, res) => {
    console.log(req.body)
    // res.status(200).json(req)
};

module.exports = {
    postPlants
    };