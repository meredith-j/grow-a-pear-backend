const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient()

const postPlants = (req, res) => {
    console.log(req.body)
    // res.status(200).json(req)

    // declare variable for data
    const { zone, plantData, email } = req.body

        // check to see if email section is empty
    if (email === "") {

        // add data from each item in plantData array
        for (i = 0; i < plantData.length; i++) {

            // check to see if identical entry of plant exists in the plants table


            // if entry exists, add a +1 to "count" column


            // if plant does not exist, post new entry to Plant database
            prisma.post.create({
                data: {
                  plant,
                  isEasy,
                  count,
                  zone
                },
              })

            // function ends
            return
        }
    }

        // when the email section is not empty
    else {

        // for each item in the plantData array:
            // check to see if identical entry of plant exists in the plants table
            // if entry exists, add a +1 to "count" column
                // post email to user emails table with Plants id
            // if plant does not exist, post new entry to Plant database
                // post email to user emails table with Plants id
            // function ends
    }
        
};

module.exports = {
    postPlants
    };