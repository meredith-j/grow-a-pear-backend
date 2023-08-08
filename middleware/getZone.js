// const zoneFunction = require("../data/zoneFunction");
const axios = require('axios')
const zones = require("../data/zoneData")
const classifyPoint = require("robust-point-in-polygon");
const API_KEY = process.env.API_KEY;

function zoneFunction(lng, lat) {
    for (let i = 0; i < zones.length; i++) {

    let result = classifyPoint(zones[i], [lng, lat])

        if (result === -1 && (i < 19)) {
            return "0A"
        }
        if (result === -1 && (i < 31)) {
            return "0B"
        }
        if (result === -1 && (i < 50)) {
            return "1A"
        }
        if (result === -1 && (i < 78)) {
            return "1B"
        }
        if (result === -1 && (i < 99)) {
            return "2A"
        }
        if (result === -1 && (i < 176)) {
            return "2B"
        }
        if (result === -1 && (i < 338)) {
            return "3A"
        }
        if (result === -1 && (i < 606)) {
            return "3B"
        }
        if (result === -1 && (i < 785)) {
            return "4A"
        }
        if (result === -1 && (i < 990)) {
            return "4B"
        }
        if (result === -1 && (i < 1185)) {
            return "5A"
        }
        if (result === -1 && (i < 1484)) {
            return "5B"
        }
        if (result === -1 && (i < 1648)) {
            return "6A"
        }
        if (result === -1 && (i < 1751)) {
            return "6B"
        }
        if (result === -1 && (i < 1783)) {
            return "7A"
        }
        if (result === -1 && (i < 1807)) {
            return "7B"
        }
        if (result === -1 && (i < 1834)) {
            return "8A"
        }
        if (result === -1 && (i < 1853)) {
            return "8B"
        }
        if (result === -1 && (i < 1857)) {
            return "9A"
        }
    }
};


const getZone = (req, res, next) => {

    const city = req.body.city
    const province = req.body.province

    let zone;

    axios.get(`https://maps.googleapis.com/maps/api/geocode/json?key=${API_KEY}&address=${city}&${province}&canada&sensor=false`)
         .then((response) => {

            const lat = response.data.results[0].geometry.location.lat
            const lng = response.data.results[0].geometry.location.lng

            zone = zoneFunction(lng, lat)

            req.zone = zone
            next()

         })
         .catch((err) =>{
            console.log(err)
         })
};

module.exports = getZone;