const notificationRoute = require('express').Router();

notificationRoute.post('/retrievefornotifications', (req, res, next) => {
    res.status(204).json({
        message: 'handle post'
    });
});

module.exports = notificationRoute;