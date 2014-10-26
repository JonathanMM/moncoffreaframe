CREATE TABLE `framatout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(256) NOT NULL,
  `type` int(11) NOT NULL,
  `date_ajout` datetime NOT NULL,
  `lien` text NOT NULL,
  `membre` varchar(256) NOT NULL,
  `dossier` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `membre` (`membre`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;