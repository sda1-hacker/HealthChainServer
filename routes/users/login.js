var express = require('express')
var router = express.Router()

var service = require('../../service')

router.post('/', function(req, res, next){
  service.userService.login(req, function(result){
    res.json(result)
  })
})

module.exports = router
