-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2023 at 10:54 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_hubungan`
--

CREATE TABLE `table_hubungan` (
  `id_hub` int(10) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_ortu` int(11) DEFAULT NULL,
  `status_hubungan` char(50) DEFAULT NULL,
  `keterangan` char(50) DEFAULT NULL,
  `status_ortu` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_hubungan`
--

INSERT INTO `table_hubungan` (`id_hub`, `id_siswa`, `id_ortu`, `status_hubungan`, `keterangan`, `status_ortu`) VALUES
(1, 2, 1, 'Kandung', 'Ayah', 'Hidup'),
(3, 1, 2, 'Kandung', 'Ibu', 'Hidup'),
(4, 4, 3, 'Kandung', 'Paman', 'Almarhum');

-- --------------------------------------------------------

--
-- Table structure for table `table_kelas`
--

CREATE TABLE `table_kelas` (
  `id_kelas` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `jurusan` enum('IPA','IPS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_kelas`
--

INSERT INTO `table_kelas` (`id_kelas`, `nama`, `jenis`, `jurusan`) VALUES
(1, '10', 'A', 'IPS'),
(3, '12', 'C', 'IPA'),
(4, '9', 'B', 'IPA');

-- --------------------------------------------------------

--
-- Table structure for table `table_ortu`
--

