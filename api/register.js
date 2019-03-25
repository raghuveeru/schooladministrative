const registerRoute = require('express').Router();

registerRoute.get('/register', (req, res, next) => {
    res.status(201).json({
        message: 'handle post from register ###############'
    });
});

module.exports = registerRoute;