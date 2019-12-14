-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2019 at 04:26 AM
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
(4, 'Doa Setelah Shalat Sunat di Hijir Ismail', 'doa.jpg', 'Ya Allah, Engkaulah pemeliharaku, tiada Tuhan selain Engkau yang menjadikan daku. Aku ini hambaMu, memenuhi janji dan ikatan padaMu sejauh kemampuanku, sedapat mungkin aku berlindung kepadaMu dari kejahatan yang telah aku perbuat, aku kembali padaMu memba'),
(5, 'Doa Sesudah Shalat Sunat Thawaf', 'doa2.jpg', 'Ya Allah, sesungguhnya Engkau Maha Mengetahui rahasiaku yang tersembunyi dan amal perbuatanku yang nyata, terimalah permohonanku, Engkau Maha Mengetahui hajatku, perkenankanlah harapanku. Ya Allah, tiada Tuhan selain Engkau, Maha Suci engkau dan Maha Terp'),
(6, 'Doa di Multazam Setelah Tawaf', 'doa3.PNG', 'Ya Allah Tuhanku yang memelihara Ka’bah ini, merdekakanlah diri kami, bapak dan ibu kami, saudara-saudara dan anak-anak kami dari siksa neraka. Wahai Tuhan Yang Maha Pemurah, yang mempunyai keutamaan, kelebihan, anugerah dan kebaikan. Ya Allah Tuhanku ses'),
(7, 'Doa Tawaf Putaran Ketujuh', 'haji90.png', 'Allahumma anta rabbi laa ilaaha illa anta khalaqtanii anaa ‘abduka wa anaa ‘alaa ‘ahdika wawa’dika mastatha’tu a’uudzubika min syarri maa shana’tu abuu ulaka bini’matika ‘alayya wa abuu ubidzambii faghfir lii fa innahuu laa yaghfirudzdzunuuba illaa anta. ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kegiatan`
--

CREATE TABLE `tb_kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `kloter` int(11) NOT NULL,
  `priode` int(11) NOT NULL,
  `tanggal_keberangkatan` date NOT NULL,
  `tanggal_kepulangan` date NOT NULL,
  `judul_kegiatan` varchar(50) NOT NULL,
  `deskripsi_kegiatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_kegiatan`
--

INSERT INTO `tb_kegiatan` (`id_kegiatan`, `kloter`, `priode`, `tanggal_keberangkatan`, `tanggal_kepulangan`, `judul_kegiatan`, `deskripsi_kegiatan`) VALUES
(4, 1, 2019, '2019-12-13', '2019-12-31', 'judul', 'des'),
(5, 1, 2019, '2019-12-13', '2019-12-31', 'uuu', 'iiiiiiiiiiiii'),
(6, 2, 2019, '2019-12-31', '2020-01-31', 'piuhjk', 'fhgfhjh'),
(7, 2, 2018, '2019-12-31', '2020-01-31', 'dkafjadf', 'fasdfa'),
(8, 1, 2018, '2019-12-13', '2019-12-31', 'test 1', 'test 1');

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
(1, 'tidak boleh membunuh binatang', 'diharamkan membunuh binatang'),
(2, 'Larangan2', 'isi larangan2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `jenis_materi` varchar(50) NOT NULL,
  `judul_materi` varchar(50) NOT NULL,
  `deskripsi_materi` varchar(225) NOT NULL,
  `link_youtube` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `jenis_materi`, `judul_materi`, `deskripsi_materi`, `link_youtube`) VALUES
(1, 'umrah', 'Pengertian Dan Perbedaan Ibadah Haji Dan Umroh', 'Haji adalah berkunjung ketanah suci (ka’bah)) untuk melaksanakan amal ibadah tertentu sesuai dengan syarat, rukun, dan ketentuan yang telah ditetapkan oleh syara’. Haji diwajibkan bagi orang-orang islam yang sudah mampu atau ', 'https://www.youtube.com/watch?v=poooYDzgFFU'),
(2, 'haji & umrah', 'Hukum Haji Dan Umrah', 'Ibadah haji dan umrah adalah suatu ibadah yang dikerjakan oleh umat Islam di tanah suci (Mekkah). Cara melakukan ibadah haji dan umroh tidak sama, karena memiliki perbedaan dari segi rukun umrah dan wajib umrah, terkadang mas', 'https://www.youtube.com/watch?v=oVwTWVPnchY'),
(4, 'Umrah dan Haji', 'Judul', 'Materi describsi', 'https://www.youtube.com/watch?v=M1WwrLB1BK8');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `kloter` int(11) NOT NULL,
  `priode` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_awal` varchar(50) NOT NULL,
  `nama_akhir` varchar(50) NOT NULL,
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

INSERT INTO `tb_user` (`id_user`, `unique_id`, `kloter`, `priode`, `username`, `nama_awal`, `nama_akhir`, `email`, `password`, `salt`, `nomor_hp`, `alamat`, `restore_id`) VALUES
(13, '5dea489535fe25.50971293', 1, 2019, 'username', 'Ahmad', 'Sutarman', 'user@gmail.com', 'Pwjkgy8cKsZNGwF3tK6GiPs2VWA1NTQ4NjM3YjRm', '5548637b4f', 822, 'alamat', '0036d859-cb9f-4c41-8f97-4c6eb2e763d4'),
(29, '5df3d152035856.74244153', 1, 2019, 'amin', 'Amin', 'Alin', 'amin@gmail.com', 'QEuw5zOInp3hJ24yJeCxABYxMtQyZjQxNjc2ZWEy', '2f41676ea2', 822, 'pku', NULL);

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
  MODIFY `id_doa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_kegiatan`
--
ALTER TABLE `tb_kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_larangan`
--
ALTER TABLE `tb_larangan`
  MODIFY `id_larangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
