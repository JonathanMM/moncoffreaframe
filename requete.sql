
CREATE TABLE `framatout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(256) NOT NULL,
  `type` int(11) NOT NULL,
  `date_ajout` datetime NOT NULL,
  `lien` text NOT NULL,
  `membre` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;