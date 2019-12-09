-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2019 at 09:27 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_haji_umrah`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `authkey` varchar(50) NOT NULL,
  `accesToken` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `nama_lengkap`, `password`, `authkey`, `accesToken`, `email`, `foto`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', 'admin', '12345', '120297dewi', '121416dewi', 'dewi@gmail.com', 'dewi.jpg', '2019-11-04 00:00:00', '2019-11-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_doa`
--

CREATE TABLE `tb_doa` (
  `id_doa` int(11) NOT NULL,
  `judul_doa` varchar(50) NOT NULL,
  `gambar_doa` varchar(50) NOT NULL,
  `deskripsi_doa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_doa`
--

INSERT INTO `tb_doa` (`id_doa`, `judul_doa`, `gambar_doa`, `deskripsi_doa`) VALUES
(4, 'yii2', 'lara.png', 'yii2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kegiatan`
--

CREATE TABLE `tb_kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `judul_kegiatan` varchar(50) NOT NULL,
  `deskripsi_kegiatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kegiatan`
--

INSERT INTO `tb_kegiatan` (`id_kegiatan`, `judul_kegiatan`, `deskripsi_kegiatan`) VALUES
(4, 'judul', 'des');

-- --------------------------------------------------------

--
-- Table structure for table `tb_larangan`
--

CREATE TABLE `tb_larangan` (
  `id_larangan` int(11) NOT NULL,
  `judul_larangan` varchar(50) NOT NULL,
  `deskripsi_larangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_larangan`
--

INSERT INTO `tb_larangan` (`id_larangan`, `judul_larangan`, `deskripsi_larangan`) VALUES
(1, 'tidak boleh membunuh binatang', 'diharamkan membunuh binatang');

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `jenis_materi` varchar(50) NOT NULL,
  `judul_materi` varchar(50) NOT NULL,
  `deskripsi_materi` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `jenis_materi`, `judul_materi`, `deskripsi_materi`) VALUES
(1, 'haji', 'umrah', 'blablabla'),
(2, 'umrah', 'hajiumrah', 'bbkk');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `nomor_hp` int(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `restore_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `unique_id`, `username`, `nama_lengkap`, `email`, `password`, `salt`, `nomor_hp`, `alamat`, `restore_id`) VALUES
(12, '', 'admin', 'dewi', 'dewi@gmail.com', '123456', '', 9879, 'panam', ''),
(13, '5dea489535fe25.50971293', 'username', 'username', 'user@gmail.com', 'Pwjkgy8cKsZNGwF3tK6GiPs2VWA1NTQ4NjM3YjRm', '5548637b4f', 822, 'alamat', 'd22e76d8-eb42-4cb3-b4fa-cfaee468569e'),
(14, '5dec99420d4d03.96547314', 'user2', 'User2', 'user2@gmail.com', '4tzEg+U/CdSLAvQ0lloTOzQuBmsyYmFlNTdhYzhl', '2bae57ac8e', 822, 'user2', 'f97e42eb-619c-4d9a-8b64-6599158b5345'),
(18, '5decc6da868f59.06326110', 'user3', 'User3', 'user3@gmail.com', 'jCIJgHIo//UVmLyOddl+tQWQ+Io3YjAyZmQ2NDll', '7b02fd649e', 822, 'user3', '009a712e-a28f-4c20-a4ef-52522c54f988'),
(19, '5dece3ff1c1bb4.75625419', 'user4', 'User4', 'user4@gmail.com', 'PLi+ULJAYKtTnjpWbtSkcYZKCPpiYzcxZTUyOWRi', 'bc71e529db', 822, 'user4', '8a22db8d-4429-4a8c-8c43-e13299deefca'),
(20, '5dece4b9bce023.39188982', 'user5', 'User5', 'user5@gmail.com', 'tpFF+Cc+JYfFKSGc5niojP8jz/dlYTIyYzQyYWNk', 'ea22c42acd', 822, 'user5', '86bbb099-4fbb-44b8-abc8-d1d164b6a776'),
(21, '5dece5d922f6d5.84077129', 'user6', 'User6', 'user6@gmail.com', 'BC+Ijs9nfuqRyTQeFu/RUOhxY/c2MzA4OGQ4Yzlm', '63088d8c9f', 822, 'user6', 'f7ae33c9-f040-41c5-bba6-bcf6bbb9493a'),
(22, '5dece80f625602.22262913', 'user7', 'User7', 'user7@gmail.com', 'ykA2V3gpHVy/brJu6YYR6WCgSvgzZjlkMTJhZjRm', '3f9d12af4f', 822, 'user7', 'd22e76d8-eb42-4cb3-b4fa-cfaee468569e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_doa`
--
ALTER TABLE `tb_doa`
  ADD PRIMARY KEY (`id_doa`);

--
-- Indexes for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `tb_larangan`
--
ALTER TABLE `tb_larangan`
  ADD PRIMARY KEY (`id_larangan`);

--
-- Indexes for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_doa`
--
ALTER TABLE `tb_doa`
  MODIFY `id_doa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_larangan`
--
ALTER TABLE `tb_larangan`
  MODIFY `id_larangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
