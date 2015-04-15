CREATE  TABLE `comment` (
  `comment_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `article_id` BIGINT NOT NULL DEFAULT 0 ,
  `user_id` BIGINT NOT NULL DEFAULT 0 ,
  `user_name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `user_image` VARCHAR(4095) NOT NULL DEFAULT '' ,
  `time` BIGINT NOT NULL DEFAULT 0 ,
  `status` ENUM('new','pass','nopass','delete') NOT NULL DEFAULT 'new' ,
  PRIMARY KEY (`comment_id`) )
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(4095) NOT NULL DEFAULT '',
  `brief` text NOT NULL,
  `type` enum('article','course') NOT NULL DEFAULT 'article',
  `group_tag` varchar(255) NOT NULL DEFAULT '',
  `time` bigint(20) NOT NULL DEFAULT '0',
  `read_count` int(11) NOT NULL DEFAULT '0',
  `like_count` int(11) NOT NULL DEFAULT '0',
  `share_count` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE  TABLE `content` (
  `content_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `father_id` BIGINT NOT NULL DEFAULT 0 ,
  `depth` INT NOT NULL DEFAULT 0 ,
  `seq` INT NOT NULL DEFAULT 0 ,
  `tag` VARCHAR(255) NOT NULL DEFAULT '' ,
  `name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `article_id` BIGINT NOT NULL DEFAULT 0 ,
  `is_delete` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`content_id`) )
DEFAULT CHARACTER SET = utf8;

CREATE  TABLE `article_like` (
  `like_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `article_id` BIGINT NOT NULL DEFAULT 0 ,
  `user_id` BIGINT NOT NULL DEFAULT 0 ,
  `user_name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `user_image` VARCHAR(4095) NOT NULL DEFAULT '' ,
  `like_time` BIGINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`like_id`) );

CREATE  TABLE `article_share` (
  `share_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `article_id` BIGINT NOT NULL DEFAULT 0 ,
  `user_id` BIGINT NOT NULL DEFAULT 0 ,
  `user_name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `user_image` VARCHAR(4095) NOT NULL DEFAULT '' ,
  `share_time` BIGINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`share_id`) );

CREATE  TABLE `user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT ,
  `user_name` VARCHAR(255) NOT NULL DEFAULT '' ,
  `user_account` VARCHAR(255) NOT NULL DEFAULT '' ,
  `from` ENUM('native','weibo','weixin') NOT NULL DEFAULT 'native' ,
  `user_image` VARCHAR(4095) NOT NULL DEFAULT '' ,
  `time` BIGINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`user_id`) )
DEFAULT CHARACTER SET = utf8;
