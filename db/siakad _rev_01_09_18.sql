-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2018 at 10:45 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `semester_krs` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `name_login` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type_login` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `name_login`, `username`, `password`, `type_login`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Disza', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa_detail`
--

CREATE TABLE `mahasiswa_detail` (
  `username` varchar(97) NOT NULL DEFAULT '0',
  `nim_mahasiswa` varchar(20) NOT NULL,
  `kode_jurusan` int(10) NOT NULL,
  `dosen_pembimbing` int(10) NOT NULL,
  `status_mahasiswa` varchar(10) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `kelas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa_detail`
--

INSERT INTO `mahasiswa_detail` (`username`, `nim_mahasiswa`, `kode_jurusan`, `dosen_pembimbing`, `status_mahasiswa`, `semester`, `kelas`) VALUES
('sandria', '16060022', 3, 4120, 'Cuti', 1, 'Reguler Sore'),
('user', '16060012', 2, 4120, 'Aktif', 1, 'Reguler');

-- --------------------------------------------------------

--
-- Table structure for table `master_dosen`
--

CREATE TABLE `master_dosen` (
  `kode_dosen` int(10) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_dosen`
--

INSERT INTO `master_dosen` (`kode_dosen`, `nama_dosen`, `jenis_kelamin`, `alamat`, `gol_darah`, `email`, `no_hp`) VALUES
(4120, 'Fajar Firmansyah', 'Laki Laki', 'Tasikmalaya', '', 'fajar@google.com', '08551121212'),
(4121, 'Arip', 'Laki Laki', 'Tasikmalaya', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `master_jurusan`
--

CREATE TABLE `master_jurusan` (
  `kode_jurusan` int(10) NOT NULL,
  `akreditasi` varchar(50) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `kode_dosen` int(10) NOT NULL,
  `didirikan` date NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_jurusan`
--

INSERT INTO `master_jurusan` (`kode_jurusan`, `akreditasi`, `nama_jurusan`, `kode_dosen`, `didirikan`, `deskripsi`) VALUES
(1, 'Ban PT Kelas C', 'Teknik Mesin', 2, '2018-08-06', 'Teknik Mesin Adalah Jurusan Yang Berkecimpung Di Dunia Konsentrasi Otomotif'),
(2, 'Ban PT Kelas C', 'Teknik Informatika', 0, '0000-00-00', 'Teknik Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `master_mahasiswa`
--

CREATE TABLE `master_mahasiswa` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `alamat_rumah` text NOT NULL,
  `kelurahan` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kode_pos` varchar(10) NOT NULL,
  `kota_asal` varchar(50) NOT NULL,
  `kota_sekarang` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pendidikan_terakhir` varchar(50) NOT NULL,
  `nama_sekolah_asal` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `tahun_masuk` year(4) NOT NULL,
  `tahun_lulus` year(4) NOT NULL,
  `gol_darah` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_mahasiswa`
--

INSERT INTO `master_mahasiswa` (`id`, `username`, `nama_depan`, `nama_lengkap`, `nik`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `nama_ayah`, `alamat_rumah`, `kelurahan`, `kecamatan`, `kode_pos`, `kota_asal`, `kota_sekarang`, `no_hp`, `email`, `pendidikan_terakhir`, `nama_sekolah_asal`, `jurusan`, `tahun_masuk`, `tahun_lulus`, `gol_darah`) VALUES
(1, 'user', 'Disza', 'Disza Jatnika Gunawan Athar', '3278021410970007', 'Laki Laki', 'Tasikmalaya', '1997-10-14', 'Dyah Suryati', 'Latif Mulyana', 'Jl Buninagara 1 RT 01 RW 04 ', 'Nagarasari', 'Cipedes', '46132', 'Kota Tasikmalaya', 'Kota Tasikmalaya', '089614729915', 'diszaid@gmail.com', 'SMK', 'SMK Nahdlatul Ulama', 'Rekayasa Perangkat Lunak', 2013, 2016, 'O'),
(2, 'sandria', 'Sandria', 'Sandria Anggra Sutardi', '', 'Laki Laki', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', 0000, 0000, '');

-- --------------------------------------------------------

--
-- Table structure for table `master_matakuliah`
--

CREATE TABLE `master_matakuliah` (
  `kode_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `kode_jurusan` int(10) NOT NULL,
  `semester` int(2) NOT NULL,
  `jumlah_sks` int(2) NOT NULL,
  `kode_dosen` int(10) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_matakuliah`
--

INSERT INTO `master_matakuliah` (`kode_matakuliah`, `nama_matakuliah`, `kode_jurusan`, `semester`, `jumlah_sks`, `kode_dosen`, `deskripsi`) VALUES
('1101', 'Pendidikan Agama', 2, 1, 2, 4120, 'Sistem basis data'),
('1102', 'Matematika Diskrit', 2, 1, 2, 4121, 'Sistem Operasi'),
('1103', 'Algoritma & Pemrograman', 2, 1, 4, 4120, ''),
('1104', 'Logika Informatika', 2, 1, 3, 4121, ''),
('1105', 'B. Inggris 1', 2, 1, 2, 4120, ''),
('1106', 'Aplikasi Perkantoran', 2, 1, 4, 4121, ''),
('1107', 'Pengantar Komputer & Internet', 2, 1, 4, 4121, ''),
('1108', 'Kalkulus', 2, 2, 4, 4121, ''),
('1109', 'Struktur Data', 2, 2, 3, 4121, ''),
('1110', 'Arsitektur & Organisasi Komp', 2, 2, 3, 4121, ''),
('1111', 'B Inggris 2', 2, 2, 2, 4120, ''),
('1112', 'Ilmu Alamiah Dasar', 2, 2, 2, 4120, ''),
('1113', 'Pemrograman Visual', 2, 2, 3, 4120, ''),
('1114', 'Design Grafis', 2, 2, 3, 4120, ''),
('1201', 'Statistik', 2, 3, 3, 4121, ''),
('1203', 'Sistem Operasi', 2, 3, 3, 4120, ''),
('1204', 'Pem. Berorientasi Objek', 2, 3, 3, 4120, ''),
('1205', 'B Inggris 3', 0, 3, 2, 4120, ''),
('1206', 'Basis Data', 2, 3, 3, 4120, ''),
('1207', 'Akhlaq', 2, 3, 2, 4120, ''),
('1208', 'Kewarganegaraan', 2, 4, 2, 4121, ''),
('1209', 'Metoda Numerik', 2, 4, 2, 4121, ''),
('2102', 'Aljabar Linier', 2, 3, 2, 4121, '');

-- --------------------------------------------------------

--
-- Table structure for table `master_nilai`
--

CREATE TABLE `master_nilai` (
  `Id` int(11) NOT NULL,
  `kode_matakuliah` varchar(10) DEFAULT NULL,
  `nim_mhs` varchar(20) DEFAULT NULL,
  `nilai_tugas` int(11) DEFAULT NULL,
  `nilai_kehadiran` int(11) DEFAULT NULL,
  `nilai_uts` int(11) DEFAULT NULL,
  `nilai_uas` int(11) DEFAULT NULL,
  `nilai_akhir` int(11) DEFAULT NULL,
  `status_matkul` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_nilai`
--

INSERT INTO `master_nilai` (`Id`, `kode_matakuliah`, `nim_mhs`, `nilai_tugas`, `nilai_kehadiran`, `nilai_uts`, `nilai_uas`, `nilai_akhir`, `status_matkul`) VALUES
(2, '1104', '16060012', 80, 100, NULL, NULL, 90, 'Belum Tuntas');

-- --------------------------------------------------------

--
-- Table structure for table `master_semester`
--

CREATE TABLE `master_semester` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_semester`
--

INSERT INTO `master_semester` (`id`, `nama`) VALUES
(2, 'Semester 2'),
(3, 'Semester 3'),
(4, 'Semester 4'),
(5, 'Semester 5'),
(6, 'Semester 6'),
(7, 'Semester 7'),
(8, 'Semester 8');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Kode_Matakuliah` varchar(50) NOT NULL,
  `Nama_Matakuliah` varchar(50) NOT NULL,
  `SKS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`Kode_Matakuliah`, `Nama_Matakuliah`, `SKS`) VALUES
('MK01', 'Database', 2),
('MK02', 'MTQ', 3),
('W01', 'Web Programming', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tmp_krs`
--

CREATE TABLE `tmp_krs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `semester_krs` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_krs`
--

INSERT INTO `tmp_krs` (`id`, `nim`, `kode_matkul`, `semester_krs`, `status`) VALUES
(179, '16060012', '1101', 1, 2),
(180, '16060012', '1102', 1, 2),
(181, '16060012', '1103', 1, 2),
(182, '16060012', '1104', 1, 2),
(183, '16060012', '1105', 1, 2),
(184, '16060012', '1106', 1, 2),
(186, '16060012', '1107', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tmp_pembayaran`
--

CREATE TABLE `tmp_pembayaran` (
  `Id` int(11) NOT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `semester_trs` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_pembayaran`
--

INSERT INTO `tmp_pembayaran` (`Id`, `nim`, `semester_trs`, `status`) VALUES
(6, '16060012', '1', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `mahasiswa_detail`
--
ALTER TABLE `mahasiswa_detail`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `master_dosen`
--
ALTER TABLE `master_dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indexes for table `master_jurusan`
--
ALTER TABLE `master_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_matakuliah`
--
ALTER TABLE `master_matakuliah`
  ADD PRIMARY KEY (`kode_matakuliah`);

--
-- Indexes for table `master_nilai`
--
ALTER TABLE `master_nilai`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `master_semester`
--
ALTER TABLE `master_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kode_Matakuliah`);

--
-- Indexes for table `tmp_krs`
--
ALTER TABLE `tmp_krs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tmp_pembayaran`
--
ALTER TABLE `tmp_pembayaran`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_nilai`
--
ALTER TABLE `master_nilai`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_semester`
--
ALTER TABLE `master_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tmp_krs`
--
ALTER TABLE `tmp_krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `tmp_pembayaran`
--
ALTER TABLE `tmp_pembayaran`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
