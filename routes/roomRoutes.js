const express = require('express');
const roomController = require('../controllers/roomController');
const router = express.Router();

router.get('/rooms', roomController.getAllRooms);
router.get('/rooms/:id', roomController.getRoomById);

module.exports = router;