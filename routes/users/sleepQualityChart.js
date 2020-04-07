var express = require('express')
var router = express.Router()

var service = require('../../service')
var checkToken = require('../../middleware/checkToken')

router.post('/', checkToken, function(req, res, next){
  service.userService.getHealthDataList(req, function(result){
    res.render('sleepQualityChart',{healthDataList:result._data})
  })
})
router.get('/da', function(req, res, next){
  console.log("上车吗")
  service.userService.getHealthDataList(req, function(result){
    res.render('sleepQualityChart')
  })
})
module.exports = router
