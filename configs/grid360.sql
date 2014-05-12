-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 12 mei 2014 om 12:01
-- Serverversie: 5.5.35-0ubuntu0.13.10.2
-- PHP-versie: 5.5.3-1ubuntu2.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `grid360`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `agreementreview`
--

CREATE TABLE IF NOT EXISTS `agreementreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `selection` int(11) NOT NULL,
  `comment` text NOT NULL,
  `reviewee_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `round_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `agreements`
--

CREATE TABLE IF NOT EXISTS `agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `work` text NOT NULL,
  `training` text NOT NULL,
  `other` text NOT NULL,
  `goals` text NOT NULL,
  `tenant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `competency`
--

CREATE TABLE IF NOT EXISTS `competency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `competencygroup_id` int(11) unsigned DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_competency_tenant` (`tenant_id`),
  KEY `index_foreignkey_competency_competencygroup` (`competencygroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=97 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `competencygroup`
--

CREATE TABLE IF NOT EXISTS `competencygroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `general` tinyint(1) unsigned DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_competencygroup_tenant` (`tenant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_department_tenant` (`tenant_id`),
  KEY `index_foreignkey_department_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `infomessage`
--

CREATE TABLE IF NOT EXISTS `infomessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `tenant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `round_id` int(11) unsigned DEFAULT NULL,
  `tenant_id` int(11) NOT NULL,
  `with_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cons_fk_meeting_user_id_id` (`user_id`),
  KEY `index_foreignkey_meeting_round` (`round_id`),
  KEY `cons_fk_meeting_with_id_id` (`with_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci,
  `reviewer_id` int(11) unsigned DEFAULT NULL,
  `reviewee_id` int(11) unsigned DEFAULT NULL,
  `competency_id` int(11) unsigned DEFAULT NULL,
  `round_id` int(11) unsigned DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  `selection` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_review_user` (`reviewer_id`),
  KEY `cons_fk_review_reviewee_id_id` (`reviewee_id`),
  KEY `index_foreignkey_review_competency` (`competency_id`),
  KEY `index_foreignkey_review_round` (`round_id`),
  KEY `index_foreignkey_review_tenant` (`tenant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2570 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `competencygroup_id` int(11) unsigned DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_role_competencygroup` (`competencygroup_id`),
  KEY `index_foreignkey_role_tenant` (`tenant_id`),
  KEY `index_foreignkey_role_department` (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `round`
--

CREATE TABLE IF NOT EXISTS `round` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  `closing_date` datetime DEFAULT NULL,
  `total_to_review` int(11) NOT NULL,
  `min_reviewed_by` int(11) NOT NULL,
  `min_to_review` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_round_tenant` (`tenant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `roundinfo`
--

CREATE TABLE IF NOT EXISTS `roundinfo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `reviewer_id` int(11) unsigned DEFAULT NULL,
  `reviewee_id` int(11) unsigned DEFAULT NULL,
  `round_id` int(11) unsigned DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_roundinfo_user` (`reviewer_id`),
  KEY `cons_fk_roundinfo_reviewee_id_id` (`reviewee_id`),
  KEY `index_foreignkey_roundinfo_round` (`round_id`),
  KEY `index_foreignkey_roundinfo_tenant` (`tenant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1432 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tenant`
--

CREATE TABLE IF NOT EXISTS `tenant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `role_id` int(11) unsigned DEFAULT NULL,
  `userlevel_id` int(11) unsigned DEFAULT NULL,
  `tenant_id` int(11) unsigned DEFAULT NULL,
  `identity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_foreignkey_user_department` (`department_id`),
  KEY `index_foreignkey_user_role` (`role_id`),
  KEY `index_foreignkey_user_userlevel` (`userlevel_id`),
  KEY `index_foreignkey_user_tenant` (`tenant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userlevel`
--

CREATE TABLE IF NOT EXISTS `userlevel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Gegevens worden uitgevoerd voor tabel `userlevel`
--

INSERT INTO `userlevel` (`id`, `name`, `level`) VALUES
(1, 'admin', 1),
(2, 'manager', 2),
(3, 'employee', 3);

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `competency`
--
ALTER TABLE `competency`
  ADD CONSTRAINT `cons_fk_competency_competencygroup_id_id` FOREIGN KEY (`competencygroup_id`) REFERENCES `competencygroup` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_competency_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `competencygroup`
--
ALTER TABLE `competencygroup`
  ADD CONSTRAINT `cons_fk_competencygroup_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `cons_fk_department_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_department_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `meeting`
--
ALTER TABLE `meeting`
  ADD CONSTRAINT `cons_fk_meeting_round_id_id` FOREIGN KEY (`round_id`) REFERENCES `round` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_meeting_user_id_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_meeting_with_id_id` FOREIGN KEY (`with_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `cons_fk_review_competency_id_id` FOREIGN KEY (`competency_id`) REFERENCES `competency` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_review_reviewee_id_id` FOREIGN KEY (`reviewee_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_review_reviewer_id_id` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_review_round_id_id` FOREIGN KEY (`round_id`) REFERENCES `round` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_review_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `cons_fk_role_competencygroup_id_id` FOREIGN KEY (`competencygroup_id`) REFERENCES `competencygroup` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_role_department_id_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_role_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `round`
--
ALTER TABLE `round`
  ADD CONSTRAINT `cons_fk_round_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `roundinfo`
--
ALTER TABLE `roundinfo`
  ADD CONSTRAINT `cons_fk_roundinfo_reviewee_id_id` FOREIGN KEY (`reviewee_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_roundinfo_reviewer_id_id` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_roundinfo_round_id_id` FOREIGN KEY (`round_id`) REFERENCES `round` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_roundinfo_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Beperkingen voor tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `cons_fk_user_department_id_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_user_role_id_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_user_tenant_id_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `cons_fk_user_userlevel_id_id` FOREIGN KEY (`userlevel_id`) REFERENCES `userlevel` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
