use mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';

CREATE DATABASE `sell` CHARACTER SET 'utf8mb4';

use sell;

CREATE TABLE `seller_info` (
                             `seller_id` varchar(32) NOT NULL,
                             `username` varchar(32) NOT NULL,
                             `password` varchar(32) NOT NULL,
                             `openid` varchar(64) NOT NULL,
                             `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                             PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卖家信息表';

CREATE TABLE `product_info` (
                              `product_id` varchar(32) NOT NULL,
                              `product_name` varchar(64) NOT NULL COMMENT '商品名称',
                              `product_price` decimal(8,2) NOT NULL COMMENT '单价',
                              `product_stock` int(11) NOT NULL COMMENT '库存',
                              `product_description` varchar(64) DEFAULT NULL COMMENT '描述',
                              `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
                              `product_status` tinyint(3) DEFAULT '0' COMMENT '商品状态,0正常1下架',
                              `category_type` int(11) NOT NULL COMMENT '类目编号',
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                              PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

CREATE TABLE `product_category` (
                                  `category_id` int(11) NOT NULL AUTO_INCREMENT,
                                  `category_name` varchar(64) NOT NULL COMMENT '类目名称',
                                  `category_type` int(11) NOT NULL COMMENT '类目编号',
                                  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                                  PRIMARY KEY (`category_id`),
                                  UNIQUE KEY `uqe_category_type` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='类目表';

CREATE TABLE `order_master` (
                              `order_id` varchar(32) NOT NULL,
                              `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
                              `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
                              `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
                              `buyer_openid` varchar(64) NOT NULL COMMENT '买家微信opendid',
                              `order_amount` decimal(8,2) NOT NULL COMMENT '订单金额',
                              `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态,默认0新下单',
                              `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态，默认0未支付',
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                              PRIMARY KEY (`order_id`),
                              KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

CREATE TABLE `order_detail` (
                              `detail_id` varchar(32) NOT NULL,
                              `order_id` varchar(32) NOT NULL,
                              `product_id` varchar(32) NOT NULL,
                              `product_name` varchar(64) NOT NULL COMMENT '商品名称',
                              `product_price` decimal(8,2) NOT NULL COMMENT '商品价格',
                              `product_quantity` int(11) NOT NULL COMMENT '商品数量',
                              `product_icon` varchar(512) DEFAULT NULL COMMENT '商品小图',
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                              PRIMARY KEY (`detail_id`),
                              KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情';

INSERT INTO `order_detail` (`detail_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `product_icon`, `create_time`, `update_time`)
VALUES
('1571366676165488838', '1571366676084268288', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 10:47:02', '2019-10-18 10:47:02'),
('1571366676190687101', '1571366676084268288', '123456789', '红薯', 6.00, 3, 'https://***.jpg', '2019-10-18 10:47:02', '2019-10-18 10:47:02'),
('1571366894650288230', '1571366894448195258', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 10:48:14', '2019-10-18 10:48:14'),
('1571366894675751221', '1571366894448195258', '123456789', '红薯', 6.00, 3, 'https://***.jpg', '2019-10-18 10:48:14', '2019-10-18 10:48:14'),
('1571388436631436493', '1571388436523281734', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 16:47:16', '2019-10-18 16:47:16'),
('1571388578791823989', '1571388578779559014', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 16:49:38', '2019-10-18 16:49:38'),
('1571389123535986321', '1571389123421688807', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 17:01:54', '2019-10-18 17:01:54'),
('1571389429182865238', '1571389429085492937', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 17:03:49', '2019-10-18 17:03:49'),
('1571389571850158205', '1571389571847331321', '123456', '玉米', 5.50, 2, 'https://***.jpg', '2019-10-18 17:06:11', '2019-10-18 17:06:11'),
('1572580744747288296', '1572580744472317996', '123456', '玉米', 5.50, 2, 'http://img.redocn.com/sheying/20160822/tudouniu_6957057.jpg', '2019-11-01 11:59:04', '2019-11-01 11:59:04'),
('1572580763253159125', '1572580763250160243', '123456', '玉米', 5.50, 2, 'http://img.redocn.com/sheying/20160822/tudouniu_6957057.jpg', '2019-11-01 11:59:23', '2019-11-01 11:59:23');


INSERT INTO `order_master` (`order_id`, `buyer_name`, `buyer_phone`, `buyer_address`, `buyer_openid`, `order_amount`, `order_status`, `pay_status`, `create_time`, `update_time`)
VALUES
('1571366616978671869', 'santiiny', '18738368901', '北京市海淀区建材城西二里', 'wx8999898', 29.00, 0, 0, '2019-10-18 10:43:37', '2019-10-18 10:43:37'),
('1571366676084268288', 'santiiny', '18738368901', '北京市海淀区建材城西二里', 'wx8999898', 29.00, 0, 0, '2019-10-18 10:47:02', '2019-10-18 10:47:02'),
('1571366894448195258', 'santiiny', '18738368901', '北京市海淀区建材城西二里', 'wx8999898', 29.00, 0, 1, '2019-10-18 10:48:14', '2019-10-18 14:45:17'),
('1571388436523281734', '张三', '13738392800', '北京大兴区枣园站', 'wx9088880000', 11.00, 0, 0, '2019-10-18 16:47:16', '2019-10-18 16:47:16'),
('1571388578779559014', '张三', '13738392800', '北京大兴区枣园站', 'wx9088880000', 11.00, 0, 0, '2019-10-18 16:49:38', '2019-10-18 16:49:38'),
('1571389123421688807', '张三', '13738392800', '北京大兴区枣园站', 'wx9088880000', 11.00, 0, 0, '2019-10-18 17:01:54', '2019-10-18 17:01:54'),
('1571389429085492937', '张三', '13738392800', '北京大兴区枣园站', 'wx9088880000', 11.00, 0, 0, '2019-10-18 17:03:49', '2019-10-18 17:03:49'),
('1571389571847331321', '张三', '13738392800', '北京大兴区枣园站', 'wx9088880000', 11.00, 2, 0, '2019-10-18 17:06:11', '2019-10-18 18:48:53'),
('1572580744472317996', '张三', '13738392800', '北京大兴区枣园站', 'wx9088880000', 11.00, 0, 0, '2019-11-01 11:59:04', '2019-11-01 11:59:04'),
('1572580763250160243', '张三', '13738392800', '北京大兴区枣园站', 'wx90888800001', 11.00, 0, 0, '2019-11-01 11:59:23', '2019-11-01 11:59:23');


INSERT INTO `product_category` (`category_id`, `category_name`, `category_type`, `create_time`, `update_time`)
VALUES
(1, '热搜', 2, '2019-10-15 16:25:07', '2019-10-15 16:28:19'),
(2, '女性榜单', 3, '2019-10-15 16:51:16', '2019-10-15 16:51:16'),
(6, '男性最爱', 4, '2019-10-16 11:20:55', '2019-10-16 15:47:50'),
(17, '科技', 8, '2019-10-16 15:05:02', '2019-10-16 15:05:02'),
(18, '程序员的最爱', 1024, '2019-11-01 14:13:27', '2019-11-01 15:04:55');


INSERT INTO `product_info` (`product_id`, `product_name`, `product_price`, `product_stock`, `product_description`, `product_icon`, `product_status`, `category_type`, `create_time`, `update_time`)
VALUES
('1234', '小米粥', 3.20, 100, '很清淡的粥', 'http://img.redocn.com/sheying/20191031/niutudou_10648725.jpg', 0, 3, '2019-10-16 15:48:52', '2019-10-31 18:18:32'),
('123456', '玉米', 4.50, 96, '好吃的玉米棒', 'http://img.redocn.com/sheying/20160822/tudouniu_6957057.jpg', 0, 2, '2019-10-16 16:36:43', '2019-11-04 11:24:11'),
('123456789', '红薯', 6.00, 32, '好甜的烤红薯', 'http://img.redocn.com/sheying/20191030/cupaohuasheng_10647103.jpg', 0, 2, '2019-10-16 16:36:43', '2019-10-31 18:19:11');

INSERT INTO `seller_info` (`seller_id`, `username`, `password`, `openid`, `create_time`, `update_time`)
VALUES
('1572318535623888346', 'admin', 'admin', 'adbc', '2019-10-29 11:08:55', '2019-10-29 11:08:55');
