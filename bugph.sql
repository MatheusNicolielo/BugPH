# Host: localhost  (Version 5.5.5-10.1.30-MariaDB)
# Date: 2019-04-10 19:57:33
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "usuarios"
#

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `senha` varchar(255) NOT NULL DEFAULT '',
  `ultimo_login` datetime DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "usuarios"
#


#
# Structure for table "posts"
#

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_usuarios` (`id_usuario`),
  CONSTRAINT `fk_posts_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "posts"
#


#
# Structure for table "comentarios"
#

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_usuarios` (`id_usuario`),
  KEY `fk_comentarios_posts` (`id_post`),
  CONSTRAINT `fk_comentarios_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_comentarios_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "comentarios"
#


#
# Structure for table "curtidas"
#

DROP TABLE IF EXISTS `curtidas`;
CREATE TABLE `curtidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_post` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_curtidas_posts` (`id_post`),
  KEY `fk_curtidas_usuarios` (`id_usuario`),
  CONSTRAINT `fk_curtidas_posts` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_curtidas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "curtidas"
#


#
# Structure for table "logs"
#

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `id_usuario` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_usuarios` (`id_usuario`),
  CONSTRAINT `fk_log_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "logs"
#

