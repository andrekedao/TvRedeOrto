-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Set-2016 às 20:38
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.6

--SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
--SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tv_redeorto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticia`
--

CREATE TABLE `noticia` (
  `ID_NOTICIA` int(11) NOT NULL,
  `ID_TV` int(11) DEFAULT NULL,
  `ID_RSS` int(11) DEFAULT NULL,
  `ID_TEMPLATE` int(11) DEFAULT NULL,
  `TEMPO_EXIBICAO` time DEFAULT NULL,
  `PERIODO_EXIBICAO` int(11) DEFAULT NULL,
  `ORDEM_EXIBICAO` int(11) DEFAULT NULL,
  `DATA_CADASTRO` datetime DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ATIVO` tinyint(1) DEFAULT NULL
);


--
-- Estrutura da tabela `rss`
--

CREATE TABLE `rss` (
  `ID_RSS` int(11) NOT NULL,
  `DESCRICAO` varchar(100) DEFAULT NULL,
  `LINK` varchar(100) DEFAULT NULL,
  `DATA_CADASTRO` datetime DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ATIVO` tinyint(1) DEFAULT NULL
);

--
-- Estrutura da tabela `template`
--

CREATE TABLE `template` (
  `ID_TEMPLATE` int(11) NOT NULL,
  `NOME_TEMPLATE` varchar(50) DEFAULT NULL,
  `CAMINHO` varchar(100) DEFAULT NULL,
  `IMAGEM` varchar(200) DEFAULT NULL,
  `DATA_CADASTRO` datetime DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ATIVO` tinyint(1) DEFAULT NULL
);

--
-- Estrutura da tabela `tv`
--

CREATE TABLE `tv` (
  `ID_TV` int(11) NOT NULL,
  `NOME_TV` varchar(50) DEFAULT NULL,
  `ULTIMA_ATUALIZACAO` datetime DEFAULT NULL,
  `DATA_CADASTRO` datetime DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ATIVO` tinyint(1) DEFAULT NULL
);

--
-- Estrutura da tabela `usuarios_conexao`
--

CREATE TABLE `usuarios_conexao` (
  `id_usuarios_conexao` int(15) NOT NULL,
  `usuario_id` int(15) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `computador_atual` varchar(50) DEFAULT NULL,
  `horario_login` datetime DEFAULT NULL,
  `horario_logoff` datetime DEFAULT NULL,
  `ultima_acao` time DEFAULT NULL
);


--
-- Estrutura da tabela `usuarios_log`
--

CREATE TABLE `usuarios_log` (
  `id_usuario_log` int(15) NOT NULL,
  `id_usuario` int(15) NOT NULL,
  `login_usuario` varchar(30) NOT NULL,
  `computador` varchar(50) NOT NULL,
  `acao` varchar(50) NOT NULL,
  `tabela` varchar(50) NOT NULL,
  `data_acao` datetime NOT NULL
);


--
-- Estrutura da tabela `usuarios_login`
--

CREATE TABLE `usuarios_login` (
  `ID_USUARIO` int(15) NOT NULL,
  `ID_TV` int(15) DEFAULT NULL,
  `NOME_USUARIO` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `LOGIN` varchar(30) NOT NULL,
  `SENHA` varchar(100) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `TELEFONE` varchar(15) DEFAULT NULL,
  `TIPO_USUARIO` int(11) DEFAULT NULL,
  `DATA_CADASTRO` datetime DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ATIVO` tinyint(1) DEFAULT NULL
);


--
-- Estrutura da tabela `usuarios_tentativa_conexao`
--

CREATE TABLE `usuarios_tentativa_conexao` (
  `id_usuarios_tentativa_conexao` int(15) NOT NULL,
  `usuario_id` int(15) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `computador_atual` varchar(50) DEFAULT NULL,
  `horario_login` datetime DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `ID_VIDEO` int(11) NOT NULL,
  `DESCRICAO_VIDEO` varchar(100) DEFAULT NULL,
  `CAMINHO_VIDEO` varchar(100) DEFAULT NULL,
  `TIPO_VIDEO` int(11) DEFAULT NULL,
  `ORDEM_VIDEO` int(11) DEFAULT NULL,
  `DATA_CADASTRO` datetime DEFAULT NULL,
  `DATA_ATUALIZACAO` datetime DEFAULT NULL,
  `ATIVO` tinyint(1) DEFAULT NULL
);


