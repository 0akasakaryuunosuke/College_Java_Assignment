-
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `f_article`
--

DROP TABLE IF EXISTS `f_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `f_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(80) NOT NULL,
  `article_describe` varchar(200) NOT NULL,
  `article_tag` varchar(40) NOT NULL,
  `article_author` varchar(20) NOT NULL,
  `article_createtime` datetime DEFAULT NULL,
  `article_content` varchar(10000) DEFAULT NULL,
  `article_author_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_article`
--

LOCK TABLES `f_article` WRITE;
/*!40000 ALTER TABLE `f_article` DISABLE KEYS */;
INSERT INTO `f_article` VALUES (19,' 你觉得二次元宅男恶心吗？','自己并不认同','讨论','OOUser','2024-05-13 18:50:26','虚假的二次元：肥胖 天天看h漫 动不动就发情 做出迷惑行为<br/>\r\n<br/>\r\n真实的二次元：说话偶尔夹杂日语 喜欢窝在家里看番 身材中等 喜欢熬夜<br/>\r\n<br/>\r\n非常害怕给别人添麻烦 宁可自己吃亏 轻微社恐但是不妨碍交流 做事独来独往<br/>\r\n<br/>\r\n对现状感到满意 对理科尤其是计算机（无论软硬件）以及化学实验深有造诣<br/>\r\n<br/>\r\n心里难受会憋着不说出来 尽量以最好的态度对待别人 买周边但不多<br/>\r\n<br/>\r\n会骑着车子自己出去逛街 极其反感虚假的二次元 鲜葱 我照了照镜子 如是写道',16);
INSERT INTO `f_article` VALUES(20,'c++指针入门','一些给初学者的建议和指导','c++','methylbird','2024-05-14 11:10:26','一、指针变量的声明<br/>\r\n指针也是一种数据结构，具有指针类型的变量。指针变量适用于存放内存单元地址的。指针也是先声明后使用的，声明指针的语法形式为：<br/>\r\n数据类型 *标识符；<br/>\r\n如下所示：<br/>\r\n<br/>\r\nint *p;<br/>\r\n<br/>\r\n二、与地址相关的运算<br/>\r\nC++提供了两个与地址相关的运算符——*和&。*称为指针运算符，也成为解析，表示获取指针所指向的变量的值，这是一个一元操作符。&称为取地址运算符，也是一个一元操作符，用来得到一个对象的地址。<br/>\r\n注：*和&出现在声明语句中和执行语句中其含义是不同的，它们作为一元运算符和作为二元运算符时其含义也是不同的。<br/>\r\n*出现在声明语句中，在被声明的变量名之前时，表示声明的是指针；出现在执行语句中或声明语句的初始化表达式中作为一元运算符时，表示访问指针所指对象的内容。<br/>\r\n&出现在变量声明语句中位于被声明的变量左边时，表示声明的是引用；在给变量赋初值时出现在等号右边或在执行语句中作为一元运算符出现时，表示取对象的地址。<br/>\r\n<br/>\r\n三、指针的赋值<br/>\r\n对指针的赋值有两种方法：<br/>\r\n1）在定义指针的同时进行初始化赋值。语法形式如下：<br/>\r\n存储类型 数据类型 *指针名=初始地址；<br/>\r\n2）在定义之后，单独使用赋值语句。赋值语句的语法形式如下：<br/>\r\n指针名 地址<br/>\r\n注：一个数组，可以使用它的名称直接来表示它的起始地址。数组名称实际上就是一个不能被赋值的指针，即指针常量。<br/>\r\n关于指针的类型，还应该注意一下几点：<br/>\r\n1）可以声明指向常量的指针，此时不能通过指针来改变所指向对象的值，但指针本身可以改变，可以只想另外的对象；<br/>\r\n2）可以声明指针类型的常量，这时指针本身的值不能被改变；<br/>\r\n3）一般情况下，可以存储任何类型的对西安该地址，就是任何类型的指针都可以赋值给void类型的指针变量。<br/>\r\n<br/>\r\n四、指针运算<br/>\r\n指针可以和整数进行加减运算，但是运算规则是比较特殊的。变量时必须指出它所指的对象是什么类型。这里将看到指针进行加减运算的结果与指针的类型密切相关。比如有指针p1和整数n1,p1+n1表示指针p1当前所指位置后方第 n1个数的地址，p1-n1表示指针p1当前所指位置前方第 n1个数的地址。“指针++”或“指针–”表示指针当前所指位置下一个或前一个数据的地址。<br/>\r\n<br/>\r\n五、指针数组<br/>\r\n如果一个数组的每个元素都是指针变量，这个数组就是指针数组。指针数组的每个元素都必须是同一类型的指针。声明如下：<br/>\r\n数据类型 *数组名[下标表达式]；<br/>\r\n由于指针数组的每个元素都是一个指针，必须先赋值后引用，因此，声明数组之后，对指针元素赋初值是必不可少的。<br/>\r\n<br/>\r\n六、用指针作为函数参数<br/>\r\n当需要在不同的函数之间传送大量数据时，程序执行时调用函数的开销就会比较大。这是如果需要传递的数据时存放在一个连续的内存区域中，就可以值传递数据的起始地址，而不必传递数据的值，以减少开销，提高效率。以指针作为函数的形参有三个作用：<br/>\r\n1）使实参与形参指针指向共同的内存空间，以达到参数双向传递的目的，即通过在被调函数中直接处理主调函数中的数据而将函数的处理结果返回其调用者；<br/>\r\n2）减少函数调用时数据传递的开销；<br/>\r\n3）通过指向函数的指针传递函数代码的首地址。<br/>\r\n<br/>\r\n七、指向函数的指针<br/>\r\n每一个函数都有函数名，实际上这个函数名就表示函数的代码在内存中的起始地址。调用函数的通常是行“函数名（参数表）”的实质就是“函数代码首地址（参数表）”。<br/>\r\n函数指针就是专门用来存放函数代码首地址的变量。在程序中可以像使用函数名一样使用指向函数的指针来调用函数。也就是说一旦函数指针指向了某个函数，它与函数名便具有了相同的作用。声明一个函数指针时，也需要说明函数的返回值、形式参数列表，其一般语法如下：<br/>\r\n数据类型 （* 函数指针名）（形参表）<br/>\r\n数据类型说明函数指针所指函数的返回值类型；第一个圆括号中的内容知名一个函数指针的名称；形参表则列出来该指针所指函数的形参类型和个数。<br/>\r\n函数指针在使用之前也要进行赋值，使指针指向一个已经存在的函数代码的起始地址。一般语法为：<br/>\r\n函数指针名=函数名；
',17);
/*!40000 ALTER TABLE `f_article` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


