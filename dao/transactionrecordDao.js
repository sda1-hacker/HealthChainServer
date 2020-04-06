var db = require("../db/mysql")

var conn = db.connect()

// 参数{交易记录 json}
function insert(params, callback){
  var sql_insert = "insert into transactionrecord set ?"

  conn.query(sql_insert, params, function(err, res){
    if(err){
      console.log('[INSERT ERROR] - ',err.message);
      callback(0);
      return;
    }
    console.log("插入成功");
    callback(1);
  })
}

// 参数 id
function deleteByPrimaryKey(params, callback){
  var sql_delete = "delete from transactionrecord where id = ?"

  conn.query(sql_delete, [params], function(err, res){
    if(err){
      console.log('[DELETE ERROR] - ',err.message);
      callback(0);
      return;
    }
    console.log("删除成功");
    callback(1);
  })
}

// 参数 id
function findByPrimaryKey(params, callback){
  var sql_select = "select * from transactionrecord where 1 = 1 and id = ?"

  conn.query(sql_select, [params], function(err, res){
    if(err){
      console.log('[FIND ERROR] - ',err.message);
      callback(0);
      return false;
    }
    console.log("查找成功");
    callback(1, res);
  })
}

//参数发送者ethAddress
function findBysendAddress(params, callback){
  var sql_select = "select * from transactionrecord where 1 = 1 and sendAddress = ?"

  conn.query(sql_select, [params], function(err, res){
    if(err){
      console.log('[FIND ERROR] - ',err.message);
      callback(0);
      return false;
    }
    console.log("查找成功");
    callback(1, res);
  })
}

// 参数列表{"sendAddress": "", "recieveAddress": "", "transactTime":"", "limit": 1, "page": 2}
function findByConditionsCount(params, callback){
  var sql_select_count = 'select count(*) as allCount from transactionrecord where 1 = 1 '  // 注意末尾空格

  if(params.sendAddress != "" && params.sendAddress != null)
    sql_select_count += 'and sendAddress = ' + '\"'  + params.sendAddress + '\" ' // 字符串拼接需要引号，注意末尾空格

  if(params.recieveAddress != "" && params.recieveAddress != null)
    sql_select_count += 'or recieveAddress = ' + '\"'  + params.recieveAddress + '\" ' // 字符串拼接需要引号，注意末尾空格

  if(params.transactTime != "" && params.transactTime != null)
    sql_select_count += 'and transactTime = ' + '\"'  + params.transactTime + '\" ' // 字符串拼接需要引号，注意末尾空格

  if(params.transactRemarks != "" && params.transactRemarks != null)
    sql_select_count += 'and transactRemarks = ' + '\"'  + params.transactRemarks + '\" ' // 字符串拼接需要引号，注意末尾空格


  console.log(sql_select_count)

  conn.query(sql_select_count, "",function(err, res){
    if(err){
      console.log('[FIND ERROR] - ',err.message);
      callback(0);
      return;
     }
    console.log("条数查找成功~");
    callback(1, res);
  })
}

// 参数列表{"sendAddress": "", "recieveAddress": "", "transactTime":"", "limit": 1, "page": 2}
function findByConditions(params, callback){
  var sql_select = 'select * from transactionrecord where 1 = 1 '

  if(params.operateTime != "" && params.operateTime != null)
    sql_select += 'and operateTime = ' + '\"' + params.operateTime + '\" '

  if(params.operateResult != "" && params.operateResult != null)
    sql_select += 'or operateResult = ' + '\"' + params.operateResult + '\" '

  if(params.transactTime != "" && params.transactTime != null)
    sql_select += 'and transactTime = ' + '\"'  + params.transactTime + '\" ' // 字符串拼接需要引号，注意末尾空格

  if(params.transactRemarks != "" && params.transactRemarks != null)
    sql_select_count += 'and transactRemarks = ' + '\"'  + params.transactRemarks + '\" ' // 字符串拼接需要引号，注意末尾空格


  sql_select += 'limit ' + params.limit*(params.page-1) + ',' + params.limit
  // sql_select += 'limit ?, ?';

  conn.query(sql_select, [params.limit*(params.page-1), params.limit], function(err, res){
    if(err){
      console.log('[FIND ERROR] - ',err.message);
      callback(0);
      return false;
    }
    console.log("查找成功")
    callback(1, res);
  })

}

module.exports = {
  insert,
  deleteByPrimaryKey,
  findByPrimaryKey,
  findByConditionsCount,
  findByConditions
}
