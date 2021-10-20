const express = require('express')
const cors = require('cors')

require('dotenv').config()

const app = express()

app.use(express.static('public'))

app.use(cors())

app.use(express.json())

/* app.use('/api/auth', require('./routes/auth.js'))

app.use('/api/events', require('./routes/events.js'))
 */

app.use('/auth',require('./routes/auth.js'))



app.listen(process.env.PORT, () => {
    console.log(`Server up on port ${process.env.PORT} `)
})