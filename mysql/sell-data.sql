
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
