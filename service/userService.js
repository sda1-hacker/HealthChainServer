var dao = require('../dao')
var createToken = require('../middleware/createToken')
var BigNumber = require("bignumber.js")
var dateUtil = require('../utils/dateUtil')
var obj = {
  _code: '',
  _msg: '',
  _data: {}
}

// 用户登录
function login(req, callback){
  if(req.body && req.body.account && req.body.password){
    dao.userDao.findByAccount(req.body.account, function(status, result){
      // 验证登录
      if(1 === status && result[0] && result[0].password === req.body.password){
        obj._code = '200'
        obj._msg = '登录成功'
        obj._data.token = createToken({id: result[0].id, type: 'user'})
        delete result[0].privateKey
        delete result[0].contractAddr
        obj._data.userInfo = result[0]
        callback(obj)
      } else {
        obj._code = '201'
        obj._msg = '登录失败'
        obj._data = {}
        callback(obj)
      }
    })
  } else {
    obj._code = '201'
    obj._msg = '登录失败'
    obj._data = {}
    callback(obj)
  }
}

// 用户注册
function register(req, callback){
  if(req.body && req.body.account && req.body.password){
    // 判定账户是否已存在
    dao.userDao.findByAccount(req.body.account, function(status, result){
      if(1 === status && !result[0]){
        // 生成私钥、地址、初始化智能合约
        dao.ethDao.createAccout(function(status, result){
          if(1 == status){
            req.body.privateKey = result.privateKey
            req.body.ethAddress = result.ethAddress
            req.body.contractAddr = result.contractAddr
            dao.userDao.insert(req.body, function(status){
              if(1 === status){
                obj._code = '200'
                obj._msg = '注册成功'
                obj._data = {}
                callback(obj)
              } else {
                obj._code = '201'
                obj._msg = '注册失败'
                obj._data = {}
                callback(obj)
              }
            })
          } else {
            obj._code = '201'
            obj._msg = '注册失败'
            obj._data = {}
            callback(obj)
          }
        })
      } else {
        obj._code = '201'
        obj._msg = '注册失败'
        obj._data = {}
        callback(obj)
      }
    })
  } else {
    obj._code = '201'
    obj._msg = '注册失败'
    obj._data = {}
    callback(obj)
  }
}

// 获取用户信息
function getUserInfo(req, callback){
  if(req.body && req.body.verify && req.body.verify.id){
    dao.userDao.findByPrimaryKey(req.body.verify.id, function(status, result){
      if(1 === status && result[0]){
        obj._code = '200'
        obj._msg = '查询成功'
        delete result[0].privateKey
        delete result[0].contractAddr
        obj._data = result[0]
        callback(obj)
      } else {
        obj._code = '201'
        obj._msg = '查询失败'
        obj._data = {}
        callback(obj)
      }
    })
  } else {
    obj._code = '201'
    obj._msg = '查询失败'
    obj._data = {}
    callback(obj)
  }
}

// 更新用户信息
function updateUserInfo(req, callback){
  if(req.body && req.body.verify && req.body.verify.id){
    var id = req.body.verify.id
    delete req.body.token
    delete req.body.verify
    dao.userDao.findByPrimaryKey(id, function(status, result){
      if(1 === status && result[0]){
        dao.userDao.updateByPrimaryKey([req.body, id], function(status){
          obj._code = '200'
          obj._msg = '更新成功'
          obj._data = {}
          callback(obj)
        })
      } else {
        obj._code = '201'
        obj._msg = '更新失败'
        obj._data = {}
        callback(obj)
      }
    })
  } else {
    obj._code = '201'
    obj._msg = '更新失败'
    obj._data = {}
    callback(obj)
  }
}

// 获取医疗服务列表
function getMedicalServiceList(req, callback){
  dao.medicalServiceDao.findAllAudited(function(status, result){
    if(1 === status){
      obj._code = '200'
      obj._msg = '查询成功'
      obj._data = {
        medicalServiceList: {
          data: result
        }
      }
      callback(obj)
    }
    else {
      obj._code = '201'
      obj._msg = '查询失败'
      obj._data = {}
      callback(obj)
    }
  })
}

// 获取健康数据
function getHealthData(req, callback){
  if(req.body && req.body.verify){
    dao.user_healthdataDao.findAllDataById(req.body.verify.id, function(status, result){
      if(1 === status){
        obj._code = '200'
        obj._msg = '查询成功'
        obj._data = {
          healthMetaDataList: result
        }
        callback(obj)
      } else {
        obj._code = '201'
        obj._msg = '查询失败'
        obj._data = {}
      }
    })
  } else {
    obj._code = '200'
    obj._msg = '查询失败'
    obj._data = {}
  }
}

function transferUserToUser(req, callback){
  if(req.body && req.body.verify && req.body.verify.id){
    var id = req.body.verify.id
    dao.userDao.findByPrimaryKey(id, function(status, result){
      if( 1 === status && result[0]){
        console.log(result[0])
        dao.userDao.findByAccount(req.body.account, function(status1, result1){
          if(1 === status1 && result1[0]){
            var senderPrivateKey = result[0].privateKey;
            var receiverEthAddr = result1[0].ethAddress;
            var value = new BigNumber(req.body.value);
            dao.ethDao.transfer(senderPrivateKey, receiverEthAddr, value, function(sta){
              if( 1 === sta){
                var record = {
                  sendAddress: result[0].ethAddress,  // 发送方地址
                  recieveAddress: receiverEthAddr,  // 接收方地址
                  transactEth: value,     // 交易金额
                  transactTime: dateUtil.format(new Date(), '-'),   // 交易时间
                  transactAddr: '',       // 交易地址
                  transactRemarks: req.body.transactRemarks  // 备注

                }
                dao.transactionrecordDao.insert(record, function(s, r){
                  if( 1 === s){
                    obj._code = "200";
                    obj._msg = "转账成功..记录插入成功..";
                    obj._data = {};
                    callback(obj);
                  }
                  else{
                    obj._code = "201";
                    obj._msg = "交易记录插入失败";
                    obj._data = {};
                    callback(obj);
                  }
                })

              }
              else{
                obj._code = "201";
                obj._msg = "转账失败..";
                obj._data = {};
                callback(obj);
              }
            })
          }else{
            obj._code = "201";
            obj._msg = "转账失败..";
            obj._data = {};
            callback(obj);
          }
        })
      }
      else{
        obj._code = "201";
        obj._msg = "转账用户不存在..";
        obj._data = {};
        callback(obj);
      }
    })
  }
}

module.exports = {
  login,
  register,
  getUserInfo,
  updateUserInfo,
  getMedicalServiceList,
  getHealthData,
  transferUserToUser
}
