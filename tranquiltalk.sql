-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : sam. 30 mars 2024 à 15:22
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tranquiltalk`
--

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `Groupe_id` int(11) NOT NULL,
  `Groupe_name` varchar(255) NOT NULL,
  `Groupe_description` varchar(255) DEFAULT NULL,
  `Groupe_admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_messages`
--

CREATE TABLE `groupe_messages` (
  `message_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `GMC_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_message_content`
--

CREATE TABLE `groupe_message_content` (
  `GMC_id` int(11) NOT NULL,
  `Groupe_id` int(11) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `sender_Email` varchar(255) NOT NULL,
  `content` mediumblob NOT NULL,
  `messageType` varchar(10) DEFAULT 'text',
  `fileName` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_Email` varchar(255) NOT NULL,
  `receiver_Email` varchar(255) NOT NULL,
  `message` mediumblob NOT NULL,
  `messageType` varchar(10) DEFAULT 'text',
  `fileName` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `name`) VALUES
(1, 'Youness@gmail.com', '159753', 'Youness'),
(2, 'Ayoub@gmail.com', '123456', 'Ayoub'),
(3, 'Yassin@gmail.com', 'azerty', 'yassin'),
(4, 'Ayman@gmail.com', '456789', 'Ayman'),
(5, 'Rachid@gmail.com', '258456', 'Rachid'),
(6, 'Mohamed@gmail.com', 'qsdfgh', 'mohamed'),
(7, 'khadija@gmail.com', '1234', 'khadija'),
(8, 'omar@gmail.com', '1234', 'omar'),
(9, 'imane123@gmail.com', '123', 'imane'),
(10, 'ilham@gmail.com', '1234', 'ilham '),
(11, 'soukaina@gmail.com', '123', 'soukaina'),
(12, 'test@gmail.com', '1234', 'test account'),
(13, 'test1@gmail.com', '123', 'test1'),
(14, 'test2@gmail.com', '123', 'test2'),
(15, 'test3@gmail.com', '123', 'test3'),
(16, 'test4@gmail.com', '123', 'test4'),
(17, 'nom@gmail.com', '1234', 'nom'),
(18, 'farah@gmail.com', '123', 'farah'),
(19, 'testtt@gmail.com', '123', 'testttt'),
(20, 'testing@gmail.com', '123', 'testing'),
(21, 'new@gmail.com', '123', 'new user'),
(22, 'new1@gmail.com', '123', 'new1'),
(23, 'testing1@gmail.com', '123', 'testing1'),
(24, 'new2@gmail.com', '123', 'new2'),
(25, 'utilisateur1@gmail.com', '123', 'utilisateur1'),
(26, 'utilisateur2@gmail.com', '123', 'utilisateur2'),
(27, 'testtttt@gmail.com', '1234', 'test'),
(28, 'user1@gmail.com', '1234', 'user1'),
(29, 'user2@gmail.com', '123', 'user2');

-- --------------------------------------------------------

--
-- Structure de la table `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`Groupe_id`);

--
-- Index pour la table `groupe_messages`
--
ALTER TABLE `groupe_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `GMC_id` (`GMC_id`);

--
-- Index pour la table `groupe_message_content`
--
ALTER TABLE `groupe_message_content`
  ADD PRIMARY KEY (`GMC_id`),
  ADD KEY `Groupe_id` (`Groupe_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `Groupe_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe_messages`
--
ALTER TABLE `groupe_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe_message_content`
--
ALTER TABLE `groupe_message_content`
  MODIFY `GMC_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `groupe_messages`
--
ALTER TABLE `groupe_messages`
  ADD CONSTRAINT `groupe_messages_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `groupe_messages_ibfk_2` FOREIGN KEY (`GMC_id`) REFERENCES `groupe_message_content` (`GMC_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `groupe_message_content`
--
ALTER TABLE `groupe_message_content`
  ADD CONSTRAINT `groupe_message_content_ibfk_1` FOREIGN KEY (`Groupe_id`) REFERENCES `groupe` (`Groupe_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
