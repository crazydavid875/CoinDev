-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： db:3306
-- 產生時間： 2021 年 10 月 06 日 18:05
-- 伺服器版本： 8.0.25
-- PHP 版本： 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `payment`
--

-- --------------------------------------------------------

--
-- 資料表結構 `Receipt`
--

CREATE TABLE `Receipt` (
  `id` int NOT NULL,
  `dist` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uid` int NOT NULL,
  `datetime` int NOT NULL,
  `articleTitle` varchar(1000) NOT NULL,
  `total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `Receipt`
--

INSERT INTO `Receipt` (`id`, `dist`, `uid`, `datetime`, `articleTitle`, `total`) VALUES
(1, '10000001', 35, 1633457687, 'Highly Efficient Indexing Scheme for k-Dominant Skyline Processing over Uncertain Data Stream', 7500),
(2, '10000002', 37, 1633457689, 'Transformer Empowered CSI Feedback for Massive MIMO Systems', 7500),
(3, '10000003', 38, 1633457689, 'Task scheduling approaches for fog computing', 8500),
(4, '10000004', 38, 1633457690, 'Dynamic TDMA for Wireless Sensor Networks', 8500),
(5, '10000005', 39, 1633457691, 'Beyond Octave-Spanning Supercontinuum Generation of Optical Vortices in Ring-Core Photonic Crystal Fiber', 7500),
(6, '10000006', 40, 1633457692, '', 1500),
(7, '10000007', 41, 1633457692, 'A Systematic Resource Management for VR Streaming on MECs', 8500),
(8, '10000008', 44, 1633457693, 'Geographic Routing with Two-Hop Movement Information in Mobile Opportunistic Networks', 7500),
(9, '10000009', 45, 1633457694, 'On-Chip Multiband MIMO Dielectric Resonator Antenna Design for Mm-wave Application', 8500),
(10, '10000010', 46, 1633457694, 'High thermal stability of 850 nm VCSELs with enhanced mask margin up to 85 °C for 100G-SR4 Operation', 7500),
(11, '10000011', 47, 1633457695, 'Survivable Virtual Network Embedding Problem on Elastic Optical Networks with Node Failure', 8500),
(12, '10000012', 48, 1633457696, 'A Study of Neural Network Receivers in OFDM Systems Subject to Memoryless Impulse Noise', 7500),
(13, '10000013', 49, 1633457697, 'Data-Driven Symbol Definition for Color Shift Keying in Screen Camera Communications', 7500),
(14, '10000014', 50, 1633457697, 'Design of a DRX Sleep Scheduling Scheme with Carrier Aggregation in 3GPP Heterogeneous Cellular Networks', 7500),
(15, '10000015', 51, 1633457698, 'Performance Assessment for different SDN-Based Controllers', 7500),
(16, '10000016', 51, 1633457699, 'P2P locality-aware Live IPTV over SDN based FiWi Network', 7500),
(17, '10000017', 52, 1633457700, 'Impact of Artificial Seawater and Turbulence Factors on Underwater Optical Wireless Communication', 7500),
(18, '10000018', 53, 1633457700, 'Strategy-Proof Beam-Aware Multicast Resource Allocation Mechanism', 7500),
(19, '10000019', 55, 1633457719, 'A Scalable Optical Intra-Cluster Data Center Network with an Efficient WDMA protocol: Performance and Power Consumption Study', 7500),
(20, '10000020', 56, 1633457720, 'Using Machine Learning Techniques to Predict Recurrent Breast Cancer in Taiwan', 8500),
(21, '10000021', 57, 1633457721, 'Performance of Fully Digital Zero-Forcing Precoding in mmWave Massive MIMO-NOMA with Antenna Reduction', 8500),
(22, '10000022', 58, 1633457722, '', 3000),
(23, '10000023', 59, 1633457722, 'A wireless sensing device for open farmland and its back-end system design', 8500),
(24, '10000024', 60, 1633457723, 'PPoL: A Periodic Channel Hopping Sequence with Nearly Full Rendezvous Diversity', 8500),
(25, '10000025', 61, 1633457724, 'Channel Modeling of Air-to-Ground Signal Measurement with Two-Ray Ground-Reflection Model for UAV Communication Systems	', 12700),
(26, '10000026', 63, 1633457725, 'An improvement of cycle-based energy-saving scheme in medium-load traffic for NG-EPON networks', 8500),
(27, '10000027', 64, 1633457725, 'Secrecy Energy Efficiency Maximization for UAV Enabled Communication Systems', 7500),
(28, '10000028', 65, 1633457726, 'Collision Avoidance Control for Connected Drones in Air-Intersections', 7500),
(29, '10000029', 66, 1633457727, 'Activity Recognition Based on FR-CNN and Attention-Based LSTM Network', 8500),
(30, '10000030', 67, 1633457728, '1-bit Nonlinear Mapping Precoder for Downlink Massive MU-MIMO Systems', 7500),
(31, '10000031', 68, 1633457728, 'A Systematic Resource Management for VR Streaming on MECs', 8500),
(32, '10000032', 69, 1633457729, '', 1500),
(33, '10000033', 70, 1633457730, 'Extended Abstract）An Efficient AI Resource Allocation Algorithm Based on QoS', 8500),
(34, '10000034', 71, 1633457731, 'A Machine Learning Approach for CQI Feedback Delay in 5G and Beyond 5G Networks', 8500),
(35, '10000035', 72, 1633457732, 'A Positioning Control Module for Lubricate Railway and Lower Pantograph', 8500),
(36, '10000036', 73, 1633457732, 'QAM Signal Classification and Timing Jitter Identification Based on Eye Diagrams and Deep Learning', 7500),
(37, '10000037', 75, 1633457747, 'Using Machine Learning and Light Spatial Sequence Arrangement for Copying Positioning Unit Cell to Reduce Training Burden in Visible Light Positioning (VLP)', 7500),
(38, '10000038', 76, 1633457748, 'Cooperative Deep Learning-Based Uplink Distributed Fair Resource Allocation for Aerial Reconfigurable Intelligent Surfaces Wireless Networks', 8500),
(39, '10000039', 77, 1633457749, 'Modeling Implicit User Relations with Information Propagation Graph for User Influence Prediction', 7500),
(40, '10000040', 78, 1633457749, 'Learning from UAV Experimental Results for Performance Modeling of Reconfigurable Intelligent Surface Flying Platform', 12700),
(41, '10000041', 80, 1633457750, 'Hybrid Multicast and Unicast Streaming System with Layered Video Coding', 7500),
(42, '10000042', 81, 1633457751, 'Latest Advances in Spectrum Management for 6G Communications', 7500),
(43, '10000043', 82, 1633457752, 'Comparative Study on CDMA Code Design of PMCW Radar on Long-Range Multi-Objects Detection', 8500),
(44, '10000044', 83, 1633457752, 'RIS-assisted UAV Networks: Deployment Optimization with Reinforcement-Learning-Based Federated Learning', 12700),
(45, '10000045', 84, 1633457753, '12-Bit 200 MS/s Switched-Current Pipelined Analog-to-Digital Converter for High-Speed DSL', 7500),
(46, '10000046', 84, 1633457754, '12-Bit 200 MS/s Digital Transmitter for Very-High-Bit-Rate Digital Subscriber Loop', 7500),
(47, '10000047', 85, 1633457755, '5G Edge Computing Experiments with Intelligent Resource Allocation for Multi-Application Video Analytics', 7500),
(48, '10000048', 86, 1633457755, 'Simulated Throughput of the O-CDMA/ P-ALOHA Network with Variable-size-message Two-classes Multimedia Traffic', 7500),
(49, '10000049', 87, 1633457756, 'Wi-Fi DSAR: Wi-Fi based Indoor Localization using Denoising Supervised Autoencoder', 8500),
(50, '10000050', 88, 1633457757, 'Optical Focusing-based Adaptive Modulation for Optoacoustic Communication', 7500),
(51, '10000051', 89, 1633457757, 'A Deep Neural Network Equalizer for FSO Transmission System', 7500),
(52, '10000052', 90, 1633457758, '', 1500),
(53, '10000053', 91, 1633457759, 'Modulation Classification in a Multipath Fading Channel Using Deep Learning: 16QAM, 32QAM and 64QAM', 8500),
(54, '10000054', 95, 1633457782, 'A Simulation of Innovative Car Parking Bidding System', 8500),
(55, '10000055', 95, 1633457783, 'Data-driven Spatial Features Analysis Using Share of Voice in Commercial Area', 8500),
(56, '10000056', 96, 1633457783, 'Machine Learning-based Path Loss Modeling in Urban Propagation Environments', 8500),
(57, '10000057', 97, 1633457784, 'Prediction of THz Absorption and Inverse Design of Graphene-Based Metasurface Structure Using Deep Learning', 7500),
(58, '10000058', 99, 1633457785, 'Various microcavity lasers monolithically grown on planar on-axis Si (001) substrates', 7500),
(59, '10000059', 100, 1633457786, '3D-printed mold-assisted U-shaped optical fiber sensor for displacement sensing', 8500),
(60, '10000060', 101, 1633457786, 'High-Baud-Rate 32-QAM OFDM Single-arm and Dual-arm Encoded Silicon Mach-Zehnder Modulator', 7500),
(61, '10000061', 101, 1633457787, 'Impulse Response and Noise Figure of a 50-Gbps O-band Ge p-i-n Waveguide Photodiode with High Responsivity', 7500),
(62, '10000062', 102, 1633457788, 'Employing Telecom Fiber Cables as Sensing Media for Road Traffic Applications', 7500),
(63, '10000063', 103, 1633457789, 'Event identification by deep transfer learning with dual transformations', 8500),
(64, '10000064', 104, 1633457789, 'Multi-agent Learning based Anti-jamming Communications Against Cognitive Jammers', 8500),
(65, '10000065', 105, 1633457790, '', 3000),
(66, '10000066', 107, 1633457791, 'Design and spectral reconstruction assisted by intelligent algorithms for high-resolution Fourier transform spectrometer', 7500),
(67, '10000067', 109, 1633457791, 'Building a Mininet-based Fiber Optic Simulator', 7500),
(68, '10000068', 110, 1633457792, 'Channel Quality Estimation in 3D Drone Base Station for Future Wireless Network', 8500),
(69, '10000069', 111, 1633457793, 'Radio Resource Allocation for 5G Networks Using Deep Reinforcement Learning', 8500),
(70, '10000070', 112, 1633457794, 'Improving Routing Protocol for Low-Power and Lossy Networks over IoT Enviroment', 7500),
(71, '10000071', 113, 1633457794, 'Resource Allocation based on Genetic Algorithm for Cloud Computing', 7500),
(72, '10000072', 54, 1633457828, '40 Gb/s × 8 WDM Bi-directional Transmission in 100 GHz Channel Spacing using Dispersion Compensating Fiber', 7500),
(73, '10000073', 33, 1633484896, '', 1500),
(74, '10000074', 116, 1633515326, 'Edge-based Realtime Image Object Detection for UAV Missions', 7500);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `Receipt`
--
ALTER TABLE `Receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidxxx` (`uid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `Receipt`
--
ALTER TABLE `Receipt`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `Receipt`
--
ALTER TABLE `Receipt`
  ADD CONSTRAINT `uidxxx` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
