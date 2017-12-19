-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.7.20-0ubuntu0.16.04.1 - (Ubuntu)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 ShoppingMall.administrator 구조 내보내기
CREATE TABLE IF NOT EXISTS `administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자를 유일하게 식별하는 숫자',
  `username` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '관리자 닉네임',
  `password` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '관리자 비밀번호',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ShoppingMall.administrator:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`id`, `username`, `password`) VALUES
	(1, 'admin', '1234');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

-- 테이블 ShoppingMall.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '식별자',
  `userId` int(11) NOT NULL COMMENT '사용자테이블의 id를 참조하는 외래키(사용자 식별자)',
  `productCode` int(11) NOT NULL COMMENT 'product 테이블의 code를 참조하는 외래키(상품 식별자)',
  `isPurchased` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'userId에 해당하는 사용자가 상품을 구매했는지 여부(아직 구매하지 않았거나 구매 취소했을 때의 값 : 0, 구매 했을 때의 값 : 1)',
  `amount` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_Cart_User1_idx` (`userId`),
  KEY `fk_cart_product1_idx` (`productCode`),
  CONSTRAINT `fk_Cart_User1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`productCode`) REFERENCES `product` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ShoppingMall.cart:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`id`, `userId`, `productCode`, `isPurchased`, `amount`) VALUES
	(11, 14, 1005, 1, 1),
	(14, 14, 1003, 0, 1),
	(15, 14, 1006, 0, 1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 ShoppingMall.favorite 구조 내보내기
CREATE TABLE IF NOT EXISTS `favorite` (
  `userId` int(11) NOT NULL COMMENT 'user테이블의 id를 참조하는 외래키(사용자 식별자)',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'favorite 식별자',
  `productCode` int(11) NOT NULL COMMENT 'product테이블의 id를 참조하는 외래키(상품 식별자)',
  PRIMARY KEY (`id`),
  KEY `fk_favorite_product1_idx` (`productCode`),
  KEY `fk_favorite_user1` (`userId`),
  CONSTRAINT `fk_favorite_product1` FOREIGN KEY (`productCode`) REFERENCES `product` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favorite_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 ShoppingMall.favorite:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;

-- 테이블 ShoppingMall.post 구조 내보내기
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'post 식별자',
  `userId` int(11) NOT NULL COMMENT 'user테이블에 i를 참조하는 외래키(사용자 식별자)',
  `category` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '글의 종류 (''후기'' ''문의''로 분류됨)',
  `title` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '글 제목',
  `content` text CHARACTER SET utf8 COMMENT '글 내용',
  `postedTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '글이 등록된 시간(자동으로 저장해주므로 애플리케이션에서 따로 값을 주지 않아도 됨)',
  `filePath` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_user1_idx` (`userId`),
  CONSTRAINT `fk_post_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ShoppingMall.post:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `userId`, `category`, `title`, `content`, `postedTime`, `filePath`) VALUES
	(3, 14, '후기', 'ㄴㅇㅎㄴㅇㅎ', '											ㄴㅇㅎㄴㅇㅎㄴㅇㅎ', '2017-12-06 00:00:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(4, 14, '후기', '후기입니다', '내용입니다', '2017-12-06 00:00:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(5, 14, NULL, NULL, NULL, '2017-12-06 00:00:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(6, 14, '후기', 'sdf', 'sdfsdf						', '2017-12-06 00:00:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(7, 14, '후기', '점토액체 괴물 구매했습니다.', '붕사 없이 가능한 액체괴물ㄴ붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ											붕사 없이 가능한 액체괴물ㄴ																						', '2017-12-06 00:00:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(8, 14, '후기\n', '제목\n', '냥ㅇ											\n', '2017-12-10 00:00:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(9, 14, '후기\n', '제목\n', '냥ㅇ											\n', '2017-12-11 11:54:00', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(10, 14, '후기\n', 'ㄴㅇㄹ\n', 'ㄴㅇㄹㄴㅇㄹ\n', '2017-12-11 11:54:10', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(11, 14, '후기\n', 'sdfsdfsdf\n', 'sdfsdfsdfsd											\n', '2017-12-11 12:09:58', '/ShoppingMall/storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(12, 14, '후기\n', 'dfgdfg\n', '											dfgdfgdfg\n', '2017-12-11 12:13:35', 'storage/2729985ef1b1182df241f7a80be60966.jpg'),
	(13, 14, '후기\n', 'sdfsdf\n', 'sdfsdfsdfsdf\n', '2017-12-11 12:24:28', '/home/kde6260/jsp/ShoppingMall/storage/Mon Dec 11 21:24:27 KST 2017-1473369933172.jpg'),
	(14, 14, '후기\n', 'sdfsdf\n', 'sdfsdfsdfsdf\n', '2017-12-11 12:25:40', '/home/kde6260/jsp/ShoppingMall/storage/Mon Dec 11 21:25:40 KST 2017-1473369933172.jpg'),
	(15, 14, '후기\n', 'sdfsdf\n', 'sdfsdfsdfsdf\n', '2017-12-11 12:27:48', '/home/kde6260/jsp/ShoppingMall/storage/Mon Dec 11 21:27:48 KST 2017-1473369933172.jpg'),
	(16, 14, '후기\n', 'sdfsdf\n', 'sdfsdfsdfsdf\n', '2017-12-11 12:28:26', '/home/kde6260/jsp/ShoppingMall/storage/Mon Dec 11 21:28:26 KST 2017-1473369933172.jpg'),
	(17, 14, '후기\n', 'dfgdfg\n', '											dfgdfgdfg\n', '2017-12-11 12:31:21', '/home/kde6260/jsp/ShoppingMall/storage/Mon Dec 11 21:31:21 KST 2017-images (1).jpg'),
	(18, 14, '후기\n', 'sdsdfsdf\n', 'sdfsdfsdfsdf											\n', '2017-12-11 12:48:47', '/home/kde6260/jsp/ShoppingMall/WebContent/static/Mon Dec 11 21:48:47 KST 2017-images.jpg'),
	(19, 14, '후기\n', 'ㄴㅇㄹㄴㅇㄹ\n', 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹ											\n', '2017-12-11 12:52:21', '/home/kde6260/jsp/ShoppingMall/WebContent/static/56193739-다운로드 (1).jpg'),
	(20, 14, '후기\n', 'ㄴㅇㄹㄴㅇㄹ\n', 'ㄴㅇㄹㄴㅇㄹㄴㅇㄹ											\n', '2017-12-11 13:02:43', '/home/kde6260/jsp/ShoppingMall/WebContent/static/104222915-다운로드 (1).jpg'),
	(21, 15, '후기\n', 'erferf\n', 'erferfer\n', '2017-12-12 05:47:15', '/home/kde6260/jsp/ShoppingMall/WebContent/static/1623361089-images.jpg');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;

-- 테이블 ShoppingMall.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품코드(상품 식별자)',
  `adminId` int(11) NOT NULL COMMENT '상품을 등록한 관리자의 id(administrator의 id를 참조)',
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '상품 종류(perl, sand, etc 세 가지로 분류)',
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '상품 이름',
  `price` int(11) DEFAULT NULL COMMENT '상품 가격',
  `imagePath` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '상품글 등록 시 업로드되는 이미지가 저장된 경로',
  `description` text CHARACTER SET utf8 COMMENT '상품에 대한 설명',
  `postedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품이 등록된 시간(디비에서 자동으로 저장해주므로 애플리케이션에서 따로 값을 주지 않아도 됨)',
  PRIMARY KEY (`code`),
  KEY `fk_product_1_idx` (`adminId`),
  CONSTRAINT `fk_product_1` FOREIGN KEY (`adminId`) REFERENCES `administrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ShoppingMall.product:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`code`, `adminId`, `category`, `name`, `price`, `imagePath`, `description`, `postedTime`) VALUES
	(1000, 1, 'perl', '진주액괴', 7000, 'http://seoul-p-studio.bunjang.net/product/72961890_1_1503133850_w640.jpg', '흰색 진주 + 투명액괴 세트!', '2017-12-02 00:00:00'),
	(1001, 1, 'perl', '진주액괴(보라)', 8000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8xcdVWWDv9eALP3ngmT5Na2PNFBn2JYhnBHYQiDMYyklL4xMEw', '보라색 진주 + 투명액괴 세트', '2017-12-02 00:00:00'),
	(1003, 1, 'sand', '색모래액괴-토마토', 6000, 'https://scontent-lga3-1.cdninstagram.com/t51.2885-15/s640x640/e15/20633628_130568934241151_1816933129424732160_n.jpg', '레드 컬러의 색모래액괴', '2017-12-02 00:00:00'),
	(1004, 1, 'sand', '색모래액괴-바다', 6000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiQ1wifoLqy8qo7qxRJexDkWeBPshKhjOoRX2V0aeWbSKxNIfunQ', '파랑+하늘+화이트 구성의 색모래액괴', '2017-12-02 00:00:00'),
	(1005, 1, 'sand', '갤럭시 액체괴물', 7000, 'http://t1.daumcdn.net/liveboard/scientist/f9fd854a09374441a9ce0e4bace96d4c.jpg', '블루+퍼플의 조합으로 갤럭시를 연상케 하는 색모래 액괴!', '2017-12-02 00:00:00'),
	(1006, 1, 'etc', '점토액괴-파랑', 5000, 'https://i.ytimg.com/vi/RLUonz9y3D8/maxresdefault.jpg', '투명한 색깔의 점토액체괴물', '2017-12-02 00:00:00'),
	(1009, 1, 'etc', '말랑푸딩 액체괴물', 4000, 'http://s2.dmcdn.net/QLb00/1280x720-UvQ.jpg', '푸딩같이 말랑탱탱한 질감의 액체괴물', '2017-12-02 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 ShoppingMall.productSize 구조 내보내기
CREATE TABLE IF NOT EXISTS `productSize` (
  `size` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '상품 사이즈',
  `optionPrice` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT 'size에 따라 추가되는 가격',
  `productCode` int(11) NOT NULL COMMENT 'product테이블에 code를 참조하는 외래키(상품 식별자)',
  KEY `fk_ProductSize_Product1_idx` (`productCode`),
  CONSTRAINT `fk_ProductSize_Product1` FOREIGN KEY (`productCode`) REFERENCES `product` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ShoppingMall.productSize:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `productSize` DISABLE KEYS */;
/*!40000 ALTER TABLE `productSize` ENABLE KEYS */;

-- 테이블 ShoppingMall.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '사용자를 유일하게 식별하는 숫자',
  `email` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '이메일 주소',
  `phone` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '전화번호',
  `password` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '비밀번호',
  `nickname` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '닉네임',
  `address` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '집 주소',
  `mileage` int(11) DEFAULT '0' COMMENT '마일리지 (사용자가 구매한 상품들의 전체 가격에 5%)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 테이블 데이터 ShoppingMall.user:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `phone`, `password`, `nickname`, `address`, `mileage`) VALUES
	(14, 'kde6260', '010-1234-1234', 'momo', 'kde6260', '광주 강남구 sdf ', 350),
	(15, 'kde6260@gmail.com', '010-1234-1234', 'momo', 'kde6260', '광주 강남구 대치4동', 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
