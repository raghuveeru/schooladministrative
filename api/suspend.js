const suspendRoute = require('express').Router();

suspendRoute.post('./suspend', (req, res, next) => {
    res.status(204).json({
        message: 'handle post'
    });
});

module.exports = suspendRoute;