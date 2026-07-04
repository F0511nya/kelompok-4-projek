-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2026 at 07:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_etherealstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` char(10) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama`, `alamat`, `no_hp`, `email`) VALUES
('', '', '', '', ''),
('CS001', 'Daniel Hidayat', 'Jl. Merdeka Barat No.15 Jakarta Selatan', '085710086787', 'hidayat@gmail.com'),
('CS002', 'Dania Husna', 'Jl. Kampung Melati 1 No. 04 Bekasi Timur', '085644526789', 'ddinda4@gmail.com'),
('CS003', 'Zaria Amizah', 'Jogjakarta', '087898762345', 'azia@gmail.com'),
('CS004', 'Aulia Azahra', 'Jakarta ', '089724565432', 'ara@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` varchar(10) NOT NULL,
  `id_transaksi` varchar(10) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_satuan` decimal(12,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_produk`, `jumlah`, `harga_satuan`) VALUES
('D001', 'TR002', 'PR001', 1, 65000),
('D002', 'TR003', 'PR002', 3, 120000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` varchar(10) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `stock` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `kategori`, `harga`, `stock`) VALUES
('PR001', 'Tumblr Thermos', 'Tumblr', 65000, 99),
('PR002', 'Tumblr Custom', 'Souvenir', 120000, 47);

-- --------------------------------------------------------

--
-- Table structure for table `stok_log`
--

CREATE TABLE `stok_log` (
  `id_log` varchar(10) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `jenis` enum('masuk','keluar') NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_log`
--

INSERT INTO `stok_log` (`id_log`, `id_produk`, `jenis`, `jumlah`, `tanggal`, `keterangan`) VALUES
('LG001', 'PR001', 'keluar', 1, '2026-06-07 11:10:28', 'Penjualan PR001'),
('LG002', 'PR002', 'keluar', 3, '2026-06-08 11:10:28', 'Penjualan PR002');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_customer` varchar(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_harga` decimal(50,0) NOT NULL,
  `status` enum('Pending','Selesai','Batal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_customer`, `tanggal_transaksi`, `total_harga`, `status`) VALUES
('TR001', 'CS001', '2026-06-10', 120000, 'Batal'),
('TR002', 'CS003', '2026-06-07', 65000, 'Selesai'),
('TR003', 'CS002', '2025-06-08', 360000, 'Selesai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `stok_log`
--
ALTER TABLE `stok_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
