-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Maio-2022 às 02:18
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula2`
--
CREATE DATABASE IF NOT EXISTS `aula2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aula2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbaluguel`
--

CREATE TABLE `tbaluguel` (
  `codalug` int(5) NOT NULL,
  `dtlocacao` date NOT NULL,
  `dtentrega` date NOT NULL,
  `codcli` int(5) DEFAULT NULL,
  `codcar` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbaluguel`
--

INSERT INTO `tbaluguel` (`codalug`, `dtlocacao`, `dtentrega`, `codcli`, `codcar`) VALUES
(1, '2021-01-06', '2021-01-10', 1, 3),
(2, '2000-04-07', '2000-04-16', 3, 4),
(3, '2021-06-29', '2021-07-26', 1, 3),
(4, '2002-12-24', '2003-01-10', 5, 2),
(5, '1999-12-20', '1999-12-31', 3, 4),
(6, '2005-04-01', '2005-09-30', 2, 4),
(7, '2008-01-30', '2008-01-30', 5, 1),
(8, '2018-09-01', '2018-09-11', 2, 4),
(9, '2013-10-28', '2013-10-30', 3, 3),
(10, '2011-05-09', '2011-05-19', 1, 1),
(11, '2016-08-27', '2016-09-01', 2, 4),
(12, '2015-01-01', '2015-01-04', 4, 3),
(13, '2016-03-03', '2016-03-06', 6, 1),
(14, '2019-03-03', '2019-03-06', 6, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcarro`
--

CREATE TABLE `tbcarro` (
  `codcar` int(5) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `cor` varchar(15) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbcarro`
--

INSERT INTO `tbcarro` (`codcar`, `placa`, `cor`, `modelo`, `ano`) VALUES
(1, 'PGB1234', 'Azul', 'Uno', 2000),
(2, 'pug4321', 'Preto', 'Gol', 1990),
(3, 'CSE6163', 'Cinza', 'Uno', 2001),
(4, 'TUB4314', 'Branco', 'Gol', 1990),
(6, 'GRJ4R85', 'Azul', 'Bmw330e', 2021);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `id` int(5) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dtnasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbcliente`
--

INSERT INTO `tbcliente` (`id`, `nome`, `dtnasc`) VALUES
(1, 'João', '2000-01-01'),
(2, 'José', '2001-07-01'),
(3, 'Paulo', '1994-03-04'),
(4, 'Moisés', '1972-06-06'),
(5, 'Maria', '2003-10-12'),
(6, 'Claudia', '1998-02-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbdocumento`
--

CREATE TABLE `tbdocumento` (
  `coddoc` int(5) NOT NULL,
  `cnh` varchar(11) NOT NULL,
  `codcli` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbendereco`
--

CREATE TABLE `tbendereco` (
  `codend` int(5) NOT NULL,
  `endereco` varchar(60) NOT NULL,
  `bairro` varchar(35) NOT NULL,
  `cidade` varchar(12) NOT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `codcli` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtelefone`
--

CREATE TABLE `tbtelefone` (
  `codtel` int(5) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `codcli` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtipo`
--

CREATE TABLE `tbtipo` (
  `codtipo` int(5) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `codcar` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbaluguel`
--
ALTER TABLE `tbaluguel`
  ADD PRIMARY KEY (`codalug`),
  ADD KEY `fk_codclialu_id` (`codcli`),
  ADD KEY `fk_codcaralu_id` (`codcar`);

--
-- Índices para tabela `tbcarro`
--
ALTER TABLE `tbcarro`
  ADD PRIMARY KEY (`codcar`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Índices para tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tbdocumento`
--
ALTER TABLE `tbdocumento`
  ADD PRIMARY KEY (`coddoc`),
  ADD UNIQUE KEY `cnh` (`cnh`),
  ADD KEY `fk_codcli_id` (`codcli`);

--
-- Índices para tabela `tbendereco`
--
ALTER TABLE `tbendereco`
  ADD PRIMARY KEY (`codend`),
  ADD KEY `fk_codcliend_id` (`codcli`);

--
-- Índices para tabela `tbtelefone`
--
ALTER TABLE `tbtelefone`
  ADD PRIMARY KEY (`codtel`),
  ADD UNIQUE KEY `celular` (`celular`),
  ADD KEY `fk_codclitel_id` (`codcli`);

--
-- Índices para tabela `tbtipo`
--
ALTER TABLE `tbtipo`
  ADD PRIMARY KEY (`codtipo`),
  ADD KEY `fk_codcartipo_codcar` (`codcar`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbaluguel`
--
ALTER TABLE `tbaluguel`
  MODIFY `codalug` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tbcarro`
--
ALTER TABLE `tbcarro`
  MODIFY `codcar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tbdocumento`
--
ALTER TABLE `tbdocumento`
  MODIFY `coddoc` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbendereco`
--
ALTER TABLE `tbendereco`
  MODIFY `codend` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbtelefone`
--
ALTER TABLE `tbtelefone`
  MODIFY `codtel` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbtipo`
--
ALTER TABLE `tbtipo`
  MODIFY `codtipo` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbaluguel`
--
ALTER TABLE `tbaluguel`
  ADD CONSTRAINT `fk_codcaralu_id` FOREIGN KEY (`codcar`) REFERENCES `tbcarro` (`codcar`),
  ADD CONSTRAINT `fk_codclialu_id` FOREIGN KEY (`codcli`) REFERENCES `tbcliente` (`id`);

--
-- Limitadores para a tabela `tbdocumento`
--
ALTER TABLE `tbdocumento`
  ADD CONSTRAINT `fk_codcli_id` FOREIGN KEY (`codcli`) REFERENCES `tbcliente` (`id`);

--
-- Limitadores para a tabela `tbendereco`
--
ALTER TABLE `tbendereco`
  ADD CONSTRAINT `fk_codcliend_id` FOREIGN KEY (`codcli`) REFERENCES `tbcliente` (`id`);

--
-- Limitadores para a tabela `tbtelefone`
--
ALTER TABLE `tbtelefone`
  ADD CONSTRAINT `fk_codclitel_id` FOREIGN KEY (`codcli`) REFERENCES `tbcliente` (`id`);

--
-- Limitadores para a tabela `tbtipo`
--
ALTER TABLE `tbtipo`
  ADD CONSTRAINT `fk_codcartipo_codcar` FOREIGN KEY (`codcar`) REFERENCES `tbcarro` (`codcar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
