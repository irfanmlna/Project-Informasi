-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 12:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_informasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jms`
--

CREATE TABLE `tb_jms` (
  `id` int(11) NOT NULL,
  `sekolah_tujuan` varchar(250) NOT NULL,
  `nama_pemohon` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_jms`
--

INSERT INTO `tb_jms` (`id`, `sekolah_tujuan`, `nama_pemohon`) VALUES
(1, 'tes', 'tes'),
(2, '123', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tb_korupsi`
--

CREATE TABLE `tb_korupsi` (
  `id` int(11) NOT NULL,
  `nama_pelapor` varchar(250) NOT NULL,
  `no_hp` varchar(250) NOT NULL,
  `no_ktp` varchar(250) NOT NULL,
  `file_ktp` varchar(250) NOT NULL,
  `uraian_singkat` text NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `file_laporan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_korupsi`
--

INSERT INTO `tb_korupsi` (`id`, `nama_pelapor`, `no_hp`, `no_ktp`, `file_ktp`, `uraian_singkat`, `laporan_pengaduan`, `file_laporan`) VALUES
(1, 'Asep', '0812312312', '1321312331212', 'ktp.docx', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'laporan.docx'),
(2, 'tes', 'tes', 'tes', '', 'tes', 'tes', ''),
(3, '123', '123', '123', '', '123', '123', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengaduan`
--

CREATE TABLE `tb_pengaduan` (
  `id` int(11) NOT NULL,
  `nama_pelapor` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `file_ktp` varchar(255) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `file_laporan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengaduan`
--

INSERT INTO `tb_pengaduan` (`id`, `nama_pelapor`, `no_hp`, `no_ktp`, `file_ktp`, `laporan_pengaduan`, `file_laporan`) VALUES
(1, '0', '0', '0', '0', '0', '0'),
(2, '0', '0', '0', '0', '0', '0'),
(3, '0', '0', '0', '0', '0', '0'),
(4, 'tes', 'tes', 'tes', '', 'tes', ''),
(5, '123', '123', '123', '', '123', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengawasam`
--

CREATE TABLE `tb_pengawasam` (
  `id` int(11) NOT NULL,
  `nama_pelapor` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `file_ktp` varchar(255) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `file_laporan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pengawasam`
--

INSERT INTO `tb_pengawasam` (`id`, `nama_pelapor`, `no_hp`, `no_ktp`, `file_ktp`, `laporan_pengaduan`, `file_laporan`) VALUES
(1, 'tes1', 'tes1', 'tes1', '', 'tes1', ''),
(2, '123', '123', '213', '', '123', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penyuluhan`
--

CREATE TABLE `tb_penyuluhan` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `no_hp` varchar(250) NOT NULL,
  `no_ktp` varchar(250) NOT NULL,
  `file_ktp` varchar(250) NOT NULL,
  `bentuk_permasalahan` varchar(250) NOT NULL,
  `file_laporan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_penyuluhan`
--

INSERT INTO `tb_penyuluhan` (`id`, `nama`, `no_hp`, `no_ktp`, `file_ktp`, `bentuk_permasalahan`, `file_laporan`) VALUES
(3, 'test', 'test', 'test', '', 'test', ''),
(4, 'test', 'test', 'test', '', 'test', ''),
(5, 'tes2', 'tes2', 'tes2', '', 'tes2', ''),
(6, 'tes3', 'tes3', 'tes3', '', 'tes3', ''),
(7, 'tes4', 'tes4', 'tes4', '', 'tes4', ''),
(8, 'tes4', 'tes4', 'tes4', '', 'tes4', ''),
(9, 'tes5', 'tes5', 'tes5', '', 'tes5', ''),
(10, 'tes6', 'tes6', 'tes6', '', 'tes6', ''),
(11, '123', '123', '123', '', '123', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_posko`
--

CREATE TABLE `tb_posko` (
  `id` int(11) NOT NULL,
  `nama_pelapor` varchar(250) NOT NULL,
  `no_hp` varchar(250) NOT NULL,
  `no_ktp` varchar(250) NOT NULL,
  `file_ktp` varchar(250) NOT NULL,
  `laporan_pengaduan` text NOT NULL,
  `file_laporan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_posko`
--

INSERT INTO `tb_posko` (`id`, `nama_pelapor`, `no_hp`, `no_ktp`, `file_ktp`, `laporan_pengaduan`, `file_laporan`) VALUES
(1, 'tes', 'tes', 'tes', '', 'tes', ''),
(2, 'tes2', 'tes2', 'tes2', '', 'tes2', ''),
(3, 'tes4', 'tes4', 'tes4', '', 'tes4', ''),
(4, '123', '123', '123', '', '123', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `tgl_daftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jms`
--
ALTER TABLE `tb_jms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_korupsi`
--
ALTER TABLE `tb_korupsi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengawasam`
--
ALTER TABLE `tb_pengawasam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penyuluhan`
--
ALTER TABLE `tb_penyuluhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_posko`
--
ALTER TABLE `tb_posko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jms`
--
ALTER TABLE `tb_jms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_korupsi`
--
ALTER TABLE `tb_korupsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pengaduan`
--
ALTER TABLE `tb_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_pengawasam`
--
ALTER TABLE `tb_pengawasam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_penyuluhan`
--
ALTER TABLE `tb_penyuluhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_posko`
--
ALTER TABLE `tb_posko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
