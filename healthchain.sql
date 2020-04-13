/*
Navicat MySQL Data Transfer

Source Server         : springcloudpro
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : healthchain

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-04-13 17:54:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `ethAddress` varchar(255) NOT NULL DEFAULT '',
  `authority` varchar(10) NOT NULL DEFAULT '',
  `privateKey` varchar(255) DEFAULT '',
  `contractAddr` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique` (`account`) USING BTREE,
  UNIQUE KEY `ethAddress_unique` (`ethAddress`) USING BTREE,
  UNIQUE KEY `contractAddr_unique` (`contractAddr`),
  UNIQUE KEY `privateKey_unique` (`privateKey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '18212341234', '123456', '0x83743cfff53699852d92298e67571c771b806d48', 'root', null, '0xcE9f280b10AEb057ec3E7d35E10a1ab0141bBE5a');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operateId` int(11) NOT NULL,
  `operateDetails` varchar(255) NOT NULL DEFAULT '',
  `operateTime` varchar(255) NOT NULL DEFAULT '',
  `operateResult` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for medicalservice
-- ----------------------------
DROP TABLE IF EXISTS `medicalservice`;
CREATE TABLE `medicalservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `portrait` int(11) DEFAULT '0',
  `serviceName` varchar(255) NOT NULL DEFAULT '',
  `serviceDetails` varchar(255) NOT NULL DEFAULT '',
  `cost` varchar(255) NOT NULL,
  `oid` int(11) NOT NULL,
  `auditResult` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of medicalservice
-- ----------------------------
INSERT INTO `medicalservice` VALUES ('1001', '3', '营养咨询指导', '通过全面的营养分析和生长发育评价，亦可对存在营养性疾病或偏差的孩子给予科学诊疗和营养推荐', '1000000000000000000', '1001', '审核通过');
INSERT INTO `medicalservice` VALUES ('1002', '2', '肝功能检测', '对肝脏的各项功能进行全面的体检', '1000000000000000000', '1003', '审核通过');
INSERT INTO `medicalservice` VALUES ('1003', '5', '血糖检测', '检测血液中血糖的含量', '1000000000000000000', '1002', '审核通过');
INSERT INTO `medicalservice` VALUES ('1004', '6', '血脂检测', '检测血液中血脂的含量', '1000000000000000000', '1001', '审核通过');
INSERT INTO `medicalservice` VALUES ('1005', '7', '肾功能检测', '对肾脏的各项功能进行全面的检测', '1000000000000000000', '1003', '审核通过');
INSERT INTO `medicalservice` VALUES ('1006', '4', '胸透', 'X线检查方法，检测胸腔是否存在异常', '1000000000000000000', '1002', '审核通过');
INSERT INTO `medicalservice` VALUES ('1007', '8', '心电图', '记录心脏每一心动周期所产生的电活动变化', '1000000000000000000', '1002', '审核通过');
INSERT INTO `medicalservice` VALUES ('1008', '1', '耳鼻喉科检查', '检查五官是否存在异常', '1000000000000000000', '1003', '审核通过');
INSERT INTO `medicalservice` VALUES ('1009', '3', '养生方案咨询', '专业的医生提供养生方案', '1000000000000000000', '1001', '审核通过');
INSERT INTO `medicalservice` VALUES ('1010', '9', '植发', '根据医生的建议选择无痕植发，或者有痕植发', '5000000000000000000', '1001', '审核通过');
INSERT INTO `medicalservice` VALUES ('1011', '8', '心脏护理', '为心脏不好的病人提供保护咨询', '2000000000000000000', '1002', '审核通过');
INSERT INTO `medicalservice` VALUES ('1012', '0', '自救应急咨询', '提供一些常用的应急、自救的方案', '1000000000000000000', '1001', '审核通过');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `portrait` int(11) DEFAULT '0',
  `ethAddress` varchar(255) NOT NULL DEFAULT '',
  `organizationName` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `certificateResult` varchar(255) DEFAULT '',
  `certificateFiles` varchar(255) DEFAULT '',
  `certificateTime` varchar(255) DEFAULT '',
  `privateKey` varchar(255) DEFAULT '',
  `introduction` varchar(255) DEFAULT '',
  `contractAddr` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(30) DEFAULT '',
  `pic` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique_org` (`account`) USING BTREE,
  UNIQUE KEY `ethaddress_unique_org` (`ethAddress`) USING BTREE,
  UNIQUE KEY `orgName_unique_org` (`organizationName`) USING BTREE,
  UNIQUE KEY `contractAddr_unique_org` (`contractAddr`),
  UNIQUE KEY `privateKey_unique_org` (`privateKey`) USING BTREE,
  KEY `ethAddress` (`ethAddress`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('1001', '18212340001', '123456', '0', '0x9Cd24C450520fF4D6D25Fad5EF4a7F6e95aAb773', '东南大学附属医院', '普通', '未上传', '', '', '0x337165fda50a8b907e8d2315acd471542a0f656eb78b498baca7b4391e25fd5d', '是集医疗、教学、科研为一体的综合性三级甲等医院，是江苏省唯一教育部直属“985”、“211”工程重点建设的大学附属医院', '0x720c60d18a8fb776005E6ed8752F95E728BDA3D1', '15265734070', '');
INSERT INTO `organization` VALUES ('1002', '18212340002', '123456', '1', '0x0cB5F2EE8024D6daB757FCc49A0A678a60c12B9D', '独墅湖医院', '普通', '未上传', '', '', '0xec27d4e78505b1efc80a70f093468898707595b759f5007972f400b9abb8c4b1', '于2013年经江苏省卫生厅批准设置，是苏州市苏南现代化建设示范区“十二五”重点卫生项目并列入苏州市2017年民生实事工程。', '0xFF4C678222ec27E7730110e428d35e7AB36Ab950', '13821382587', '');
INSERT INTO `organization` VALUES ('1003', '18212340003', '123456', '2', '0x86Ab76CA7FB3240ba6eFF82BbD19c2955e149A4C', '北京协和医院', '普通', '未上传', '', '', '0x674139c22fab1a6627c01036839a30651819468f0d2094cf4bfff7545de28def', '是一所位于北京市东城区，集医疗、科研、教学为一体的大型综合医院。', '0x45fac702A81FB337DC95C817e206Da859c0134f3', '15299378932', '');

-- ----------------------------
-- Table structure for transactionrecord
-- ----------------------------
DROP TABLE IF EXISTS `transactionrecord`;
CREATE TABLE `transactionrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sendAddress` varchar(255) NOT NULL DEFAULT '',
  `recieveAddress` varchar(255) NOT NULL DEFAULT '',
  `transactEth` varchar(255) NOT NULL DEFAULT '',
  `transactTime` varchar(255) NOT NULL DEFAULT '',
  `transactAddr` varchar(255) DEFAULT '',
  `transactRemarks` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of transactionrecord
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL DEFAULT '',
  `portrait` int(11) DEFAULT '0',
  `nickname` varchar(30) DEFAULT '昵称',
  `password` varchar(255) NOT NULL DEFAULT '',
  `ethAddress` varchar(255) NOT NULL DEFAULT '',
  `sex` varchar(4) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `birth` varchar(255) DEFAULT '',
  `tel` varchar(20) DEFAULT '',
  `contractAddr` varchar(255) NOT NULL DEFAULT '',
  `privateKey` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique_user` (`account`) USING BTREE,
  UNIQUE KEY `ethaddress_unique_user` (`ethAddress`) USING BTREE,
  UNIQUE KEY `contractAddr_unique_user` (`contractAddr`),
  UNIQUE KEY `pk_unique_user` (`privateKey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', '16612340001', '0', '昵称', '123456', '0x257443734D741f9638872f4fcaD07FaBb4ecA391', '1', '江苏南京', '1989-01-02', '13662728575', '0x539115ccFaa8A36E7A3F92Ae00ABd4dC77D9f918', '0x2ab4d057fdeca19065547b6d291f8c11427d3f4fecbb3b55632c13f8a8d6b689');
INSERT INTO `user` VALUES ('1002', '16612340002', '0', '昵称', '123456', '0x9A3706bcBD0AD649110028906f1F6da049afa1DE', '1', '江苏苏州', '1988-03-02', '13651501758', '0x9b2790eC5455D7172f41c193353cEABB74f51Cb6', '0x3656862bb883a20d1b6450caede70059acd3fde94852dd2ec1a9f73de3008fc1');
INSERT INTO `user` VALUES ('1003', '16612340003', '0', '昵称', '123456', '0xCF9abE8C5b53adEfe4feb26f5E7b39e0D7f7E738', '0', '河北鞍山', '1987-12-03', '15966446133', '0x90cbF098F62bacdF24bA1F540b4F1b81b239dacF', '0x8b180d5c8bba16601280980662e0b02781f83b6a730b3c3306304616a1f4ab3b');
INSERT INTO `user` VALUES ('1004', '16612340004', '0', '昵称', '123456', '0xaBA401d0C899Ec873D4E1703469af14d7EDA9151', '1', '河南郑州', '1963-09-03', '18317784817', '0x0DcFCeb2Aae1c60d76817F5C0b31E767FeE0705A', '0x70be9bc55453384a4309f85ffafb37633fdb1a354ee619db9d1ae374a6d5a2c1');
INSERT INTO `user` VALUES ('1005', '16612340005', '0', '昵称', '123456', '0x51d957A346C60dCf2DB5039125C58Ca23E41C984', '0', '山东济南', '1976-09-07', '15039711648', '0xe544b9eEcE0E9CE687EAb954D1397Da706c7EfED', '0x86a59d16562e9fa956fd7ff8022247b1bb30bff092d2949a293c82f575a24750');
INSERT INTO `user` VALUES ('1006', '16612340006', '0', '昵称', '123456', '0x6c5E5c5AF7C6A3389A679240085aAb920561E36c', '0', '湖南长沙', '1959-11-03', '18464474132', '0x4a18e95144bd7bBbf829101D5A499D458Cc9035e', '0xe9b918b8e77dcc0d5f95528a082e65a7a61059ca912e2738a484d4a656b1332d');
INSERT INTO `user` VALUES ('1007', '16612340007', '0', '昵称', '123456', '0x6f1C7c56A04336a6E77fea228aA8234659cd4F4c', '1', '湖北武汉', '1978-07-11', '16576436296', '0xA5b5Eff969C5C76Ef39D938e4e01dbE9bEAC7d13', '0x603a9f9981c02b01fe81199570173fcde576fc3de0822f446723091af26add00');
INSERT INTO `user` VALUES ('1008', '16612340008', '0', '昵称', '123456', '0x21351A97F4b06B3C9b0E71898D306806626Ec380', '1', '广州深圳', '1983-10-08', '18719694193', '0xfcE0193Fb1122F284924Bb35D115576A9c59ca7b', '0x41c7881a5eaeb78f998b2188b21658022752c8baefd618272a4b70892d24c832');
INSERT INTO `user` VALUES ('1009', '16612340009', '0', '昵称', '123456', '0x6A2Cb1878b91A671604B3028b443B0A75DA3F39e', '0', '四川成都', '1982-09-03', '13692892928', '0xa83bB2d2DeCc2e57dFa302747E2d8456499267B1', '0x8c5825b6f8567630fe1115017c987bae7eb79bdb3f80aefba3ab40e0cc4ed0b8');
INSERT INTO `user` VALUES ('1010', '16612340010', '0', '昵称', '123456', '0x4Cdfd43dC15bF53285B1431a77eF5AeBbD78f7E3', '0', '河南郑州', '1981-09-15', '13531086494', '0x320cCc5FC0b4142c97122e43b8d9aB0C9E218703', '0x2467c9256159721b8ad0c13d50f14289615d5fa7fa9db747e96b5a55621f7d51');
INSERT INTO `user` VALUES ('1011', '16612340011', '0', '昵称', '123456', '0x2e4F0A52c47af8Ab460a2E0735F481E3c6CAe3cD', '1', '湖北武汉', '1975-04-09', '13490915254', '0x5Db8d55E21b17307E06CBcEa5C7b9cBd4E3597a9', '0x9a1e2512f92ff4d502fda617ab74df91786268227a5dde4e7fca2141e06b363e');
INSERT INTO `user` VALUES ('1012', '16612340012', '0', '昵称', '123456', '0x0388A5FC4DB114ac3f4630DaD046738b6AD09872', '1', '湖南长沙', '1980-09-03', '15894781339', '0xf27Da6f3c484D907cBEB2AFcf5BFbB202B0bC540', '0xc12185ac5337e1b4f9e2c92c10d5926d42d298fd1463015ba02ff93b88714b60');

-- ----------------------------
-- Table structure for user_healthdata
-- ----------------------------
DROP TABLE IF EXISTS `user_healthdata`;
CREATE TABLE `user_healthdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `uploadTime` varchar(50) DEFAULT NULL,
  `eval` varchar(255) DEFAULT NULL,
  `dataAddr` varchar(255) DEFAULT NULL,
  `permitVisit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dataAddr_unique_heathdata` (`dataAddr`) USING BTREE,
  KEY `add_class_ibfk_1` (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_healthdata
-- ----------------------------

-- ----------------------------
-- Table structure for visitorrecord
-- ----------------------------
DROP TABLE IF EXISTS `visitorrecord`;
CREATE TABLE `visitorrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) NOT NULL DEFAULT '',
  `visitorId` varchar(255) NOT NULL DEFAULT '',
  `visitTime` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of visitorrecord
-- ----------------------------
