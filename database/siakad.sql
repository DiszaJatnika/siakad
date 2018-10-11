-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Sep 2018 pada 10.36
-- Versi server: 10.1.34-MariaDB
-- Versi PHP: 7.2.8

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
-- Struktur dari tabel `biaya_kelas`
--

CREATE TABLE `biaya_kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `tahun_ajaran` year(4) NOT NULL,
  `tahun_ajaran2` year(4) NOT NULL,
  `kode_transaksi` int(11) NOT NULL,
  `kode_jurusan` int(11) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `biaya_kelas`
--

INSERT INTO `biaya_kelas` (`id`, `nama_kelas`, `tahun_ajaran`, `tahun_ajaran2`, `kode_transaksi`, `kode_jurusan`, `deskripsi`) VALUES
(1, 'Reguler', 2015, 2016, 1, 2, 'Kelas Reguler'),
(2, 'Reguler Sore', 2016, 2017, 2, 2, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biaya_transaksi_kelas`
--

CREATE TABLE `biaya_transaksi_kelas` (
  `kode` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `biaya_tetap` int(11) NOT NULL,
  `biaya_bangunan` int(11) NOT NULL,
  `biaya_sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `biaya_transaksi_kelas`
--

INSERT INTO `biaya_transaksi_kelas` (`kode`, `id_kelas`, `biaya_tetap`, `biaya_bangunan`, `biaya_sks`) VALUES
(1, 1, 375000, 1500000, 2000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `id` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `kode_matkul` int(11) NOT NULL,
  `semester_krs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `name_login` varchar(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type_login` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `name_login`, `username`, `password`, `type_login`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Disza', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_detail`
--

CREATE TABLE `mahasiswa_detail` (
  `username` varchar(97) NOT NULL DEFAULT '0',
  `nim_mahasiswa` varchar(20) NOT NULL,
  `kode_jurusan` int(10) NOT NULL,
  `dosen_pembimbing` int(10) NOT NULL,
  `status_mahasiswa` varchar(10) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `tahun_masuk` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa_detail`
--

INSERT INTO `mahasiswa_detail` (`username`, `nim_mahasiswa`, `kode_jurusan`, `dosen_pembimbing`, `status_mahasiswa`, `semester`, `id_kelas`, `tahun_masuk`) VALUES
('sandria', '16060022', 2, 4120, 'Cuti', 1, 2, 2015),
('user', '16060012', 2, 4120, 'Aktif', 1, 1, 2015);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_dosen`
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
-- Dumping data untuk tabel `master_dosen`
--

INSERT INTO `master_dosen` (`kode_dosen`, `nama_dosen`, `jenis_kelamin`, `alamat`, `gol_darah`, `email`, `no_hp`) VALUES
(4120, 'Fajar Firmansyah', 'Laki Laki', 'Tasikmalaya', '', 'fajar@google.com', '08551121212'),
(4121, 'Arip', 'Laki Laki', 'Tasikmalaya', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_jurusan`
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
-- Dumping data untuk tabel `master_jurusan`
--

INSERT INTO `master_jurusan` (`kode_jurusan`, `akreditasi`, `nama_jurusan`, `kode_dosen`, `didirikan`, `deskripsi`) VALUES
(1, 'Ban PT Kelas C', 'Teknik Mesin', 2, '2018-08-06', 'Teknik Mesin Adalah Jurusan Yang Berkecimpung Di Dunia Konsentrasi Otomotif'),
(2, 'Ban PT Kelas C', 'Teknik Informatika', 0, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_kelas`
--

CREATE TABLE `master_kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `deskripsi` text NOT NULL,
  `kode_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `master_kelas`
--

INSERT INTO `master_kelas` (`id`, `nama_kelas`, `deskripsi`, `kode_jurusan`) VALUES
(1, 'Reguler', 'Kelas Reguler', 1),
(2, 'Reguler Sore', 'Kelas Reguler Sore', 1),
(3, 'Wekend', 'Kelas Wekend', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_mahasiswa`
--

CREATE TABLE `master_mahasiswa` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
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
-- Dumping data untuk tabel `master_mahasiswa`
--

INSERT INTO `master_mahasiswa` (`id`, `username`, `nama_depan`, `nama_lengkap`, `nik`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nama_ibu`, `nama_ayah`, `alamat_rumah`, `kelurahan`, `kecamatan`, `kode_pos`, `kota_asal`, `kota_sekarang`, `no_hp`, `email`, `pendidikan_terakhir`, `nama_sekolah_asal`, `jurusan`, `tahun_masuk`, `tahun_lulus`, `gol_darah`) VALUES
(1, 'user', 'Disza', 'Disza Jatnika Gunawan Athar', '3278021410970007', 'Laki Laki', 'Jakarta', '1997-10-14', 'Dyah Suryati', 'Latif Mulyana', 'Jl Buninagara 1 RT 01 RW 04', 'Nagarasari', 'Cipedes', '46132', 'Tasikmalaya', 'Tasikmalaya', '089614729915', 'disza@gmail.com', 'SMK', 'SMK Nahdlatul Ulama', 'Rekayasa Perangkat Lunak', 2013, 2016, 'O'),
(2, 'sandria', 'Sandria', 'Sandria Anggra Sutardi', '327851256664646', 'Laki Laki', 'Tasikmalaya', '2012-12-12', 'Sutarti', 'Sandria', 'Tasikmalaya', 'Cihideng', 'Cihideng', '46111', 'Tasikmalaya', 'Tasikmalaya', '08555555', 'sandria@gmail.com', '', '', '', 0000, 0000, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_matakuliah`
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
-- Dumping data untuk tabel `master_matakuliah`
--

INSERT INTO `master_matakuliah` (`kode_matakuliah`, `nama_matakuliah`, `kode_jurusan`, `semester`, `jumlah_sks`, `kode_dosen`, `deskripsi`) VALUES
('1101', 'Pendidikan Agama', 2, 1, 2, 4120, 'Sistem basis data'),
('1102', 'Matematika Diskrit', 2, 1, 2, 4121, 'Sistem Operasi'),
('1103', 'Algoritma & Pemrograman', 2, 1, 4, 4120, ''),
('1104', 'Logika Informatika', 2, 1, 3, 4121, ''),
('1105', 'B. Inggris 1', 0, 1, 2, 4120, ''),
('1106', 'Aplikasi Perkantoran', 1, 1, 4, 4121, ''),
('1107', 'Pengantar Komputer & Internet', 1, 1, 4, 4121, ''),
('1108', 'Struktur Data', 0, 2, 4, 4121, ''),
('1109', 'Struktur Data', 2, 2, 3, 4121, ''),
('1110', 'Arsitektur & Organisasi Komp', 2, 2, 3, 4121, ''),
('1111', 'B Inggris 2', 0, 2, 2, 4120, ''),
('1112', 'Ilmu Alamiah Dasar', 0, 2, 2, 4120, ''),
('1113', 'Pemrograman Visual', 2, 2, 3, 4120, ''),
('1114', 'Design Grafis', 2, 2, 3, 4120, ''),
('1201', 'Statistik', 2, 3, 3, 4121, ''),
('1203', 'Sistem Operasi', 2, 3, 3, 4120, ''),
('1204', 'Pem. Berorientasi Objek', 2, 3, 3, 4120, ''),
('1205', 'B Inggris 3', 0, 3, 2, 0, ''),
('1206', 'Basis Data', 2, 3, 3, 0, ''),
('1207', 'Akhlaq', 0, 3, 2, 0, ''),
('1208', 'Kewarganegaraan', 0, 4, 2, 4121, ''),
('1209', 'Metoda Numerik', 2, 4, 2, 4121, ''),
('2102', 'Aljabar Linier', 2, 3, 2, 4121, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_nilai`
--

CREATE TABLE `master_nilai` (
  `Id` int(11) NOT NULL,
  `kode_matakuliah` varchar(10) DEFAULT NULL,
  `tahun_ajaran` year(4) NOT NULL,
  `nim_mhs` varchar(20) DEFAULT NULL,
  `nilai_tugas` int(11) DEFAULT NULL,
  `nilai_kehadiran` int(11) DEFAULT NULL,
  `nilai_uts` int(11) DEFAULT NULL,
  `nilai_uas` int(11) DEFAULT NULL,
  `nilai_akhir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `master_nilai`
--

INSERT INTO `master_nilai` (`Id`, `kode_matakuliah`, `tahun_ajaran`, `nim_mhs`, `nilai_tugas`, `nilai_kehadiran`, `nilai_uts`, `nilai_uas`, `nilai_akhir`) VALUES
(1, '1104', 2015, '16060012', 85, 100, 85, 80, 0),
(2, '1103', 2015, '16060012', 70, 70, 50, 45, NULL),
(3, '1106', 2015, '16060012', 40, 40, 40, 45, NULL),
(4, '1105', 2015, '16060012', 80, 90, 100, 85, NULL),
(5, '1102', 2015, '16060012', 75, 75, 70, 76, NULL),
(6, '1101', 2015, '16060012', 80, 80, 80, 80, NULL),
(7, '1107', 2015, '16060012', 80, 95, 85, 85, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_semester`
--

CREATE TABLE `master_semester` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `master_semester`
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
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Kode_Matakuliah` varchar(50) NOT NULL,
  `Nama_Matakuliah` varchar(50) NOT NULL,
  `SKS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`Kode_Matakuliah`, `Nama_Matakuliah`, `SKS`) VALUES
('MK01', 'Database', 2),
('MK02', 'MTQ', 3),
('W01', 'Web Programming', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_krs`
--

CREATE TABLE `tmp_krs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `kode_matkul` varchar(10) NOT NULL,
  `semester_krs` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_krs`
--

INSERT INTO `tmp_krs` (`id`, `nim`, `kode_matkul`, `semester_krs`, `tahun`, `status`) VALUES
(1, '16060012', '1101', 1, 2015, 2),
(2, '16060012', '1102', 1, 2015, 2),
(3, '16060012', '1103', 1, 2015, 2),
(4, '16060012', '1104', 1, 2015, 2),
(5, '16060012', '1105', 1, 2015, 2),
(6, '16060012', '1106', 1, 2015, 2),
(7, '16060012', '1107', 1, 2015, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_matakuliah`
--

CREATE TABLE `tmp_matakuliah` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `kode_matakuliah` varchar(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_matakuliah`
--

INSERT INTO `tmp_matakuliah` (`id`, `nim`, `kode_matakuliah`) VALUES
(1, '16060012', 'M5001'),
(2, '16060012', 'M5002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_matkul`
--

CREATE TABLE `tmp_matkul` (
  `id` int(11) NOT NULL,
  `kode_matakuliah` int(11) NOT NULL,
  `tahun_ajaran` year(4) NOT NULL,
  `prs_kehadiran` int(11) NOT NULL,
  `prs_tugas` int(11) NOT NULL,
  `prs_uts` int(11) NOT NULL,
  `prs_uas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_matkul`
--

INSERT INTO `tmp_matkul` (`id`, `kode_matakuliah`, `tahun_ajaran`, `prs_kehadiran`, `prs_tugas`, `prs_uts`, `prs_uas`) VALUES
(1, 1103, 2015, 10, 20, 30, 40),
(3, 1104, 2015, 20, 10, 30, 40),
(4, 1101, 2015, 20, 10, 30, 40),
(5, 1102, 2015, 20, 10, 30, 40),
(6, 1105, 2015, 20, 10, 30, 40),
(7, 1106, 2015, 20, 10, 30, 40),
(8, 1107, 2015, 20, 10, 30, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_pembayaran`
--

CREATE TABLE `tmp_pembayaran` (
  `Id` int(11) NOT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `semester_trs` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_pembayaran`
--

INSERT INTO `tmp_pembayaran` (`Id`, `nim`, `semester_trs`, `status`) VALUES
(2, '16060012', '1', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_mahasiswa`
--

CREATE TABLE `transaksi_mahasiswa` (
  `id_trs` int(11) NOT NULL,
  `nim` int(11) NOT NULL,
  `jenis_pembayaran` varchar(30) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `bayar` int(11) NOT NULL,
  `semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_mahasiswa`
--

INSERT INTO `transaksi_mahasiswa` (`id_trs`, `nim`, `jenis_pembayaran`, `tanggal_pembayaran`, `bayar`, `semester`) VALUES
(1, 16060012, 'Biaya Tetap', '2018-09-13', 200000, 1),
(3, 16060012, 'SKS', '2018-09-01', 1500000, 1),
(6, 16060012, 'SKS', '0000-00-00', 450000, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `biaya_kelas`
--
ALTER TABLE `biaya_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `biaya_transaksi_kelas`
--
ALTER TABLE `biaya_transaksi_kelas`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `mahasiswa_detail`
--
ALTER TABLE `mahasiswa_detail`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `master_dosen`
--
ALTER TABLE `master_dosen`
  ADD PRIMARY KEY (`kode_dosen`);

--
-- Indeks untuk tabel `master_jurusan`
--
ALTER TABLE `master_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indeks untuk tabel `master_kelas`
--
ALTER TABLE `master_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_matakuliah`
--
ALTER TABLE `master_matakuliah`
  ADD PRIMARY KEY (`kode_matakuliah`);

--
-- Indeks untuk tabel `master_nilai`
--
ALTER TABLE `master_nilai`
  ADD PRIMARY KEY (`Id`);

--
-- Indeks untuk tabel `master_semester`
--
ALTER TABLE `master_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kode_Matakuliah`);

--
-- Indeks untuk tabel `tmp_krs`
--
ALTER TABLE `tmp_krs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tmp_matakuliah`
--
ALTER TABLE `tmp_matakuliah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tmp_matkul`
--
ALTER TABLE `tmp_matkul`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tmp_pembayaran`
--
ALTER TABLE `tmp_pembayaran`
  ADD PRIMARY KEY (`Id`);

--
-- Indeks untuk tabel `transaksi_mahasiswa`
--
ALTER TABLE `transaksi_mahasiswa`
  ADD PRIMARY KEY (`id_trs`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `biaya_kelas`
--
ALTER TABLE `biaya_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `biaya_transaksi_kelas`
--
ALTER TABLE `biaya_transaksi_kelas`
  MODIFY `kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `krs`
--
ALTER TABLE `krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `master_kelas`
--
ALTER TABLE `master_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `master_mahasiswa`
--
ALTER TABLE `master_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `master_nilai`
--
ALTER TABLE `master_nilai`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `master_semester`
--
ALTER TABLE `master_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tmp_krs`
--
ALTER TABLE `tmp_krs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tmp_matakuliah`
--
ALTER TABLE `tmp_matakuliah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tmp_matkul`
--
ALTER TABLE `tmp_matkul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tmp_pembayaran`
--
ALTER TABLE `tmp_pembayaran`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `transaksi_mahasiswa`
--
ALTER TABLE `transaksi_mahasiswa`
  MODIFY `id_trs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
