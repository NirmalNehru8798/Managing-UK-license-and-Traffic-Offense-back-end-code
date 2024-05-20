const express = require('express');
const app = express();
const bodyparser = require('body-parser');
const cors = require('cors');

const users = require('./api/users');
const drivingInstructor = require('./api/driving_instructor');
const testCenter = require('./api/test_center');
const userTest = require('./api/user_test');

app.use(cors());
app.use(bodyparser.json({ limit: '20mb' }));
app.use(bodyparser.urlencoded({extended:true}));

app.use("/users",users);
app.use("/drivingInstructor",drivingInstructor);
app.use("/testCenter",testCenter);
app.use("/userTest",userTest);


//if we are here then the specified request is not found
app.use((req,res,next)=> {
    const err = new Error("Not Found");
    err.status = 404;
    next(err);
});

//all other requests are not implemented.
app.use((err,req, res, next) => {
   res.status(err.status || 501);
   res.json({
       error: {
           code: err.status || 501,
           message: err.message
       }
   });
});

module.exports = app;
