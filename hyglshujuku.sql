/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : ssm_conference_room_yuyue

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 26/05/2023 21:07:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `room_id` int(0) NULL DEFAULT NULL,
  `user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `begintime` time(0) NULL DEFAULT NULL,
  `endtime` time(0) NULL DEFAULT NULL,
  `mark` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_reservation_room`(`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (50, 1, 'test', '张三', '测试', '123', '2022-04-09', '09:00:00', '09:00:00', '审核通过');
INSERT INTO `reservation` VALUES (51, 1, 'test', '张三', '开会', '123', '2022-04-09', '09:00:00', '09:00:00', '审核未通过');
INSERT INTO `reservation` VALUES (52, 9, 'test', '张三', '上课', '', '2023-06-01', '15:00:00', '17:30:00', '审核通过');
INSERT INTO `reservation` VALUES (53, 7, 'test', '张三', '体育', '18451035957', '2023-06-06', '17:30:00', '18:00:00', '审核通过');
INSERT INTO `reservation` VALUES (54, 3, '胡桃', '胡桃', '想要哥哥的赞', '123456789', '2023-05-31', '14:30:00', '16:00:00', '审核通过');
INSERT INTO `reservation` VALUES (55, 7, 'test', '张三', '自习', '12331312312321', '2023-05-26', '09:00:00', '09:00:00', '审核通过');
INSERT INTO `reservation` VALUES (56, 7, 'qi', 'qi', '', '', '2023-05-26', '09:00:00', '09:00:00', '审核未通过');
INSERT INTO `reservation` VALUES (57, 7, 'AAA', 'AAA', '自习', '312312321', '2023-05-26', '09:00:00', '09:00:00', '审核通过');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(0) NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin');
INSERT INTO `role` VALUES (2, 'ordinary');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (7, '讲座', '开会');
INSERT INTO `room` VALUES (11, '学习通在线', '333');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_role`(`role`) USING BTREE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('AAA', 'AAA', '123', 2);
INSERT INTO `user` VALUES ('admin', '管理员', '123456', 1);
INSERT INTO `user` VALUES ('qi', 'qi', '123', 2);
INSERT INTO `user` VALUES ('test', '张三', '123', 2);
INSERT INTO `user` VALUES ('吱吱吱吱', '吱吱吱吱', '123456789', 2);
INSERT INTO `user` VALUES ('胡桃', '胡桃', '123', 2);

SET FOREIGN_KEY_CHECKS = 1;
