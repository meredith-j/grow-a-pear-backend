// const zoneFunction = require("../data/zoneFunction");
const axios = require('axios')
const zones = require("../data/zoneData")
const classifyPoint = require("robust-point-in-polygon");
const API_KEY = process.env.API_KEY;

function zoneFunction(lng, lat) {
    for (let i = 0; i < zones.length; i++) {

    let result = classifyPoint(zones[i], [lng, lat])

        if (result === -1 && (i < 19)) {
            return "zone_0A"
        }
        if (result === -1 && (i < 31)) {
            return "zone_0B"
        }
        if (result === -1 && (i < 50)) {
            return "zone_1A"
        }
        if (result === -1 && (i < 78)) {
            return "zone_1B"
        }
        if (result === -1 && (i < 99)) {
            return "zone_2A"
        }
        if (result === -1 && (i < 176)) {
            return "zone_2B"
        }
        if (result === -1 && (i < 338)) {
            return "zone_3A"
        }
        if (result === -1 && (i < 606)) {
            return "zone_3B"
        }
        if (result === -1 && (i < 785)) {
            return "zone_4A"
        }
        if (result === -1 && (i < 990)) {
            return "zone_4B"
        }
        if (result === -1 && (i < 1185)) {
            return "zone_5A"
        }
        if (result === -1 && (i < 1484)) {
            return "zone_5B"
        }
        if (result === -1 && (i < 1648)) {
            return "zone_6A"
        }
        if (result === -1 && (i < 1751)) {
            return "zone_6B"
        }
        if (result === -1 && (i < 1783)) {
            return "zone_7A"
        }
        if (result === -1 && (i < 1807)) {
            return "zone_7B"
        }
        if (result === -1 && (i < 1834)) {
            return "zone_8A"
        }
        if (result === -1 && (i < 1853)) {
            return "zone_8B"
        }
        if (result === -1 && (i < 1857)) {
            return "zone_9A"
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