--
-- Indexes for dumped tables
--

--
-- Indexes for table `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`ID_NOTICIA`),
  ADD KEY `ID_TV` (`ID_TV`),
  ADD KEY `ID_TEMPLATE` (`ID_TEMPLATE`),
  ADD KEY `ID_RSS` (`ID_RSS`);

--
-- Indexes for table `rss`
--
ALTER TABLE `rss`
  ADD PRIMARY KEY (`ID_RSS`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`ID_TEMPLATE`);

--
-- Indexes for table `tv`
--
ALTER TABLE `tv`
  ADD PRIMARY KEY (`ID_TV`);

--
-- Indexes for table `usuarios_conexao`
--
ALTER TABLE `usuarios_conexao`
  ADD PRIMARY KEY (`id_usuarios_conexao`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `usuarios_log`
--
ALTER TABLE `usuarios_log`
  ADD PRIMARY KEY (`id_usuario_log`),
  ADD KEY `fk_usuarios_login` (`id_usuario`);

--
-- Indexes for table `usuarios_login`
--
ALTER TABLE `usuarios_login`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `fk_tv` (`ID_TV`);

--
-- Indexes for table `usuarios_tentativa_conexao`
--
ALTER TABLE `usuarios_tentativa_conexao`
  ADD PRIMARY KEY (`id_usuarios_tentativa_conexao`),
  ADD KEY `fk_usuarios_tentativa_conexao` (`usuario_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`ID_VIDEO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `noticia`
--
ALTER TABLE `noticia`
  MODIFY `ID_NOTICIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rss`
--
ALTER TABLE `rss`
  MODIFY `ID_RSS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `ID_TEMPLATE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tv`
--
ALTER TABLE `tv`
  MODIFY `ID_TV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuarios_conexao`
--
ALTER TABLE `usuarios_conexao`
  MODIFY `id_usuarios_conexao` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios_log`
--
ALTER TABLE `usuarios_log`
  MODIFY `id_usuario_log` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios_login`
--
ALTER TABLE `usuarios_login`
  MODIFY `ID_USUARIO` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `usuarios_tentativa_conexao`
--
ALTER TABLE `usuarios_tentativa_conexao`
  MODIFY `id_usuarios_tentativa_conexao` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `ID_VIDEO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `noticia_ibfk_1` FOREIGN KEY (`ID_TV`) REFERENCES `tv` (`ID_TV`),
  ADD CONSTRAINT `noticia_ibfk_2` FOREIGN KEY (`ID_TEMPLATE`) REFERENCES `template` (`ID_TEMPLATE`),
  ADD CONSTRAINT `noticia_ibfk_3` FOREIGN KEY (`ID_RSS`) REFERENCES `rss` (`ID_RSS`);

--
-- Limitadores para a tabela `usuarios_conexao`
--
ALTER TABLE `usuarios_conexao`
  ADD CONSTRAINT `fk_usuarios_conexao` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_login` (`ID_USUARIO`);

--
-- Limitadores para a tabela `usuarios_log`
--
ALTER TABLE `usuarios_log`
  ADD CONSTRAINT `id_usuario_fk` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios_login` (`ID_USUARIO`);

--
-- Limitadores para a tabela `usuarios_login`
--
ALTER TABLE `usuarios_login`
  ADD CONSTRAINT `fk_tv` FOREIGN KEY (`ID_TV`) REFERENCES `tv` (`ID_TV`);

--
-- Limitadores para a tabela `usuarios_tentativa_conexao`
--
ALTER TABLE `usuarios_tentativa_conexao`
  ADD CONSTRAINT `fk_usuarios_tentativa_conexao` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_login` (`ID_USUARIO`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

?
/* script criado no banco mysql e reutilizado no sqlite */
