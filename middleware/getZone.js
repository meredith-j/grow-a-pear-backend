// const zoneFunction = require("../data/zoneFunction");
const axios = require('axios');
const zones = require("../data/zoneData");
const classifyPoint = require("robust-point-in-polygon");
const API_KEY = process.env.API_KEY;

function zoneFunction(lng, lat) {
    for (let i = 0; i < zones.length; i++) {

    let result = classifyPoint(zones[i], [lng, lat]);
    
        if (result === -1 && (i < 19)) {
            return "0A"
        }
        else if (result === -1 && (i < 31)) {
            return "0B"
        }
        else if (result === -1 && (i < 50)) {
            return "1A"
        }
        else if (result === -1 && (i < 78)) {
            return "1B"
        }
        else if (result === -1 && (i < 99)) {
            return "2A"
        }
        else if (result === -1 && (i < 176)) {
            return "2B"
        }
        else if (result === -1 && (i < 338)) {
            return "3A"
        }
        else if (result === -1 && (i < 606)) {
            return "3B"
        }
        else if (result === -1 && (i < 785)) {
            return "4A"
        }
        else if (result === -1 && (i < 990)) {
            return "4B"
        }
        else if (result === -1 && (i < 1185)) {
            return "5A"
        }
        else if (result === -1 && (i < 1484)) {
            return "5B"
        }
        else if (result === -1 && (i < 1648)) {
            return "6A"
        }
        else if (result === -1 && (i < 1751)) {
            return "6B"
        }
        else if (result === -1 && (i < 1783)) {
            return "7A"
        }
        else if (result === -1 && (i < 1807)) {
            return "7B"
        }
        else if (result === -1 && (i < 1834)) {
            return "8A"
        }
        else if (result === -1 && (i < 1853)) {
            return "8B"
        }
        else if (result === -1 && (i < 1857)) {
            return "9A"
        }
    }
};


const getZone = (req, res, next) => {

    const city = req.body.city
    const province = req.body.province

    // check for 10 most populus cities in canada so that cost of API requests to google stays low
    if (city === "Toronto" || province === "Ontario") {
        req.body.zone = "7a";
        next()
    }

    else if (city === "Mississauga" && province === "Ontario" || city === "Hamilton" && province === "Ontario") {
        req.body.zone = "6b";
        next()
    }

    else if (city === "Montreal" && province === "Quebec" || city === "Montréal" && province === "Quebec" || city === "Brampton" && province === "Ontario") {
        req.body.zone = "6a";
        next()
    }

    else if (city === "Calgary" &&  province === "Alberta" || city === "Edmonton" && province === "Alberta" || city === "Winnipeg" && province === "Manitoba") {
        req.body.zone = "4a";
        next()
    }

    else if (city === "Ottawa" && province === "Ontario") {
        req.body.zone = "5b";
        next()
    }

    else if (city === "Vancouver" && province === "British Colombia") {
        req.body.zone = "8b";
        next()
    }

    // if person is not from above cities, process google API get request
    else {

        axios.get(`https://maps.googleapis.com/maps/api/geocode/json?key=${API_KEY}&address=${city}&${province}&canada&sensor=false`)
            .then((response) => {

                const lat = response.data.results[0].geometry.location.lat
                const lng = response.data.results[0].geometry.location.lng

                const zone = zoneFunction(lng, lat)

                req.body.zone = zone;
                req.body.lat = lat;
                req.body.lng = lng;

                next()

            })
            .catch((err) =>{
                console.log(err)
            })
    }
};

module.exports = getZone;