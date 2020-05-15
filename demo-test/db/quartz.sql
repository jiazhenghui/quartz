/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : quartz

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 16/05/2020 01:51:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'jiazhenghuideMacBook-Pro.local1589564841074', 1589565041625, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0/20 48 1 16 5 ? 2020', 0, '参数测试', '2020-05-16 01:02:27');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1261352812751638531 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` VALUES (1261341823830450177, 1, 'testTask', 'renren', 1, 'org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named \'testTask\' available', 8, '2020-05-15 12:05:00');
INSERT INTO `schedule_job_log` VALUES (1261342725534507010, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:08:35');
INSERT INTO `schedule_job_log` VALUES (1261342746417946626, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:08:40');
INSERT INTO `schedule_job_log` VALUES (1261342767364300802, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:08:45');
INSERT INTO `schedule_job_log` VALUES (1261342788365180930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:08:50');
INSERT INTO `schedule_job_log` VALUES (1261342809336700929, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:08:55');
INSERT INTO `schedule_job_log` VALUES (1261342830320803842, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:00');
INSERT INTO `schedule_job_log` VALUES (1261342851325878273, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:05');
INSERT INTO `schedule_job_log` VALUES (1261342872247066626, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:10');
INSERT INTO `schedule_job_log` VALUES (1261342893210198018, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:15');
INSERT INTO `schedule_job_log` VALUES (1261342914185912322, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:20');
INSERT INTO `schedule_job_log` VALUES (1261342935170015234, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:25');
INSERT INTO `schedule_job_log` VALUES (1261342956128952322, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:30');
INSERT INTO `schedule_job_log` VALUES (1261342977108860929, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:35');
INSERT INTO `schedule_job_log` VALUES (1261342998076186625, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:40');
INSERT INTO `schedule_job_log` VALUES (1261343019051900929, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:45');
INSERT INTO `schedule_job_log` VALUES (1261343040036003841, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:50');
INSERT INTO `schedule_job_log` VALUES (1261343061015912449, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:09:55');
INSERT INTO `schedule_job_log` VALUES (1261343081983238145, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:10:00');
INSERT INTO `schedule_job_log` VALUES (1261343102979923970, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:10:05');
INSERT INTO `schedule_job_log` VALUES (1261343123989192706, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:10:10');
INSERT INTO `schedule_job_log` VALUES (1261343144897798146, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:10:15');
INSERT INTO `schedule_job_log` VALUES (1261343165848346625, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:10:20');
INSERT INTO `schedule_job_log` VALUES (1261343333721079809, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:11:00');
INSERT INTO `schedule_job_log` VALUES (1261343354591936514, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:11:05');
INSERT INTO `schedule_job_log` VALUES (1261343375567650817, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:11:10');
INSERT INTO `schedule_job_log` VALUES (1261343396534976514, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:11:15');
INSERT INTO `schedule_job_log` VALUES (1261346864180097026, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:25:02');
INSERT INTO `schedule_job_log` VALUES (1261347926496632834, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:29:15');
INSERT INTO `schedule_job_log` VALUES (1261347947354906625, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:29:20');
INSERT INTO `schedule_job_log` VALUES (1261347968318038018, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:29:25');
INSERT INTO `schedule_job_log` VALUES (1261347989302140930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:29:30');
INSERT INTO `schedule_job_log` VALUES (1261348010261078018, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:29:35');
INSERT INTO `schedule_job_log` VALUES (1261348094260285441, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:29:55');
INSERT INTO `schedule_job_log` VALUES (1261348115135336450, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES (1261348136127827970, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:05');
INSERT INTO `schedule_job_log` VALUES (1261348157065793537, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:10');
INSERT INTO `schedule_job_log` VALUES (1261348178041507842, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:15');
INSERT INTO `schedule_job_log` VALUES (1261348199008833537, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:20');
INSERT INTO `schedule_job_log` VALUES (1261348219988742145, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:25');
INSERT INTO `schedule_job_log` VALUES (1261348240951873538, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:30:30');
INSERT INTO `schedule_job_log` VALUES (1261348261915004930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:35');
INSERT INTO `schedule_job_log` VALUES (1261348282886524929, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:40');
INSERT INTO `schedule_job_log` VALUES (1261348303866433538, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:45');
INSERT INTO `schedule_job_log` VALUES (1261348324837953538, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:50');
INSERT INTO `schedule_job_log` VALUES (1261348345788502017, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:30:55');
INSERT INTO `schedule_job_log` VALUES (1261348366780993537, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:00');
INSERT INTO `schedule_job_log` VALUES (1261348387756707842, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:05');
INSERT INTO `schedule_job_log` VALUES (1261348408698867713, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:10');
INSERT INTO `schedule_job_log` VALUES (1261348429691359234, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:15');
INSERT INTO `schedule_job_log` VALUES (1261348450654490625, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:20');
INSERT INTO `schedule_job_log` VALUES (1261348471600844801, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:25');
INSERT INTO `schedule_job_log` VALUES (1261348492719165442, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:30');
INSERT INTO `schedule_job_log` VALUES (1261348513569050625, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:35');
INSERT INTO `schedule_job_log` VALUES (1261348534540570625, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:40');
INSERT INTO `schedule_job_log` VALUES (1261348555512090626, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:45');
INSERT INTO `schedule_job_log` VALUES (1261348576487804930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:50');
INSERT INTO `schedule_job_log` VALUES (1261348597450936321, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:31:55');
INSERT INTO `schedule_job_log` VALUES (1261348618435039233, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:00');
INSERT INTO `schedule_job_log` VALUES (1261348639410753537, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:05');
INSERT INTO `schedule_job_log` VALUES (1261348660365496321, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:10');
INSERT INTO `schedule_job_log` VALUES (1261348681362182145, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:15');
INSERT INTO `schedule_job_log` VALUES (1261348702384033794, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:20');
INSERT INTO `schedule_job_log` VALUES (1261348723363942401, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:25');
INSERT INTO `schedule_job_log` VALUES (1261348744327073793, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:30');
INSERT INTO `schedule_job_log` VALUES (1261348765239873538, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:35');
INSERT INTO `schedule_job_log` VALUES (1261348786194616322, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:40');
INSERT INTO `schedule_job_log` VALUES (1261348807178719234, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:45');
INSERT INTO `schedule_job_log` VALUES (1261348828146044930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:50');
INSERT INTO `schedule_job_log` VALUES (1261348849113370626, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:32:55');
INSERT INTO `schedule_job_log` VALUES (1261348870084890626, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:00');
INSERT INTO `schedule_job_log` VALUES (1261348891039633409, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:05');
INSERT INTO `schedule_job_log` VALUES (1261348912011153409, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:10');
INSERT INTO `schedule_job_log` VALUES (1261348932999450626, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:33:15');
INSERT INTO `schedule_job_log` VALUES (1261348953987747841, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:20');
INSERT INTO `schedule_job_log` VALUES (1261348974959267841, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:25');
INSERT INTO `schedule_job_log` VALUES (1261348995918204929, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:30');
INSERT INTO `schedule_job_log` VALUES (1261349016893919234, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:35');
INSERT INTO `schedule_job_log` VALUES (1261349037873827842, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:40');
INSERT INTO `schedule_job_log` VALUES (1261349058832764930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:45');
INSERT INTO `schedule_job_log` VALUES (1261349079804284929, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:50');
INSERT INTO `schedule_job_log` VALUES (1261349100779999233, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:33:55');
INSERT INTO `schedule_job_log` VALUES (1261349121785073666, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:34:00');
INSERT INTO `schedule_job_log` VALUES (1261349142714650625, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:34:05');
INSERT INTO `schedule_job_log` VALUES (1261349163677782018, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:34:10');
INSERT INTO `schedule_job_log` VALUES (1261349184749965313, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:34:15');
INSERT INTO `schedule_job_log` VALUES (1261349205633404930, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:34:20');
INSERT INTO `schedule_job_log` VALUES (1261349289657929730, 1, 'testTask', 'renren', 1, 'java.lang.IllegalArgumentException: argument type mismatch', 6, '2020-05-15 12:34:40');
INSERT INTO `schedule_job_log` VALUES (1261349310503620610, 1, 'testTask', 'renren', 1, 'java.lang.IllegalArgumentException: argument type mismatch', 0, '2020-05-15 12:34:45');
INSERT INTO `schedule_job_log` VALUES (1261349373590159362, 1, 'testTask', 'renren', 1, 'java.lang.IllegalArgumentException: argument type mismatch', 8, '2020-05-15 12:35:00');
INSERT INTO `schedule_job_log` VALUES (1261349394381324290, 1, 'testTask', 'renren', 1, 'java.lang.IllegalArgumentException: argument type mismatch', 0, '2020-05-15 12:35:05');
INSERT INTO `schedule_job_log` VALUES (1261349415373815809, 1, 'testTask', 'renren', 1, 'java.lang.IllegalArgumentException: argument type mismatch', 1, '2020-05-15 12:35:10');
INSERT INTO `schedule_job_log` VALUES (1261349436328558593, 1, 'testTask', 'renren', 1, 'java.lang.IllegalArgumentException: argument type mismatch', 1, '2020-05-15 12:35:15');
INSERT INTO `schedule_job_log` VALUES (1261349520344629250, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:35:35');
INSERT INTO `schedule_job_log` VALUES (1261349541186125825, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:35:40');
INSERT INTO `schedule_job_log` VALUES (1261349562182811650, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:35:45');
INSERT INTO `schedule_job_log` VALUES (1261349583124971521, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:35:50');
INSERT INTO `schedule_job_log` VALUES (1261349604096491522, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:35:55');
INSERT INTO `schedule_job_log` VALUES (1261349625080594433, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:36:00');
INSERT INTO `schedule_job_log` VALUES (1261349646022754305, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:36:05');
INSERT INTO `schedule_job_log` VALUES (1261349667011051522, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:36:10');
INSERT INTO `schedule_job_log` VALUES (1261349687982571522, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:36:15');
INSERT INTO `schedule_job_log` VALUES (1261349708966674433, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:36:20');
INSERT INTO `schedule_job_log` VALUES (1261349729934000130, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:36:25');
INSERT INTO `schedule_job_log` VALUES (1261349750972628994, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:36:30');
INSERT INTO `schedule_job_log` VALUES (1261351638430416897, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:44:00');
INSERT INTO `schedule_job_log` VALUES (1261351680297959426, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:44:10');
INSERT INTO `schedule_job_log` VALUES (1261351722203250689, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:44:20');
INSERT INTO `schedule_job_log` VALUES (1261351764167262210, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:44:30');
INSERT INTO `schedule_job_log` VALUES (1261351806135468034, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:44:40');
INSERT INTO `schedule_job_log` VALUES (1261351848036564994, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:44:50');
INSERT INTO `schedule_job_log` VALUES (1261352191600488449, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352191621459969, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352191717928961, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352191793426433, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352191868923905, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352191948615681, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352192015724545, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:12');
INSERT INTO `schedule_job_log` VALUES (1261352196176474114, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:13');
INSERT INTO `schedule_job_log` VALUES (1261352200374972417, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:14');
INSERT INTO `schedule_job_log` VALUES (1261352204577665026, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:15');
INSERT INTO `schedule_job_log` VALUES (1261352208763580418, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:16');
INSERT INTO `schedule_job_log` VALUES (1261352212966273025, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:17');
INSERT INTO `schedule_job_log` VALUES (1261352217147994113, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:18');
INSERT INTO `schedule_job_log` VALUES (1261352221354881025, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:19');
INSERT INTO `schedule_job_log` VALUES (1261352225532407809, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:46:20');
INSERT INTO `schedule_job_log` VALUES (1261352229735100418, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:46:21');
INSERT INTO `schedule_job_log` VALUES (1261352233900044289, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:22');
INSERT INTO `schedule_job_log` VALUES (1261352238094348289, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:23');
INSERT INTO `schedule_job_log` VALUES (1261352242309623810, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:24');
INSERT INTO `schedule_job_log` VALUES (1261352246503927810, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:25');
INSERT INTO `schedule_job_log` VALUES (1261352250698231809, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:26');
INSERT INTO `schedule_job_log` VALUES (1261352254896730113, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:27');
INSERT INTO `schedule_job_log` VALUES (1261352259107811330, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:46:28');
INSERT INTO `schedule_job_log` VALUES (1261352263285338114, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:29');
INSERT INTO `schedule_job_log` VALUES (1261352267492225025, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:30');
INSERT INTO `schedule_job_log` VALUES (1261352271711694850, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:46:31');
INSERT INTO `schedule_job_log` VALUES (1261352275876638722, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:32');
INSERT INTO `schedule_job_log` VALUES (1261352280066748417, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:33');
INSERT INTO `schedule_job_log` VALUES (1261352284265246721, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:34');
INSERT INTO `schedule_job_log` VALUES (1261352288446967809, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:35');
INSERT INTO `schedule_job_log` VALUES (1261352292666437633, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:36');
INSERT INTO `schedule_job_log` VALUES (1261352296831381506, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:37');
INSERT INTO `schedule_job_log` VALUES (1261352301025685505, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:38');
INSERT INTO `schedule_job_log` VALUES (1261352305224183809, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:39');
INSERT INTO `schedule_job_log` VALUES (1261352309452042242, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:46:40');
INSERT INTO `schedule_job_log` VALUES (1261352415567814657, 1, 'testTask', 'renren', 0, NULL, 1, '2020-05-15 12:47:05');
INSERT INTO `schedule_job_log` VALUES (1261352645063364610, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:48:00');
INSERT INTO `schedule_job_log` VALUES (1261352728865558530, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:48:20');
INSERT INTO `schedule_job_log` VALUES (1261352812751638530, 1, 'testTask', 'renren', 0, NULL, 0, '2020-05-15 12:48:40');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
