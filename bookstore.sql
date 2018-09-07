/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.16-log : Database - book
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `book`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) NOT NULL,
  `authors` varchar(255) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `year_publication` year(4) NOT NULL,
  KEY `year_publication` (`year_publication`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`order_id`,`product_id`,`buynum`) values ('2b6e6050-7bb3-4dc0-b752-f8364899896a','0e75f93d-c754-45d2-94fb-b15df50e6ba4',1),('2b6e6050-7bb3-4dc0-b752-f8364899896a','2215365a-30ce-46ba-ad79-96a08c063cf9',1),('59dd7eb7-5088-4755-a317-2a378630e4a7','0e75f93d-c754-45d2-94fb-b15df50e6ba4',1),('59dd7eb7-5088-4755-a317-2a378630e4a7','10c26d77-0e13-45fe-9039-67c1472b51e1',1),('5afea07d-d581-427d-979c-21e97006d670','0e75f93d-c754-45d2-94fb-b15df50e6ba4',1),('5afea07d-d581-427d-979c-21e97006d670','2215365a-30ce-46ba-ad79-96a08c063cf9',1),('aaf72dc3-8ce1-46d7-8a9a-d5316396b905','0e75f93d-c754-45d2-94fb-b15df50e6ba4',1),('aaf72dc3-8ce1-46d7-8a9a-d5316396b905','10c26d77-0e13-45fe-9039-67c1472b51e1',1),('ee8c7275-71b3-43c8-9275-60c1c3d15dbc','0e75f93d-c754-45d2-94fb-b15df50e6ba4',1),('ee8c7275-71b3-43c8-9275-60c1c3d15dbc','10c26d77-0e13-45fe-9039-67c1472b51e1',1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`money`,`receiverAddress`,`receiverName`,`receiverPhone`,`paystate`,`ordertime`,`user_id`) values ('2b6e6050-7bb3-4dc0-b752-f8364899896a',101.8,'河南省','张三','18738982010',0,'2017-12-25 15:29:24',9),('59dd7eb7-5088-4755-a317-2a378630e4a7',49.2,'河南省','张三','18738982010',0,'2017-12-25 15:42:01',9),('5afea07d-d581-427d-979c-21e97006d670',101.8,'河南省','张三','18738982010',0,'2017-12-25 15:28:08',9),('aaf72dc3-8ce1-46d7-8a9a-d5316396b905',49.2,'河南省','张三','18738982010',0,'2017-12-25 15:42:26',9),('ee8c7275-71b3-43c8-9275-60c1c3d15dbc',49.2,'河南省','张三','18738982010',0,'2017-12-25 15:39:58',9);

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` varchar(100) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`price`,`pnum`,`category`,`description`,`img_url`) values ('0e75f93d-c754-45d2-94fb-b15df50e6ba4','解忧杂货铺',27.3,45,'小说','★《白夜行》后，东野圭吾最受欢迎作品 ★不是推理小说，却更扣人心弦 ★荣获中央公论文艺奖 ★荣登纪伊国屋、诚品、博客来、金石堂各大排行榜第1名 ★东野圭吾这次选择的，是生活中*平凡的片段：在事业和爱情间艰难抉择。王俊凯、迪丽热巴、董子健等推荐 ','2\\d\\004.png'),('10c26d77-0e13-45fe-9039-67c1472b51e1','看见',21.9,52,'文艺','雾霾调查纪录片《穹顶之下》制作人 柴静：十年个人成长的告白，中国社会变迁的备忘 ','5\\4\\003.png'),('143e050b-7dec-43cf-92de-aeb27a182eb3','秘密',33.8,55,'小说','《秘密》中的故事给人非常奇妙的感觉，这是一个只有两个人的三口之家，在别人看来平凡无奇，但他们必须保守这个秘密，对这个家之外的任何人都不能说起哪怕只言片语。 《秘密》在日本读者票选东野圭吾作品中位居第2名，仅次于《白夜行》。《秘密》日文版销量突破200万册.','5\\6\\13.png'),('2215365a-30ce-46ba-ad79-96a08c063cf9','平凡的世界',74.5,33,'小说','茅盾文学奖皇冠上的明珠，激励亿万读者的不朽经典。深受老师和学生喜爱的新课标必读书 ','3\\1\\7.png'),('24cf1b88-d012-4d08-8286-9d599d50fe42','目送',25.8,60,'文艺','被誉为21世纪的《背影》 ，是跨三代共读的人生之书、感人至深的“生死笔记”，包含龙应台亲手摄影。','5\\4\\005.png'),('26ca4ba1-bbd7-46b0-a367-04e03381615b','养育男孩',30.6,40,'生活','写给天下母亲的男孩养育指南！《纽约时报》畅销书作家爱默生·艾格里奇博士新作！教你培养独立、有担当、有领导力的男孩','3\\f\\002.png'),('279275d5-5a3e-45e6-bddb-8aac8e97a4e2','从大都到上都：在古道上重新发现中国 ',42.6,23,'历史文化','北大历史学家的徒步之旅，一场关于历史、关于当下、关于自我的深刻探寻 ','5\\4\\000001.png'),('2797281c-309d-4be8-a335-92bc95789421','谁动了我的奶酪',45,50,'小说','生活是个充满变化的迷宫 让我们不时陷入迷茫与恐惧 那么，如何才能找到属于自己的奶酪？ 你必须时刻保持警惕 确定目标，勇敢坚定地为之努力','7\\4\\104.jpg'),('30ed390a-0ed6-4a42-841d-6584db2f5981','互联网+制造：迈向中国制造2025 ',79.2,55,'经济','腾讯研究院官方出品，马化腾、郑新立作序，吴敬琏、邬贺铨院士、李伯虎院士等专家力荐','b\\6\\789654546.png'),('328ae4d6-3cb1-4e09-91e3-2fda1fcb0da6','失乐园',40,55,'小说','渡边淳一代表作，长期雄踞日本畅销书排行榜榜首，由黑木瞳、役所广司主演的电影引发“失乐园”热。此次的全新林少华译本，将带你体味不一样的渡边淳一，不一样的失乐园。 ','2\\c\\1.png'),('3cec4554-b1b0-438e-b768-88415dd8bbbf','摆渡人',18,34,'小说','★《摆渡人》畅销欧美33个国家的心灵治愈小说，令千万读者灵魂震颤的人性救赎之作。一个史诗般动人的温情故事，回归人性，引人深思。 ★《摆渡人》荣获苏格兰图书大奖、布兰福博斯奖、格兰扁图书奖、考文垂灵感图书奖候补提名，入围英国文学社图书大奖，英国《卫报》等多家重量级报刊媒体震撼推荐。','3\\0\\6.png'),('40762be0-3800-49f1-96ff-993ca69b3198','我不',37.1,30,'小说','作家很多，野生作家只有一个。 写书的人很多，大冰只有一个。 当下中国的青年作家里，这条山东大汉是个独一无二的异端，*不羁，也*接地气。 他的文字是有根的，有血有肉的。 他的这本新书，是本奇书。 ','5\\6\\11.png'),('49d652bb-e583-4714-b946-8d1b8a1e2e05','愿所有相遇，都恰逢其时',33.6,26,'文艺','一切都是*好的安排，结束的，已然结束；相逢的，终将遇见，不早不晚。41篇暖意萦怀的生活感悟，让你不畏将来，不念过去，在忙乱的世界中守住内心的安定和富足.','5\\4\\03.png'),('4c1d6879-947a-48e8-88d3-123ce20b9c22','二手时间',41.3,45,'文艺','2015年诺贝尔文学奖得主阿列克谢耶维奇全新力作 豆瓣2016年度高分图书榜榜首、新浪好书榜2016年度十大好书、单向街 书店文学奖2016年度图书 《人民日报》央视《第yi时间》凤凰卫视《锵锵三人行》《总编辑时间》推荐 梁文','5\\5\\07.png'),('602eb6cc-03f6-4b12-9b16-f95d5f3d0234','人间失格',19.8,55,'小说','太宰治灵魂深处无助的生命绝唱，同时也是村上春树绝望凄美的灵感源泉。 ★ 完整收录未完成遗作《Goodbye》， 无赖派 文学大师太宰治代表作集结。 ★ 即使时移世易，深深的绝望依旧源自内心的迷茫，而这种迷茫和彷徨几乎贯穿了太宰治以及我们每个人的青春。因此，《人间失格》是一部残酷而永恒的青春文学。 ','3\\0\\5.png'),('65a79039-962b-46d8-aca4-cab420e955dc','霍乱时期的爱情',34.2,50,'小说','★ 原著首印量是《百年孤独》的150倍，中文版已售100万册！ ★ 这部光芒闪耀、令人心碎的作品是人类有史以来*伟大的爱情小说。 《纽约时报》 ★ 《霍乱时期的爱情》是我*好的作品，是我发自内心的创作。','3\\3\\9.png'),('67e28221-1ac2-43e1-8536-111457cdaaad','你是我不及的梦',28,65,'文艺','央视《朗读者》第六期书单，赖敏深情朗诵 ','5\\4\\01.png'),('72e22256-7372-4825-89c6-6016d10d8296','追风筝的人',14.5,55,'小说','这本小说太令人震撼，很长一段时日，让我所读的一切都相形失色。文学与生活中的所有重要主题，都交织在这部惊世之作里：爱、恐惧、愧疚、赎罪 伊莎贝拉 阿连德 ★ 一个阿富汗作家的处女作 ★ 一部以史诗般的历史景观和荡气回肠。','5\\6\\10.png'),('74927536-8940-4c37-9812-69f16608ba81','长征',77.4,50,'文艺','畅销十年的非虚构经典，销量逾 90 万册 把长征作为人类精神事件书写的图书 教育部编八年级（上）语文教科书名著导读自主阅读指定书目','5\\4\\06.png'),('78859868-e60b-4110-9a14-0ccdba69d6c2','第四次工业革命 ',30,60,'经济','林毅夫、姜建清、董明珠等鼎力推荐！中国制造2025，德国工业4.0美国智能制造的核心力量，一场席卷世界的社会大变革来了！','e\\9\\000000787.png'),('8aa60d0d-91d2-4223-a71f-9886724f1a01','围城',24.2,35,'小说','凡是真正出色的文学作品，都具有一种抗理论分析力，任何自认为深透、精彩的理论都会在它们面前显得干瘪而又捉襟见肘。尽管钱锺书所著的《围城》本身并不朦胧，但我们读后的感觉仍是感觉大于思想，大于语言。','5\\6\\12.png'),('9ab48a5d-02c0-49fc-970a-4cb0ffebf5a7','抗日战争',156.4,40,'文艺','1 、全民族抗战史! 2 、《抗日战争》 抵达历史，抵达文学 王树增战争系列自2006年开始出版，至今已有《长征》《解放战争》《朝鲜战争》一系列作品问世。他开创了全新的战争史写作范式，也为战争文学树立了新标杆。 这一系列作品所具备的坚实宏大的结构、国际的视角、对现实的关照以及详尽的资料，使他拥有了数百万忠实粉丝','5\\5\\08.png'),('9b90df07-fa90-47d6-b5d0-38393030acd8','愿你慢慢长大',24,123,'文艺','愿你慢慢长大（与刘瑜、周国平、冯唐等名家一起开始一场温柔的教养旅程，聊一聊关于教养的真心话，感受孩子成长的真实意义。','5\\b\\46.jpg'),('a92d1165-e3a3-4c37-a6e4-b1b45c30003d','时空穿行',35,20,'小说','这是国内**编剧六六携手童话大师周艺文打造全新电视与图书交互式阅读新体验','7\\4\\101.jpg'),('aa255bc9-ee77-4bd2-8dbc-c575f4dce3b6','倾听，成就孩子健全人格',32.8,60,'生活','美国医学委员会全新观点：一次短暂的倾听可以让情感关系发生巨大的转变，帮助孩子和我们自己渡过难关，并培养出具有心理弹性、拥有真实自我的下一代 ','4\\0\\004.png'),('ac6d965f-a060-4dcb-a46f-64ce0afe8a6c','知行合一王阳明大全集',103.7,15,'历史文化','全面解读知行合一理念及其创始人王阳明的通俗全传！公务员网站专题力荐王阳明家训！隆庆六年初刻本《传习录》，尘封400余年原貌重现的初始定本！','8\\6\\00001.png'),('b06b3685-bac8-463c-856f-83c762071d73','芳华',27.3,45,'小说','《芳华》涵盖了严歌苓的青春与成长期，她在四十余年后回望这段经历，笔端蕴含了饱满的情感。青春荷尔蒙冲动下的少男少女的懵懂激情，由激情犯下的过错，由过错生出的懊悔，还有那个特殊的时代背景，种种，构成了《芳华》对一段历史、一群人以及潮流更替、境遇变迁的复杂感怀。','2\\e\\3.png'),('c547bdcc-a201-42a3-a47e-53eccbcd7f57','活着',15.3,70,'小说','中国作家之一，他的作品成了当代中国的典范。世界华文“冰心文学奖”，入选香港《亚洲周刊》评选的“20世纪中文小说百年百强”等 ','2\\f\\4.png'),('c888407a-9905-49af-b8ce-c1c0df0dad9d','傲慢与偏见',55,80,'原版书','Pride and Prejudice 《 傲慢与偏见》 ，英国著名女作家简 奥斯汀的代表作，是其 21 岁时写成的小说，原名 First Impressions 《最初的印象》，经过改写后换名为《傲慢与偏见》，并于自 18* 年出版。至今 200 余年来，仍畅销全国。','b\\2\\111222.png'),('ce278672-a246-49d4-b383-8049e6888ad3','甲骨文字典',250.8,60,'历史文化','《甲骨文字典(第3版)》是《甲骨文字典》的第3版。《甲骨文字典(第3版)》由徐中舒主编。','b\\a\\0001.png'),('e0e1f291-532a-4c37-9d8b-999d40525061','好妈妈胜过好老师',45.9,25,'生活','《好妈妈胜过好老师》堪称中国家庭教育里程碑之作，既有国际视野，又具中国文化精髓，紧贴现实，呈现了优质教育的做法和魅力，首次把家庭教育著作提升到专业化水平。文笔流畅，可读性强，改变了长期以来教育著作晦涩艰深的现象，在普及现代教育理念方面形成的广度和深度都是前所未有的。','3\\f\\001.png'),('e7c85dc5-0af4-4c32-80b8-007264cdb820','醒来的女性',66.4,50,'文艺','一部小说版的《第二性》，一部女性的心灵史，全球销量2000万册，翻译为22种语言，改编电影获戛纳3项提名。我们不只是别人的另一半，我们还是我们自己。','5\\4\\05.png'),('eb1518f1-bc22-41ae-a934-36c4b060ceb9','如何培养孩子的阅读力',27.2,100,'生活','跟美国幼儿园园长学育儿，硅谷华裔妈妈的49堂亲子课，适用于0—8岁。双语、分级、学龄期…阅读力培养工具书，家庭教育书架必备，轻松提升孩子的情商和思维能力。用书“喂”大的孩子，爱学习、会思考、不叛逆。','3\\f\\007.png'),('eb4a8b32-565f-4be3-8c9e-2a7c4720a822','感悟',18,15,'文艺','动物小说与其他儿童文学相比，内涵更加爱深刻，具有更强的生命力；其内涵对孩子的成长有较大的激励作用，也越来越受到儿童读者的喜爱','7\\4\\102.jpg'),('f0371869-5022-4d25-862d-a20955f36a32','白夜行',41.1,48,'小说','1999年，东野圭吾41岁正值盛年，写作出道已14年，在笔力、技巧、体力和雄心上都炉火纯青，于是洋洋洒洒写出了这部鸿篇巨制《白夜行》。这种规模宏大的长篇作品在职业作家一生的创作中极为罕见，完成后基本都被视为生涯代表作。 《白夜行》一经推出即成为东野圭吾的长篇小说代表作，被万千书迷视为东野圭吾作品中的无冕之王。','3\\2\\8.png');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`PASSWORD`,`gender`,`email`,`telephone`,`introduce`,`role`,`registTime`) values (9,'123456','123456','男','18738982010@163.com','18738982010','哥们就是帅','普通用户','2017-12-25 18:20:48'),(10,'admin','admin','男','',NULL,NULL,'admin','2017-12-21 01:07:02'),(11,'fafagea','123456','男','18999@163.com','18738982010','gril','普通用户','2017-12-25 14:53:26');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