CREATE TABLE `table_ortu` (
  `id_ortu` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(15) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_ortu`
--

INSERT INTO `table_ortu` (`id_ortu`, `nik`, `nama`, `pendidikan`, `pekerjaan`, `telp`, `alamat`, `jenis_kelamin`, `agama`, `status`) VALUES
(1, '6378936542', 'Riadi', 'STM', 'PEGAWAI', '0897654321', 'JL.Imbramsyah', 'L', 'ISLAM', 'HIDUP'),
(2, '12123232', 'Agustin', 'SMA', 'IRT', '089765', 'JL Ulin', 'P', 'ISLAM', 'HIDUP'),
(3, '1233456', 'Agus', 'S1', 'PNS', '05677', 'BJM', 'L', 'KRISTEN', 'HIDUP');

-- --------------------------------------------------------

--
-- Table structure for table `table_poin`
--

CREATE TABLE `table_poin` (
  `id_poin` int(10) NOT NULL,
  `nama_poin` varchar(15) NOT NULL,
  `bobot` varchar(10) NOT NULL,
  `jenis` enum('Prestasi','Pelanggaran') NOT NULL,
  `status` enum('True','False') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_poin`
--

INSERT INTO `table_poin` (`id_poin`, `nama_poin`, `bobot`, `jenis`, `status`) VALUES
(1, 'Lomba Pidato', '100', 'Prestasi', 'True'),
(2, 'Berkelahi', '-20', 'Pelanggaran', 'True'),
(3, 'Absensi Alpha', '-15', 'Pelanggaran', 'True');

-- --------------------------------------------------------

--
-- Table structure for table `table_semester`
--

CREATE TABLE `table_semester` (
  `id_semester` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_poin` int(11) DEFAULT NULL,
  `id_wali` int(11) DEFAULT NULL,
  `id_ortu` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `tingkat_kelas` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_semester`
--

INSERT INTO `table_semester` (`id_semester`, `id_siswa`, `id_poin`, `id_wali`, `id_ortu`, `id_kelas`, `tanggal`, `semester`, `status`, `tingkat_kelas`) VALUES
(1, 2, 1, 2, 2, 1, '2023-06-28', '2', 'Lulus', '12'),
(2, 1, 2, 1, 1, 1, '2023-06-28', '2', 'Naik Kelas', '11'),
(3, 4, 3, 3, 3, 4, '2023-06-28', '2', 'Tinggal Kelas', '10');

-- --------------------------------------------------------

--
-- Table structure for table `table_siswa`
--

CREATE TABLE `table_siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nik` varchar(13) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `telp` varchar(13) NOT NULL,
  `hp` varchar(20) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_siswa`
--

INSERT INTO `table_siswa` (`id_siswa`, `nis`, `nisn`, `nama`, `nik`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `telp`, `hp`, `status`) VALUES
(1, '63123', '60213', 'Garin', '67885', 'KOTABARU', '2001-10-06', 'L', 'BJB', '0511823221', '081250541799', 'Aktif'),
(2, '12233', '898765', 'Eka', '636544', 'Banjarmasin', '2023-06-28', 'P', 'Mekarsari', '081211', '08121', 'Aktif'),
(4, '623112', '677211', 'Adi', '211001', 'Kotabaru', '2023-06-28', 'L', 'BJB', '051199', '08125054', 'AKTIF');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(8) NOT NULL,
  `level` varchar(15) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`id_user`, `username`, `password`, `level`, `status`) VALUES
(2, 'garin21', 'Garins21', 'User', 'Siswa'),
(3, 'Eka05', 'Eka05040', 'User', 'Orang Tua'),
(4, 'admin', 'admin', 'Admin', 'Wali Kelas'),
(5, 'Dhea', '2121', 'USER', 'Siswa'),
(6, 'Tyo', '31241', 'USER', 'Orang Tua');

-- --------------------------------------------------------

--
-- Table structure for table `table_wali_kelas`
--

CREATE TABLE `table_wali_kelas` (
  `id_wali` int(10) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `pendidikan` varchar(30) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `matpel` varchar(15) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `status` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_wali_kelas`
--

INSERT INTO `table_wali_kelas` (`id_wali`, `nik`, `nama`, `jenis_kelamin`, `pendidikan`, `telp`, `matpel`, `alamat`, `status`) VALUES
(1, '6370987', 'Bayu', 'L', 'S.PD', '08976545', 'MATEMATIKA', 'Jl.Karya', 'HONORER'),
(2, '63798765', 'Nisa', 'P', 'S.PD', '086543221', 'B ING', 'JL.Melati', 'TETAP'),
(3, '678823', 'Mariadi', 'L', 'S.Kom', '08124123', 'TIK', 'Jl.Gersang', 'TETAP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_hubungan`
--
ALTER TABLE `table_hubungan`
  ADD PRIMARY KEY (`id_hub`),
  ADD KEY `fk_hubungan_ortu` (`id_ortu`),
  ADD KEY `fk_hubungan_siswa` (`id_siswa`);

--
-- Indexes for table `table_kelas`
--
ALTER TABLE `table_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `table_ortu`
--
ALTER TABLE `table_ortu`
  ADD PRIMARY KEY (`id_ortu`);

--
-- Indexes for table `table_poin`
--
ALTER TABLE `table_poin`
  ADD PRIMARY KEY (`id_poin`);

--
-- Indexes for table `table_semester`
--
ALTER TABLE `table_semester`
  ADD PRIMARY KEY (`id_semester`),
  ADD KEY `fk_semester_siswa` (`id_siswa`),
  ADD KEY `fk_semester_poin` (`id_poin`),
  ADD KEY `fk_semester_wali` (`id_wali`),
  ADD KEY `fk_semester_ortu` (`id_ortu`),
  ADD KEY `fk_semester_kelas` (`id_kelas`);

--
-- Indexes for table `table_siswa`
--
ALTER TABLE `table_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `table_wali_kelas`
--
ALTER TABLE `table_wali_kelas`
  ADD PRIMARY KEY (`id_wali`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_hubungan`
--
ALTER TABLE `table_hubungan`
  MODIFY `id_hub` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_kelas`
--
ALTER TABLE `table_kelas`
  MODIFY `id_kelas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_ortu`
--
ALTER TABLE `table_ortu`
  MODIFY `id_ortu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_poin`
--
ALTER TABLE `table_poin`
  MODIFY `id_poin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_semester`
--
ALTER TABLE `table_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_siswa`
--
ALTER TABLE `table_siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `table_wali_kelas`
--
ALTER TABLE `table_wali_kelas`
  MODIFY `id_wali` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_hubungan`
--
ALTER TABLE `table_hubungan`
  ADD CONSTRAINT `fk_hubungan_ortu` FOREIGN KEY (`id_ortu`) REFERENCES `table_ortu` (`id_ortu`),
  ADD CONSTRAINT `fk_hubungan_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `table_siswa` (`id_siswa`);

--
-- Constraints for table `table_semester`
--
ALTER TABLE `table_semester`
  ADD CONSTRAINT `fk_semester_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `table_kelas` (`id_kelas`),
  ADD CONSTRAINT `fk_semester_ortu` FOREIGN KEY (`id_ortu`) REFERENCES `table_ortu` (`id_ortu`),
  ADD CONSTRAINT `fk_semester_poin` FOREIGN KEY (`id_poin`) REFERENCES `table_poin` (`id_poin`),
  ADD CONSTRAINT `fk_semester_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `table_siswa` (`id_siswa`),
  ADD CONSTRAINT `fk_semester_wali` FOREIGN KEY (`id_wali`) REFERENCES `table_wali_kelas` (`id_wali`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
