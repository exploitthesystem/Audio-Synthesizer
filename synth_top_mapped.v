/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-6
// Date      : Wed Nov 28 18:40:13 2018
/////////////////////////////////////////////////////////////



module pad_out_buffered (out, pad);
	input out;
	output pad;
	
	wire out_pre, out_pre1, out_pre2, out_buf;

	INVX1 inv0 (.A(out), .Z(out_pre));
	INVX4 inv1 (.A(out_pre), .Z(out_pre1));
	INVX16 inv2 (.A(out_pre1), .Z(out_pre2));
	INVX32 inv3 (.A(out_pre2), .Z(out_buf));

	pad_out pad_out0(.pad(pad), .DataOut(out_buf));
endmodule

module pad_bidirhe_buffered (out, pad, in);
	input out;
	output pad;
	output in;

	wire out_pre, out_pre1, out_pre2, out_buf;

	INVX1 inv0 (.A(out), .Z(out_pre));
	INVX4 inv1 (.A(out_pre), .Z(out_pre1));
	INVX16 inv2 (.A(out_pre1), .Z(out_pre2));
	INVX32 inv3 (.A(out_pre2), .Z(out_buf));

	pad_bidirhe pad_bidirhe0(.pad(pad), .DataOut(out_buf), .EN(out_pre), .DataIn(in));
endmodule


module reg_file ( clk, rst, write_en, wrData, DataIn, rdDataA, rdDataB, 
        rdDataC, A, B, C, i2c_wr_en, i2c_sts, i2c_to_reg_file_data, 
        reg_file_to_i2c_data, i2c_slave_addr, i2c_addr, pwm_reg0, pwm_reg1, 
        pwm_reg2, pwm_reg3, pwm_reg4, pwm_reg5, pwm_reg6, pwm_reg7 );
  input [3:0] wrData;
  input [15:0] DataIn;
  input [3:0] rdDataA;
  input [3:0] rdDataB;
  input [3:0] rdDataC;
  output [15:0] A;
  output [15:0] B;
  output [15:0] C;
  input [1:0] i2c_sts;
  input [7:0] i2c_to_reg_file_data;
  output [7:0] reg_file_to_i2c_data;
  output [7:0] i2c_slave_addr;
  output [8:0] i2c_addr;
  output [15:0] pwm_reg0;
  output [15:0] pwm_reg1;
  output [15:0] pwm_reg2;
  output [15:0] pwm_reg3;
  output [15:0] pwm_reg4;
  output [15:0] pwm_reg5;
  output [15:0] pwm_reg6;
  output [15:0] pwm_reg7;
  input clk, rst, write_en, i2c_wr_en;
  wire   N261, N263, N266, N267, N268, N270, N271, N272, N273, N274, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n948, n949, n950, n951, n952, n953,
         n954, n955, n956, n957, n958, n959, n960, n961, n962, n963, n964,
         n965, n966, n967, n968, n969, n970, n971, n972, n973, n974, n975,
         n976, n977, n978, n979, n980, n981, n982, n983, n984, n985, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107,
         n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117,
         n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127,
         n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137,
         n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147,
         n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157,
         n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167,
         n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177,
         n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187,
         n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197,
         n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207,
         n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217,
         n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227,
         n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237,
         n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247,
         n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257,
         n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267,
         n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277,
         n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287,
         n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297,
         n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307,
         n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317,
         n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327,
         n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337,
         n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347,
         n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357,
         n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367,
         n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377,
         n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387,
         n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397,
         n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407,
         n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417,
         n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427,
         n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437,
         n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447,
         n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457,
         n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467,
         n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477,
         n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487,
         n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497,
         n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507,
         n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517,
         n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527,
         n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537,
         n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546, n1547,
         n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556, n1557,
         n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566, n1567,
         n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576, n1577,
         n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586, n1587,
         n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597,
         n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607,
         n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617,
         n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627,
         n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637,
         n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647,
         n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657,
         n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667,
         n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677,
         n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687,
         n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697,
         n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707,
         n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717,
         n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725, n1726, n1727,
         n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735, n1736, n1737,
         n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747,
         n1748, n1749, n1750, n1751, n1752, n1753, n1754, n1755, n1756, n1757,
         n1758, n1759, n1760, n1761, n1762, n1763, n1764, n1765, n1766, n1767,
         n1768, n1769, n1770, n1771, n1772, n1773, n1774, n1775, n1776, n1777,
         n1778, n1779, n1780, n1781, n1782, n1783, n1784, n1785, n1786, n1787,
         n1788, n1789, n1790, n1791, n1792, n1793, n1794, n1795, n1796, n1797,
         n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807,
         n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817,
         n1818, n1819, n1820, n1821, n1822, n1823, n1824, n1825, n1826, n1827,
         n1828, n1829, n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837,
         n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847,
         n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857,
         n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867,
         n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877,
         n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887,
         n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897,
         n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907,
         n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917,
         n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927,
         n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937,
         n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947,
         n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957,
         n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967,
         n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977,
         n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987,
         n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997,
         n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007,
         n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017,
         n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026, n2027,
         n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037,
         n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047,
         n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057,
         n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067,
         n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077,
         n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087,
         n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097,
         n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107,
         n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117,
         n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127,
         n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137,
         n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147,
         n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157,
         n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167,
         n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177,
         n2178, n2179, n2180, n2181, n2182, n2183, n2184, n2185, n2186, n2187,
         n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195, n2196, n2197,
         n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205, n2206, n2207,
         n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215, n2216, n2217,
         n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225, n2226, n2227,
         n2228, n2229, n2230, n2231, n2232, n2233, n2234, n2235, n2236, n2237,
         n2238, n2239, n2240, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n2241, n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249, n2250,
         n2251, n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259, n2260,
         n2261, n2262, n2263, n2264, n2265;
  wire   [15:9] reg6;
  wire   [15:0] reg1;
  wire   [15:0] reg2;
  wire   [15:0] reg3;

  DFFQX1 \reg9_reg[15]  ( .D(n2240), .CLK(clk), .Q(pwm_reg1[15]) );
  DFFQX1 \reg9_reg[14]  ( .D(n2239), .CLK(clk), .Q(pwm_reg1[14]) );
  DFFQX1 \reg9_reg[13]  ( .D(n2238), .CLK(clk), .Q(pwm_reg1[13]) );
  DFFQX1 \reg9_reg[12]  ( .D(n2237), .CLK(clk), .Q(pwm_reg1[12]) );
  DFFQX1 \reg9_reg[11]  ( .D(n2236), .CLK(clk), .Q(pwm_reg1[11]) );
  DFFQX1 \reg9_reg[10]  ( .D(n2235), .CLK(clk), .Q(pwm_reg1[10]) );
  DFFQX1 \reg9_reg[9]  ( .D(n2234), .CLK(clk), .Q(pwm_reg1[9]) );
  DFFQX1 \reg9_reg[8]  ( .D(n2233), .CLK(clk), .Q(pwm_reg1[8]) );
  DFFQX1 \reg9_reg[7]  ( .D(n2232), .CLK(clk), .Q(pwm_reg1[7]) );
  DFFQX1 \reg9_reg[6]  ( .D(n2231), .CLK(clk), .Q(pwm_reg1[6]) );
  DFFQX1 \reg9_reg[5]  ( .D(n2230), .CLK(clk), .Q(pwm_reg1[5]) );
  DFFQX1 \reg9_reg[4]  ( .D(n2229), .CLK(clk), .Q(pwm_reg1[4]) );
  DFFQX1 \reg9_reg[3]  ( .D(n2228), .CLK(clk), .Q(pwm_reg1[3]) );
  DFFQX1 \reg9_reg[2]  ( .D(n2227), .CLK(clk), .Q(pwm_reg1[2]) );
  DFFQX1 \reg9_reg[1]  ( .D(n2226), .CLK(clk), .Q(pwm_reg1[1]) );
  DFFQX1 \reg9_reg[0]  ( .D(n2225), .CLK(clk), .Q(pwm_reg1[0]) );
  DFFQX1 \reg12_reg[15]  ( .D(n2192), .CLK(clk), .Q(pwm_reg4[15]) );
  DFFQX1 \reg12_reg[14]  ( .D(n2191), .CLK(clk), .Q(pwm_reg4[14]) );
  DFFQX1 \reg12_reg[13]  ( .D(n2190), .CLK(clk), .Q(pwm_reg4[13]) );
  DFFQX1 \reg12_reg[12]  ( .D(n2189), .CLK(clk), .Q(pwm_reg4[12]) );
  DFFQX1 \reg12_reg[11]  ( .D(n2188), .CLK(clk), .Q(pwm_reg4[11]) );
  DFFQX1 \reg12_reg[10]  ( .D(n2187), .CLK(clk), .Q(pwm_reg4[10]) );
  DFFQX1 \reg12_reg[9]  ( .D(n2186), .CLK(clk), .Q(pwm_reg4[9]) );
  DFFQX1 \reg12_reg[8]  ( .D(n2185), .CLK(clk), .Q(pwm_reg4[8]) );
  DFFQX1 \reg12_reg[7]  ( .D(n2184), .CLK(clk), .Q(pwm_reg4[7]) );
  DFFQX1 \reg12_reg[6]  ( .D(n2183), .CLK(clk), .Q(pwm_reg4[6]) );
  DFFQX1 \reg12_reg[5]  ( .D(n2182), .CLK(clk), .Q(pwm_reg4[5]) );
  DFFQX1 \reg12_reg[4]  ( .D(n2181), .CLK(clk), .Q(pwm_reg4[4]) );
  DFFQX1 \reg12_reg[3]  ( .D(n2180), .CLK(clk), .Q(pwm_reg4[3]) );
  DFFQX1 \reg12_reg[2]  ( .D(n2179), .CLK(clk), .Q(pwm_reg4[2]) );
  DFFQX1 \reg12_reg[1]  ( .D(n2178), .CLK(clk), .Q(pwm_reg4[1]) );
  DFFQX1 \reg12_reg[0]  ( .D(n2177), .CLK(clk), .Q(pwm_reg4[0]) );
  DFFQX1 \reg13_reg[15]  ( .D(n2176), .CLK(clk), .Q(pwm_reg5[15]) );
  DFFQX1 \reg13_reg[14]  ( .D(n2175), .CLK(clk), .Q(pwm_reg5[14]) );
  DFFQX1 \reg13_reg[13]  ( .D(n2174), .CLK(clk), .Q(pwm_reg5[13]) );
  DFFQX1 \reg13_reg[12]  ( .D(n2173), .CLK(clk), .Q(pwm_reg5[12]) );
  DFFQX1 \reg13_reg[11]  ( .D(n2172), .CLK(clk), .Q(pwm_reg5[11]) );
  DFFQX1 \reg13_reg[10]  ( .D(n2171), .CLK(clk), .Q(pwm_reg5[10]) );
  DFFQX1 \reg13_reg[9]  ( .D(n2170), .CLK(clk), .Q(pwm_reg5[9]) );
  DFFQX1 \reg13_reg[8]  ( .D(n2169), .CLK(clk), .Q(pwm_reg5[8]) );
  DFFQX1 \reg13_reg[7]  ( .D(n2168), .CLK(clk), .Q(pwm_reg5[7]) );
  DFFQX1 \reg13_reg[6]  ( .D(n2167), .CLK(clk), .Q(pwm_reg5[6]) );
  DFFQX1 \reg13_reg[5]  ( .D(n2166), .CLK(clk), .Q(pwm_reg5[5]) );
  DFFQX1 \reg13_reg[4]  ( .D(n2165), .CLK(clk), .Q(pwm_reg5[4]) );
  DFFQX1 \reg13_reg[3]  ( .D(n2164), .CLK(clk), .Q(pwm_reg5[3]) );
  DFFQX1 \reg13_reg[2]  ( .D(n2163), .CLK(clk), .Q(pwm_reg5[2]) );
  DFFQX1 \reg13_reg[1]  ( .D(n2162), .CLK(clk), .Q(pwm_reg5[1]) );
  DFFQX1 \reg13_reg[0]  ( .D(n2161), .CLK(clk), .Q(pwm_reg5[0]) );
  DFFQX1 \reg1_reg[15]  ( .D(n2128), .CLK(clk), .Q(reg1[15]) );
  DFFQX1 \reg1_reg[14]  ( .D(n2127), .CLK(clk), .Q(reg1[14]) );
  DFFQX1 \reg1_reg[13]  ( .D(n2126), .CLK(clk), .Q(reg1[13]) );
  DFFQX1 \reg1_reg[12]  ( .D(n2125), .CLK(clk), .Q(reg1[12]) );
  DFFQX1 \reg1_reg[11]  ( .D(n2124), .CLK(clk), .Q(reg1[11]) );
  DFFQX1 \reg1_reg[10]  ( .D(n2123), .CLK(clk), .Q(reg1[10]) );
  DFFQX1 \reg1_reg[9]  ( .D(n2122), .CLK(clk), .Q(reg1[9]) );
  DFFQX1 \reg1_reg[8]  ( .D(n2121), .CLK(clk), .Q(reg1[8]) );
  DFFQX1 \reg1_reg[7]  ( .D(n2120), .CLK(clk), .Q(reg1[7]) );
  DFFQX1 \reg1_reg[6]  ( .D(n2119), .CLK(clk), .Q(reg1[6]) );
  DFFQX1 \reg1_reg[5]  ( .D(n2118), .CLK(clk), .Q(reg1[5]) );
  DFFQX1 \reg1_reg[4]  ( .D(n2117), .CLK(clk), .Q(reg1[4]) );
  DFFQX1 \reg1_reg[3]  ( .D(n2116), .CLK(clk), .Q(reg1[3]) );
  DFFQX1 \reg1_reg[2]  ( .D(n2115), .CLK(clk), .Q(reg1[2]) );
  DFFQX1 \reg1_reg[1]  ( .D(n2114), .CLK(clk), .Q(reg1[1]) );
  DFFQX1 \reg1_reg[0]  ( .D(n2113), .CLK(clk), .Q(reg1[0]) );
  DFFQX1 \reg2_reg[15]  ( .D(n2112), .CLK(clk), .Q(reg2[15]) );
  DFFQX1 \reg2_reg[14]  ( .D(n2111), .CLK(clk), .Q(reg2[14]) );
  DFFQX1 \reg2_reg[13]  ( .D(n2110), .CLK(clk), .Q(reg2[13]) );
  DFFQX1 \reg2_reg[12]  ( .D(n2109), .CLK(clk), .Q(reg2[12]) );
  DFFQX1 \reg2_reg[11]  ( .D(n2108), .CLK(clk), .Q(reg2[11]) );
  DFFQX1 \reg2_reg[10]  ( .D(n2107), .CLK(clk), .Q(reg2[10]) );
  DFFQX1 \reg2_reg[9]  ( .D(n2106), .CLK(clk), .Q(reg2[9]) );
  DFFQX1 \reg2_reg[8]  ( .D(n2105), .CLK(clk), .Q(reg2[8]) );
  DFFQX1 \reg2_reg[7]  ( .D(n2104), .CLK(clk), .Q(reg2[7]) );
  DFFQX1 \reg2_reg[6]  ( .D(n2103), .CLK(clk), .Q(reg2[6]) );
  DFFQX1 \reg2_reg[5]  ( .D(n2102), .CLK(clk), .Q(reg2[5]) );
  DFFQX1 \reg2_reg[4]  ( .D(n2101), .CLK(clk), .Q(reg2[4]) );
  DFFQX1 \reg2_reg[3]  ( .D(n2100), .CLK(clk), .Q(reg2[3]) );
  DFFQX1 \reg2_reg[2]  ( .D(n2099), .CLK(clk), .Q(reg2[2]) );
  DFFQX1 \reg2_reg[1]  ( .D(n2098), .CLK(clk), .Q(reg2[1]) );
  DFFQX1 \reg2_reg[0]  ( .D(n2097), .CLK(clk), .Q(reg2[0]) );
  DFFQX1 \reg3_reg[15]  ( .D(n2096), .CLK(clk), .Q(reg3[15]) );
  DFFQX1 \reg3_reg[14]  ( .D(n2095), .CLK(clk), .Q(reg3[14]) );
  DFFQX1 \reg3_reg[13]  ( .D(n2094), .CLK(clk), .Q(reg3[13]) );
  DFFQX1 \reg3_reg[12]  ( .D(n2093), .CLK(clk), .Q(reg3[12]) );
  DFFQX1 \reg3_reg[11]  ( .D(n2092), .CLK(clk), .Q(reg3[11]) );
  DFFQX1 \reg3_reg[10]  ( .D(n2091), .CLK(clk), .Q(reg3[10]) );
  DFFQX1 \reg3_reg[9]  ( .D(n2090), .CLK(clk), .Q(reg3[9]) );
  DFFQX1 \reg3_reg[8]  ( .D(n2089), .CLK(clk), .Q(reg3[8]) );
  DFFQX1 \reg3_reg[7]  ( .D(n2088), .CLK(clk), .Q(reg3[7]) );
  DFFQX1 \reg3_reg[6]  ( .D(n2087), .CLK(clk), .Q(reg3[6]) );
  DFFQX1 \reg3_reg[5]  ( .D(n2086), .CLK(clk), .Q(reg3[5]) );
  DFFQX1 \reg3_reg[4]  ( .D(n2085), .CLK(clk), .Q(reg3[4]) );
  DFFQX1 \reg3_reg[3]  ( .D(n2084), .CLK(clk), .Q(reg3[3]) );
  DFFQX1 \reg3_reg[2]  ( .D(n2083), .CLK(clk), .Q(reg3[2]) );
  DFFQX1 \reg3_reg[1]  ( .D(n2082), .CLK(clk), .Q(reg3[1]) );
  DFFQX1 \reg3_reg[0]  ( .D(n2081), .CLK(clk), .Q(reg3[0]) );
  DFFQX1 \reg6_reg[15]  ( .D(n2048), .CLK(clk), .Q(reg6[15]) );
  DFFQX1 \reg6_reg[14]  ( .D(n2047), .CLK(clk), .Q(reg6[14]) );
  DFFQX1 \reg6_reg[13]  ( .D(n2046), .CLK(clk), .Q(reg6[13]) );
  DFFQX1 \reg6_reg[12]  ( .D(n2045), .CLK(clk), .Q(reg6[12]) );
  DFFQX1 \reg6_reg[11]  ( .D(n2044), .CLK(clk), .Q(reg6[11]) );
  DFFQX1 \reg6_reg[10]  ( .D(n2043), .CLK(clk), .Q(reg6[10]) );
  DFFQX1 \reg6_reg[9]  ( .D(n2042), .CLK(clk), .Q(reg6[9]) );
  DFFQX1 \reg6_reg[8]  ( .D(n2041), .CLK(clk), .Q(i2c_addr[8]) );
  DFFQX1 \reg6_reg[7]  ( .D(n2040), .CLK(clk), .Q(i2c_addr[7]) );
  DFFQX1 \reg6_reg[6]  ( .D(n2039), .CLK(clk), .Q(i2c_addr[6]) );
  DFFQX1 \reg6_reg[5]  ( .D(n2038), .CLK(clk), .Q(i2c_addr[5]) );
  DFFQX1 \reg6_reg[4]  ( .D(n2037), .CLK(clk), .Q(i2c_addr[4]) );
  DFFQX1 \reg6_reg[3]  ( .D(n2036), .CLK(clk), .Q(i2c_addr[3]) );
  DFFQX1 \reg6_reg[2]  ( .D(n2035), .CLK(clk), .Q(i2c_addr[2]) );
  DFFQX1 \reg6_reg[1]  ( .D(n2034), .CLK(clk), .Q(i2c_addr[1]) );
  DFFQX1 \reg6_reg[0]  ( .D(n2033), .CLK(clk), .Q(i2c_addr[0]) );
  DFFQX1 \reg7_reg[15]  ( .D(n2032), .CLK(clk), .Q(reg_file_to_i2c_data[7]) );
  DFFQX1 \reg7_reg[14]  ( .D(n2031), .CLK(clk), .Q(reg_file_to_i2c_data[6]) );
  DFFQX1 \reg7_reg[13]  ( .D(n2030), .CLK(clk), .Q(reg_file_to_i2c_data[5]) );
  DFFQX1 \reg7_reg[12]  ( .D(n2029), .CLK(clk), .Q(reg_file_to_i2c_data[4]) );
  DFFQX1 \reg7_reg[11]  ( .D(n2028), .CLK(clk), .Q(reg_file_to_i2c_data[3]) );
  DFFQX1 \reg7_reg[10]  ( .D(n2027), .CLK(clk), .Q(reg_file_to_i2c_data[2]) );
  DFFQX1 \reg7_reg[9]  ( .D(n2026), .CLK(clk), .Q(reg_file_to_i2c_data[1]) );
  DFFQX1 \reg7_reg[8]  ( .D(n2025), .CLK(clk), .Q(reg_file_to_i2c_data[0]) );
  DFFQX1 \reg7_reg[7]  ( .D(n2024), .CLK(clk), .Q(i2c_slave_addr[7]) );
  DFFQX1 \reg7_reg[6]  ( .D(n2023), .CLK(clk), .Q(i2c_slave_addr[6]) );
  DFFQX1 \reg7_reg[5]  ( .D(n2022), .CLK(clk), .Q(i2c_slave_addr[5]) );
  DFFQX1 \reg7_reg[4]  ( .D(n2021), .CLK(clk), .Q(i2c_slave_addr[4]) );
  DFFQX1 \reg7_reg[3]  ( .D(n2020), .CLK(clk), .Q(i2c_slave_addr[3]) );
  DFFQX1 \reg7_reg[2]  ( .D(n2019), .CLK(clk), .Q(i2c_slave_addr[2]) );
  DFFQX1 \reg7_reg[1]  ( .D(n2018), .CLK(clk), .Q(i2c_slave_addr[1]) );
  DFFQX1 \reg7_reg[0]  ( .D(n2017), .CLK(clk), .Q(i2c_slave_addr[0]) );
  DFFQX1 \reg8_reg[15]  ( .D(n2016), .CLK(clk), .Q(pwm_reg0[15]) );
  DFFQX1 \reg8_reg[14]  ( .D(n2015), .CLK(clk), .Q(pwm_reg0[14]) );
  DFFQX1 \reg8_reg[13]  ( .D(n2014), .CLK(clk), .Q(pwm_reg0[13]) );
  DFFQX1 \reg8_reg[12]  ( .D(n2013), .CLK(clk), .Q(pwm_reg0[12]) );
  DFFQX1 \reg8_reg[11]  ( .D(n2012), .CLK(clk), .Q(pwm_reg0[11]) );
  DFFQX1 \reg8_reg[10]  ( .D(n2011), .CLK(clk), .Q(pwm_reg0[10]) );
  DFFQX1 \reg8_reg[9]  ( .D(n2010), .CLK(clk), .Q(pwm_reg0[9]) );
  DFFQX1 \reg8_reg[8]  ( .D(n2009), .CLK(clk), .Q(pwm_reg0[8]) );
  DFFQX1 \reg8_reg[7]  ( .D(n2008), .CLK(clk), .Q(pwm_reg0[7]) );
  DFFQX1 \reg8_reg[6]  ( .D(n2007), .CLK(clk), .Q(pwm_reg0[6]) );
  DFFQX1 \reg8_reg[5]  ( .D(n2006), .CLK(clk), .Q(pwm_reg0[5]) );
  DFFQX1 \reg8_reg[4]  ( .D(n2005), .CLK(clk), .Q(pwm_reg0[4]) );
  DFFQX1 \reg8_reg[3]  ( .D(n2004), .CLK(clk), .Q(pwm_reg0[3]) );
  DFFQX1 \reg8_reg[2]  ( .D(n2003), .CLK(clk), .Q(pwm_reg0[2]) );
  DFFQX1 \reg8_reg[1]  ( .D(n2002), .CLK(clk), .Q(pwm_reg0[1]) );
  DFFQX1 \reg8_reg[0]  ( .D(n2001), .CLK(clk), .Q(pwm_reg0[0]) );
  NAND2X1 U227 ( .A(n224), .B(n225), .Z(n2001) );
  NAND2X1 U228 ( .A(pwm_reg0[0]), .B(n2246), .Z(n225) );
  NAND2X1 U229 ( .A(n226), .B(n227), .Z(n224) );
  NAND2X1 U230 ( .A(n228), .B(n229), .Z(n2002) );
  NAND2X1 U231 ( .A(pwm_reg0[1]), .B(n2246), .Z(n229) );
  NAND2X1 U232 ( .A(n230), .B(n227), .Z(n228) );
  NAND2X1 U233 ( .A(n231), .B(n232), .Z(n2003) );
  NAND2X1 U234 ( .A(pwm_reg0[2]), .B(n2246), .Z(n232) );
  NAND2X1 U235 ( .A(n233), .B(n227), .Z(n231) );
  NAND2X1 U236 ( .A(n234), .B(n235), .Z(n2004) );
  NAND2X1 U237 ( .A(pwm_reg0[3]), .B(n2246), .Z(n235) );
  NAND2X1 U238 ( .A(n236), .B(n227), .Z(n234) );
  NAND2X1 U239 ( .A(n237), .B(n238), .Z(n2005) );
  NAND2X1 U240 ( .A(pwm_reg0[4]), .B(n2246), .Z(n238) );
  NAND2X1 U241 ( .A(n239), .B(n227), .Z(n237) );
  NAND2X1 U242 ( .A(n240), .B(n241), .Z(n2006) );
  NAND2X1 U243 ( .A(pwm_reg0[5]), .B(n2246), .Z(n241) );
  NAND2X1 U244 ( .A(n242), .B(n227), .Z(n240) );
  NAND2X1 U245 ( .A(n243), .B(n244), .Z(n2007) );
  NAND2X1 U246 ( .A(pwm_reg0[6]), .B(n2246), .Z(n244) );
  NAND2X1 U247 ( .A(n245), .B(n227), .Z(n243) );
  NAND2X1 U248 ( .A(n246), .B(n247), .Z(n2008) );
  NAND2X1 U249 ( .A(pwm_reg0[7]), .B(n2246), .Z(n247) );
  NAND2X1 U250 ( .A(n248), .B(n227), .Z(n246) );
  NAND2X1 U251 ( .A(n249), .B(n250), .Z(n2009) );
  NAND2X1 U252 ( .A(pwm_reg0[8]), .B(n2246), .Z(n250) );
  NAND2X1 U253 ( .A(n251), .B(n227), .Z(n249) );
  NAND2X1 U254 ( .A(n252), .B(n253), .Z(n2010) );
  NAND2X1 U255 ( .A(pwm_reg0[9]), .B(n2246), .Z(n253) );
  NAND2X1 U256 ( .A(n254), .B(n227), .Z(n252) );
  NAND2X1 U257 ( .A(n255), .B(n256), .Z(n2011) );
  NAND2X1 U258 ( .A(pwm_reg0[10]), .B(n2246), .Z(n256) );
  NAND2X1 U259 ( .A(n257), .B(n227), .Z(n255) );
  NAND2X1 U260 ( .A(n258), .B(n259), .Z(n2012) );
  NAND2X1 U261 ( .A(pwm_reg0[11]), .B(n2246), .Z(n259) );
  NAND2X1 U262 ( .A(n260), .B(n227), .Z(n258) );
  NAND2X1 U263 ( .A(n261), .B(n262), .Z(n2013) );
  NAND2X1 U264 ( .A(pwm_reg0[12]), .B(n2246), .Z(n262) );
  NAND2X1 U265 ( .A(n263), .B(n227), .Z(n261) );
  NAND2X1 U266 ( .A(n264), .B(n265), .Z(n2014) );
  NAND2X1 U267 ( .A(pwm_reg0[13]), .B(n2246), .Z(n265) );
  NAND2X1 U268 ( .A(n266), .B(n227), .Z(n264) );
  NAND2X1 U269 ( .A(n267), .B(n268), .Z(n2015) );
  NAND2X1 U270 ( .A(pwm_reg0[14]), .B(n2246), .Z(n268) );
  NAND2X1 U271 ( .A(n269), .B(n227), .Z(n267) );
  NAND2X1 U272 ( .A(n270), .B(n271), .Z(n2016) );
  NAND2X1 U273 ( .A(pwm_reg0[15]), .B(n2246), .Z(n271) );
  NAND2X1 U274 ( .A(n272), .B(n227), .Z(n270) );
  NAND2X1 U275 ( .A(n122), .B(n273), .Z(n227) );
  NAND3X1 U276 ( .A(n274), .B(n275), .C(write_en), .Z(n273) );
  NAND2X1 U277 ( .A(n276), .B(n277), .Z(n2017) );
  NAND2X1 U278 ( .A(i2c_slave_addr[0]), .B(n2247), .Z(n277) );
  NAND2X1 U279 ( .A(n226), .B(n278), .Z(n276) );
  NAND2X1 U280 ( .A(n279), .B(n280), .Z(n2018) );
  NAND2X1 U281 ( .A(i2c_slave_addr[1]), .B(n2247), .Z(n280) );
  NAND2X1 U282 ( .A(n230), .B(n278), .Z(n279) );
  NAND2X1 U283 ( .A(n281), .B(n282), .Z(n2019) );
  NAND2X1 U284 ( .A(i2c_slave_addr[2]), .B(n2247), .Z(n282) );
  NAND2X1 U285 ( .A(n233), .B(n278), .Z(n281) );
  NAND2X1 U286 ( .A(n283), .B(n284), .Z(n2020) );
  NAND2X1 U287 ( .A(i2c_slave_addr[3]), .B(n2247), .Z(n284) );
  NAND2X1 U288 ( .A(n236), .B(n278), .Z(n283) );
  NAND2X1 U289 ( .A(n285), .B(n286), .Z(n2021) );
  NAND2X1 U290 ( .A(i2c_slave_addr[4]), .B(n2247), .Z(n286) );
  NAND2X1 U291 ( .A(n239), .B(n278), .Z(n285) );
  NAND2X1 U292 ( .A(n287), .B(n288), .Z(n2022) );
  NAND2X1 U293 ( .A(i2c_slave_addr[5]), .B(n2247), .Z(n288) );
  NAND2X1 U294 ( .A(n242), .B(n278), .Z(n287) );
  NAND2X1 U295 ( .A(n289), .B(n290), .Z(n2023) );
  NAND2X1 U296 ( .A(i2c_slave_addr[6]), .B(n2247), .Z(n290) );
  NAND2X1 U297 ( .A(n245), .B(n278), .Z(n289) );
  NAND2X1 U298 ( .A(n291), .B(n292), .Z(n2024) );
  NAND2X1 U299 ( .A(i2c_slave_addr[7]), .B(n2247), .Z(n292) );
  NAND2X1 U300 ( .A(n248), .B(n278), .Z(n291) );
  NAND2X1 U301 ( .A(n122), .B(n293), .Z(n278) );
  NAND3X1 U302 ( .A(n294), .B(n295), .C(n296), .Z(n2025) );
  NAND2X1 U303 ( .A(reg_file_to_i2c_data[0]), .B(n297), .Z(n296) );
  NAND2X1 U304 ( .A(i2c_to_reg_file_data[0]), .B(n298), .Z(n295) );
  NAND2X1 U305 ( .A(N266), .B(n299), .Z(n294) );
  NAND3X1 U306 ( .A(n300), .B(n301), .C(n302), .Z(n2026) );
  NAND2X1 U307 ( .A(reg_file_to_i2c_data[1]), .B(n297), .Z(n302) );
  NAND2X1 U308 ( .A(i2c_to_reg_file_data[1]), .B(n298), .Z(n301) );
  NAND2X1 U309 ( .A(N267), .B(n299), .Z(n300) );
  NAND3X1 U310 ( .A(n303), .B(n304), .C(n305), .Z(n2027) );
  NAND2X1 U311 ( .A(reg_file_to_i2c_data[2]), .B(n297), .Z(n305) );
  NAND2X1 U312 ( .A(i2c_to_reg_file_data[2]), .B(n298), .Z(n304) );
  NAND2X1 U313 ( .A(N268), .B(n299), .Z(n303) );
  NAND3X1 U314 ( .A(n306), .B(n307), .C(n308), .Z(n2028) );
  NAND2X1 U315 ( .A(reg_file_to_i2c_data[3]), .B(n297), .Z(n308) );
  NAND2X1 U316 ( .A(i2c_to_reg_file_data[3]), .B(n298), .Z(n307) );
  NAND2X1 U317 ( .A(N270), .B(n299), .Z(n306) );
  NAND3X1 U318 ( .A(n309), .B(n310), .C(n311), .Z(n2029) );
  NAND2X1 U319 ( .A(reg_file_to_i2c_data[4]), .B(n297), .Z(n311) );
  NAND2X1 U320 ( .A(i2c_to_reg_file_data[4]), .B(n298), .Z(n310) );
  NAND2X1 U321 ( .A(N271), .B(n299), .Z(n309) );
  NAND3X1 U322 ( .A(n312), .B(n313), .C(n314), .Z(n2030) );
  NAND2X1 U323 ( .A(reg_file_to_i2c_data[5]), .B(n297), .Z(n314) );
  NAND2X1 U324 ( .A(i2c_to_reg_file_data[5]), .B(n298), .Z(n313) );
  NAND2X1 U325 ( .A(N272), .B(n299), .Z(n312) );
  NAND3X1 U326 ( .A(n315), .B(n316), .C(n317), .Z(n2031) );
  NAND2X1 U327 ( .A(reg_file_to_i2c_data[6]), .B(n297), .Z(n317) );
  NAND2X1 U328 ( .A(i2c_to_reg_file_data[6]), .B(n298), .Z(n316) );
  NAND2X1 U329 ( .A(N273), .B(n299), .Z(n315) );
  NAND3X1 U330 ( .A(n318), .B(n319), .C(n320), .Z(n2032) );
  NAND2X1 U331 ( .A(reg_file_to_i2c_data[7]), .B(n297), .Z(n320) );
  NAND2X1 U332 ( .A(i2c_to_reg_file_data[7]), .B(n298), .Z(n319) );
  AND2X1 U333 ( .A(n321), .B(n2245), .Z(n298) );
  NAND2X1 U334 ( .A(N274), .B(n299), .Z(n318) );
  AND2X1 U335 ( .A(n321), .B(write_en), .Z(n299) );
  NOR2X1 U336 ( .A(n297), .B(rst), .Z(n321) );
  AND2X1 U337 ( .A(n322), .B(n293), .Z(n297) );
  NAND2X1 U338 ( .A(n323), .B(write_en), .Z(n293) );
  AND2X1 U339 ( .A(n324), .B(n325), .Z(n323) );
  NAND2X1 U340 ( .A(n326), .B(n327), .Z(n2033) );
  NAND2X1 U341 ( .A(i2c_addr[0]), .B(n2248), .Z(n327) );
  NAND2X1 U342 ( .A(n226), .B(n328), .Z(n326) );
  NAND2X1 U343 ( .A(n329), .B(n330), .Z(n2034) );
  NAND2X1 U344 ( .A(i2c_addr[1]), .B(n2248), .Z(n330) );
  NAND2X1 U345 ( .A(n230), .B(n328), .Z(n329) );
  NAND2X1 U346 ( .A(n331), .B(n332), .Z(n2035) );
  NAND2X1 U347 ( .A(i2c_addr[2]), .B(n2248), .Z(n332) );
  NAND2X1 U348 ( .A(n233), .B(n328), .Z(n331) );
  NAND2X1 U349 ( .A(n333), .B(n334), .Z(n2036) );
  NAND2X1 U350 ( .A(i2c_addr[3]), .B(n2248), .Z(n334) );
  NAND2X1 U351 ( .A(n236), .B(n328), .Z(n333) );
  NAND2X1 U352 ( .A(n335), .B(n336), .Z(n2037) );
  NAND2X1 U353 ( .A(i2c_addr[4]), .B(n2248), .Z(n336) );
  NAND2X1 U354 ( .A(n239), .B(n328), .Z(n335) );
  NAND2X1 U355 ( .A(n337), .B(n338), .Z(n2038) );
  NAND2X1 U356 ( .A(i2c_addr[5]), .B(n2248), .Z(n338) );
  NAND2X1 U357 ( .A(n242), .B(n328), .Z(n337) );
  NAND2X1 U358 ( .A(n339), .B(n340), .Z(n2039) );
  NAND2X1 U359 ( .A(i2c_addr[6]), .B(n2248), .Z(n340) );
  NAND2X1 U360 ( .A(n245), .B(n328), .Z(n339) );
  NAND2X1 U361 ( .A(n341), .B(n342), .Z(n2040) );
  NAND2X1 U362 ( .A(i2c_addr[7]), .B(n2248), .Z(n342) );
  NAND2X1 U363 ( .A(n248), .B(n328), .Z(n341) );
  NAND2X1 U364 ( .A(n343), .B(n344), .Z(n2041) );
  NAND3X1 U365 ( .A(n345), .B(n122), .C(n346), .Z(n344) );
  NAND2X1 U366 ( .A(n347), .B(n348), .Z(n346) );
  NAND2X1 U367 ( .A(N261), .B(write_en), .Z(n348) );
  NAND2X1 U368 ( .A(i2c_sts[0]), .B(n2245), .Z(n347) );
  NAND2X1 U369 ( .A(i2c_addr[8]), .B(n2249), .Z(n343) );
  NAND2X1 U370 ( .A(n349), .B(n350), .Z(n2042) );
  NAND3X1 U371 ( .A(n345), .B(n122), .C(n351), .Z(n350) );
  NAND2X1 U372 ( .A(n352), .B(n353), .Z(n351) );
  NAND2X1 U373 ( .A(N263), .B(write_en), .Z(n353) );
  NAND2X1 U374 ( .A(i2c_sts[1]), .B(n2245), .Z(n352) );
  NAND2X1 U375 ( .A(reg6[9]), .B(n2249), .Z(n349) );
  NAND2X1 U376 ( .A(n322), .B(n354), .Z(n345) );
  NOR2X1 U377 ( .A(rst), .B(i2c_wr_en), .Z(n322) );
  NAND2X1 U378 ( .A(n355), .B(n356), .Z(n2043) );
  NAND2X1 U379 ( .A(reg6[10]), .B(n2248), .Z(n356) );
  NAND2X1 U380 ( .A(n257), .B(n328), .Z(n355) );
  NAND2X1 U381 ( .A(n357), .B(n358), .Z(n2044) );
  NAND2X1 U382 ( .A(reg6[11]), .B(n2248), .Z(n358) );
  NAND2X1 U383 ( .A(n260), .B(n328), .Z(n357) );
  NAND2X1 U384 ( .A(n359), .B(n360), .Z(n2045) );
  NAND2X1 U385 ( .A(reg6[12]), .B(n2248), .Z(n360) );
  NAND2X1 U386 ( .A(n263), .B(n328), .Z(n359) );
  NAND2X1 U387 ( .A(n361), .B(n362), .Z(n2046) );
  NAND2X1 U388 ( .A(reg6[13]), .B(n2248), .Z(n362) );
  NAND2X1 U389 ( .A(n266), .B(n328), .Z(n361) );
  NAND2X1 U390 ( .A(n363), .B(n364), .Z(n2047) );
  NAND2X1 U391 ( .A(reg6[14]), .B(n2248), .Z(n364) );
  NAND2X1 U392 ( .A(n269), .B(n328), .Z(n363) );
  NAND2X1 U393 ( .A(n365), .B(n366), .Z(n2048) );
  NAND2X1 U394 ( .A(reg6[15]), .B(n2248), .Z(n366) );
  NAND2X1 U395 ( .A(n272), .B(n328), .Z(n365) );
  NAND2X1 U396 ( .A(n122), .B(n354), .Z(n328) );
  NAND2X1 U397 ( .A(n367), .B(write_en), .Z(n354) );
  AND2X1 U398 ( .A(n368), .B(n325), .Z(n367) );
  NAND2X1 U399 ( .A(n369), .B(n370), .Z(n2049) );
  NAND2X1 U400 ( .A(n218), .B(n2250), .Z(n370) );
  NAND2X1 U401 ( .A(n226), .B(n371), .Z(n369) );
  NAND2X1 U402 ( .A(n372), .B(n373), .Z(n2050) );
  NAND2X1 U403 ( .A(n217), .B(n2250), .Z(n373) );
  NAND2X1 U404 ( .A(n230), .B(n371), .Z(n372) );
  NAND2X1 U405 ( .A(n374), .B(n375), .Z(n2051) );
  NAND2X1 U406 ( .A(n216), .B(n2250), .Z(n375) );
  NAND2X1 U407 ( .A(n233), .B(n371), .Z(n374) );
  NAND2X1 U408 ( .A(n376), .B(n377), .Z(n2052) );
  NAND2X1 U409 ( .A(n215), .B(n2250), .Z(n377) );
  NAND2X1 U410 ( .A(n236), .B(n371), .Z(n376) );
  NAND2X1 U411 ( .A(n378), .B(n379), .Z(n2053) );
  NAND2X1 U412 ( .A(n214), .B(n2250), .Z(n379) );
  NAND2X1 U413 ( .A(n239), .B(n371), .Z(n378) );
  NAND2X1 U414 ( .A(n380), .B(n381), .Z(n2054) );
  NAND2X1 U415 ( .A(n213), .B(n2250), .Z(n381) );
  NAND2X1 U416 ( .A(n242), .B(n371), .Z(n380) );
  NAND2X1 U417 ( .A(n382), .B(n383), .Z(n2055) );
  NAND2X1 U418 ( .A(n212), .B(n2250), .Z(n383) );
  NAND2X1 U419 ( .A(n245), .B(n371), .Z(n382) );
  NAND2X1 U420 ( .A(n384), .B(n385), .Z(n2056) );
  NAND2X1 U421 ( .A(n211), .B(n2250), .Z(n385) );
  NAND2X1 U422 ( .A(n248), .B(n371), .Z(n384) );
  NAND2X1 U423 ( .A(n386), .B(n387), .Z(n2057) );
  NAND2X1 U424 ( .A(n210), .B(n2250), .Z(n387) );
  NAND2X1 U425 ( .A(n251), .B(n371), .Z(n386) );
  NAND2X1 U426 ( .A(n388), .B(n389), .Z(n2058) );
  NAND2X1 U427 ( .A(n209), .B(n2250), .Z(n389) );
  NAND2X1 U428 ( .A(n254), .B(n371), .Z(n388) );
  NAND2X1 U429 ( .A(n390), .B(n391), .Z(n2059) );
  NAND2X1 U430 ( .A(n208), .B(n2250), .Z(n391) );
  NAND2X1 U431 ( .A(n257), .B(n371), .Z(n390) );
  NAND2X1 U432 ( .A(n392), .B(n393), .Z(n2060) );
  NAND2X1 U433 ( .A(n207), .B(n2250), .Z(n393) );
  NAND2X1 U434 ( .A(n260), .B(n371), .Z(n392) );
  NAND2X1 U435 ( .A(n394), .B(n395), .Z(n2061) );
  NAND2X1 U436 ( .A(n206), .B(n2250), .Z(n395) );
  NAND2X1 U437 ( .A(n263), .B(n371), .Z(n394) );
  NAND2X1 U438 ( .A(n396), .B(n397), .Z(n2062) );
  NAND2X1 U439 ( .A(n205), .B(n2250), .Z(n397) );
  NAND2X1 U440 ( .A(n266), .B(n371), .Z(n396) );
  NAND2X1 U441 ( .A(n398), .B(n399), .Z(n2063) );
  NAND2X1 U442 ( .A(n204), .B(n2250), .Z(n399) );
  NAND2X1 U443 ( .A(n269), .B(n371), .Z(n398) );
  NAND2X1 U444 ( .A(n400), .B(n401), .Z(n2064) );
  NAND2X1 U445 ( .A(n203), .B(n2250), .Z(n401) );
  NAND2X1 U446 ( .A(n272), .B(n371), .Z(n400) );
  NAND2X1 U447 ( .A(n122), .B(n402), .Z(n371) );
  NAND3X1 U448 ( .A(n324), .B(write_en), .C(n403), .Z(n402) );
  NAND2X1 U449 ( .A(n404), .B(n405), .Z(n2065) );
  NAND2X1 U450 ( .A(n202), .B(n2251), .Z(n405) );
  NAND2X1 U451 ( .A(n226), .B(n406), .Z(n404) );
  NAND2X1 U452 ( .A(n407), .B(n408), .Z(n2066) );
  NAND2X1 U453 ( .A(n201), .B(n2251), .Z(n408) );
  NAND2X1 U454 ( .A(n230), .B(n406), .Z(n407) );
  NAND2X1 U455 ( .A(n409), .B(n410), .Z(n2067) );
  NAND2X1 U456 ( .A(n200), .B(n2251), .Z(n410) );
  NAND2X1 U457 ( .A(n233), .B(n406), .Z(n409) );
  NAND2X1 U458 ( .A(n411), .B(n412), .Z(n2068) );
  NAND2X1 U459 ( .A(n199), .B(n2251), .Z(n412) );
  NAND2X1 U460 ( .A(n236), .B(n406), .Z(n411) );
  NAND2X1 U461 ( .A(n413), .B(n414), .Z(n2069) );
  NAND2X1 U462 ( .A(n198), .B(n2251), .Z(n414) );
  NAND2X1 U463 ( .A(n239), .B(n406), .Z(n413) );
  NAND2X1 U464 ( .A(n415), .B(n416), .Z(n2070) );
  NAND2X1 U465 ( .A(n197), .B(n2251), .Z(n416) );
  NAND2X1 U466 ( .A(n242), .B(n406), .Z(n415) );
  NAND2X1 U467 ( .A(n417), .B(n418), .Z(n2071) );
  NAND2X1 U468 ( .A(n196), .B(n2251), .Z(n418) );
  NAND2X1 U469 ( .A(n245), .B(n406), .Z(n417) );
  NAND2X1 U470 ( .A(n419), .B(n420), .Z(n2072) );
  NAND2X1 U471 ( .A(n195), .B(n2251), .Z(n420) );
  NAND2X1 U472 ( .A(n248), .B(n406), .Z(n419) );
  NAND2X1 U473 ( .A(n421), .B(n422), .Z(n2073) );
  NAND2X1 U474 ( .A(n194), .B(n2251), .Z(n422) );
  NAND2X1 U475 ( .A(n251), .B(n406), .Z(n421) );
  NAND2X1 U476 ( .A(n423), .B(n424), .Z(n2074) );
  NAND2X1 U477 ( .A(n193), .B(n2251), .Z(n424) );
  NAND2X1 U478 ( .A(n254), .B(n406), .Z(n423) );
  NAND2X1 U479 ( .A(n425), .B(n426), .Z(n2075) );
  NAND2X1 U480 ( .A(n192), .B(n2251), .Z(n426) );
  NAND2X1 U481 ( .A(n257), .B(n406), .Z(n425) );
  NAND2X1 U482 ( .A(n427), .B(n428), .Z(n2076) );
  NAND2X1 U483 ( .A(n191), .B(n2251), .Z(n428) );
  NAND2X1 U484 ( .A(n260), .B(n406), .Z(n427) );
  NAND2X1 U485 ( .A(n429), .B(n430), .Z(n2077) );
  NAND2X1 U486 ( .A(n190), .B(n2251), .Z(n430) );
  NAND2X1 U487 ( .A(n263), .B(n406), .Z(n429) );
  NAND2X1 U488 ( .A(n431), .B(n432), .Z(n2078) );
  NAND2X1 U489 ( .A(n189), .B(n2251), .Z(n432) );
  NAND2X1 U490 ( .A(n266), .B(n406), .Z(n431) );
  NAND2X1 U491 ( .A(n433), .B(n434), .Z(n2079) );
  NAND2X1 U492 ( .A(n188), .B(n2251), .Z(n434) );
  NAND2X1 U493 ( .A(n269), .B(n406), .Z(n433) );
  NAND2X1 U494 ( .A(n435), .B(n436), .Z(n2080) );
  NAND2X1 U495 ( .A(n187), .B(n2251), .Z(n436) );
  NAND2X1 U496 ( .A(n272), .B(n406), .Z(n435) );
  NAND2X1 U497 ( .A(n122), .B(n437), .Z(n406) );
  NAND3X1 U498 ( .A(n368), .B(write_en), .C(n403), .Z(n437) );
  NAND2X1 U499 ( .A(n438), .B(n439), .Z(n2081) );
  NAND2X1 U500 ( .A(reg3[0]), .B(n2252), .Z(n439) );
  NAND2X1 U501 ( .A(n226), .B(n440), .Z(n438) );
  NAND2X1 U502 ( .A(n441), .B(n442), .Z(n2082) );
  NAND2X1 U503 ( .A(reg3[1]), .B(n2252), .Z(n442) );
  NAND2X1 U504 ( .A(n230), .B(n440), .Z(n441) );
  NAND2X1 U505 ( .A(n443), .B(n444), .Z(n2083) );
  NAND2X1 U506 ( .A(reg3[2]), .B(n2252), .Z(n444) );
  NAND2X1 U507 ( .A(n233), .B(n440), .Z(n443) );
  NAND2X1 U508 ( .A(n445), .B(n446), .Z(n2084) );
  NAND2X1 U509 ( .A(reg3[3]), .B(n2252), .Z(n446) );
  NAND2X1 U510 ( .A(n236), .B(n440), .Z(n445) );
  NAND2X1 U511 ( .A(n447), .B(n448), .Z(n2085) );
  NAND2X1 U512 ( .A(reg3[4]), .B(n2252), .Z(n448) );
  NAND2X1 U513 ( .A(n239), .B(n440), .Z(n447) );
  NAND2X1 U514 ( .A(n449), .B(n450), .Z(n2086) );
  NAND2X1 U515 ( .A(reg3[5]), .B(n2252), .Z(n450) );
  NAND2X1 U516 ( .A(n242), .B(n440), .Z(n449) );
  NAND2X1 U517 ( .A(n451), .B(n452), .Z(n2087) );
  NAND2X1 U518 ( .A(reg3[6]), .B(n2252), .Z(n452) );
  NAND2X1 U519 ( .A(n245), .B(n440), .Z(n451) );
  NAND2X1 U520 ( .A(n453), .B(n454), .Z(n2088) );
  NAND2X1 U521 ( .A(reg3[7]), .B(n2252), .Z(n454) );
  NAND2X1 U522 ( .A(n248), .B(n440), .Z(n453) );
  NAND2X1 U523 ( .A(n455), .B(n456), .Z(n2089) );
  NAND2X1 U524 ( .A(reg3[8]), .B(n2252), .Z(n456) );
  NAND2X1 U525 ( .A(n251), .B(n440), .Z(n455) );
  NAND2X1 U526 ( .A(n457), .B(n458), .Z(n2090) );
  NAND2X1 U527 ( .A(reg3[9]), .B(n2252), .Z(n458) );
  NAND2X1 U528 ( .A(n254), .B(n440), .Z(n457) );
  NAND2X1 U529 ( .A(n459), .B(n460), .Z(n2091) );
  NAND2X1 U530 ( .A(reg3[10]), .B(n2252), .Z(n460) );
  NAND2X1 U531 ( .A(n257), .B(n440), .Z(n459) );
  NAND2X1 U532 ( .A(n461), .B(n462), .Z(n2092) );
  NAND2X1 U533 ( .A(reg3[11]), .B(n2252), .Z(n462) );
  NAND2X1 U534 ( .A(n260), .B(n440), .Z(n461) );
  NAND2X1 U535 ( .A(n463), .B(n464), .Z(n2093) );
  NAND2X1 U536 ( .A(reg3[12]), .B(n2252), .Z(n464) );
  NAND2X1 U537 ( .A(n263), .B(n440), .Z(n463) );
  NAND2X1 U538 ( .A(n465), .B(n466), .Z(n2094) );
  NAND2X1 U539 ( .A(reg3[13]), .B(n2252), .Z(n466) );
  NAND2X1 U540 ( .A(n266), .B(n440), .Z(n465) );
  NAND2X1 U541 ( .A(n467), .B(n468), .Z(n2095) );
  NAND2X1 U542 ( .A(reg3[14]), .B(n2252), .Z(n468) );
  NAND2X1 U543 ( .A(n269), .B(n440), .Z(n467) );
  NAND2X1 U544 ( .A(n469), .B(n470), .Z(n2096) );
  NAND2X1 U545 ( .A(reg3[15]), .B(n2252), .Z(n470) );
  NAND2X1 U546 ( .A(n272), .B(n440), .Z(n469) );
  NAND2X1 U547 ( .A(n122), .B(n471), .Z(n440) );
  NAND3X1 U548 ( .A(n324), .B(write_en), .C(n472), .Z(n471) );
  NAND2X1 U549 ( .A(n473), .B(n474), .Z(n2097) );
  NAND2X1 U550 ( .A(reg2[0]), .B(n2253), .Z(n474) );
  NAND2X1 U551 ( .A(n226), .B(n475), .Z(n473) );
  NAND2X1 U552 ( .A(n476), .B(n477), .Z(n2098) );
  NAND2X1 U553 ( .A(reg2[1]), .B(n2253), .Z(n477) );
  NAND2X1 U554 ( .A(n230), .B(n475), .Z(n476) );
  NAND2X1 U555 ( .A(n478), .B(n479), .Z(n2099) );
  NAND2X1 U556 ( .A(reg2[2]), .B(n2253), .Z(n479) );
  NAND2X1 U557 ( .A(n233), .B(n475), .Z(n478) );
  NAND2X1 U558 ( .A(n480), .B(n481), .Z(n2100) );
  NAND2X1 U559 ( .A(reg2[3]), .B(n2253), .Z(n481) );
  NAND2X1 U560 ( .A(n236), .B(n475), .Z(n480) );
  NAND2X1 U561 ( .A(n482), .B(n483), .Z(n2101) );
  NAND2X1 U562 ( .A(reg2[4]), .B(n2253), .Z(n483) );
  NAND2X1 U563 ( .A(n239), .B(n475), .Z(n482) );
  NAND2X1 U564 ( .A(n484), .B(n485), .Z(n2102) );
  NAND2X1 U565 ( .A(reg2[5]), .B(n2253), .Z(n485) );
  NAND2X1 U566 ( .A(n242), .B(n475), .Z(n484) );
  NAND2X1 U567 ( .A(n486), .B(n487), .Z(n2103) );
  NAND2X1 U568 ( .A(reg2[6]), .B(n2253), .Z(n487) );
  NAND2X1 U569 ( .A(n245), .B(n475), .Z(n486) );
  NAND2X1 U570 ( .A(n488), .B(n489), .Z(n2104) );
  NAND2X1 U571 ( .A(reg2[7]), .B(n2253), .Z(n489) );
  NAND2X1 U572 ( .A(n248), .B(n475), .Z(n488) );
  NAND2X1 U573 ( .A(n490), .B(n491), .Z(n2105) );
  NAND2X1 U574 ( .A(reg2[8]), .B(n2253), .Z(n491) );
  NAND2X1 U575 ( .A(n251), .B(n475), .Z(n490) );
  NAND2X1 U576 ( .A(n492), .B(n493), .Z(n2106) );
  NAND2X1 U577 ( .A(reg2[9]), .B(n2253), .Z(n493) );
  NAND2X1 U578 ( .A(n254), .B(n475), .Z(n492) );
  NAND2X1 U579 ( .A(n494), .B(n495), .Z(n2107) );
  NAND2X1 U580 ( .A(reg2[10]), .B(n2253), .Z(n495) );
  NAND2X1 U581 ( .A(n257), .B(n475), .Z(n494) );
  NAND2X1 U582 ( .A(n496), .B(n497), .Z(n2108) );
  NAND2X1 U583 ( .A(reg2[11]), .B(n2253), .Z(n497) );
  NAND2X1 U584 ( .A(n260), .B(n475), .Z(n496) );
  NAND2X1 U585 ( .A(n498), .B(n499), .Z(n2109) );
  NAND2X1 U586 ( .A(reg2[12]), .B(n2253), .Z(n499) );
  NAND2X1 U587 ( .A(n263), .B(n475), .Z(n498) );
  NAND2X1 U588 ( .A(n500), .B(n501), .Z(n2110) );
  NAND2X1 U589 ( .A(reg2[13]), .B(n2253), .Z(n501) );
  NAND2X1 U590 ( .A(n266), .B(n475), .Z(n500) );
  NAND2X1 U591 ( .A(n502), .B(n503), .Z(n2111) );
  NAND2X1 U592 ( .A(reg2[14]), .B(n2253), .Z(n503) );
  NAND2X1 U593 ( .A(n269), .B(n475), .Z(n502) );
  NAND2X1 U594 ( .A(n504), .B(n505), .Z(n2112) );
  NAND2X1 U595 ( .A(reg2[15]), .B(n2253), .Z(n505) );
  NAND2X1 U596 ( .A(n272), .B(n475), .Z(n504) );
  NAND2X1 U597 ( .A(n122), .B(n506), .Z(n475) );
  NAND3X1 U598 ( .A(n368), .B(write_en), .C(n472), .Z(n506) );
  NOR2X1 U599 ( .A(wrData[3]), .B(wrData[0]), .Z(n368) );
  NAND2X1 U600 ( .A(n507), .B(n508), .Z(n2113) );
  NAND2X1 U601 ( .A(reg1[0]), .B(n2254), .Z(n508) );
  NAND2X1 U602 ( .A(n226), .B(n509), .Z(n507) );
  NAND2X1 U603 ( .A(n510), .B(n511), .Z(n2114) );
  NAND2X1 U604 ( .A(reg1[1]), .B(n2254), .Z(n511) );
  NAND2X1 U605 ( .A(n230), .B(n509), .Z(n510) );
  NAND2X1 U606 ( .A(n512), .B(n513), .Z(n2115) );
  NAND2X1 U607 ( .A(reg1[2]), .B(n2254), .Z(n513) );
  NAND2X1 U608 ( .A(n233), .B(n509), .Z(n512) );
  NAND2X1 U609 ( .A(n514), .B(n515), .Z(n2116) );
  NAND2X1 U610 ( .A(reg1[3]), .B(n2254), .Z(n515) );
  NAND2X1 U611 ( .A(n236), .B(n509), .Z(n514) );
  NAND2X1 U612 ( .A(n516), .B(n517), .Z(n2117) );
  NAND2X1 U613 ( .A(reg1[4]), .B(n2254), .Z(n517) );
  NAND2X1 U614 ( .A(n239), .B(n509), .Z(n516) );
  NAND2X1 U615 ( .A(n518), .B(n519), .Z(n2118) );
  NAND2X1 U616 ( .A(reg1[5]), .B(n2254), .Z(n519) );
  NAND2X1 U617 ( .A(n242), .B(n509), .Z(n518) );
  NAND2X1 U618 ( .A(n520), .B(n521), .Z(n2119) );
  NAND2X1 U619 ( .A(reg1[6]), .B(n2254), .Z(n521) );
  NAND2X1 U620 ( .A(n245), .B(n509), .Z(n520) );
  NAND2X1 U621 ( .A(n522), .B(n523), .Z(n2120) );
  NAND2X1 U622 ( .A(reg1[7]), .B(n2254), .Z(n523) );
  NAND2X1 U623 ( .A(n248), .B(n509), .Z(n522) );
  NAND2X1 U624 ( .A(n524), .B(n525), .Z(n2121) );
  NAND2X1 U625 ( .A(reg1[8]), .B(n2254), .Z(n525) );
  NAND2X1 U626 ( .A(n251), .B(n509), .Z(n524) );
  NAND2X1 U627 ( .A(n526), .B(n527), .Z(n2122) );
  NAND2X1 U628 ( .A(reg1[9]), .B(n2254), .Z(n527) );
  NAND2X1 U629 ( .A(n254), .B(n509), .Z(n526) );
  NAND2X1 U630 ( .A(n528), .B(n529), .Z(n2123) );
  NAND2X1 U631 ( .A(reg1[10]), .B(n2254), .Z(n529) );
  NAND2X1 U632 ( .A(n257), .B(n509), .Z(n528) );
  NAND2X1 U633 ( .A(n530), .B(n531), .Z(n2124) );
  NAND2X1 U634 ( .A(reg1[11]), .B(n2254), .Z(n531) );
  NAND2X1 U635 ( .A(n260), .B(n509), .Z(n530) );
  NAND2X1 U636 ( .A(n532), .B(n533), .Z(n2125) );
  NAND2X1 U637 ( .A(reg1[12]), .B(n2254), .Z(n533) );
  NAND2X1 U638 ( .A(n263), .B(n509), .Z(n532) );
  NAND2X1 U639 ( .A(n534), .B(n535), .Z(n2126) );
  NAND2X1 U640 ( .A(reg1[13]), .B(n2254), .Z(n535) );
  NAND2X1 U641 ( .A(n266), .B(n509), .Z(n534) );
  NAND2X1 U642 ( .A(n536), .B(n537), .Z(n2127) );
  NAND2X1 U643 ( .A(reg1[14]), .B(n2254), .Z(n537) );
  NAND2X1 U644 ( .A(n269), .B(n509), .Z(n536) );
  NAND2X1 U645 ( .A(n538), .B(n539), .Z(n2128) );
  NAND2X1 U646 ( .A(reg1[15]), .B(n2254), .Z(n539) );
  NAND2X1 U647 ( .A(n272), .B(n509), .Z(n538) );
  NAND2X1 U648 ( .A(n122), .B(n540), .Z(n509) );
  NAND3X1 U649 ( .A(write_en), .B(n275), .C(n324), .Z(n540) );
  NOR2X1 U650 ( .A(n2262), .B(wrData[3]), .Z(n324) );
  NAND2X1 U651 ( .A(n541), .B(n542), .Z(n2129) );
  NAND2X1 U652 ( .A(pwm_reg7[0]), .B(n2255), .Z(n542) );
  NAND2X1 U653 ( .A(n226), .B(n543), .Z(n541) );
  NAND2X1 U654 ( .A(n544), .B(n545), .Z(n2130) );
  NAND2X1 U655 ( .A(pwm_reg7[1]), .B(n2255), .Z(n545) );
  NAND2X1 U656 ( .A(n230), .B(n543), .Z(n544) );
  NAND2X1 U657 ( .A(n546), .B(n547), .Z(n2131) );
  NAND2X1 U658 ( .A(pwm_reg7[2]), .B(n2255), .Z(n547) );
  NAND2X1 U659 ( .A(n233), .B(n543), .Z(n546) );
  NAND2X1 U660 ( .A(n548), .B(n549), .Z(n2132) );
  NAND2X1 U661 ( .A(pwm_reg7[3]), .B(n2255), .Z(n549) );
  NAND2X1 U662 ( .A(n236), .B(n543), .Z(n548) );
  NAND2X1 U663 ( .A(n550), .B(n551), .Z(n2133) );
  NAND2X1 U664 ( .A(pwm_reg7[4]), .B(n2255), .Z(n551) );
  NAND2X1 U665 ( .A(n239), .B(n543), .Z(n550) );
  NAND2X1 U666 ( .A(n552), .B(n553), .Z(n2134) );
  NAND2X1 U667 ( .A(pwm_reg7[5]), .B(n2255), .Z(n553) );
  NAND2X1 U668 ( .A(n242), .B(n543), .Z(n552) );
  NAND2X1 U669 ( .A(n554), .B(n555), .Z(n2135) );
  NAND2X1 U670 ( .A(pwm_reg7[6]), .B(n2255), .Z(n555) );
  NAND2X1 U671 ( .A(n245), .B(n543), .Z(n554) );
  NAND2X1 U672 ( .A(n556), .B(n557), .Z(n2136) );
  NAND2X1 U673 ( .A(pwm_reg7[7]), .B(n2255), .Z(n557) );
  NAND2X1 U674 ( .A(n248), .B(n543), .Z(n556) );
  NAND2X1 U675 ( .A(n558), .B(n559), .Z(n2137) );
  NAND2X1 U676 ( .A(pwm_reg7[8]), .B(n2255), .Z(n559) );
  NAND2X1 U677 ( .A(n251), .B(n543), .Z(n558) );
  NAND2X1 U678 ( .A(n560), .B(n561), .Z(n2138) );
  NAND2X1 U679 ( .A(pwm_reg7[9]), .B(n2255), .Z(n561) );
  NAND2X1 U680 ( .A(n254), .B(n543), .Z(n560) );
  NAND2X1 U681 ( .A(n562), .B(n563), .Z(n2139) );
  NAND2X1 U682 ( .A(pwm_reg7[10]), .B(n2255), .Z(n563) );
  NAND2X1 U683 ( .A(n257), .B(n543), .Z(n562) );
  NAND2X1 U684 ( .A(n564), .B(n565), .Z(n2140) );
  NAND2X1 U685 ( .A(pwm_reg7[11]), .B(n2255), .Z(n565) );
  NAND2X1 U686 ( .A(n260), .B(n543), .Z(n564) );
  NAND2X1 U687 ( .A(n566), .B(n567), .Z(n2141) );
  NAND2X1 U688 ( .A(pwm_reg7[12]), .B(n2255), .Z(n567) );
  NAND2X1 U689 ( .A(n263), .B(n543), .Z(n566) );
  NAND2X1 U690 ( .A(n568), .B(n569), .Z(n2142) );
  NAND2X1 U691 ( .A(pwm_reg7[13]), .B(n2255), .Z(n569) );
  NAND2X1 U692 ( .A(n266), .B(n543), .Z(n568) );
  NAND2X1 U693 ( .A(n570), .B(n571), .Z(n2143) );
  NAND2X1 U694 ( .A(pwm_reg7[14]), .B(n2255), .Z(n571) );
  NAND2X1 U695 ( .A(n269), .B(n543), .Z(n570) );
  NAND2X1 U696 ( .A(n572), .B(n573), .Z(n2144) );
  NAND2X1 U697 ( .A(pwm_reg7[15]), .B(n2255), .Z(n573) );
  NAND2X1 U698 ( .A(n272), .B(n543), .Z(n572) );
  NAND2X1 U699 ( .A(n122), .B(n574), .Z(n543) );
  NAND3X1 U700 ( .A(n325), .B(write_en), .C(n575), .Z(n574) );
  NAND2X1 U701 ( .A(n576), .B(n577), .Z(n2145) );
  NAND2X1 U702 ( .A(pwm_reg2[0]), .B(n2256), .Z(n577) );
  NAND2X1 U703 ( .A(n226), .B(n578), .Z(n576) );
  NAND2X1 U704 ( .A(n579), .B(n580), .Z(n2146) );
  NAND2X1 U705 ( .A(pwm_reg2[1]), .B(n2256), .Z(n580) );
  NAND2X1 U706 ( .A(n230), .B(n578), .Z(n579) );
  NAND2X1 U707 ( .A(n581), .B(n582), .Z(n2147) );
  NAND2X1 U708 ( .A(pwm_reg2[2]), .B(n2256), .Z(n582) );
  NAND2X1 U709 ( .A(n233), .B(n578), .Z(n581) );
  NAND2X1 U710 ( .A(n583), .B(n584), .Z(n2148) );
  NAND2X1 U711 ( .A(pwm_reg2[3]), .B(n2256), .Z(n584) );
  NAND2X1 U712 ( .A(n236), .B(n578), .Z(n583) );
  NAND2X1 U713 ( .A(n585), .B(n586), .Z(n2149) );
  NAND2X1 U714 ( .A(pwm_reg2[4]), .B(n2256), .Z(n586) );
  NAND2X1 U715 ( .A(n239), .B(n578), .Z(n585) );
  NAND2X1 U716 ( .A(n587), .B(n588), .Z(n2150) );
  NAND2X1 U717 ( .A(pwm_reg2[5]), .B(n2256), .Z(n588) );
  NAND2X1 U718 ( .A(n242), .B(n578), .Z(n587) );
  NAND2X1 U719 ( .A(n589), .B(n590), .Z(n2151) );
  NAND2X1 U720 ( .A(pwm_reg2[6]), .B(n2256), .Z(n590) );
  NAND2X1 U721 ( .A(n245), .B(n578), .Z(n589) );
  NAND2X1 U722 ( .A(n591), .B(n592), .Z(n2152) );
  NAND2X1 U723 ( .A(pwm_reg2[7]), .B(n2256), .Z(n592) );
  NAND2X1 U724 ( .A(n248), .B(n578), .Z(n591) );
  NAND2X1 U725 ( .A(n593), .B(n594), .Z(n2153) );
  NAND2X1 U726 ( .A(pwm_reg2[8]), .B(n2256), .Z(n594) );
  NAND2X1 U727 ( .A(n251), .B(n578), .Z(n593) );
  NAND2X1 U728 ( .A(n595), .B(n596), .Z(n2154) );
  NAND2X1 U729 ( .A(pwm_reg2[9]), .B(n2256), .Z(n596) );
  NAND2X1 U730 ( .A(n254), .B(n578), .Z(n595) );
  NAND2X1 U731 ( .A(n597), .B(n598), .Z(n2155) );
  NAND2X1 U732 ( .A(pwm_reg2[10]), .B(n2256), .Z(n598) );
  NAND2X1 U733 ( .A(n257), .B(n578), .Z(n597) );
  NAND2X1 U734 ( .A(n599), .B(n600), .Z(n2156) );
  NAND2X1 U735 ( .A(pwm_reg2[11]), .B(n2256), .Z(n600) );
  NAND2X1 U736 ( .A(n260), .B(n578), .Z(n599) );
  NAND2X1 U737 ( .A(n601), .B(n602), .Z(n2157) );
  NAND2X1 U738 ( .A(pwm_reg2[12]), .B(n2256), .Z(n602) );
  NAND2X1 U739 ( .A(n263), .B(n578), .Z(n601) );
  NAND2X1 U740 ( .A(n603), .B(n604), .Z(n2158) );
  NAND2X1 U741 ( .A(pwm_reg2[13]), .B(n2256), .Z(n604) );
  NAND2X1 U742 ( .A(n266), .B(n578), .Z(n603) );
  NAND2X1 U743 ( .A(n605), .B(n606), .Z(n2159) );
  NAND2X1 U744 ( .A(pwm_reg2[14]), .B(n2256), .Z(n606) );
  NAND2X1 U745 ( .A(n269), .B(n578), .Z(n605) );
  NAND2X1 U746 ( .A(n607), .B(n608), .Z(n2160) );
  NAND2X1 U747 ( .A(pwm_reg2[15]), .B(n2256), .Z(n608) );
  NAND2X1 U748 ( .A(n272), .B(n578), .Z(n607) );
  NAND2X1 U749 ( .A(n122), .B(n609), .Z(n578) );
  NAND3X1 U750 ( .A(write_en), .B(n274), .C(n472), .Z(n609) );
  NAND2X1 U751 ( .A(n610), .B(n611), .Z(n2161) );
  NAND2X1 U752 ( .A(pwm_reg5[0]), .B(n2257), .Z(n611) );
  NAND2X1 U753 ( .A(n226), .B(n612), .Z(n610) );
  NAND2X1 U754 ( .A(n613), .B(n614), .Z(n2162) );
  NAND2X1 U755 ( .A(pwm_reg5[1]), .B(n2257), .Z(n614) );
  NAND2X1 U756 ( .A(n230), .B(n612), .Z(n613) );
  NAND2X1 U757 ( .A(n615), .B(n616), .Z(n2163) );
  NAND2X1 U758 ( .A(pwm_reg5[2]), .B(n2257), .Z(n616) );
  NAND2X1 U759 ( .A(n233), .B(n612), .Z(n615) );
  NAND2X1 U760 ( .A(n617), .B(n618), .Z(n2164) );
  NAND2X1 U761 ( .A(pwm_reg5[3]), .B(n2257), .Z(n618) );
  NAND2X1 U762 ( .A(n236), .B(n612), .Z(n617) );
  NAND2X1 U763 ( .A(n619), .B(n620), .Z(n2165) );
  NAND2X1 U764 ( .A(pwm_reg5[4]), .B(n2257), .Z(n620) );
  NAND2X1 U765 ( .A(n239), .B(n612), .Z(n619) );
  NAND2X1 U766 ( .A(n621), .B(n622), .Z(n2166) );
  NAND2X1 U767 ( .A(pwm_reg5[5]), .B(n2257), .Z(n622) );
  NAND2X1 U768 ( .A(n242), .B(n612), .Z(n621) );
  NAND2X1 U769 ( .A(n623), .B(n624), .Z(n2167) );
  NAND2X1 U770 ( .A(pwm_reg5[6]), .B(n2257), .Z(n624) );
  NAND2X1 U771 ( .A(n245), .B(n612), .Z(n623) );
  NAND2X1 U772 ( .A(n625), .B(n626), .Z(n2168) );
  NAND2X1 U773 ( .A(pwm_reg5[7]), .B(n2257), .Z(n626) );
  NAND2X1 U774 ( .A(n248), .B(n612), .Z(n625) );
  NAND2X1 U775 ( .A(n627), .B(n628), .Z(n2169) );
  NAND2X1 U776 ( .A(pwm_reg5[8]), .B(n2257), .Z(n628) );
  NAND2X1 U777 ( .A(n251), .B(n612), .Z(n627) );
  NAND2X1 U778 ( .A(n629), .B(n630), .Z(n2170) );
  NAND2X1 U779 ( .A(pwm_reg5[9]), .B(n2257), .Z(n630) );
  NAND2X1 U780 ( .A(n254), .B(n612), .Z(n629) );
  NAND2X1 U781 ( .A(n631), .B(n632), .Z(n2171) );
  NAND2X1 U782 ( .A(pwm_reg5[10]), .B(n2257), .Z(n632) );
  NAND2X1 U783 ( .A(n257), .B(n612), .Z(n631) );
  NAND2X1 U784 ( .A(n633), .B(n634), .Z(n2172) );
  NAND2X1 U785 ( .A(pwm_reg5[11]), .B(n2257), .Z(n634) );
  NAND2X1 U786 ( .A(n260), .B(n612), .Z(n633) );
  NAND2X1 U787 ( .A(n635), .B(n636), .Z(n2173) );
  NAND2X1 U788 ( .A(pwm_reg5[12]), .B(n2257), .Z(n636) );
  NAND2X1 U789 ( .A(n263), .B(n612), .Z(n635) );
  NAND2X1 U790 ( .A(n637), .B(n638), .Z(n2174) );
  NAND2X1 U791 ( .A(pwm_reg5[13]), .B(n2257), .Z(n638) );
  NAND2X1 U792 ( .A(n266), .B(n612), .Z(n637) );
  NAND2X1 U793 ( .A(n639), .B(n640), .Z(n2175) );
  NAND2X1 U794 ( .A(pwm_reg5[14]), .B(n2257), .Z(n640) );
  NAND2X1 U795 ( .A(n269), .B(n612), .Z(n639) );
  NAND2X1 U796 ( .A(n641), .B(n642), .Z(n2176) );
  NAND2X1 U797 ( .A(pwm_reg5[15]), .B(n2257), .Z(n642) );
  NAND2X1 U798 ( .A(n272), .B(n612), .Z(n641) );
  NAND2X1 U799 ( .A(n122), .B(n643), .Z(n612) );
  NAND3X1 U800 ( .A(n403), .B(write_en), .C(n575), .Z(n643) );
  NAND2X1 U801 ( .A(n644), .B(n645), .Z(n2177) );
  NAND2X1 U802 ( .A(pwm_reg4[0]), .B(n2258), .Z(n645) );
  NAND2X1 U803 ( .A(n226), .B(n646), .Z(n644) );
  NAND2X1 U804 ( .A(n647), .B(n648), .Z(n2178) );
  NAND2X1 U805 ( .A(pwm_reg4[1]), .B(n2258), .Z(n648) );
  NAND2X1 U806 ( .A(n230), .B(n646), .Z(n647) );
  NAND2X1 U807 ( .A(n649), .B(n650), .Z(n2179) );
  NAND2X1 U808 ( .A(pwm_reg4[2]), .B(n2258), .Z(n650) );
  NAND2X1 U809 ( .A(n233), .B(n646), .Z(n649) );
  NAND2X1 U810 ( .A(n651), .B(n652), .Z(n2180) );
  NAND2X1 U811 ( .A(pwm_reg4[3]), .B(n2258), .Z(n652) );
  NAND2X1 U812 ( .A(n236), .B(n646), .Z(n651) );
  NAND2X1 U813 ( .A(n653), .B(n654), .Z(n2181) );
  NAND2X1 U814 ( .A(pwm_reg4[4]), .B(n2258), .Z(n654) );
  NAND2X1 U815 ( .A(n239), .B(n646), .Z(n653) );
  NAND2X1 U816 ( .A(n655), .B(n656), .Z(n2182) );
  NAND2X1 U817 ( .A(pwm_reg4[5]), .B(n2258), .Z(n656) );
  NAND2X1 U818 ( .A(n242), .B(n646), .Z(n655) );
  NAND2X1 U819 ( .A(n657), .B(n658), .Z(n2183) );
  NAND2X1 U820 ( .A(pwm_reg4[6]), .B(n2258), .Z(n658) );
  NAND2X1 U821 ( .A(n245), .B(n646), .Z(n657) );
  NAND2X1 U822 ( .A(n659), .B(n660), .Z(n2184) );
  NAND2X1 U823 ( .A(pwm_reg4[7]), .B(n2258), .Z(n660) );
  NAND2X1 U824 ( .A(n248), .B(n646), .Z(n659) );
  NAND2X1 U825 ( .A(n661), .B(n662), .Z(n2185) );
  NAND2X1 U826 ( .A(pwm_reg4[8]), .B(n2258), .Z(n662) );
  NAND2X1 U827 ( .A(n251), .B(n646), .Z(n661) );
  NAND2X1 U828 ( .A(n663), .B(n664), .Z(n2186) );
  NAND2X1 U829 ( .A(pwm_reg4[9]), .B(n2258), .Z(n664) );
  NAND2X1 U830 ( .A(n254), .B(n646), .Z(n663) );
  NAND2X1 U831 ( .A(n665), .B(n666), .Z(n2187) );
  NAND2X1 U832 ( .A(pwm_reg4[10]), .B(n2258), .Z(n666) );
  NAND2X1 U833 ( .A(n257), .B(n646), .Z(n665) );
  NAND2X1 U834 ( .A(n667), .B(n668), .Z(n2188) );
  NAND2X1 U835 ( .A(pwm_reg4[11]), .B(n2258), .Z(n668) );
  NAND2X1 U836 ( .A(n260), .B(n646), .Z(n667) );
  NAND2X1 U837 ( .A(n669), .B(n670), .Z(n2189) );
  NAND2X1 U838 ( .A(pwm_reg4[12]), .B(n2258), .Z(n670) );
  NAND2X1 U839 ( .A(n263), .B(n646), .Z(n669) );
  NAND2X1 U840 ( .A(n671), .B(n672), .Z(n2190) );
  NAND2X1 U841 ( .A(pwm_reg4[13]), .B(n2258), .Z(n672) );
  NAND2X1 U842 ( .A(n266), .B(n646), .Z(n671) );
  NAND2X1 U843 ( .A(n673), .B(n674), .Z(n2191) );
  NAND2X1 U844 ( .A(pwm_reg4[14]), .B(n2258), .Z(n674) );
  NAND2X1 U845 ( .A(n269), .B(n646), .Z(n673) );
  NAND2X1 U846 ( .A(n675), .B(n676), .Z(n2192) );
  NAND2X1 U847 ( .A(pwm_reg4[15]), .B(n2258), .Z(n676) );
  NAND2X1 U848 ( .A(n272), .B(n646), .Z(n675) );
  NAND2X1 U849 ( .A(n122), .B(n677), .Z(n646) );
  NAND3X1 U850 ( .A(write_en), .B(n274), .C(n403), .Z(n677) );
  NOR2X1 U851 ( .A(n2264), .B(wrData[1]), .Z(n403) );
  NAND2X1 U852 ( .A(n678), .B(n679), .Z(n2193) );
  NAND2X1 U853 ( .A(pwm_reg3[0]), .B(n2259), .Z(n679) );
  NAND2X1 U854 ( .A(n226), .B(n680), .Z(n678) );
  NAND2X1 U855 ( .A(n681), .B(n682), .Z(n2194) );
  NAND2X1 U856 ( .A(pwm_reg3[1]), .B(n2259), .Z(n682) );
  NAND2X1 U857 ( .A(n230), .B(n680), .Z(n681) );
  NAND2X1 U858 ( .A(n683), .B(n684), .Z(n2195) );
  NAND2X1 U859 ( .A(pwm_reg3[2]), .B(n2259), .Z(n684) );
  NAND2X1 U860 ( .A(n233), .B(n680), .Z(n683) );
  NAND2X1 U861 ( .A(n685), .B(n686), .Z(n2196) );
  NAND2X1 U862 ( .A(pwm_reg3[3]), .B(n2259), .Z(n686) );
  NAND2X1 U863 ( .A(n236), .B(n680), .Z(n685) );
  NAND2X1 U864 ( .A(n687), .B(n688), .Z(n2197) );
  NAND2X1 U865 ( .A(pwm_reg3[4]), .B(n2259), .Z(n688) );
  NAND2X1 U866 ( .A(n239), .B(n680), .Z(n687) );
  NAND2X1 U867 ( .A(n689), .B(n690), .Z(n2198) );
  NAND2X1 U868 ( .A(pwm_reg3[5]), .B(n2259), .Z(n690) );
  NAND2X1 U869 ( .A(n242), .B(n680), .Z(n689) );
  NAND2X1 U870 ( .A(n691), .B(n692), .Z(n2199) );
  NAND2X1 U871 ( .A(pwm_reg3[6]), .B(n2259), .Z(n692) );
  NAND2X1 U872 ( .A(n245), .B(n680), .Z(n691) );
  NAND2X1 U873 ( .A(n693), .B(n694), .Z(n2200) );
  NAND2X1 U874 ( .A(pwm_reg3[7]), .B(n2259), .Z(n694) );
  NAND2X1 U875 ( .A(n248), .B(n680), .Z(n693) );
  NAND2X1 U876 ( .A(n695), .B(n696), .Z(n2201) );
  NAND2X1 U877 ( .A(pwm_reg3[8]), .B(n2259), .Z(n696) );
  NAND2X1 U878 ( .A(n251), .B(n680), .Z(n695) );
  NAND2X1 U879 ( .A(n697), .B(n698), .Z(n2202) );
  NAND2X1 U880 ( .A(pwm_reg3[9]), .B(n2259), .Z(n698) );
  NAND2X1 U881 ( .A(n254), .B(n680), .Z(n697) );
  NAND2X1 U882 ( .A(n699), .B(n700), .Z(n2203) );
  NAND2X1 U883 ( .A(pwm_reg3[10]), .B(n2259), .Z(n700) );
  NAND2X1 U884 ( .A(n257), .B(n680), .Z(n699) );
  NAND2X1 U885 ( .A(n701), .B(n702), .Z(n2204) );
  NAND2X1 U886 ( .A(pwm_reg3[11]), .B(n2259), .Z(n702) );
  NAND2X1 U887 ( .A(n260), .B(n680), .Z(n701) );
  NAND2X1 U888 ( .A(n703), .B(n704), .Z(n2205) );
  NAND2X1 U889 ( .A(pwm_reg3[12]), .B(n2259), .Z(n704) );
  NAND2X1 U890 ( .A(n263), .B(n680), .Z(n703) );
  NAND2X1 U891 ( .A(n705), .B(n706), .Z(n2206) );
  NAND2X1 U892 ( .A(pwm_reg3[13]), .B(n2259), .Z(n706) );
  NAND2X1 U893 ( .A(n266), .B(n680), .Z(n705) );
  NAND2X1 U894 ( .A(n707), .B(n708), .Z(n2207) );
  NAND2X1 U895 ( .A(pwm_reg3[14]), .B(n2259), .Z(n708) );
  NAND2X1 U896 ( .A(n269), .B(n680), .Z(n707) );
  NAND2X1 U897 ( .A(n709), .B(n710), .Z(n2208) );
  NAND2X1 U898 ( .A(pwm_reg3[15]), .B(n2259), .Z(n710) );
  NAND2X1 U899 ( .A(n272), .B(n680), .Z(n709) );
  NAND2X1 U900 ( .A(n122), .B(n711), .Z(n680) );
  NAND3X1 U901 ( .A(n472), .B(write_en), .C(n575), .Z(n711) );
  NOR2X1 U902 ( .A(n2263), .B(wrData[2]), .Z(n472) );
  NAND2X1 U903 ( .A(n712), .B(n713), .Z(n2209) );
  NAND2X1 U904 ( .A(pwm_reg6[0]), .B(n2260), .Z(n713) );
  NAND2X1 U905 ( .A(n226), .B(n714), .Z(n712) );
  NAND2X1 U906 ( .A(n715), .B(n716), .Z(n2210) );
  NAND2X1 U907 ( .A(pwm_reg6[1]), .B(n2260), .Z(n716) );
  NAND2X1 U908 ( .A(n230), .B(n714), .Z(n715) );
  NAND2X1 U909 ( .A(n717), .B(n718), .Z(n2211) );
  NAND2X1 U910 ( .A(pwm_reg6[2]), .B(n2260), .Z(n718) );
  NAND2X1 U911 ( .A(n233), .B(n714), .Z(n717) );
  NAND2X1 U912 ( .A(n719), .B(n720), .Z(n2212) );
  NAND2X1 U913 ( .A(pwm_reg6[3]), .B(n2260), .Z(n720) );
  NAND2X1 U914 ( .A(n236), .B(n714), .Z(n719) );
  NAND2X1 U915 ( .A(n721), .B(n722), .Z(n2213) );
  NAND2X1 U916 ( .A(pwm_reg6[4]), .B(n2260), .Z(n722) );
  NAND2X1 U917 ( .A(n239), .B(n714), .Z(n721) );
  NAND2X1 U918 ( .A(n723), .B(n724), .Z(n2214) );
  NAND2X1 U919 ( .A(pwm_reg6[5]), .B(n2260), .Z(n724) );
  NAND2X1 U920 ( .A(n242), .B(n714), .Z(n723) );
  NAND2X1 U921 ( .A(n725), .B(n726), .Z(n2215) );
  NAND2X1 U922 ( .A(pwm_reg6[6]), .B(n2260), .Z(n726) );
  NAND2X1 U923 ( .A(n245), .B(n714), .Z(n725) );
  NAND2X1 U924 ( .A(n727), .B(n728), .Z(n2216) );
  NAND2X1 U925 ( .A(pwm_reg6[7]), .B(n2260), .Z(n728) );
  NAND2X1 U926 ( .A(n248), .B(n714), .Z(n727) );
  NAND2X1 U927 ( .A(n729), .B(n730), .Z(n2217) );
  NAND2X1 U928 ( .A(pwm_reg6[8]), .B(n2260), .Z(n730) );
  NAND2X1 U929 ( .A(n251), .B(n714), .Z(n729) );
  NAND2X1 U930 ( .A(n731), .B(n732), .Z(n2218) );
  NAND2X1 U931 ( .A(pwm_reg6[9]), .B(n2260), .Z(n732) );
  NAND2X1 U932 ( .A(n254), .B(n714), .Z(n731) );
  NAND2X1 U933 ( .A(n733), .B(n734), .Z(n2219) );
  NAND2X1 U934 ( .A(pwm_reg6[10]), .B(n2260), .Z(n734) );
  NAND2X1 U935 ( .A(n257), .B(n714), .Z(n733) );
  NAND2X1 U936 ( .A(n735), .B(n736), .Z(n2220) );
  NAND2X1 U937 ( .A(pwm_reg6[11]), .B(n2260), .Z(n736) );
  NAND2X1 U938 ( .A(n260), .B(n714), .Z(n735) );
  NAND2X1 U939 ( .A(n737), .B(n738), .Z(n2221) );
  NAND2X1 U940 ( .A(pwm_reg6[12]), .B(n2260), .Z(n738) );
  NAND2X1 U941 ( .A(n263), .B(n714), .Z(n737) );
  NAND2X1 U942 ( .A(n739), .B(n740), .Z(n2222) );
  NAND2X1 U943 ( .A(pwm_reg6[13]), .B(n2260), .Z(n740) );
  NAND2X1 U944 ( .A(n266), .B(n714), .Z(n739) );
  NAND2X1 U945 ( .A(n741), .B(n742), .Z(n2223) );
  NAND2X1 U946 ( .A(pwm_reg6[14]), .B(n2260), .Z(n742) );
  NAND2X1 U947 ( .A(n269), .B(n714), .Z(n741) );
  NAND2X1 U948 ( .A(n743), .B(n744), .Z(n2224) );
  NAND2X1 U949 ( .A(pwm_reg6[15]), .B(n2260), .Z(n744) );
  NAND2X1 U950 ( .A(n272), .B(n714), .Z(n743) );
  NAND2X1 U951 ( .A(n122), .B(n745), .Z(n714) );
  NAND3X1 U952 ( .A(write_en), .B(n274), .C(n325), .Z(n745) );
  NOR2X1 U953 ( .A(n2264), .B(n2263), .Z(n325) );
  NOR2X1 U954 ( .A(n2265), .B(wrData[0]), .Z(n274) );
  NAND2X1 U955 ( .A(n746), .B(n747), .Z(n2225) );
  NAND2X1 U956 ( .A(pwm_reg1[0]), .B(n2261), .Z(n747) );
  NAND2X1 U957 ( .A(n226), .B(n748), .Z(n746) );
  AND2X1 U958 ( .A(DataIn[0]), .B(n122), .Z(n226) );
  NAND2X1 U959 ( .A(n749), .B(n750), .Z(n2226) );
  NAND2X1 U960 ( .A(pwm_reg1[1]), .B(n2261), .Z(n750) );
  NAND2X1 U961 ( .A(n230), .B(n748), .Z(n749) );
  AND2X1 U962 ( .A(DataIn[1]), .B(n122), .Z(n230) );
  NAND2X1 U963 ( .A(n751), .B(n752), .Z(n2227) );
  NAND2X1 U964 ( .A(pwm_reg1[2]), .B(n2261), .Z(n752) );
  NAND2X1 U965 ( .A(n233), .B(n748), .Z(n751) );
  AND2X1 U966 ( .A(DataIn[2]), .B(n122), .Z(n233) );
  NAND2X1 U967 ( .A(n753), .B(n754), .Z(n2228) );
  NAND2X1 U968 ( .A(pwm_reg1[3]), .B(n2261), .Z(n754) );
  NAND2X1 U969 ( .A(n236), .B(n748), .Z(n753) );
  AND2X1 U970 ( .A(DataIn[3]), .B(n122), .Z(n236) );
  NAND2X1 U971 ( .A(n755), .B(n756), .Z(n2229) );
  NAND2X1 U972 ( .A(pwm_reg1[4]), .B(n2261), .Z(n756) );
  NAND2X1 U973 ( .A(n239), .B(n748), .Z(n755) );
  AND2X1 U974 ( .A(DataIn[4]), .B(n122), .Z(n239) );
  NAND2X1 U975 ( .A(n757), .B(n758), .Z(n2230) );
  NAND2X1 U976 ( .A(pwm_reg1[5]), .B(n2261), .Z(n758) );
  NAND2X1 U977 ( .A(n242), .B(n748), .Z(n757) );
  AND2X1 U978 ( .A(DataIn[5]), .B(n122), .Z(n242) );
  NAND2X1 U979 ( .A(n759), .B(n760), .Z(n2231) );
  NAND2X1 U980 ( .A(pwm_reg1[6]), .B(n2261), .Z(n760) );
  NAND2X1 U981 ( .A(n245), .B(n748), .Z(n759) );
  AND2X1 U982 ( .A(DataIn[6]), .B(n122), .Z(n245) );
  NAND2X1 U983 ( .A(n761), .B(n762), .Z(n2232) );
  NAND2X1 U984 ( .A(pwm_reg1[7]), .B(n2261), .Z(n762) );
  NAND2X1 U985 ( .A(n248), .B(n748), .Z(n761) );
  AND2X1 U986 ( .A(DataIn[7]), .B(n122), .Z(n248) );
  NAND2X1 U987 ( .A(n763), .B(n764), .Z(n2233) );
  NAND2X1 U988 ( .A(pwm_reg1[8]), .B(n2261), .Z(n764) );
  NAND2X1 U989 ( .A(n251), .B(n748), .Z(n763) );
  AND2X1 U990 ( .A(DataIn[8]), .B(n122), .Z(n251) );
  NAND2X1 U991 ( .A(n765), .B(n766), .Z(n2234) );
  NAND2X1 U992 ( .A(pwm_reg1[9]), .B(n2261), .Z(n766) );
  NAND2X1 U993 ( .A(n254), .B(n748), .Z(n765) );
  AND2X1 U994 ( .A(DataIn[9]), .B(n122), .Z(n254) );
  NAND2X1 U995 ( .A(n767), .B(n768), .Z(n2235) );
  NAND2X1 U996 ( .A(pwm_reg1[10]), .B(n2261), .Z(n768) );
  NAND2X1 U997 ( .A(n257), .B(n748), .Z(n767) );
  AND2X1 U998 ( .A(DataIn[10]), .B(n122), .Z(n257) );
  NAND2X1 U999 ( .A(n769), .B(n770), .Z(n2236) );
  NAND2X1 U1000 ( .A(pwm_reg1[11]), .B(n2261), .Z(n770) );
  NAND2X1 U1001 ( .A(n260), .B(n748), .Z(n769) );
  AND2X1 U1002 ( .A(DataIn[11]), .B(n122), .Z(n260) );
  NAND2X1 U1003 ( .A(n771), .B(n772), .Z(n2237) );
  NAND2X1 U1004 ( .A(pwm_reg1[12]), .B(n2261), .Z(n772) );
  NAND2X1 U1005 ( .A(n263), .B(n748), .Z(n771) );
  AND2X1 U1006 ( .A(DataIn[12]), .B(n122), .Z(n263) );
  NAND2X1 U1007 ( .A(n773), .B(n774), .Z(n2238) );
  NAND2X1 U1008 ( .A(pwm_reg1[13]), .B(n2261), .Z(n774) );
  NAND2X1 U1009 ( .A(n266), .B(n748), .Z(n773) );
  AND2X1 U1010 ( .A(DataIn[13]), .B(n122), .Z(n266) );
  NAND2X1 U1011 ( .A(n775), .B(n776), .Z(n2239) );
  NAND2X1 U1012 ( .A(pwm_reg1[14]), .B(n2261), .Z(n776) );
  NAND2X1 U1013 ( .A(n269), .B(n748), .Z(n775) );
  AND2X1 U1014 ( .A(DataIn[14]), .B(n122), .Z(n269) );
  NAND2X1 U1015 ( .A(n777), .B(n778), .Z(n2240) );
  NAND2X1 U1016 ( .A(pwm_reg1[15]), .B(n2261), .Z(n778) );
  NAND2X1 U1017 ( .A(n272), .B(n748), .Z(n777) );
  NAND2X1 U1018 ( .A(n122), .B(n779), .Z(n748) );
  NAND3X1 U1019 ( .A(write_en), .B(n275), .C(n575), .Z(n779) );
  NOR2X1 U1020 ( .A(n2262), .B(n2265), .Z(n575) );
  NOR2X1 U1021 ( .A(wrData[2]), .B(wrData[1]), .Z(n275) );
  AND2X1 U1022 ( .A(DataIn[15]), .B(n122), .Z(n272) );
  NAND2X1 U1023 ( .A(n780), .B(n781), .Z(C[9]) );
  NOR2X1 U1024 ( .A(n782), .B(n783), .Z(n781) );
  NAND3X1 U1025 ( .A(n784), .B(n785), .C(n786), .Z(n783) );
  NOR2X1 U1026 ( .A(n787), .B(n788), .Z(n786) );
  NOR2X1 U1027 ( .A(n58), .B(n789), .Z(n788) );
  NOR2X1 U1028 ( .A(n74), .B(n790), .Z(n787) );
  NAND2X1 U1029 ( .A(n791), .B(pwm_reg1[9]), .Z(n785) );
  NAND2X1 U1030 ( .A(n792), .B(pwm_reg0[9]), .Z(n784) );
  NAND3X1 U1031 ( .A(n793), .B(n794), .C(n795), .Z(n782) );
  NOR2X1 U1032 ( .A(n796), .B(n797), .Z(n795) );
  NOR2X1 U1033 ( .A(n90), .B(n798), .Z(n797) );
  NOR2X1 U1034 ( .A(n42), .B(n799), .Z(n796) );
  NAND2X1 U1035 ( .A(n800), .B(pwm_reg5[9]), .Z(n794) );
  NAND2X1 U1036 ( .A(n801), .B(pwm_reg4[9]), .Z(n793) );
  NOR2X1 U1037 ( .A(n802), .B(n803), .Z(n780) );
  NAND3X1 U1038 ( .A(n804), .B(n805), .C(n806), .Z(n803) );
  NAND2X1 U1039 ( .A(n807), .B(reg1[9]), .Z(n806) );
  NAND2X1 U1040 ( .A(n808), .B(reg3[9]), .Z(n805) );
  NAND2X1 U1041 ( .A(n809), .B(reg2[9]), .Z(n804) );
  NAND3X1 U1042 ( .A(n810), .B(n811), .C(n812), .Z(n802) );
  NOR2X1 U1043 ( .A(n813), .B(n814), .Z(n812) );
  NOR2X1 U1044 ( .A(n26), .B(n815), .Z(n814) );
  NOR2X1 U1045 ( .A(n10), .B(n816), .Z(n813) );
  NAND2X1 U1046 ( .A(n817), .B(reg_file_to_i2c_data[1]), .Z(n811) );
  NAND2X1 U1047 ( .A(n818), .B(reg6[9]), .Z(n810) );
  NAND2X1 U1048 ( .A(n819), .B(n820), .Z(C[8]) );
  NOR2X1 U1049 ( .A(n821), .B(n822), .Z(n820) );
  NAND3X1 U1050 ( .A(n823), .B(n824), .C(n825), .Z(n822) );
  NOR2X1 U1051 ( .A(n826), .B(n827), .Z(n825) );
  NOR2X1 U1052 ( .A(n57), .B(n789), .Z(n827) );
  NOR2X1 U1053 ( .A(n73), .B(n790), .Z(n826) );
  NAND2X1 U1054 ( .A(n791), .B(pwm_reg1[8]), .Z(n824) );
  NAND2X1 U1055 ( .A(n792), .B(pwm_reg0[8]), .Z(n823) );
  NAND3X1 U1056 ( .A(n828), .B(n829), .C(n830), .Z(n821) );
  NOR2X1 U1057 ( .A(n831), .B(n832), .Z(n830) );
  NOR2X1 U1058 ( .A(n89), .B(n798), .Z(n832) );
  NOR2X1 U1059 ( .A(n41), .B(n799), .Z(n831) );
  NAND2X1 U1060 ( .A(n800), .B(pwm_reg5[8]), .Z(n829) );
  NAND2X1 U1061 ( .A(n801), .B(pwm_reg4[8]), .Z(n828) );
  NOR2X1 U1062 ( .A(n833), .B(n834), .Z(n819) );
  NAND3X1 U1063 ( .A(n835), .B(n836), .C(n837), .Z(n834) );
  NAND2X1 U1064 ( .A(n807), .B(reg1[8]), .Z(n837) );
  NAND2X1 U1065 ( .A(n808), .B(reg3[8]), .Z(n836) );
  NAND2X1 U1066 ( .A(n809), .B(reg2[8]), .Z(n835) );
  NAND3X1 U1067 ( .A(n838), .B(n839), .C(n840), .Z(n833) );
  NOR2X1 U1068 ( .A(n841), .B(n842), .Z(n840) );
  NOR2X1 U1069 ( .A(n25), .B(n815), .Z(n842) );
  NOR2X1 U1070 ( .A(n9), .B(n816), .Z(n841) );
  NAND2X1 U1071 ( .A(n817), .B(reg_file_to_i2c_data[0]), .Z(n839) );
  NAND2X1 U1072 ( .A(n818), .B(i2c_addr[8]), .Z(n838) );
  NAND2X1 U1073 ( .A(n843), .B(n844), .Z(C[7]) );
  NOR2X1 U1074 ( .A(n845), .B(n846), .Z(n844) );
  NAND3X1 U1075 ( .A(n847), .B(n848), .C(n849), .Z(n846) );
  NOR2X1 U1076 ( .A(n850), .B(n851), .Z(n849) );
  NOR2X1 U1077 ( .A(n56), .B(n789), .Z(n851) );
  NOR2X1 U1078 ( .A(n72), .B(n790), .Z(n850) );
  NAND2X1 U1079 ( .A(n791), .B(pwm_reg1[7]), .Z(n848) );
  NAND2X1 U1080 ( .A(n792), .B(pwm_reg0[7]), .Z(n847) );
  NAND3X1 U1081 ( .A(n852), .B(n853), .C(n854), .Z(n845) );
  NOR2X1 U1082 ( .A(n855), .B(n856), .Z(n854) );
  NOR2X1 U1083 ( .A(n88), .B(n798), .Z(n856) );
  NOR2X1 U1084 ( .A(n40), .B(n799), .Z(n855) );
  NAND2X1 U1085 ( .A(n800), .B(pwm_reg5[7]), .Z(n853) );
  NAND2X1 U1086 ( .A(n801), .B(pwm_reg4[7]), .Z(n852) );
  NOR2X1 U1087 ( .A(n857), .B(n858), .Z(n843) );
  NAND3X1 U1088 ( .A(n859), .B(n860), .C(n861), .Z(n858) );
  NAND2X1 U1089 ( .A(n807), .B(reg1[7]), .Z(n861) );
  NAND2X1 U1090 ( .A(n808), .B(reg3[7]), .Z(n860) );
  NAND2X1 U1091 ( .A(n809), .B(reg2[7]), .Z(n859) );
  NAND3X1 U1092 ( .A(n862), .B(n863), .C(n864), .Z(n857) );
  NOR2X1 U1093 ( .A(n865), .B(n866), .Z(n864) );
  NOR2X1 U1094 ( .A(n24), .B(n815), .Z(n866) );
  NOR2X1 U1095 ( .A(n8), .B(n816), .Z(n865) );
  NAND2X1 U1096 ( .A(n817), .B(i2c_slave_addr[7]), .Z(n863) );
  NAND2X1 U1097 ( .A(n818), .B(i2c_addr[7]), .Z(n862) );
  NAND2X1 U1098 ( .A(n867), .B(n868), .Z(C[6]) );
  NOR2X1 U1099 ( .A(n869), .B(n870), .Z(n868) );
  NAND3X1 U1100 ( .A(n871), .B(n872), .C(n873), .Z(n870) );
  NOR2X1 U1101 ( .A(n874), .B(n875), .Z(n873) );
  NOR2X1 U1102 ( .A(n55), .B(n789), .Z(n875) );
  NOR2X1 U1103 ( .A(n71), .B(n790), .Z(n874) );
  NAND2X1 U1104 ( .A(n791), .B(pwm_reg1[6]), .Z(n872) );
  NAND2X1 U1105 ( .A(n792), .B(pwm_reg0[6]), .Z(n871) );
  NAND3X1 U1106 ( .A(n876), .B(n877), .C(n878), .Z(n869) );
  NOR2X1 U1107 ( .A(n879), .B(n880), .Z(n878) );
  NOR2X1 U1108 ( .A(n87), .B(n798), .Z(n880) );
  NOR2X1 U1109 ( .A(n39), .B(n799), .Z(n879) );
  NAND2X1 U1110 ( .A(n800), .B(pwm_reg5[6]), .Z(n877) );
  NAND2X1 U1111 ( .A(n801), .B(pwm_reg4[6]), .Z(n876) );
  NOR2X1 U1112 ( .A(n881), .B(n882), .Z(n867) );
  NAND3X1 U1113 ( .A(n883), .B(n884), .C(n885), .Z(n882) );
  NAND2X1 U1114 ( .A(n807), .B(reg1[6]), .Z(n885) );
  NAND2X1 U1115 ( .A(n808), .B(reg3[6]), .Z(n884) );
  NAND2X1 U1116 ( .A(n809), .B(reg2[6]), .Z(n883) );
  NAND3X1 U1117 ( .A(n886), .B(n887), .C(n888), .Z(n881) );
  NOR2X1 U1118 ( .A(n889), .B(n890), .Z(n888) );
  NOR2X1 U1119 ( .A(n23), .B(n815), .Z(n890) );
  NOR2X1 U1120 ( .A(n7), .B(n816), .Z(n889) );
  NAND2X1 U1121 ( .A(n817), .B(i2c_slave_addr[6]), .Z(n887) );
  NAND2X1 U1122 ( .A(n818), .B(i2c_addr[6]), .Z(n886) );
  NAND2X1 U1123 ( .A(n891), .B(n892), .Z(C[5]) );
  NOR2X1 U1124 ( .A(n893), .B(n894), .Z(n892) );
  NAND3X1 U1125 ( .A(n895), .B(n896), .C(n897), .Z(n894) );
  NOR2X1 U1126 ( .A(n898), .B(n899), .Z(n897) );
  NOR2X1 U1127 ( .A(n54), .B(n789), .Z(n899) );
  NOR2X1 U1128 ( .A(n70), .B(n790), .Z(n898) );
  NAND2X1 U1129 ( .A(n791), .B(pwm_reg1[5]), .Z(n896) );
  NAND2X1 U1130 ( .A(n792), .B(pwm_reg0[5]), .Z(n895) );
  NAND3X1 U1131 ( .A(n900), .B(n901), .C(n902), .Z(n893) );
  NOR2X1 U1132 ( .A(n903), .B(n904), .Z(n902) );
  NOR2X1 U1133 ( .A(n86), .B(n798), .Z(n904) );
  NOR2X1 U1134 ( .A(n38), .B(n799), .Z(n903) );
  NAND2X1 U1135 ( .A(n800), .B(pwm_reg5[5]), .Z(n901) );
  NAND2X1 U1136 ( .A(n801), .B(pwm_reg4[5]), .Z(n900) );
  NOR2X1 U1137 ( .A(n905), .B(n906), .Z(n891) );
  NAND3X1 U1138 ( .A(n907), .B(n908), .C(n909), .Z(n906) );
  NAND2X1 U1139 ( .A(n807), .B(reg1[5]), .Z(n909) );
  NAND2X1 U1140 ( .A(n808), .B(reg3[5]), .Z(n908) );
  NAND2X1 U1141 ( .A(n809), .B(reg2[5]), .Z(n907) );
  NAND3X1 U1142 ( .A(n910), .B(n911), .C(n912), .Z(n905) );
  NOR2X1 U1143 ( .A(n913), .B(n914), .Z(n912) );
  NOR2X1 U1144 ( .A(n22), .B(n815), .Z(n914) );
  NOR2X1 U1145 ( .A(n6), .B(n816), .Z(n913) );
  NAND2X1 U1146 ( .A(n817), .B(i2c_slave_addr[5]), .Z(n911) );
  NAND2X1 U1147 ( .A(n818), .B(i2c_addr[5]), .Z(n910) );
  NAND2X1 U1148 ( .A(n915), .B(n916), .Z(C[4]) );
  NOR2X1 U1149 ( .A(n917), .B(n918), .Z(n916) );
  NAND3X1 U1150 ( .A(n919), .B(n920), .C(n921), .Z(n918) );
  NOR2X1 U1151 ( .A(n922), .B(n923), .Z(n921) );
  NOR2X1 U1152 ( .A(n53), .B(n789), .Z(n923) );
  NOR2X1 U1153 ( .A(n69), .B(n790), .Z(n922) );
  NAND2X1 U1154 ( .A(n791), .B(pwm_reg1[4]), .Z(n920) );
  NAND2X1 U1155 ( .A(n792), .B(pwm_reg0[4]), .Z(n919) );
  NAND3X1 U1156 ( .A(n924), .B(n925), .C(n926), .Z(n917) );
  NOR2X1 U1157 ( .A(n927), .B(n928), .Z(n926) );
  NOR2X1 U1158 ( .A(n85), .B(n798), .Z(n928) );
  NOR2X1 U1159 ( .A(n37), .B(n799), .Z(n927) );
  NAND2X1 U1160 ( .A(n800), .B(pwm_reg5[4]), .Z(n925) );
  NAND2X1 U1161 ( .A(n801), .B(pwm_reg4[4]), .Z(n924) );
  NOR2X1 U1162 ( .A(n929), .B(n930), .Z(n915) );
  NAND3X1 U1163 ( .A(n931), .B(n932), .C(n933), .Z(n930) );
  NAND2X1 U1164 ( .A(n807), .B(reg1[4]), .Z(n933) );
  NAND2X1 U1165 ( .A(n808), .B(reg3[4]), .Z(n932) );
  NAND2X1 U1166 ( .A(n809), .B(reg2[4]), .Z(n931) );
  NAND3X1 U1167 ( .A(n934), .B(n935), .C(n936), .Z(n929) );
  NOR2X1 U1168 ( .A(n937), .B(n938), .Z(n936) );
  NOR2X1 U1169 ( .A(n21), .B(n815), .Z(n938) );
  NOR2X1 U1170 ( .A(n5), .B(n816), .Z(n937) );
  NAND2X1 U1171 ( .A(n817), .B(i2c_slave_addr[4]), .Z(n935) );
  NAND2X1 U1172 ( .A(n818), .B(i2c_addr[4]), .Z(n934) );
  NAND2X1 U1173 ( .A(n939), .B(n940), .Z(C[3]) );
  NOR2X1 U1174 ( .A(n941), .B(n942), .Z(n940) );
  NAND3X1 U1175 ( .A(n943), .B(n944), .C(n945), .Z(n942) );
  NOR2X1 U1176 ( .A(n946), .B(n947), .Z(n945) );
  NOR2X1 U1177 ( .A(n52), .B(n789), .Z(n947) );
  NOR2X1 U1178 ( .A(n68), .B(n790), .Z(n946) );
  NAND2X1 U1179 ( .A(n791), .B(pwm_reg1[3]), .Z(n944) );
  NAND2X1 U1180 ( .A(n792), .B(pwm_reg0[3]), .Z(n943) );
  NAND3X1 U1181 ( .A(n948), .B(n949), .C(n950), .Z(n941) );
  NOR2X1 U1182 ( .A(n951), .B(n952), .Z(n950) );
  NOR2X1 U1183 ( .A(n84), .B(n798), .Z(n952) );
  NOR2X1 U1184 ( .A(n36), .B(n799), .Z(n951) );
  NAND2X1 U1185 ( .A(n800), .B(pwm_reg5[3]), .Z(n949) );
  NAND2X1 U1186 ( .A(n801), .B(pwm_reg4[3]), .Z(n948) );
  NOR2X1 U1187 ( .A(n953), .B(n954), .Z(n939) );
  NAND3X1 U1188 ( .A(n955), .B(n956), .C(n957), .Z(n954) );
  NAND2X1 U1189 ( .A(n807), .B(reg1[3]), .Z(n957) );
  NAND2X1 U1190 ( .A(n808), .B(reg3[3]), .Z(n956) );
  NAND2X1 U1191 ( .A(n809), .B(reg2[3]), .Z(n955) );
  NAND3X1 U1192 ( .A(n958), .B(n959), .C(n960), .Z(n953) );
  NOR2X1 U1193 ( .A(n961), .B(n962), .Z(n960) );
  NOR2X1 U1194 ( .A(n20), .B(n815), .Z(n962) );
  NOR2X1 U1195 ( .A(n4), .B(n816), .Z(n961) );
  NAND2X1 U1196 ( .A(n817), .B(i2c_slave_addr[3]), .Z(n959) );
  NAND2X1 U1197 ( .A(n818), .B(i2c_addr[3]), .Z(n958) );
  NAND2X1 U1198 ( .A(n963), .B(n964), .Z(C[2]) );
  NOR2X1 U1199 ( .A(n965), .B(n966), .Z(n964) );
  NAND3X1 U1200 ( .A(n967), .B(n968), .C(n969), .Z(n966) );
  NOR2X1 U1201 ( .A(n970), .B(n971), .Z(n969) );
  NOR2X1 U1202 ( .A(n51), .B(n789), .Z(n971) );
  NOR2X1 U1203 ( .A(n67), .B(n790), .Z(n970) );
  NAND2X1 U1204 ( .A(n791), .B(pwm_reg1[2]), .Z(n968) );
  NAND2X1 U1205 ( .A(n792), .B(pwm_reg0[2]), .Z(n967) );
  NAND3X1 U1206 ( .A(n972), .B(n973), .C(n974), .Z(n965) );
  NOR2X1 U1207 ( .A(n975), .B(n976), .Z(n974) );
  NOR2X1 U1208 ( .A(n83), .B(n798), .Z(n976) );
  NOR2X1 U1209 ( .A(n35), .B(n799), .Z(n975) );
  NAND2X1 U1210 ( .A(n800), .B(pwm_reg5[2]), .Z(n973) );
  NAND2X1 U1211 ( .A(n801), .B(pwm_reg4[2]), .Z(n972) );
  NOR2X1 U1212 ( .A(n977), .B(n978), .Z(n963) );
  NAND3X1 U1213 ( .A(n979), .B(n980), .C(n981), .Z(n978) );
  NAND2X1 U1214 ( .A(n807), .B(reg1[2]), .Z(n981) );
  NAND2X1 U1215 ( .A(n808), .B(reg3[2]), .Z(n980) );
  NAND2X1 U1216 ( .A(n809), .B(reg2[2]), .Z(n979) );
  NAND3X1 U1217 ( .A(n982), .B(n983), .C(n984), .Z(n977) );
  NOR2X1 U1218 ( .A(n985), .B(n986), .Z(n984) );
  NOR2X1 U1219 ( .A(n19), .B(n815), .Z(n986) );
  NOR2X1 U1220 ( .A(n3), .B(n816), .Z(n985) );
  NAND2X1 U1221 ( .A(n817), .B(i2c_slave_addr[2]), .Z(n983) );
  NAND2X1 U1222 ( .A(n818), .B(i2c_addr[2]), .Z(n982) );
  NAND2X1 U1223 ( .A(n987), .B(n988), .Z(C[1]) );
  NOR2X1 U1224 ( .A(n989), .B(n990), .Z(n988) );
  NAND3X1 U1225 ( .A(n991), .B(n992), .C(n993), .Z(n990) );
  NOR2X1 U1226 ( .A(n994), .B(n995), .Z(n993) );
  NOR2X1 U1227 ( .A(n50), .B(n789), .Z(n995) );
  NOR2X1 U1228 ( .A(n66), .B(n790), .Z(n994) );
  NAND2X1 U1229 ( .A(n791), .B(pwm_reg1[1]), .Z(n992) );
  NAND2X1 U1230 ( .A(n792), .B(pwm_reg0[1]), .Z(n991) );
  NAND3X1 U1231 ( .A(n996), .B(n997), .C(n998), .Z(n989) );
  NOR2X1 U1232 ( .A(n999), .B(n1000), .Z(n998) );
  NOR2X1 U1233 ( .A(n82), .B(n798), .Z(n1000) );
  NOR2X1 U1234 ( .A(n34), .B(n799), .Z(n999) );
  NAND2X1 U1235 ( .A(n800), .B(pwm_reg5[1]), .Z(n997) );
  NAND2X1 U1236 ( .A(n801), .B(pwm_reg4[1]), .Z(n996) );
  NOR2X1 U1237 ( .A(n1001), .B(n1002), .Z(n987) );
  NAND3X1 U1238 ( .A(n1003), .B(n1004), .C(n1005), .Z(n1002) );
  NAND2X1 U1239 ( .A(n807), .B(reg1[1]), .Z(n1005) );
  NAND2X1 U1240 ( .A(n808), .B(reg3[1]), .Z(n1004) );
  NAND2X1 U1241 ( .A(n809), .B(reg2[1]), .Z(n1003) );
  NAND3X1 U1242 ( .A(n1006), .B(n1007), .C(n1008), .Z(n1001) );
  NOR2X1 U1243 ( .A(n1009), .B(n1010), .Z(n1008) );
  NOR2X1 U1244 ( .A(n18), .B(n815), .Z(n1010) );
  NOR2X1 U1245 ( .A(n2), .B(n816), .Z(n1009) );
  NAND2X1 U1246 ( .A(n817), .B(i2c_slave_addr[1]), .Z(n1007) );
  NAND2X1 U1247 ( .A(n818), .B(i2c_addr[1]), .Z(n1006) );
  NAND2X1 U1248 ( .A(n1011), .B(n1012), .Z(C[15]) );
  NOR2X1 U1249 ( .A(n1013), .B(n1014), .Z(n1012) );
  NAND3X1 U1250 ( .A(n1015), .B(n1016), .C(n1017), .Z(n1014) );
  NOR2X1 U1251 ( .A(n1018), .B(n1019), .Z(n1017) );
  NOR2X1 U1252 ( .A(n64), .B(n789), .Z(n1019) );
  NOR2X1 U1253 ( .A(n80), .B(n790), .Z(n1018) );
  NAND2X1 U1254 ( .A(n791), .B(pwm_reg1[15]), .Z(n1016) );
  NAND2X1 U1255 ( .A(n792), .B(pwm_reg0[15]), .Z(n1015) );
  NAND3X1 U1256 ( .A(n1020), .B(n1021), .C(n1022), .Z(n1013) );
  NOR2X1 U1257 ( .A(n1023), .B(n1024), .Z(n1022) );
  NOR2X1 U1258 ( .A(n96), .B(n798), .Z(n1024) );
  NOR2X1 U1259 ( .A(n48), .B(n799), .Z(n1023) );
  NAND2X1 U1260 ( .A(n800), .B(pwm_reg5[15]), .Z(n1021) );
  NAND2X1 U1261 ( .A(n801), .B(pwm_reg4[15]), .Z(n1020) );
  NOR2X1 U1262 ( .A(n1025), .B(n1026), .Z(n1011) );
  NAND3X1 U1263 ( .A(n1027), .B(n1028), .C(n1029), .Z(n1026) );
  NAND2X1 U1264 ( .A(n807), .B(reg1[15]), .Z(n1029) );
  NAND2X1 U1265 ( .A(n808), .B(reg3[15]), .Z(n1028) );
  NAND2X1 U1266 ( .A(n809), .B(reg2[15]), .Z(n1027) );
  NAND3X1 U1267 ( .A(n1030), .B(n1031), .C(n1032), .Z(n1025) );
  NOR2X1 U1268 ( .A(n1033), .B(n1034), .Z(n1032) );
  NOR2X1 U1269 ( .A(n32), .B(n815), .Z(n1034) );
  NOR2X1 U1270 ( .A(n16), .B(n816), .Z(n1033) );
  NAND2X1 U1271 ( .A(n817), .B(reg_file_to_i2c_data[7]), .Z(n1031) );
  NAND2X1 U1272 ( .A(n818), .B(reg6[15]), .Z(n1030) );
  NAND2X1 U1273 ( .A(n1035), .B(n1036), .Z(C[14]) );
  NOR2X1 U1274 ( .A(n1037), .B(n1038), .Z(n1036) );
  NAND3X1 U1275 ( .A(n1039), .B(n1040), .C(n1041), .Z(n1038) );
  NOR2X1 U1276 ( .A(n1042), .B(n1043), .Z(n1041) );
  NOR2X1 U1277 ( .A(n63), .B(n789), .Z(n1043) );
  NOR2X1 U1278 ( .A(n79), .B(n790), .Z(n1042) );
  NAND2X1 U1279 ( .A(n791), .B(pwm_reg1[14]), .Z(n1040) );
  NAND2X1 U1280 ( .A(n792), .B(pwm_reg0[14]), .Z(n1039) );
  NAND3X1 U1281 ( .A(n1044), .B(n1045), .C(n1046), .Z(n1037) );
  NOR2X1 U1282 ( .A(n1047), .B(n1048), .Z(n1046) );
  NOR2X1 U1283 ( .A(n95), .B(n798), .Z(n1048) );
  NOR2X1 U1284 ( .A(n47), .B(n799), .Z(n1047) );
  NAND2X1 U1285 ( .A(n800), .B(pwm_reg5[14]), .Z(n1045) );
  NAND2X1 U1286 ( .A(n801), .B(pwm_reg4[14]), .Z(n1044) );
  NOR2X1 U1287 ( .A(n1049), .B(n1050), .Z(n1035) );
  NAND3X1 U1288 ( .A(n1051), .B(n1052), .C(n1053), .Z(n1050) );
  NAND2X1 U1289 ( .A(n807), .B(reg1[14]), .Z(n1053) );
  NAND2X1 U1290 ( .A(n808), .B(reg3[14]), .Z(n1052) );
  NAND2X1 U1291 ( .A(n809), .B(reg2[14]), .Z(n1051) );
  NAND3X1 U1292 ( .A(n1054), .B(n1055), .C(n1056), .Z(n1049) );
  NOR2X1 U1293 ( .A(n1057), .B(n1058), .Z(n1056) );
  NOR2X1 U1294 ( .A(n31), .B(n815), .Z(n1058) );
  NOR2X1 U1295 ( .A(n15), .B(n816), .Z(n1057) );
  NAND2X1 U1296 ( .A(n817), .B(reg_file_to_i2c_data[6]), .Z(n1055) );
  NAND2X1 U1297 ( .A(n818), .B(reg6[14]), .Z(n1054) );
  NAND2X1 U1298 ( .A(n1059), .B(n1060), .Z(C[13]) );
  NOR2X1 U1299 ( .A(n1061), .B(n1062), .Z(n1060) );
  NAND3X1 U1300 ( .A(n1063), .B(n1064), .C(n1065), .Z(n1062) );
  NOR2X1 U1301 ( .A(n1066), .B(n1067), .Z(n1065) );
  NOR2X1 U1302 ( .A(n62), .B(n789), .Z(n1067) );
  NOR2X1 U1303 ( .A(n78), .B(n790), .Z(n1066) );
  NAND2X1 U1304 ( .A(n791), .B(pwm_reg1[13]), .Z(n1064) );
  NAND2X1 U1305 ( .A(n792), .B(pwm_reg0[13]), .Z(n1063) );
  NAND3X1 U1306 ( .A(n1068), .B(n1069), .C(n1070), .Z(n1061) );
  NOR2X1 U1307 ( .A(n1071), .B(n1072), .Z(n1070) );
  NOR2X1 U1308 ( .A(n94), .B(n798), .Z(n1072) );
  NOR2X1 U1309 ( .A(n46), .B(n799), .Z(n1071) );
  NAND2X1 U1310 ( .A(n800), .B(pwm_reg5[13]), .Z(n1069) );
  NAND2X1 U1311 ( .A(n801), .B(pwm_reg4[13]), .Z(n1068) );
  NOR2X1 U1312 ( .A(n1073), .B(n1074), .Z(n1059) );
  NAND3X1 U1313 ( .A(n1075), .B(n1076), .C(n1077), .Z(n1074) );
  NAND2X1 U1314 ( .A(n807), .B(reg1[13]), .Z(n1077) );
  NAND2X1 U1315 ( .A(n808), .B(reg3[13]), .Z(n1076) );
  NAND2X1 U1316 ( .A(n809), .B(reg2[13]), .Z(n1075) );
  NAND3X1 U1317 ( .A(n1078), .B(n1079), .C(n1080), .Z(n1073) );
  NOR2X1 U1318 ( .A(n1081), .B(n1082), .Z(n1080) );
  NOR2X1 U1319 ( .A(n30), .B(n815), .Z(n1082) );
  NOR2X1 U1320 ( .A(n14), .B(n816), .Z(n1081) );
  NAND2X1 U1321 ( .A(n817), .B(reg_file_to_i2c_data[5]), .Z(n1079) );
  NAND2X1 U1322 ( .A(n818), .B(reg6[13]), .Z(n1078) );
  NAND2X1 U1323 ( .A(n1083), .B(n1084), .Z(C[12]) );
  NOR2X1 U1324 ( .A(n1085), .B(n1086), .Z(n1084) );
  NAND3X1 U1325 ( .A(n1087), .B(n1088), .C(n1089), .Z(n1086) );
  NOR2X1 U1326 ( .A(n1090), .B(n1091), .Z(n1089) );
  NOR2X1 U1327 ( .A(n61), .B(n789), .Z(n1091) );
  NOR2X1 U1328 ( .A(n77), .B(n790), .Z(n1090) );
  NAND2X1 U1329 ( .A(n791), .B(pwm_reg1[12]), .Z(n1088) );
  NAND2X1 U1330 ( .A(n792), .B(pwm_reg0[12]), .Z(n1087) );
  NAND3X1 U1331 ( .A(n1092), .B(n1093), .C(n1094), .Z(n1085) );
  NOR2X1 U1332 ( .A(n1095), .B(n1096), .Z(n1094) );
  NOR2X1 U1333 ( .A(n93), .B(n798), .Z(n1096) );
  NOR2X1 U1334 ( .A(n45), .B(n799), .Z(n1095) );
  NAND2X1 U1335 ( .A(n800), .B(pwm_reg5[12]), .Z(n1093) );
  NAND2X1 U1336 ( .A(n801), .B(pwm_reg4[12]), .Z(n1092) );
  NOR2X1 U1337 ( .A(n1097), .B(n1098), .Z(n1083) );
  NAND3X1 U1338 ( .A(n1099), .B(n1100), .C(n1101), .Z(n1098) );
  NAND2X1 U1339 ( .A(n807), .B(reg1[12]), .Z(n1101) );
  NAND2X1 U1340 ( .A(n808), .B(reg3[12]), .Z(n1100) );
  NAND2X1 U1341 ( .A(n809), .B(reg2[12]), .Z(n1099) );
  NAND3X1 U1342 ( .A(n1102), .B(n1103), .C(n1104), .Z(n1097) );
  NOR2X1 U1343 ( .A(n1105), .B(n1106), .Z(n1104) );
  NOR2X1 U1344 ( .A(n29), .B(n815), .Z(n1106) );
  NOR2X1 U1345 ( .A(n13), .B(n816), .Z(n1105) );
  NAND2X1 U1346 ( .A(n817), .B(reg_file_to_i2c_data[4]), .Z(n1103) );
  NAND2X1 U1347 ( .A(n818), .B(reg6[12]), .Z(n1102) );
  NAND2X1 U1348 ( .A(n1107), .B(n1108), .Z(C[11]) );
  NOR2X1 U1349 ( .A(n1109), .B(n1110), .Z(n1108) );
  NAND3X1 U1350 ( .A(n1111), .B(n1112), .C(n1113), .Z(n1110) );
  NOR2X1 U1351 ( .A(n1114), .B(n1115), .Z(n1113) );
  NOR2X1 U1352 ( .A(n60), .B(n789), .Z(n1115) );
  NOR2X1 U1353 ( .A(n76), .B(n790), .Z(n1114) );
  NAND2X1 U1354 ( .A(n791), .B(pwm_reg1[11]), .Z(n1112) );
  NAND2X1 U1355 ( .A(n792), .B(pwm_reg0[11]), .Z(n1111) );
  NAND3X1 U1356 ( .A(n1116), .B(n1117), .C(n1118), .Z(n1109) );
  NOR2X1 U1357 ( .A(n1119), .B(n1120), .Z(n1118) );
  NOR2X1 U1358 ( .A(n92), .B(n798), .Z(n1120) );
  NOR2X1 U1359 ( .A(n44), .B(n799), .Z(n1119) );
  NAND2X1 U1360 ( .A(n800), .B(pwm_reg5[11]), .Z(n1117) );
  NAND2X1 U1361 ( .A(n801), .B(pwm_reg4[11]), .Z(n1116) );
  NOR2X1 U1362 ( .A(n1121), .B(n1122), .Z(n1107) );
  NAND3X1 U1363 ( .A(n1123), .B(n1124), .C(n1125), .Z(n1122) );
  NAND2X1 U1364 ( .A(n807), .B(reg1[11]), .Z(n1125) );
  NAND2X1 U1365 ( .A(n808), .B(reg3[11]), .Z(n1124) );
  NAND2X1 U1366 ( .A(n809), .B(reg2[11]), .Z(n1123) );
  NAND3X1 U1367 ( .A(n1126), .B(n1127), .C(n1128), .Z(n1121) );
  NOR2X1 U1368 ( .A(n1129), .B(n1130), .Z(n1128) );
  NOR2X1 U1369 ( .A(n28), .B(n815), .Z(n1130) );
  NOR2X1 U1370 ( .A(n12), .B(n816), .Z(n1129) );
  NAND2X1 U1371 ( .A(n817), .B(reg_file_to_i2c_data[3]), .Z(n1127) );
  NAND2X1 U1372 ( .A(n818), .B(reg6[11]), .Z(n1126) );
  NAND2X1 U1373 ( .A(n1131), .B(n1132), .Z(C[10]) );
  NOR2X1 U1374 ( .A(n1133), .B(n1134), .Z(n1132) );
  NAND3X1 U1375 ( .A(n1135), .B(n1136), .C(n1137), .Z(n1134) );
  NOR2X1 U1376 ( .A(n1138), .B(n1139), .Z(n1137) );
  NOR2X1 U1377 ( .A(n59), .B(n789), .Z(n1139) );
  NOR2X1 U1378 ( .A(n75), .B(n790), .Z(n1138) );
  NAND2X1 U1379 ( .A(n791), .B(pwm_reg1[10]), .Z(n1136) );
  NAND2X1 U1380 ( .A(n792), .B(pwm_reg0[10]), .Z(n1135) );
  NAND3X1 U1381 ( .A(n1140), .B(n1141), .C(n1142), .Z(n1133) );
  NOR2X1 U1382 ( .A(n1143), .B(n1144), .Z(n1142) );
  NOR2X1 U1383 ( .A(n91), .B(n798), .Z(n1144) );
  NOR2X1 U1384 ( .A(n43), .B(n799), .Z(n1143) );
  NAND2X1 U1385 ( .A(n800), .B(pwm_reg5[10]), .Z(n1141) );
  NAND2X1 U1386 ( .A(n801), .B(pwm_reg4[10]), .Z(n1140) );
  NOR2X1 U1387 ( .A(n1145), .B(n1146), .Z(n1131) );
  NAND3X1 U1388 ( .A(n1147), .B(n1148), .C(n1149), .Z(n1146) );
  NAND2X1 U1389 ( .A(n807), .B(reg1[10]), .Z(n1149) );
  NAND2X1 U1390 ( .A(n808), .B(reg3[10]), .Z(n1148) );
  NAND2X1 U1391 ( .A(n809), .B(reg2[10]), .Z(n1147) );
  NAND3X1 U1392 ( .A(n1150), .B(n1151), .C(n1152), .Z(n1145) );
  NOR2X1 U1393 ( .A(n1153), .B(n1154), .Z(n1152) );
  NOR2X1 U1394 ( .A(n27), .B(n815), .Z(n1154) );
  NOR2X1 U1395 ( .A(n11), .B(n816), .Z(n1153) );
  NAND2X1 U1396 ( .A(n817), .B(reg_file_to_i2c_data[2]), .Z(n1151) );
  NAND2X1 U1397 ( .A(n818), .B(reg6[10]), .Z(n1150) );
  NAND2X1 U1398 ( .A(n1155), .B(n1156), .Z(C[0]) );
  NOR2X1 U1399 ( .A(n1157), .B(n1158), .Z(n1156) );
  NAND3X1 U1400 ( .A(n1159), .B(n1160), .C(n1161), .Z(n1158) );
  NOR2X1 U1401 ( .A(n1162), .B(n1163), .Z(n1161) );
  NOR2X1 U1402 ( .A(n49), .B(n789), .Z(n1163) );
  NAND2X1 U1403 ( .A(n1164), .B(n1165), .Z(n789) );
  NOR2X1 U1404 ( .A(n65), .B(n790), .Z(n1162) );
  NAND2X1 U1405 ( .A(n1164), .B(n1166), .Z(n790) );
  NAND2X1 U1406 ( .A(n791), .B(pwm_reg1[0]), .Z(n1160) );
  AND2X1 U1407 ( .A(n1167), .B(n1166), .Z(n791) );
  NAND2X1 U1408 ( .A(n792), .B(pwm_reg0[0]), .Z(n1159) );
  AND2X1 U1409 ( .A(n1167), .B(n1165), .Z(n792) );
  NAND3X1 U1410 ( .A(n1168), .B(n1169), .C(n1170), .Z(n1157) );
  NOR2X1 U1411 ( .A(n1171), .B(n1172), .Z(n1170) );
  NOR2X1 U1412 ( .A(n81), .B(n798), .Z(n1172) );
  NAND2X1 U1413 ( .A(n1165), .B(n1173), .Z(n798) );
  NOR2X1 U1414 ( .A(n33), .B(n799), .Z(n1171) );
  NAND2X1 U1415 ( .A(n1173), .B(n1166), .Z(n799) );
  NAND2X1 U1416 ( .A(n800), .B(pwm_reg5[0]), .Z(n1169) );
  AND2X1 U1417 ( .A(n1174), .B(n1166), .Z(n800) );
  AND2X1 U1418 ( .A(rdDataC[3]), .B(rdDataC[0]), .Z(n1166) );
  NAND2X1 U1419 ( .A(n801), .B(pwm_reg4[0]), .Z(n1168) );
  AND2X1 U1420 ( .A(n1174), .B(n1165), .Z(n801) );
  AND2X1 U1421 ( .A(rdDataC[3]), .B(n2242), .Z(n1165) );
  NOR2X1 U1422 ( .A(n1175), .B(n1176), .Z(n1155) );
  NAND3X1 U1423 ( .A(n1177), .B(n1178), .C(n1179), .Z(n1176) );
  NAND2X1 U1424 ( .A(n807), .B(reg1[0]), .Z(n1179) );
  AND2X1 U1425 ( .A(n1180), .B(n1167), .Z(n807) );
  NOR2X1 U1426 ( .A(rdDataC[2]), .B(rdDataC[1]), .Z(n1167) );
  NAND2X1 U1427 ( .A(n808), .B(reg3[0]), .Z(n1178) );
  AND2X1 U1428 ( .A(n1180), .B(n1164), .Z(n808) );
  NAND2X1 U1429 ( .A(n809), .B(reg2[0]), .Z(n1177) );
  AND2X1 U1430 ( .A(n1181), .B(n1164), .Z(n809) );
  NOR2X1 U1431 ( .A(n2243), .B(rdDataC[2]), .Z(n1164) );
  NAND3X1 U1432 ( .A(n1182), .B(n1183), .C(n1184), .Z(n1175) );
  NOR2X1 U1433 ( .A(n1185), .B(n1186), .Z(n1184) );
  NOR2X1 U1434 ( .A(n17), .B(n815), .Z(n1186) );
  NAND2X1 U1435 ( .A(n1181), .B(n1174), .Z(n815) );
  NOR2X1 U1436 ( .A(n1), .B(n816), .Z(n1185) );
  NAND2X1 U1437 ( .A(n1180), .B(n1174), .Z(n816) );
  NOR2X1 U1438 ( .A(n2244), .B(rdDataC[1]), .Z(n1174) );
  NAND2X1 U1439 ( .A(n817), .B(i2c_slave_addr[0]), .Z(n1183) );
  AND2X1 U1440 ( .A(n1180), .B(n1173), .Z(n817) );
  NOR2X1 U1441 ( .A(n2242), .B(rdDataC[3]), .Z(n1180) );
  NAND2X1 U1442 ( .A(n818), .B(i2c_addr[0]), .Z(n1182) );
  AND2X1 U1443 ( .A(n1181), .B(n1173), .Z(n818) );
  NOR2X1 U1444 ( .A(n2244), .B(n2243), .Z(n1173) );
  NOR2X1 U1445 ( .A(rdDataC[3]), .B(rdDataC[0]), .Z(n1181) );
  NAND2X1 U1446 ( .A(n1187), .B(n1188), .Z(B[9]) );
  NOR2X1 U1447 ( .A(n1189), .B(n1190), .Z(n1188) );
  NAND3X1 U1448 ( .A(n1191), .B(n1192), .C(n1193), .Z(n1190) );
  NOR2X1 U1449 ( .A(n1194), .B(n1195), .Z(n1193) );
  NOR2X1 U1450 ( .A(n58), .B(n1196), .Z(n1195) );
  NOR2X1 U1451 ( .A(n74), .B(n1197), .Z(n1194) );
  NAND2X1 U1452 ( .A(n1198), .B(pwm_reg1[9]), .Z(n1192) );
  NAND2X1 U1453 ( .A(n1199), .B(pwm_reg0[9]), .Z(n1191) );
  NAND3X1 U1454 ( .A(n1200), .B(n1201), .C(n1202), .Z(n1189) );
  NOR2X1 U1455 ( .A(n1203), .B(n1204), .Z(n1202) );
  NOR2X1 U1456 ( .A(n90), .B(n1205), .Z(n1204) );
  NOR2X1 U1457 ( .A(n42), .B(n1206), .Z(n1203) );
  NAND2X1 U1458 ( .A(n1207), .B(pwm_reg5[9]), .Z(n1201) );
  NAND2X1 U1459 ( .A(n1208), .B(pwm_reg4[9]), .Z(n1200) );
  NOR2X1 U1460 ( .A(n1209), .B(n1210), .Z(n1187) );
  NAND3X1 U1461 ( .A(n1211), .B(n1212), .C(n1213), .Z(n1210) );
  NAND2X1 U1462 ( .A(n1214), .B(reg1[9]), .Z(n1213) );
  NAND2X1 U1463 ( .A(n1215), .B(reg3[9]), .Z(n1212) );
  NAND2X1 U1464 ( .A(n1216), .B(reg2[9]), .Z(n1211) );
  NAND3X1 U1465 ( .A(n1217), .B(n1218), .C(n1219), .Z(n1209) );
  NOR2X1 U1466 ( .A(n1220), .B(n1221), .Z(n1219) );
  NOR2X1 U1467 ( .A(n26), .B(n1222), .Z(n1221) );
  NOR2X1 U1468 ( .A(n10), .B(n1223), .Z(n1220) );
  NAND2X1 U1469 ( .A(n1224), .B(reg_file_to_i2c_data[1]), .Z(n1218) );
  NAND2X1 U1470 ( .A(n1225), .B(reg6[9]), .Z(n1217) );
  NAND2X1 U1471 ( .A(n1226), .B(n1227), .Z(B[8]) );
  NOR2X1 U1472 ( .A(n1228), .B(n1229), .Z(n1227) );
  NAND3X1 U1473 ( .A(n1230), .B(n1231), .C(n1232), .Z(n1229) );
  NOR2X1 U1474 ( .A(n1233), .B(n1234), .Z(n1232) );
  NOR2X1 U1475 ( .A(n57), .B(n1196), .Z(n1234) );
  NOR2X1 U1476 ( .A(n73), .B(n1197), .Z(n1233) );
  NAND2X1 U1477 ( .A(n1198), .B(pwm_reg1[8]), .Z(n1231) );
  NAND2X1 U1478 ( .A(n1199), .B(pwm_reg0[8]), .Z(n1230) );
  NAND3X1 U1479 ( .A(n1235), .B(n1236), .C(n1237), .Z(n1228) );
  NOR2X1 U1480 ( .A(n1238), .B(n1239), .Z(n1237) );
  NOR2X1 U1481 ( .A(n89), .B(n1205), .Z(n1239) );
  NOR2X1 U1482 ( .A(n41), .B(n1206), .Z(n1238) );
  NAND2X1 U1483 ( .A(n1207), .B(pwm_reg5[8]), .Z(n1236) );
  NAND2X1 U1484 ( .A(n1208), .B(pwm_reg4[8]), .Z(n1235) );
  NOR2X1 U1485 ( .A(n1240), .B(n1241), .Z(n1226) );
  NAND3X1 U1486 ( .A(n1242), .B(n1243), .C(n1244), .Z(n1241) );
  NAND2X1 U1487 ( .A(n1214), .B(reg1[8]), .Z(n1244) );
  NAND2X1 U1488 ( .A(n1215), .B(reg3[8]), .Z(n1243) );
  NAND2X1 U1489 ( .A(n1216), .B(reg2[8]), .Z(n1242) );
  NAND3X1 U1490 ( .A(n1245), .B(n1246), .C(n1247), .Z(n1240) );
  NOR2X1 U1491 ( .A(n1248), .B(n1249), .Z(n1247) );
  NOR2X1 U1492 ( .A(n25), .B(n1222), .Z(n1249) );
  NOR2X1 U1493 ( .A(n9), .B(n1223), .Z(n1248) );
  NAND2X1 U1494 ( .A(n1224), .B(reg_file_to_i2c_data[0]), .Z(n1246) );
  NAND2X1 U1495 ( .A(n1225), .B(i2c_addr[8]), .Z(n1245) );
  NAND2X1 U1496 ( .A(n1250), .B(n1251), .Z(B[7]) );
  NOR2X1 U1497 ( .A(n1252), .B(n1253), .Z(n1251) );
  NAND3X1 U1498 ( .A(n1254), .B(n1255), .C(n1256), .Z(n1253) );
  NOR2X1 U1499 ( .A(n1257), .B(n1258), .Z(n1256) );
  NOR2X1 U1500 ( .A(n56), .B(n1196), .Z(n1258) );
  NOR2X1 U1501 ( .A(n72), .B(n1197), .Z(n1257) );
  NAND2X1 U1502 ( .A(n1198), .B(pwm_reg1[7]), .Z(n1255) );
  NAND2X1 U1503 ( .A(n1199), .B(pwm_reg0[7]), .Z(n1254) );
  NAND3X1 U1504 ( .A(n1259), .B(n1260), .C(n1261), .Z(n1252) );
  NOR2X1 U1505 ( .A(n1262), .B(n1263), .Z(n1261) );
  NOR2X1 U1506 ( .A(n88), .B(n1205), .Z(n1263) );
  NOR2X1 U1507 ( .A(n40), .B(n1206), .Z(n1262) );
  NAND2X1 U1508 ( .A(n1207), .B(pwm_reg5[7]), .Z(n1260) );
  NAND2X1 U1509 ( .A(n1208), .B(pwm_reg4[7]), .Z(n1259) );
  NOR2X1 U1510 ( .A(n1264), .B(n1265), .Z(n1250) );
  NAND3X1 U1511 ( .A(n1266), .B(n1267), .C(n1268), .Z(n1265) );
  NAND2X1 U1512 ( .A(n1214), .B(reg1[7]), .Z(n1268) );
  NAND2X1 U1513 ( .A(n1215), .B(reg3[7]), .Z(n1267) );
  NAND2X1 U1514 ( .A(n1216), .B(reg2[7]), .Z(n1266) );
  NAND3X1 U1515 ( .A(n1269), .B(n1270), .C(n1271), .Z(n1264) );
  NOR2X1 U1516 ( .A(n1272), .B(n1273), .Z(n1271) );
  NOR2X1 U1517 ( .A(n24), .B(n1222), .Z(n1273) );
  NOR2X1 U1518 ( .A(n8), .B(n1223), .Z(n1272) );
  NAND2X1 U1519 ( .A(n1224), .B(i2c_slave_addr[7]), .Z(n1270) );
  NAND2X1 U1520 ( .A(n1225), .B(i2c_addr[7]), .Z(n1269) );
  NAND2X1 U1521 ( .A(n1274), .B(n1275), .Z(B[6]) );
  NOR2X1 U1522 ( .A(n1276), .B(n1277), .Z(n1275) );
  NAND3X1 U1523 ( .A(n1278), .B(n1279), .C(n1280), .Z(n1277) );
  NOR2X1 U1524 ( .A(n1281), .B(n1282), .Z(n1280) );
  NOR2X1 U1525 ( .A(n55), .B(n1196), .Z(n1282) );
  NOR2X1 U1526 ( .A(n71), .B(n1197), .Z(n1281) );
  NAND2X1 U1527 ( .A(n1198), .B(pwm_reg1[6]), .Z(n1279) );
  NAND2X1 U1528 ( .A(n1199), .B(pwm_reg0[6]), .Z(n1278) );
  NAND3X1 U1529 ( .A(n1283), .B(n1284), .C(n1285), .Z(n1276) );
  NOR2X1 U1530 ( .A(n1286), .B(n1287), .Z(n1285) );
  NOR2X1 U1531 ( .A(n87), .B(n1205), .Z(n1287) );
  NOR2X1 U1532 ( .A(n39), .B(n1206), .Z(n1286) );
  NAND2X1 U1533 ( .A(n1207), .B(pwm_reg5[6]), .Z(n1284) );
  NAND2X1 U1534 ( .A(n1208), .B(pwm_reg4[6]), .Z(n1283) );
  NOR2X1 U1535 ( .A(n1288), .B(n1289), .Z(n1274) );
  NAND3X1 U1536 ( .A(n1290), .B(n1291), .C(n1292), .Z(n1289) );
  NAND2X1 U1537 ( .A(n1214), .B(reg1[6]), .Z(n1292) );
  NAND2X1 U1538 ( .A(n1215), .B(reg3[6]), .Z(n1291) );
  NAND2X1 U1539 ( .A(n1216), .B(reg2[6]), .Z(n1290) );
  NAND3X1 U1540 ( .A(n1293), .B(n1294), .C(n1295), .Z(n1288) );
  NOR2X1 U1541 ( .A(n1296), .B(n1297), .Z(n1295) );
  NOR2X1 U1542 ( .A(n23), .B(n1222), .Z(n1297) );
  NOR2X1 U1543 ( .A(n7), .B(n1223), .Z(n1296) );
  NAND2X1 U1544 ( .A(n1224), .B(i2c_slave_addr[6]), .Z(n1294) );
  NAND2X1 U1545 ( .A(n1225), .B(i2c_addr[6]), .Z(n1293) );
  NAND2X1 U1546 ( .A(n1298), .B(n1299), .Z(B[5]) );
  NOR2X1 U1547 ( .A(n1300), .B(n1301), .Z(n1299) );
  NAND3X1 U1548 ( .A(n1302), .B(n1303), .C(n1304), .Z(n1301) );
  NOR2X1 U1549 ( .A(n1305), .B(n1306), .Z(n1304) );
  NOR2X1 U1550 ( .A(n54), .B(n1196), .Z(n1306) );
  NOR2X1 U1551 ( .A(n70), .B(n1197), .Z(n1305) );
  NAND2X1 U1552 ( .A(n1198), .B(pwm_reg1[5]), .Z(n1303) );
  NAND2X1 U1553 ( .A(n1199), .B(pwm_reg0[5]), .Z(n1302) );
  NAND3X1 U1554 ( .A(n1307), .B(n1308), .C(n1309), .Z(n1300) );
  NOR2X1 U1555 ( .A(n1310), .B(n1311), .Z(n1309) );
  NOR2X1 U1556 ( .A(n86), .B(n1205), .Z(n1311) );
  NOR2X1 U1557 ( .A(n38), .B(n1206), .Z(n1310) );
  NAND2X1 U1558 ( .A(n1207), .B(pwm_reg5[5]), .Z(n1308) );
  NAND2X1 U1559 ( .A(n1208), .B(pwm_reg4[5]), .Z(n1307) );
  NOR2X1 U1560 ( .A(n1312), .B(n1313), .Z(n1298) );
  NAND3X1 U1561 ( .A(n1314), .B(n1315), .C(n1316), .Z(n1313) );
  NAND2X1 U1562 ( .A(n1214), .B(reg1[5]), .Z(n1316) );
  NAND2X1 U1563 ( .A(n1215), .B(reg3[5]), .Z(n1315) );
  NAND2X1 U1564 ( .A(n1216), .B(reg2[5]), .Z(n1314) );
  NAND3X1 U1565 ( .A(n1317), .B(n1318), .C(n1319), .Z(n1312) );
  NOR2X1 U1566 ( .A(n1320), .B(n1321), .Z(n1319) );
  NOR2X1 U1567 ( .A(n22), .B(n1222), .Z(n1321) );
  NOR2X1 U1568 ( .A(n6), .B(n1223), .Z(n1320) );
  NAND2X1 U1569 ( .A(n1224), .B(i2c_slave_addr[5]), .Z(n1318) );
  NAND2X1 U1570 ( .A(n1225), .B(i2c_addr[5]), .Z(n1317) );
  NAND2X1 U1571 ( .A(n1322), .B(n1323), .Z(B[4]) );
  NOR2X1 U1572 ( .A(n1324), .B(n1325), .Z(n1323) );
  NAND3X1 U1573 ( .A(n1326), .B(n1327), .C(n1328), .Z(n1325) );
  NOR2X1 U1574 ( .A(n1329), .B(n1330), .Z(n1328) );
  NOR2X1 U1575 ( .A(n53), .B(n1196), .Z(n1330) );
  NOR2X1 U1576 ( .A(n69), .B(n1197), .Z(n1329) );
  NAND2X1 U1577 ( .A(n1198), .B(pwm_reg1[4]), .Z(n1327) );
  NAND2X1 U1578 ( .A(n1199), .B(pwm_reg0[4]), .Z(n1326) );
  NAND3X1 U1579 ( .A(n1331), .B(n1332), .C(n1333), .Z(n1324) );
  NOR2X1 U1580 ( .A(n1334), .B(n1335), .Z(n1333) );
  NOR2X1 U1581 ( .A(n85), .B(n1205), .Z(n1335) );
  NOR2X1 U1582 ( .A(n37), .B(n1206), .Z(n1334) );
  NAND2X1 U1583 ( .A(n1207), .B(pwm_reg5[4]), .Z(n1332) );
  NAND2X1 U1584 ( .A(n1208), .B(pwm_reg4[4]), .Z(n1331) );
  NOR2X1 U1585 ( .A(n1336), .B(n1337), .Z(n1322) );
  NAND3X1 U1586 ( .A(n1338), .B(n1339), .C(n1340), .Z(n1337) );
  NAND2X1 U1587 ( .A(n1214), .B(reg1[4]), .Z(n1340) );
  NAND2X1 U1588 ( .A(n1215), .B(reg3[4]), .Z(n1339) );
  NAND2X1 U1589 ( .A(n1216), .B(reg2[4]), .Z(n1338) );
  NAND3X1 U1590 ( .A(n1341), .B(n1342), .C(n1343), .Z(n1336) );
  NOR2X1 U1591 ( .A(n1344), .B(n1345), .Z(n1343) );
  NOR2X1 U1592 ( .A(n21), .B(n1222), .Z(n1345) );
  NOR2X1 U1593 ( .A(n5), .B(n1223), .Z(n1344) );
  NAND2X1 U1594 ( .A(n1224), .B(i2c_slave_addr[4]), .Z(n1342) );
  NAND2X1 U1595 ( .A(n1225), .B(i2c_addr[4]), .Z(n1341) );
  NAND2X1 U1596 ( .A(n1346), .B(n1347), .Z(B[3]) );
  NOR2X1 U1597 ( .A(n1348), .B(n1349), .Z(n1347) );
  NAND3X1 U1598 ( .A(n1350), .B(n1351), .C(n1352), .Z(n1349) );
  NOR2X1 U1599 ( .A(n1353), .B(n1354), .Z(n1352) );
  NOR2X1 U1600 ( .A(n52), .B(n1196), .Z(n1354) );
  NOR2X1 U1601 ( .A(n68), .B(n1197), .Z(n1353) );
  NAND2X1 U1602 ( .A(n1198), .B(pwm_reg1[3]), .Z(n1351) );
  NAND2X1 U1603 ( .A(n1199), .B(pwm_reg0[3]), .Z(n1350) );
  NAND3X1 U1604 ( .A(n1355), .B(n1356), .C(n1357), .Z(n1348) );
  NOR2X1 U1605 ( .A(n1358), .B(n1359), .Z(n1357) );
  NOR2X1 U1606 ( .A(n84), .B(n1205), .Z(n1359) );
  NOR2X1 U1607 ( .A(n36), .B(n1206), .Z(n1358) );
  NAND2X1 U1608 ( .A(n1207), .B(pwm_reg5[3]), .Z(n1356) );
  NAND2X1 U1609 ( .A(n1208), .B(pwm_reg4[3]), .Z(n1355) );
  NOR2X1 U1610 ( .A(n1360), .B(n1361), .Z(n1346) );
  NAND3X1 U1611 ( .A(n1362), .B(n1363), .C(n1364), .Z(n1361) );
  NAND2X1 U1612 ( .A(n1214), .B(reg1[3]), .Z(n1364) );
  NAND2X1 U1613 ( .A(n1215), .B(reg3[3]), .Z(n1363) );
  NAND2X1 U1614 ( .A(n1216), .B(reg2[3]), .Z(n1362) );
  NAND3X1 U1615 ( .A(n1365), .B(n1366), .C(n1367), .Z(n1360) );
  NOR2X1 U1616 ( .A(n1368), .B(n1369), .Z(n1367) );
  NOR2X1 U1617 ( .A(n20), .B(n1222), .Z(n1369) );
  NOR2X1 U1618 ( .A(n4), .B(n1223), .Z(n1368) );
  NAND2X1 U1619 ( .A(n1224), .B(i2c_slave_addr[3]), .Z(n1366) );
  NAND2X1 U1620 ( .A(n1225), .B(i2c_addr[3]), .Z(n1365) );
  NAND2X1 U1621 ( .A(n1370), .B(n1371), .Z(B[2]) );
  NOR2X1 U1622 ( .A(n1372), .B(n1373), .Z(n1371) );
  NAND3X1 U1623 ( .A(n1374), .B(n1375), .C(n1376), .Z(n1373) );
  NOR2X1 U1624 ( .A(n1377), .B(n1378), .Z(n1376) );
  NOR2X1 U1625 ( .A(n51), .B(n1196), .Z(n1378) );
  NOR2X1 U1626 ( .A(n67), .B(n1197), .Z(n1377) );
  NAND2X1 U1627 ( .A(n1198), .B(pwm_reg1[2]), .Z(n1375) );
  NAND2X1 U1628 ( .A(n1199), .B(pwm_reg0[2]), .Z(n1374) );
  NAND3X1 U1629 ( .A(n1379), .B(n1380), .C(n1381), .Z(n1372) );
  NOR2X1 U1630 ( .A(n1382), .B(n1383), .Z(n1381) );
  NOR2X1 U1631 ( .A(n83), .B(n1205), .Z(n1383) );
  NOR2X1 U1632 ( .A(n35), .B(n1206), .Z(n1382) );
  NAND2X1 U1633 ( .A(n1207), .B(pwm_reg5[2]), .Z(n1380) );
  NAND2X1 U1634 ( .A(n1208), .B(pwm_reg4[2]), .Z(n1379) );
  NOR2X1 U1635 ( .A(n1384), .B(n1385), .Z(n1370) );
  NAND3X1 U1636 ( .A(n1386), .B(n1387), .C(n1388), .Z(n1385) );
  NAND2X1 U1637 ( .A(n1214), .B(reg1[2]), .Z(n1388) );
  NAND2X1 U1638 ( .A(n1215), .B(reg3[2]), .Z(n1387) );
  NAND2X1 U1639 ( .A(n1216), .B(reg2[2]), .Z(n1386) );
  NAND3X1 U1640 ( .A(n1389), .B(n1390), .C(n1391), .Z(n1384) );
  NOR2X1 U1641 ( .A(n1392), .B(n1393), .Z(n1391) );
  NOR2X1 U1642 ( .A(n19), .B(n1222), .Z(n1393) );
  NOR2X1 U1643 ( .A(n3), .B(n1223), .Z(n1392) );
  NAND2X1 U1644 ( .A(n1224), .B(i2c_slave_addr[2]), .Z(n1390) );
  NAND2X1 U1645 ( .A(n1225), .B(i2c_addr[2]), .Z(n1389) );
  NAND2X1 U1646 ( .A(n1394), .B(n1395), .Z(B[1]) );
  NOR2X1 U1647 ( .A(n1396), .B(n1397), .Z(n1395) );
  NAND3X1 U1648 ( .A(n1398), .B(n1399), .C(n1400), .Z(n1397) );
  NOR2X1 U1649 ( .A(n1401), .B(n1402), .Z(n1400) );
  NOR2X1 U1650 ( .A(n50), .B(n1196), .Z(n1402) );
  NOR2X1 U1651 ( .A(n66), .B(n1197), .Z(n1401) );
  NAND2X1 U1652 ( .A(n1198), .B(pwm_reg1[1]), .Z(n1399) );
  NAND2X1 U1653 ( .A(n1199), .B(pwm_reg0[1]), .Z(n1398) );
  NAND3X1 U1654 ( .A(n1403), .B(n1404), .C(n1405), .Z(n1396) );
  NOR2X1 U1655 ( .A(n1406), .B(n1407), .Z(n1405) );
  NOR2X1 U1656 ( .A(n82), .B(n1205), .Z(n1407) );
  NOR2X1 U1657 ( .A(n34), .B(n1206), .Z(n1406) );
  NAND2X1 U1658 ( .A(n1207), .B(pwm_reg5[1]), .Z(n1404) );
  NAND2X1 U1659 ( .A(n1208), .B(pwm_reg4[1]), .Z(n1403) );
  NOR2X1 U1660 ( .A(n1408), .B(n1409), .Z(n1394) );
  NAND3X1 U1661 ( .A(n1410), .B(n1411), .C(n1412), .Z(n1409) );
  NAND2X1 U1662 ( .A(n1214), .B(reg1[1]), .Z(n1412) );
  NAND2X1 U1663 ( .A(n1215), .B(reg3[1]), .Z(n1411) );
  NAND2X1 U1664 ( .A(n1216), .B(reg2[1]), .Z(n1410) );
  NAND3X1 U1665 ( .A(n1413), .B(n1414), .C(n1415), .Z(n1408) );
  NOR2X1 U1666 ( .A(n1416), .B(n1417), .Z(n1415) );
  NOR2X1 U1667 ( .A(n18), .B(n1222), .Z(n1417) );
  NOR2X1 U1668 ( .A(n2), .B(n1223), .Z(n1416) );
  NAND2X1 U1669 ( .A(n1224), .B(i2c_slave_addr[1]), .Z(n1414) );
  NAND2X1 U1670 ( .A(n1225), .B(i2c_addr[1]), .Z(n1413) );
  NAND2X1 U1671 ( .A(n1418), .B(n1419), .Z(B[15]) );
  NOR2X1 U1672 ( .A(n1420), .B(n1421), .Z(n1419) );
  NAND3X1 U1673 ( .A(n1422), .B(n1423), .C(n1424), .Z(n1421) );
  NOR2X1 U1674 ( .A(n1425), .B(n1426), .Z(n1424) );
  NOR2X1 U1675 ( .A(n64), .B(n1196), .Z(n1426) );
  NOR2X1 U1676 ( .A(n80), .B(n1197), .Z(n1425) );
  NAND2X1 U1677 ( .A(n1198), .B(pwm_reg1[15]), .Z(n1423) );
  NAND2X1 U1678 ( .A(n1199), .B(pwm_reg0[15]), .Z(n1422) );
  NAND3X1 U1679 ( .A(n1427), .B(n1428), .C(n1429), .Z(n1420) );
  NOR2X1 U1680 ( .A(n1430), .B(n1431), .Z(n1429) );
  NOR2X1 U1681 ( .A(n96), .B(n1205), .Z(n1431) );
  NOR2X1 U1682 ( .A(n48), .B(n1206), .Z(n1430) );
  NAND2X1 U1683 ( .A(n1207), .B(pwm_reg5[15]), .Z(n1428) );
  NAND2X1 U1684 ( .A(n1208), .B(pwm_reg4[15]), .Z(n1427) );
  NOR2X1 U1685 ( .A(n1432), .B(n1433), .Z(n1418) );
  NAND3X1 U1686 ( .A(n1434), .B(n1435), .C(n1436), .Z(n1433) );
  NAND2X1 U1687 ( .A(n1214), .B(reg1[15]), .Z(n1436) );
  NAND2X1 U1688 ( .A(n1215), .B(reg3[15]), .Z(n1435) );
  NAND2X1 U1689 ( .A(n1216), .B(reg2[15]), .Z(n1434) );
  NAND3X1 U1690 ( .A(n1437), .B(n1438), .C(n1439), .Z(n1432) );
  NOR2X1 U1691 ( .A(n1440), .B(n1441), .Z(n1439) );
  NOR2X1 U1692 ( .A(n32), .B(n1222), .Z(n1441) );
  NOR2X1 U1693 ( .A(n16), .B(n1223), .Z(n1440) );
  NAND2X1 U1694 ( .A(n1224), .B(reg_file_to_i2c_data[7]), .Z(n1438) );
  NAND2X1 U1695 ( .A(n1225), .B(reg6[15]), .Z(n1437) );
  NAND2X1 U1696 ( .A(n1442), .B(n1443), .Z(B[14]) );
  NOR2X1 U1697 ( .A(n1444), .B(n1445), .Z(n1443) );
  NAND3X1 U1698 ( .A(n1446), .B(n1447), .C(n1448), .Z(n1445) );
  NOR2X1 U1699 ( .A(n1449), .B(n1450), .Z(n1448) );
  NOR2X1 U1700 ( .A(n63), .B(n1196), .Z(n1450) );
  NOR2X1 U1701 ( .A(n79), .B(n1197), .Z(n1449) );
  NAND2X1 U1702 ( .A(n1198), .B(pwm_reg1[14]), .Z(n1447) );
  NAND2X1 U1703 ( .A(n1199), .B(pwm_reg0[14]), .Z(n1446) );
  NAND3X1 U1704 ( .A(n1451), .B(n1452), .C(n1453), .Z(n1444) );
  NOR2X1 U1705 ( .A(n1454), .B(n1455), .Z(n1453) );
  NOR2X1 U1706 ( .A(n95), .B(n1205), .Z(n1455) );
  NOR2X1 U1707 ( .A(n47), .B(n1206), .Z(n1454) );
  NAND2X1 U1708 ( .A(n1207), .B(pwm_reg5[14]), .Z(n1452) );
  NAND2X1 U1709 ( .A(n1208), .B(pwm_reg4[14]), .Z(n1451) );
  NOR2X1 U1710 ( .A(n1456), .B(n1457), .Z(n1442) );
  NAND3X1 U1711 ( .A(n1458), .B(n1459), .C(n1460), .Z(n1457) );
  NAND2X1 U1712 ( .A(n1214), .B(reg1[14]), .Z(n1460) );
  NAND2X1 U1713 ( .A(n1215), .B(reg3[14]), .Z(n1459) );
  NAND2X1 U1714 ( .A(n1216), .B(reg2[14]), .Z(n1458) );
  NAND3X1 U1715 ( .A(n1461), .B(n1462), .C(n1463), .Z(n1456) );
  NOR2X1 U1716 ( .A(n1464), .B(n1465), .Z(n1463) );
  NOR2X1 U1717 ( .A(n31), .B(n1222), .Z(n1465) );
  NOR2X1 U1718 ( .A(n15), .B(n1223), .Z(n1464) );
  NAND2X1 U1719 ( .A(n1224), .B(reg_file_to_i2c_data[6]), .Z(n1462) );
  NAND2X1 U1720 ( .A(n1225), .B(reg6[14]), .Z(n1461) );
  NAND2X1 U1721 ( .A(n1466), .B(n1467), .Z(B[13]) );
  NOR2X1 U1722 ( .A(n1468), .B(n1469), .Z(n1467) );
  NAND3X1 U1723 ( .A(n1470), .B(n1471), .C(n1472), .Z(n1469) );
  NOR2X1 U1724 ( .A(n1473), .B(n1474), .Z(n1472) );
  NOR2X1 U1725 ( .A(n62), .B(n1196), .Z(n1474) );
  NOR2X1 U1726 ( .A(n78), .B(n1197), .Z(n1473) );
  NAND2X1 U1727 ( .A(n1198), .B(pwm_reg1[13]), .Z(n1471) );
  NAND2X1 U1728 ( .A(n1199), .B(pwm_reg0[13]), .Z(n1470) );
  NAND3X1 U1729 ( .A(n1475), .B(n1476), .C(n1477), .Z(n1468) );
  NOR2X1 U1730 ( .A(n1478), .B(n1479), .Z(n1477) );
  NOR2X1 U1731 ( .A(n94), .B(n1205), .Z(n1479) );
  NOR2X1 U1732 ( .A(n46), .B(n1206), .Z(n1478) );
  NAND2X1 U1733 ( .A(n1207), .B(pwm_reg5[13]), .Z(n1476) );
  NAND2X1 U1734 ( .A(n1208), .B(pwm_reg4[13]), .Z(n1475) );
  NOR2X1 U1735 ( .A(n1480), .B(n1481), .Z(n1466) );
  NAND3X1 U1736 ( .A(n1482), .B(n1483), .C(n1484), .Z(n1481) );
  NAND2X1 U1737 ( .A(n1214), .B(reg1[13]), .Z(n1484) );
  NAND2X1 U1738 ( .A(n1215), .B(reg3[13]), .Z(n1483) );
  NAND2X1 U1739 ( .A(n1216), .B(reg2[13]), .Z(n1482) );
  NAND3X1 U1740 ( .A(n1485), .B(n1486), .C(n1487), .Z(n1480) );
  NOR2X1 U1741 ( .A(n1488), .B(n1489), .Z(n1487) );
  NOR2X1 U1742 ( .A(n30), .B(n1222), .Z(n1489) );
  NOR2X1 U1743 ( .A(n14), .B(n1223), .Z(n1488) );
  NAND2X1 U1744 ( .A(n1224), .B(reg_file_to_i2c_data[5]), .Z(n1486) );
  NAND2X1 U1745 ( .A(n1225), .B(reg6[13]), .Z(n1485) );
  NAND2X1 U1746 ( .A(n1490), .B(n1491), .Z(B[12]) );
  NOR2X1 U1747 ( .A(n1492), .B(n1493), .Z(n1491) );
  NAND3X1 U1748 ( .A(n1494), .B(n1495), .C(n1496), .Z(n1493) );
  NOR2X1 U1749 ( .A(n1497), .B(n1498), .Z(n1496) );
  NOR2X1 U1750 ( .A(n61), .B(n1196), .Z(n1498) );
  NOR2X1 U1751 ( .A(n77), .B(n1197), .Z(n1497) );
  NAND2X1 U1752 ( .A(n1198), .B(pwm_reg1[12]), .Z(n1495) );
  NAND2X1 U1753 ( .A(n1199), .B(pwm_reg0[12]), .Z(n1494) );
  NAND3X1 U1754 ( .A(n1499), .B(n1500), .C(n1501), .Z(n1492) );
  NOR2X1 U1755 ( .A(n1502), .B(n1503), .Z(n1501) );
  NOR2X1 U1756 ( .A(n93), .B(n1205), .Z(n1503) );
  NOR2X1 U1757 ( .A(n45), .B(n1206), .Z(n1502) );
  NAND2X1 U1758 ( .A(n1207), .B(pwm_reg5[12]), .Z(n1500) );
  NAND2X1 U1759 ( .A(n1208), .B(pwm_reg4[12]), .Z(n1499) );
  NOR2X1 U1760 ( .A(n1504), .B(n1505), .Z(n1490) );
  NAND3X1 U1761 ( .A(n1506), .B(n1507), .C(n1508), .Z(n1505) );
  NAND2X1 U1762 ( .A(n1214), .B(reg1[12]), .Z(n1508) );
  NAND2X1 U1763 ( .A(n1215), .B(reg3[12]), .Z(n1507) );
  NAND2X1 U1764 ( .A(n1216), .B(reg2[12]), .Z(n1506) );
  NAND3X1 U1765 ( .A(n1509), .B(n1510), .C(n1511), .Z(n1504) );
  NOR2X1 U1766 ( .A(n1512), .B(n1513), .Z(n1511) );
  NOR2X1 U1767 ( .A(n29), .B(n1222), .Z(n1513) );
  NOR2X1 U1768 ( .A(n13), .B(n1223), .Z(n1512) );
  NAND2X1 U1769 ( .A(n1224), .B(reg_file_to_i2c_data[4]), .Z(n1510) );
  NAND2X1 U1770 ( .A(n1225), .B(reg6[12]), .Z(n1509) );
  NAND2X1 U1771 ( .A(n1514), .B(n1515), .Z(B[11]) );
  NOR2X1 U1772 ( .A(n1516), .B(n1517), .Z(n1515) );
  NAND3X1 U1773 ( .A(n1518), .B(n1519), .C(n1520), .Z(n1517) );
  NOR2X1 U1774 ( .A(n1521), .B(n1522), .Z(n1520) );
  NOR2X1 U1775 ( .A(n60), .B(n1196), .Z(n1522) );
  NOR2X1 U1776 ( .A(n76), .B(n1197), .Z(n1521) );
  NAND2X1 U1777 ( .A(n1198), .B(pwm_reg1[11]), .Z(n1519) );
  NAND2X1 U1778 ( .A(n1199), .B(pwm_reg0[11]), .Z(n1518) );
  NAND3X1 U1779 ( .A(n1523), .B(n1524), .C(n1525), .Z(n1516) );
  NOR2X1 U1780 ( .A(n1526), .B(n1527), .Z(n1525) );
  NOR2X1 U1781 ( .A(n92), .B(n1205), .Z(n1527) );
  NOR2X1 U1782 ( .A(n44), .B(n1206), .Z(n1526) );
  NAND2X1 U1783 ( .A(n1207), .B(pwm_reg5[11]), .Z(n1524) );
  NAND2X1 U1784 ( .A(n1208), .B(pwm_reg4[11]), .Z(n1523) );
  NOR2X1 U1785 ( .A(n1528), .B(n1529), .Z(n1514) );
  NAND3X1 U1786 ( .A(n1530), .B(n1531), .C(n1532), .Z(n1529) );
  NAND2X1 U1787 ( .A(n1214), .B(reg1[11]), .Z(n1532) );
  NAND2X1 U1788 ( .A(n1215), .B(reg3[11]), .Z(n1531) );
  NAND2X1 U1789 ( .A(n1216), .B(reg2[11]), .Z(n1530) );
  NAND3X1 U1790 ( .A(n1533), .B(n1534), .C(n1535), .Z(n1528) );
  NOR2X1 U1791 ( .A(n1536), .B(n1537), .Z(n1535) );
  NOR2X1 U1792 ( .A(n28), .B(n1222), .Z(n1537) );
  NOR2X1 U1793 ( .A(n12), .B(n1223), .Z(n1536) );
  NAND2X1 U1794 ( .A(n1224), .B(reg_file_to_i2c_data[3]), .Z(n1534) );
  NAND2X1 U1795 ( .A(n1225), .B(reg6[11]), .Z(n1533) );
  NAND2X1 U1796 ( .A(n1538), .B(n1539), .Z(B[10]) );
  NOR2X1 U1797 ( .A(n1540), .B(n1541), .Z(n1539) );
  NAND3X1 U1798 ( .A(n1542), .B(n1543), .C(n1544), .Z(n1541) );
  NOR2X1 U1799 ( .A(n1545), .B(n1546), .Z(n1544) );
  NOR2X1 U1800 ( .A(n59), .B(n1196), .Z(n1546) );
  NOR2X1 U1801 ( .A(n75), .B(n1197), .Z(n1545) );
  NAND2X1 U1802 ( .A(n1198), .B(pwm_reg1[10]), .Z(n1543) );
  NAND2X1 U1803 ( .A(n1199), .B(pwm_reg0[10]), .Z(n1542) );
  NAND3X1 U1804 ( .A(n1547), .B(n1548), .C(n1549), .Z(n1540) );
  NOR2X1 U1805 ( .A(n1550), .B(n1551), .Z(n1549) );
  NOR2X1 U1806 ( .A(n91), .B(n1205), .Z(n1551) );
  NOR2X1 U1807 ( .A(n43), .B(n1206), .Z(n1550) );
  NAND2X1 U1808 ( .A(n1207), .B(pwm_reg5[10]), .Z(n1548) );
  NAND2X1 U1809 ( .A(n1208), .B(pwm_reg4[10]), .Z(n1547) );
  NOR2X1 U1810 ( .A(n1552), .B(n1553), .Z(n1538) );
  NAND3X1 U1811 ( .A(n1554), .B(n1555), .C(n1556), .Z(n1553) );
  NAND2X1 U1812 ( .A(n1214), .B(reg1[10]), .Z(n1556) );
  NAND2X1 U1813 ( .A(n1215), .B(reg3[10]), .Z(n1555) );
  NAND2X1 U1814 ( .A(n1216), .B(reg2[10]), .Z(n1554) );
  NAND3X1 U1815 ( .A(n1557), .B(n1558), .C(n1559), .Z(n1552) );
  NOR2X1 U1816 ( .A(n1560), .B(n1561), .Z(n1559) );
  NOR2X1 U1817 ( .A(n27), .B(n1222), .Z(n1561) );
  NOR2X1 U1818 ( .A(n11), .B(n1223), .Z(n1560) );
  NAND2X1 U1819 ( .A(n1224), .B(reg_file_to_i2c_data[2]), .Z(n1558) );
  NAND2X1 U1820 ( .A(n1225), .B(reg6[10]), .Z(n1557) );
  NAND2X1 U1821 ( .A(n1562), .B(n1563), .Z(B[0]) );
  NOR2X1 U1822 ( .A(n1564), .B(n1565), .Z(n1563) );
  NAND3X1 U1823 ( .A(n1566), .B(n1567), .C(n1568), .Z(n1565) );
  NOR2X1 U1824 ( .A(n1569), .B(n1570), .Z(n1568) );
  NOR2X1 U1825 ( .A(n49), .B(n1196), .Z(n1570) );
  NAND2X1 U1826 ( .A(n1571), .B(n1572), .Z(n1196) );
  NOR2X1 U1827 ( .A(n65), .B(n1197), .Z(n1569) );
  NAND2X1 U1828 ( .A(n1571), .B(n1573), .Z(n1197) );
  NAND2X1 U1829 ( .A(n1198), .B(pwm_reg1[0]), .Z(n1567) );
  AND2X1 U1830 ( .A(n1574), .B(n1573), .Z(n1198) );
  NAND2X1 U1831 ( .A(n1199), .B(pwm_reg0[0]), .Z(n1566) );
  AND2X1 U1832 ( .A(n1574), .B(n1572), .Z(n1199) );
  NAND3X1 U1833 ( .A(n1575), .B(n1576), .C(n1577), .Z(n1564) );
  NOR2X1 U1834 ( .A(n1578), .B(n1579), .Z(n1577) );
  NOR2X1 U1835 ( .A(n81), .B(n1205), .Z(n1579) );
  NAND2X1 U1836 ( .A(n1572), .B(n1580), .Z(n1205) );
  NOR2X1 U1837 ( .A(n33), .B(n1206), .Z(n1578) );
  NAND2X1 U1838 ( .A(n1580), .B(n1573), .Z(n1206) );
  NAND2X1 U1839 ( .A(n1207), .B(pwm_reg5[0]), .Z(n1576) );
  AND2X1 U1840 ( .A(n1581), .B(n1573), .Z(n1207) );
  AND2X1 U1841 ( .A(rdDataB[3]), .B(rdDataB[0]), .Z(n1573) );
  NAND2X1 U1842 ( .A(n1208), .B(pwm_reg4[0]), .Z(n1575) );
  AND2X1 U1843 ( .A(n1581), .B(n1572), .Z(n1208) );
  AND2X1 U1844 ( .A(rdDataB[3]), .B(n222), .Z(n1572) );
  NOR2X1 U1845 ( .A(n1582), .B(n1583), .Z(n1562) );
  NAND3X1 U1846 ( .A(n1584), .B(n1585), .C(n1586), .Z(n1583) );
  NAND2X1 U1847 ( .A(n1214), .B(reg1[0]), .Z(n1586) );
  AND2X1 U1848 ( .A(n1587), .B(n1574), .Z(n1214) );
  NOR2X1 U1849 ( .A(rdDataB[2]), .B(rdDataB[1]), .Z(n1574) );
  NAND2X1 U1850 ( .A(n1215), .B(reg3[0]), .Z(n1585) );
  AND2X1 U1851 ( .A(n1587), .B(n1571), .Z(n1215) );
  NAND2X1 U1852 ( .A(n1216), .B(reg2[0]), .Z(n1584) );
  AND2X1 U1853 ( .A(n1588), .B(n1571), .Z(n1216) );
  NOR2X1 U1854 ( .A(n223), .B(rdDataB[2]), .Z(n1571) );
  NAND3X1 U1855 ( .A(n1589), .B(n1590), .C(n1591), .Z(n1582) );
  NOR2X1 U1856 ( .A(n1592), .B(n1593), .Z(n1591) );
  NOR2X1 U1857 ( .A(n17), .B(n1222), .Z(n1593) );
  NAND2X1 U1858 ( .A(n1588), .B(n1581), .Z(n1222) );
  NOR2X1 U1859 ( .A(n1), .B(n1223), .Z(n1592) );
  NAND2X1 U1860 ( .A(n1587), .B(n1581), .Z(n1223) );
  NOR2X1 U1861 ( .A(n2241), .B(rdDataB[1]), .Z(n1581) );
  NAND2X1 U1862 ( .A(n1224), .B(i2c_slave_addr[0]), .Z(n1590) );
  AND2X1 U1863 ( .A(n1587), .B(n1580), .Z(n1224) );
  NOR2X1 U1864 ( .A(n222), .B(rdDataB[3]), .Z(n1587) );
  NAND2X1 U1865 ( .A(n1225), .B(i2c_addr[0]), .Z(n1589) );
  AND2X1 U1866 ( .A(n1588), .B(n1580), .Z(n1225) );
  NOR2X1 U1867 ( .A(n2241), .B(n223), .Z(n1580) );
  NOR2X1 U1868 ( .A(rdDataB[3]), .B(rdDataB[0]), .Z(n1588) );
  NAND2X1 U1869 ( .A(n1594), .B(n1595), .Z(A[9]) );
  NOR2X1 U1870 ( .A(n1596), .B(n1597), .Z(n1595) );
  NAND3X1 U1871 ( .A(n1598), .B(n1599), .C(n1600), .Z(n1597) );
  NOR2X1 U1872 ( .A(n1601), .B(n1602), .Z(n1600) );
  NOR2X1 U1873 ( .A(n58), .B(n1603), .Z(n1602) );
  NOR2X1 U1874 ( .A(n74), .B(n1604), .Z(n1601) );
  NAND2X1 U1875 ( .A(n1605), .B(pwm_reg1[9]), .Z(n1599) );
  NAND2X1 U1876 ( .A(n1606), .B(pwm_reg0[9]), .Z(n1598) );
  NAND3X1 U1877 ( .A(n1607), .B(n1608), .C(n1609), .Z(n1596) );
  NOR2X1 U1878 ( .A(n1610), .B(n1611), .Z(n1609) );
  NOR2X1 U1879 ( .A(n90), .B(n1612), .Z(n1611) );
  NOR2X1 U1880 ( .A(n42), .B(n1613), .Z(n1610) );
  NAND2X1 U1881 ( .A(n1614), .B(pwm_reg5[9]), .Z(n1608) );
  NAND2X1 U1882 ( .A(n1615), .B(pwm_reg4[9]), .Z(n1607) );
  NOR2X1 U1883 ( .A(n1616), .B(n1617), .Z(n1594) );
  NAND3X1 U1884 ( .A(n1618), .B(n1619), .C(n1620), .Z(n1617) );
  NAND2X1 U1885 ( .A(n1621), .B(reg1[9]), .Z(n1620) );
  NAND2X1 U1886 ( .A(n1622), .B(reg3[9]), .Z(n1619) );
  NAND2X1 U1887 ( .A(n1623), .B(reg2[9]), .Z(n1618) );
  NAND3X1 U1888 ( .A(n1624), .B(n1625), .C(n1626), .Z(n1616) );
  NOR2X1 U1889 ( .A(n1627), .B(n1628), .Z(n1626) );
  NOR2X1 U1890 ( .A(n26), .B(n1629), .Z(n1628) );
  NOR2X1 U1891 ( .A(n10), .B(n1630), .Z(n1627) );
  NAND2X1 U1892 ( .A(n1631), .B(reg_file_to_i2c_data[1]), .Z(n1625) );
  NAND2X1 U1893 ( .A(n1632), .B(reg6[9]), .Z(n1624) );
  NAND2X1 U1894 ( .A(n1633), .B(n1634), .Z(A[8]) );
  NOR2X1 U1895 ( .A(n1635), .B(n1636), .Z(n1634) );
  NAND3X1 U1896 ( .A(n1637), .B(n1638), .C(n1639), .Z(n1636) );
  NOR2X1 U1897 ( .A(n1640), .B(n1641), .Z(n1639) );
  NOR2X1 U1898 ( .A(n57), .B(n1603), .Z(n1641) );
  NOR2X1 U1899 ( .A(n73), .B(n1604), .Z(n1640) );
  NAND2X1 U1900 ( .A(n1605), .B(pwm_reg1[8]), .Z(n1638) );
  NAND2X1 U1901 ( .A(n1606), .B(pwm_reg0[8]), .Z(n1637) );
  NAND3X1 U1902 ( .A(n1642), .B(n1643), .C(n1644), .Z(n1635) );
  NOR2X1 U1903 ( .A(n1645), .B(n1646), .Z(n1644) );
  NOR2X1 U1904 ( .A(n89), .B(n1612), .Z(n1646) );
  NOR2X1 U1905 ( .A(n41), .B(n1613), .Z(n1645) );
  NAND2X1 U1906 ( .A(n1614), .B(pwm_reg5[8]), .Z(n1643) );
  NAND2X1 U1907 ( .A(n1615), .B(pwm_reg4[8]), .Z(n1642) );
  NOR2X1 U1908 ( .A(n1647), .B(n1648), .Z(n1633) );
  NAND3X1 U1909 ( .A(n1649), .B(n1650), .C(n1651), .Z(n1648) );
  NAND2X1 U1910 ( .A(n1621), .B(reg1[8]), .Z(n1651) );
  NAND2X1 U1911 ( .A(n1622), .B(reg3[8]), .Z(n1650) );
  NAND2X1 U1912 ( .A(n1623), .B(reg2[8]), .Z(n1649) );
  NAND3X1 U1913 ( .A(n1652), .B(n1653), .C(n1654), .Z(n1647) );
  NOR2X1 U1914 ( .A(n1655), .B(n1656), .Z(n1654) );
  NOR2X1 U1915 ( .A(n25), .B(n1629), .Z(n1656) );
  NOR2X1 U1916 ( .A(n9), .B(n1630), .Z(n1655) );
  NAND2X1 U1917 ( .A(n1631), .B(reg_file_to_i2c_data[0]), .Z(n1653) );
  NAND2X1 U1918 ( .A(n1632), .B(i2c_addr[8]), .Z(n1652) );
  NAND2X1 U1919 ( .A(n1657), .B(n1658), .Z(A[7]) );
  NOR2X1 U1920 ( .A(n1659), .B(n1660), .Z(n1658) );
  NAND3X1 U1921 ( .A(n1661), .B(n1662), .C(n1663), .Z(n1660) );
  NOR2X1 U1922 ( .A(n1664), .B(n1665), .Z(n1663) );
  NOR2X1 U1923 ( .A(n56), .B(n1603), .Z(n1665) );
  NOR2X1 U1924 ( .A(n72), .B(n1604), .Z(n1664) );
  NAND2X1 U1925 ( .A(n1605), .B(pwm_reg1[7]), .Z(n1662) );
  NAND2X1 U1926 ( .A(n1606), .B(pwm_reg0[7]), .Z(n1661) );
  NAND3X1 U1927 ( .A(n1666), .B(n1667), .C(n1668), .Z(n1659) );
  NOR2X1 U1928 ( .A(n1669), .B(n1670), .Z(n1668) );
  NOR2X1 U1929 ( .A(n88), .B(n1612), .Z(n1670) );
  NOR2X1 U1930 ( .A(n40), .B(n1613), .Z(n1669) );
  NAND2X1 U1931 ( .A(n1614), .B(pwm_reg5[7]), .Z(n1667) );
  NAND2X1 U1932 ( .A(n1615), .B(pwm_reg4[7]), .Z(n1666) );
  NOR2X1 U1933 ( .A(n1671), .B(n1672), .Z(n1657) );
  NAND3X1 U1934 ( .A(n1673), .B(n1674), .C(n1675), .Z(n1672) );
  NAND2X1 U1935 ( .A(n1621), .B(reg1[7]), .Z(n1675) );
  NAND2X1 U1936 ( .A(n1622), .B(reg3[7]), .Z(n1674) );
  NAND2X1 U1937 ( .A(n1623), .B(reg2[7]), .Z(n1673) );
  NAND3X1 U1938 ( .A(n1676), .B(n1677), .C(n1678), .Z(n1671) );
  NOR2X1 U1939 ( .A(n1679), .B(n1680), .Z(n1678) );
  NOR2X1 U1940 ( .A(n24), .B(n1629), .Z(n1680) );
  NOR2X1 U1941 ( .A(n8), .B(n1630), .Z(n1679) );
  NAND2X1 U1942 ( .A(n1631), .B(i2c_slave_addr[7]), .Z(n1677) );
  NAND2X1 U1943 ( .A(n1632), .B(i2c_addr[7]), .Z(n1676) );
  NAND2X1 U1944 ( .A(n1681), .B(n1682), .Z(A[6]) );
  NOR2X1 U1945 ( .A(n1683), .B(n1684), .Z(n1682) );
  NAND3X1 U1946 ( .A(n1685), .B(n1686), .C(n1687), .Z(n1684) );
  NOR2X1 U1947 ( .A(n1688), .B(n1689), .Z(n1687) );
  NOR2X1 U1948 ( .A(n55), .B(n1603), .Z(n1689) );
  NOR2X1 U1949 ( .A(n71), .B(n1604), .Z(n1688) );
  NAND2X1 U1950 ( .A(n1605), .B(pwm_reg1[6]), .Z(n1686) );
  NAND2X1 U1951 ( .A(n1606), .B(pwm_reg0[6]), .Z(n1685) );
  NAND3X1 U1952 ( .A(n1690), .B(n1691), .C(n1692), .Z(n1683) );
  NOR2X1 U1953 ( .A(n1693), .B(n1694), .Z(n1692) );
  NOR2X1 U1954 ( .A(n87), .B(n1612), .Z(n1694) );
  NOR2X1 U1955 ( .A(n39), .B(n1613), .Z(n1693) );
  NAND2X1 U1956 ( .A(n1614), .B(pwm_reg5[6]), .Z(n1691) );
  NAND2X1 U1957 ( .A(n1615), .B(pwm_reg4[6]), .Z(n1690) );
  NOR2X1 U1958 ( .A(n1695), .B(n1696), .Z(n1681) );
  NAND3X1 U1959 ( .A(n1697), .B(n1698), .C(n1699), .Z(n1696) );
  NAND2X1 U1960 ( .A(n1621), .B(reg1[6]), .Z(n1699) );
  NAND2X1 U1961 ( .A(n1622), .B(reg3[6]), .Z(n1698) );
  NAND2X1 U1962 ( .A(n1623), .B(reg2[6]), .Z(n1697) );
  NAND3X1 U1963 ( .A(n1700), .B(n1701), .C(n1702), .Z(n1695) );
  NOR2X1 U1964 ( .A(n1703), .B(n1704), .Z(n1702) );
  NOR2X1 U1965 ( .A(n23), .B(n1629), .Z(n1704) );
  NOR2X1 U1966 ( .A(n7), .B(n1630), .Z(n1703) );
  NAND2X1 U1967 ( .A(n1631), .B(i2c_slave_addr[6]), .Z(n1701) );
  NAND2X1 U1968 ( .A(n1632), .B(i2c_addr[6]), .Z(n1700) );
  NAND2X1 U1969 ( .A(n1705), .B(n1706), .Z(A[5]) );
  NOR2X1 U1970 ( .A(n1707), .B(n1708), .Z(n1706) );
  NAND3X1 U1971 ( .A(n1709), .B(n1710), .C(n1711), .Z(n1708) );
  NOR2X1 U1972 ( .A(n1712), .B(n1713), .Z(n1711) );
  NOR2X1 U1973 ( .A(n54), .B(n1603), .Z(n1713) );
  NOR2X1 U1974 ( .A(n70), .B(n1604), .Z(n1712) );
  NAND2X1 U1975 ( .A(n1605), .B(pwm_reg1[5]), .Z(n1710) );
  NAND2X1 U1976 ( .A(n1606), .B(pwm_reg0[5]), .Z(n1709) );
  NAND3X1 U1977 ( .A(n1714), .B(n1715), .C(n1716), .Z(n1707) );
  NOR2X1 U1978 ( .A(n1717), .B(n1718), .Z(n1716) );
  NOR2X1 U1979 ( .A(n86), .B(n1612), .Z(n1718) );
  NOR2X1 U1980 ( .A(n38), .B(n1613), .Z(n1717) );
  NAND2X1 U1981 ( .A(n1614), .B(pwm_reg5[5]), .Z(n1715) );
  NAND2X1 U1982 ( .A(n1615), .B(pwm_reg4[5]), .Z(n1714) );
  NOR2X1 U1983 ( .A(n1719), .B(n1720), .Z(n1705) );
  NAND3X1 U1984 ( .A(n1721), .B(n1722), .C(n1723), .Z(n1720) );
  NAND2X1 U1985 ( .A(n1621), .B(reg1[5]), .Z(n1723) );
  NAND2X1 U1986 ( .A(n1622), .B(reg3[5]), .Z(n1722) );
  NAND2X1 U1987 ( .A(n1623), .B(reg2[5]), .Z(n1721) );
  NAND3X1 U1988 ( .A(n1724), .B(n1725), .C(n1726), .Z(n1719) );
  NOR2X1 U1989 ( .A(n1727), .B(n1728), .Z(n1726) );
  NOR2X1 U1990 ( .A(n22), .B(n1629), .Z(n1728) );
  NOR2X1 U1991 ( .A(n6), .B(n1630), .Z(n1727) );
  NAND2X1 U1992 ( .A(n1631), .B(i2c_slave_addr[5]), .Z(n1725) );
  NAND2X1 U1993 ( .A(n1632), .B(i2c_addr[5]), .Z(n1724) );
  NAND2X1 U1994 ( .A(n1729), .B(n1730), .Z(A[4]) );
  NOR2X1 U1995 ( .A(n1731), .B(n1732), .Z(n1730) );
  NAND3X1 U1996 ( .A(n1733), .B(n1734), .C(n1735), .Z(n1732) );
  NOR2X1 U1997 ( .A(n1736), .B(n1737), .Z(n1735) );
  NOR2X1 U1998 ( .A(n53), .B(n1603), .Z(n1737) );
  NOR2X1 U1999 ( .A(n69), .B(n1604), .Z(n1736) );
  NAND2X1 U2000 ( .A(n1605), .B(pwm_reg1[4]), .Z(n1734) );
  NAND2X1 U2001 ( .A(n1606), .B(pwm_reg0[4]), .Z(n1733) );
  NAND3X1 U2002 ( .A(n1738), .B(n1739), .C(n1740), .Z(n1731) );
  NOR2X1 U2003 ( .A(n1741), .B(n1742), .Z(n1740) );
  NOR2X1 U2004 ( .A(n85), .B(n1612), .Z(n1742) );
  NOR2X1 U2005 ( .A(n37), .B(n1613), .Z(n1741) );
  NAND2X1 U2006 ( .A(n1614), .B(pwm_reg5[4]), .Z(n1739) );
  NAND2X1 U2007 ( .A(n1615), .B(pwm_reg4[4]), .Z(n1738) );
  NOR2X1 U2008 ( .A(n1743), .B(n1744), .Z(n1729) );
  NAND3X1 U2009 ( .A(n1745), .B(n1746), .C(n1747), .Z(n1744) );
  NAND2X1 U2010 ( .A(n1621), .B(reg1[4]), .Z(n1747) );
  NAND2X1 U2011 ( .A(n1622), .B(reg3[4]), .Z(n1746) );
  NAND2X1 U2012 ( .A(n1623), .B(reg2[4]), .Z(n1745) );
  NAND3X1 U2013 ( .A(n1748), .B(n1749), .C(n1750), .Z(n1743) );
  NOR2X1 U2014 ( .A(n1751), .B(n1752), .Z(n1750) );
  NOR2X1 U2015 ( .A(n21), .B(n1629), .Z(n1752) );
  NOR2X1 U2016 ( .A(n5), .B(n1630), .Z(n1751) );
  NAND2X1 U2017 ( .A(n1631), .B(i2c_slave_addr[4]), .Z(n1749) );
  NAND2X1 U2018 ( .A(n1632), .B(i2c_addr[4]), .Z(n1748) );
  NAND2X1 U2019 ( .A(n1753), .B(n1754), .Z(A[3]) );
  NOR2X1 U2020 ( .A(n1755), .B(n1756), .Z(n1754) );
  NAND3X1 U2021 ( .A(n1757), .B(n1758), .C(n1759), .Z(n1756) );
  NOR2X1 U2022 ( .A(n1760), .B(n1761), .Z(n1759) );
  NOR2X1 U2023 ( .A(n52), .B(n1603), .Z(n1761) );
  NOR2X1 U2024 ( .A(n68), .B(n1604), .Z(n1760) );
  NAND2X1 U2025 ( .A(n1605), .B(pwm_reg1[3]), .Z(n1758) );
  NAND2X1 U2026 ( .A(n1606), .B(pwm_reg0[3]), .Z(n1757) );
  NAND3X1 U2027 ( .A(n1762), .B(n1763), .C(n1764), .Z(n1755) );
  NOR2X1 U2028 ( .A(n1765), .B(n1766), .Z(n1764) );
  NOR2X1 U2029 ( .A(n84), .B(n1612), .Z(n1766) );
  NOR2X1 U2030 ( .A(n36), .B(n1613), .Z(n1765) );
  NAND2X1 U2031 ( .A(n1614), .B(pwm_reg5[3]), .Z(n1763) );
  NAND2X1 U2032 ( .A(n1615), .B(pwm_reg4[3]), .Z(n1762) );
  NOR2X1 U2033 ( .A(n1767), .B(n1768), .Z(n1753) );
  NAND3X1 U2034 ( .A(n1769), .B(n1770), .C(n1771), .Z(n1768) );
  NAND2X1 U2035 ( .A(n1621), .B(reg1[3]), .Z(n1771) );
  NAND2X1 U2036 ( .A(n1622), .B(reg3[3]), .Z(n1770) );
  NAND2X1 U2037 ( .A(n1623), .B(reg2[3]), .Z(n1769) );
  NAND3X1 U2038 ( .A(n1772), .B(n1773), .C(n1774), .Z(n1767) );
  NOR2X1 U2039 ( .A(n1775), .B(n1776), .Z(n1774) );
  NOR2X1 U2040 ( .A(n20), .B(n1629), .Z(n1776) );
  NOR2X1 U2041 ( .A(n4), .B(n1630), .Z(n1775) );
  NAND2X1 U2042 ( .A(n1631), .B(i2c_slave_addr[3]), .Z(n1773) );
  NAND2X1 U2043 ( .A(n1632), .B(i2c_addr[3]), .Z(n1772) );
  NAND2X1 U2044 ( .A(n1777), .B(n1778), .Z(A[2]) );
  NOR2X1 U2045 ( .A(n1779), .B(n1780), .Z(n1778) );
  NAND3X1 U2046 ( .A(n1781), .B(n1782), .C(n1783), .Z(n1780) );
  NOR2X1 U2047 ( .A(n1784), .B(n1785), .Z(n1783) );
  NOR2X1 U2048 ( .A(n51), .B(n1603), .Z(n1785) );
  NOR2X1 U2049 ( .A(n67), .B(n1604), .Z(n1784) );
  NAND2X1 U2050 ( .A(n1605), .B(pwm_reg1[2]), .Z(n1782) );
  NAND2X1 U2051 ( .A(n1606), .B(pwm_reg0[2]), .Z(n1781) );
  NAND3X1 U2052 ( .A(n1786), .B(n1787), .C(n1788), .Z(n1779) );
  NOR2X1 U2053 ( .A(n1789), .B(n1790), .Z(n1788) );
  NOR2X1 U2054 ( .A(n83), .B(n1612), .Z(n1790) );
  NOR2X1 U2055 ( .A(n35), .B(n1613), .Z(n1789) );
  NAND2X1 U2056 ( .A(n1614), .B(pwm_reg5[2]), .Z(n1787) );
  NAND2X1 U2057 ( .A(n1615), .B(pwm_reg4[2]), .Z(n1786) );
  NOR2X1 U2058 ( .A(n1791), .B(n1792), .Z(n1777) );
  NAND3X1 U2059 ( .A(n1793), .B(n1794), .C(n1795), .Z(n1792) );
  NAND2X1 U2060 ( .A(n1621), .B(reg1[2]), .Z(n1795) );
  NAND2X1 U2061 ( .A(n1622), .B(reg3[2]), .Z(n1794) );
  NAND2X1 U2062 ( .A(n1623), .B(reg2[2]), .Z(n1793) );
  NAND3X1 U2063 ( .A(n1796), .B(n1797), .C(n1798), .Z(n1791) );
  NOR2X1 U2064 ( .A(n1799), .B(n1800), .Z(n1798) );
  NOR2X1 U2065 ( .A(n19), .B(n1629), .Z(n1800) );
  NOR2X1 U2066 ( .A(n3), .B(n1630), .Z(n1799) );
  NAND2X1 U2067 ( .A(n1631), .B(i2c_slave_addr[2]), .Z(n1797) );
  NAND2X1 U2068 ( .A(n1632), .B(i2c_addr[2]), .Z(n1796) );
  NAND2X1 U2069 ( .A(n1801), .B(n1802), .Z(A[1]) );
  NOR2X1 U2070 ( .A(n1803), .B(n1804), .Z(n1802) );
  NAND3X1 U2071 ( .A(n1805), .B(n1806), .C(n1807), .Z(n1804) );
  NOR2X1 U2072 ( .A(n1808), .B(n1809), .Z(n1807) );
  NOR2X1 U2073 ( .A(n50), .B(n1603), .Z(n1809) );
  NOR2X1 U2074 ( .A(n66), .B(n1604), .Z(n1808) );
  NAND2X1 U2075 ( .A(n1605), .B(pwm_reg1[1]), .Z(n1806) );
  NAND2X1 U2076 ( .A(n1606), .B(pwm_reg0[1]), .Z(n1805) );
  NAND3X1 U2077 ( .A(n1810), .B(n1811), .C(n1812), .Z(n1803) );
  NOR2X1 U2078 ( .A(n1813), .B(n1814), .Z(n1812) );
  NOR2X1 U2079 ( .A(n82), .B(n1612), .Z(n1814) );
  NOR2X1 U2080 ( .A(n34), .B(n1613), .Z(n1813) );
  NAND2X1 U2081 ( .A(n1614), .B(pwm_reg5[1]), .Z(n1811) );
  NAND2X1 U2082 ( .A(n1615), .B(pwm_reg4[1]), .Z(n1810) );
  NOR2X1 U2083 ( .A(n1815), .B(n1816), .Z(n1801) );
  NAND3X1 U2084 ( .A(n1817), .B(n1818), .C(n1819), .Z(n1816) );
  NAND2X1 U2085 ( .A(n1621), .B(reg1[1]), .Z(n1819) );
  NAND2X1 U2086 ( .A(n1622), .B(reg3[1]), .Z(n1818) );
  NAND2X1 U2087 ( .A(n1623), .B(reg2[1]), .Z(n1817) );
  NAND3X1 U2088 ( .A(n1820), .B(n1821), .C(n1822), .Z(n1815) );
  NOR2X1 U2089 ( .A(n1823), .B(n1824), .Z(n1822) );
  NOR2X1 U2090 ( .A(n18), .B(n1629), .Z(n1824) );
  NOR2X1 U2091 ( .A(n2), .B(n1630), .Z(n1823) );
  NAND2X1 U2092 ( .A(n1631), .B(i2c_slave_addr[1]), .Z(n1821) );
  NAND2X1 U2093 ( .A(n1632), .B(i2c_addr[1]), .Z(n1820) );
  NAND2X1 U2094 ( .A(n1825), .B(n1826), .Z(A[15]) );
  NOR2X1 U2095 ( .A(n1827), .B(n1828), .Z(n1826) );
  NAND3X1 U2096 ( .A(n1829), .B(n1830), .C(n1831), .Z(n1828) );
  NOR2X1 U2097 ( .A(n1832), .B(n1833), .Z(n1831) );
  NOR2X1 U2098 ( .A(n64), .B(n1603), .Z(n1833) );
  NOR2X1 U2099 ( .A(n80), .B(n1604), .Z(n1832) );
  NAND2X1 U2100 ( .A(n1605), .B(pwm_reg1[15]), .Z(n1830) );
  NAND2X1 U2101 ( .A(n1606), .B(pwm_reg0[15]), .Z(n1829) );
  NAND3X1 U2102 ( .A(n1834), .B(n1835), .C(n1836), .Z(n1827) );
  NOR2X1 U2103 ( .A(n1837), .B(n1838), .Z(n1836) );
  NOR2X1 U2104 ( .A(n96), .B(n1612), .Z(n1838) );
  NOR2X1 U2105 ( .A(n48), .B(n1613), .Z(n1837) );
  NAND2X1 U2106 ( .A(n1614), .B(pwm_reg5[15]), .Z(n1835) );
  NAND2X1 U2107 ( .A(n1615), .B(pwm_reg4[15]), .Z(n1834) );
  NOR2X1 U2108 ( .A(n1839), .B(n1840), .Z(n1825) );
  NAND3X1 U2109 ( .A(n1841), .B(n1842), .C(n1843), .Z(n1840) );
  NAND2X1 U2110 ( .A(n1621), .B(reg1[15]), .Z(n1843) );
  NAND2X1 U2111 ( .A(n1622), .B(reg3[15]), .Z(n1842) );
  NAND2X1 U2112 ( .A(n1623), .B(reg2[15]), .Z(n1841) );
  NAND3X1 U2113 ( .A(n1844), .B(n1845), .C(n1846), .Z(n1839) );
  NOR2X1 U2114 ( .A(n1847), .B(n1848), .Z(n1846) );
  NOR2X1 U2115 ( .A(n32), .B(n1629), .Z(n1848) );
  NOR2X1 U2116 ( .A(n16), .B(n1630), .Z(n1847) );
  NAND2X1 U2117 ( .A(n1631), .B(reg_file_to_i2c_data[7]), .Z(n1845) );
  NAND2X1 U2118 ( .A(n1632), .B(reg6[15]), .Z(n1844) );
  NAND2X1 U2119 ( .A(n1849), .B(n1850), .Z(A[14]) );
  NOR2X1 U2120 ( .A(n1851), .B(n1852), .Z(n1850) );
  NAND3X1 U2121 ( .A(n1853), .B(n1854), .C(n1855), .Z(n1852) );
  NOR2X1 U2122 ( .A(n1856), .B(n1857), .Z(n1855) );
  NOR2X1 U2123 ( .A(n63), .B(n1603), .Z(n1857) );
  NOR2X1 U2124 ( .A(n79), .B(n1604), .Z(n1856) );
  NAND2X1 U2125 ( .A(n1605), .B(pwm_reg1[14]), .Z(n1854) );
  NAND2X1 U2126 ( .A(n1606), .B(pwm_reg0[14]), .Z(n1853) );
  NAND3X1 U2127 ( .A(n1858), .B(n1859), .C(n1860), .Z(n1851) );
  NOR2X1 U2128 ( .A(n1861), .B(n1862), .Z(n1860) );
  NOR2X1 U2129 ( .A(n95), .B(n1612), .Z(n1862) );
  NOR2X1 U2130 ( .A(n47), .B(n1613), .Z(n1861) );
  NAND2X1 U2131 ( .A(n1614), .B(pwm_reg5[14]), .Z(n1859) );
  NAND2X1 U2132 ( .A(n1615), .B(pwm_reg4[14]), .Z(n1858) );
  NOR2X1 U2133 ( .A(n1863), .B(n1864), .Z(n1849) );
  NAND3X1 U2134 ( .A(n1865), .B(n1866), .C(n1867), .Z(n1864) );
  NAND2X1 U2135 ( .A(n1621), .B(reg1[14]), .Z(n1867) );
  NAND2X1 U2136 ( .A(n1622), .B(reg3[14]), .Z(n1866) );
  NAND2X1 U2137 ( .A(n1623), .B(reg2[14]), .Z(n1865) );
  NAND3X1 U2138 ( .A(n1868), .B(n1869), .C(n1870), .Z(n1863) );
  NOR2X1 U2139 ( .A(n1871), .B(n1872), .Z(n1870) );
  NOR2X1 U2140 ( .A(n31), .B(n1629), .Z(n1872) );
  NOR2X1 U2141 ( .A(n15), .B(n1630), .Z(n1871) );
  NAND2X1 U2142 ( .A(n1631), .B(reg_file_to_i2c_data[6]), .Z(n1869) );
  NAND2X1 U2143 ( .A(n1632), .B(reg6[14]), .Z(n1868) );
  NAND2X1 U2144 ( .A(n1873), .B(n1874), .Z(A[13]) );
  NOR2X1 U2145 ( .A(n1875), .B(n1876), .Z(n1874) );
  NAND3X1 U2146 ( .A(n1877), .B(n1878), .C(n1879), .Z(n1876) );
  NOR2X1 U2147 ( .A(n1880), .B(n1881), .Z(n1879) );
  NOR2X1 U2148 ( .A(n62), .B(n1603), .Z(n1881) );
  NOR2X1 U2149 ( .A(n78), .B(n1604), .Z(n1880) );
  NAND2X1 U2150 ( .A(n1605), .B(pwm_reg1[13]), .Z(n1878) );
  NAND2X1 U2151 ( .A(n1606), .B(pwm_reg0[13]), .Z(n1877) );
  NAND3X1 U2152 ( .A(n1882), .B(n1883), .C(n1884), .Z(n1875) );
  NOR2X1 U2153 ( .A(n1885), .B(n1886), .Z(n1884) );
  NOR2X1 U2154 ( .A(n94), .B(n1612), .Z(n1886) );
  NOR2X1 U2155 ( .A(n46), .B(n1613), .Z(n1885) );
  NAND2X1 U2156 ( .A(n1614), .B(pwm_reg5[13]), .Z(n1883) );
  NAND2X1 U2157 ( .A(n1615), .B(pwm_reg4[13]), .Z(n1882) );
  NOR2X1 U2158 ( .A(n1887), .B(n1888), .Z(n1873) );
  NAND3X1 U2159 ( .A(n1889), .B(n1890), .C(n1891), .Z(n1888) );
  NAND2X1 U2160 ( .A(n1621), .B(reg1[13]), .Z(n1891) );
  NAND2X1 U2161 ( .A(n1622), .B(reg3[13]), .Z(n1890) );
  NAND2X1 U2162 ( .A(n1623), .B(reg2[13]), .Z(n1889) );
  NAND3X1 U2163 ( .A(n1892), .B(n1893), .C(n1894), .Z(n1887) );
  NOR2X1 U2164 ( .A(n1895), .B(n1896), .Z(n1894) );
  NOR2X1 U2165 ( .A(n30), .B(n1629), .Z(n1896) );
  NOR2X1 U2166 ( .A(n14), .B(n1630), .Z(n1895) );
  NAND2X1 U2167 ( .A(n1631), .B(reg_file_to_i2c_data[5]), .Z(n1893) );
  NAND2X1 U2168 ( .A(n1632), .B(reg6[13]), .Z(n1892) );
  NAND2X1 U2169 ( .A(n1897), .B(n1898), .Z(A[12]) );
  NOR2X1 U2170 ( .A(n1899), .B(n1900), .Z(n1898) );
  NAND3X1 U2171 ( .A(n1901), .B(n1902), .C(n1903), .Z(n1900) );
  NOR2X1 U2172 ( .A(n1904), .B(n1905), .Z(n1903) );
  NOR2X1 U2173 ( .A(n61), .B(n1603), .Z(n1905) );
  NOR2X1 U2174 ( .A(n77), .B(n1604), .Z(n1904) );
  NAND2X1 U2175 ( .A(n1605), .B(pwm_reg1[12]), .Z(n1902) );
  NAND2X1 U2176 ( .A(n1606), .B(pwm_reg0[12]), .Z(n1901) );
  NAND3X1 U2177 ( .A(n1906), .B(n1907), .C(n1908), .Z(n1899) );
  NOR2X1 U2178 ( .A(n1909), .B(n1910), .Z(n1908) );
  NOR2X1 U2179 ( .A(n93), .B(n1612), .Z(n1910) );
  NOR2X1 U2180 ( .A(n45), .B(n1613), .Z(n1909) );
  NAND2X1 U2181 ( .A(n1614), .B(pwm_reg5[12]), .Z(n1907) );
  NAND2X1 U2182 ( .A(n1615), .B(pwm_reg4[12]), .Z(n1906) );
  NOR2X1 U2183 ( .A(n1911), .B(n1912), .Z(n1897) );
  NAND3X1 U2184 ( .A(n1913), .B(n1914), .C(n1915), .Z(n1912) );
  NAND2X1 U2185 ( .A(n1621), .B(reg1[12]), .Z(n1915) );
  NAND2X1 U2186 ( .A(n1622), .B(reg3[12]), .Z(n1914) );
  NAND2X1 U2187 ( .A(n1623), .B(reg2[12]), .Z(n1913) );
  NAND3X1 U2188 ( .A(n1916), .B(n1917), .C(n1918), .Z(n1911) );
  NOR2X1 U2189 ( .A(n1919), .B(n1920), .Z(n1918) );
  NOR2X1 U2190 ( .A(n29), .B(n1629), .Z(n1920) );
  NOR2X1 U2191 ( .A(n13), .B(n1630), .Z(n1919) );
  NAND2X1 U2192 ( .A(n1631), .B(reg_file_to_i2c_data[4]), .Z(n1917) );
  NAND2X1 U2193 ( .A(n1632), .B(reg6[12]), .Z(n1916) );
  NAND2X1 U2194 ( .A(n1921), .B(n1922), .Z(A[11]) );
  NOR2X1 U2195 ( .A(n1923), .B(n1924), .Z(n1922) );
  NAND3X1 U2196 ( .A(n1925), .B(n1926), .C(n1927), .Z(n1924) );
  NOR2X1 U2197 ( .A(n1928), .B(n1929), .Z(n1927) );
  NOR2X1 U2198 ( .A(n60), .B(n1603), .Z(n1929) );
  NOR2X1 U2199 ( .A(n76), .B(n1604), .Z(n1928) );
  NAND2X1 U2200 ( .A(n1605), .B(pwm_reg1[11]), .Z(n1926) );
  NAND2X1 U2201 ( .A(n1606), .B(pwm_reg0[11]), .Z(n1925) );
  NAND3X1 U2202 ( .A(n1930), .B(n1931), .C(n1932), .Z(n1923) );
  NOR2X1 U2203 ( .A(n1933), .B(n1934), .Z(n1932) );
  NOR2X1 U2204 ( .A(n92), .B(n1612), .Z(n1934) );
  NOR2X1 U2205 ( .A(n44), .B(n1613), .Z(n1933) );
  NAND2X1 U2206 ( .A(n1614), .B(pwm_reg5[11]), .Z(n1931) );
  NAND2X1 U2207 ( .A(n1615), .B(pwm_reg4[11]), .Z(n1930) );
  NOR2X1 U2208 ( .A(n1935), .B(n1936), .Z(n1921) );
  NAND3X1 U2209 ( .A(n1937), .B(n1938), .C(n1939), .Z(n1936) );
  NAND2X1 U2210 ( .A(n1621), .B(reg1[11]), .Z(n1939) );
  NAND2X1 U2211 ( .A(n1622), .B(reg3[11]), .Z(n1938) );
  NAND2X1 U2212 ( .A(n1623), .B(reg2[11]), .Z(n1937) );
  NAND3X1 U2213 ( .A(n1940), .B(n1941), .C(n1942), .Z(n1935) );
  NOR2X1 U2214 ( .A(n1943), .B(n1944), .Z(n1942) );
  NOR2X1 U2215 ( .A(n28), .B(n1629), .Z(n1944) );
  NOR2X1 U2216 ( .A(n12), .B(n1630), .Z(n1943) );
  NAND2X1 U2217 ( .A(n1631), .B(reg_file_to_i2c_data[3]), .Z(n1941) );
  NAND2X1 U2218 ( .A(n1632), .B(reg6[11]), .Z(n1940) );
  NAND2X1 U2219 ( .A(n1945), .B(n1946), .Z(A[10]) );
  NOR2X1 U2220 ( .A(n1947), .B(n1948), .Z(n1946) );
  NAND3X1 U2221 ( .A(n1949), .B(n1950), .C(n1951), .Z(n1948) );
  NOR2X1 U2222 ( .A(n1952), .B(n1953), .Z(n1951) );
  NOR2X1 U2223 ( .A(n59), .B(n1603), .Z(n1953) );
  NOR2X1 U2224 ( .A(n75), .B(n1604), .Z(n1952) );
  NAND2X1 U2225 ( .A(n1605), .B(pwm_reg1[10]), .Z(n1950) );
  NAND2X1 U2226 ( .A(n1606), .B(pwm_reg0[10]), .Z(n1949) );
  NAND3X1 U2227 ( .A(n1954), .B(n1955), .C(n1956), .Z(n1947) );
  NOR2X1 U2228 ( .A(n1957), .B(n1958), .Z(n1956) );
  NOR2X1 U2229 ( .A(n91), .B(n1612), .Z(n1958) );
  NOR2X1 U2230 ( .A(n43), .B(n1613), .Z(n1957) );
  NAND2X1 U2231 ( .A(n1614), .B(pwm_reg5[10]), .Z(n1955) );
  NAND2X1 U2232 ( .A(n1615), .B(pwm_reg4[10]), .Z(n1954) );
  NOR2X1 U2233 ( .A(n1959), .B(n1960), .Z(n1945) );
  NAND3X1 U2234 ( .A(n1961), .B(n1962), .C(n1963), .Z(n1960) );
  NAND2X1 U2235 ( .A(n1621), .B(reg1[10]), .Z(n1963) );
  NAND2X1 U2236 ( .A(n1622), .B(reg3[10]), .Z(n1962) );
  NAND2X1 U2237 ( .A(n1623), .B(reg2[10]), .Z(n1961) );
  NAND3X1 U2238 ( .A(n1964), .B(n1965), .C(n1966), .Z(n1959) );
  NOR2X1 U2239 ( .A(n1967), .B(n1968), .Z(n1966) );
  NOR2X1 U2240 ( .A(n27), .B(n1629), .Z(n1968) );
  NOR2X1 U2241 ( .A(n11), .B(n1630), .Z(n1967) );
  NAND2X1 U2242 ( .A(n1631), .B(reg_file_to_i2c_data[2]), .Z(n1965) );
  NAND2X1 U2243 ( .A(n1632), .B(reg6[10]), .Z(n1964) );
  NAND2X1 U2244 ( .A(n1969), .B(n1970), .Z(A[0]) );
  NOR2X1 U2245 ( .A(n1971), .B(n1972), .Z(n1970) );
  NAND3X1 U2246 ( .A(n1973), .B(n1974), .C(n1975), .Z(n1972) );
  NOR2X1 U2247 ( .A(n1976), .B(n1977), .Z(n1975) );
  NOR2X1 U2248 ( .A(n49), .B(n1603), .Z(n1977) );
  NAND2X1 U2249 ( .A(n1978), .B(n1979), .Z(n1603) );
  NOR2X1 U2250 ( .A(n65), .B(n1604), .Z(n1976) );
  NAND2X1 U2251 ( .A(n1978), .B(n1980), .Z(n1604) );
  NAND2X1 U2252 ( .A(n1605), .B(pwm_reg1[0]), .Z(n1974) );
  AND2X1 U2253 ( .A(n1981), .B(n1980), .Z(n1605) );
  NAND2X1 U2254 ( .A(n1606), .B(pwm_reg0[0]), .Z(n1973) );
  AND2X1 U2255 ( .A(n1981), .B(n1979), .Z(n1606) );
  NAND3X1 U2256 ( .A(n1982), .B(n1983), .C(n1984), .Z(n1971) );
  NOR2X1 U2257 ( .A(n1985), .B(n1986), .Z(n1984) );
  NOR2X1 U2258 ( .A(n81), .B(n1612), .Z(n1986) );
  NAND2X1 U2259 ( .A(n1979), .B(n1987), .Z(n1612) );
  NOR2X1 U2260 ( .A(n33), .B(n1613), .Z(n1985) );
  NAND2X1 U2261 ( .A(n1987), .B(n1980), .Z(n1613) );
  NAND2X1 U2262 ( .A(n1614), .B(pwm_reg5[0]), .Z(n1983) );
  AND2X1 U2263 ( .A(n1988), .B(n1980), .Z(n1614) );
  AND2X1 U2264 ( .A(rdDataA[3]), .B(rdDataA[0]), .Z(n1980) );
  NAND2X1 U2265 ( .A(n1615), .B(pwm_reg4[0]), .Z(n1982) );
  AND2X1 U2266 ( .A(n1988), .B(n1979), .Z(n1615) );
  AND2X1 U2267 ( .A(rdDataA[3]), .B(n219), .Z(n1979) );
  NOR2X1 U2268 ( .A(n1989), .B(n1990), .Z(n1969) );
  NAND3X1 U2269 ( .A(n1991), .B(n1992), .C(n1993), .Z(n1990) );
  NAND2X1 U2270 ( .A(n1621), .B(reg1[0]), .Z(n1993) );
  AND2X1 U2271 ( .A(n1994), .B(n1981), .Z(n1621) );
  NOR2X1 U2272 ( .A(rdDataA[2]), .B(rdDataA[1]), .Z(n1981) );
  NAND2X1 U2273 ( .A(n1622), .B(reg3[0]), .Z(n1992) );
  AND2X1 U2274 ( .A(n1994), .B(n1978), .Z(n1622) );
  NAND2X1 U2275 ( .A(n1623), .B(reg2[0]), .Z(n1991) );
  AND2X1 U2276 ( .A(n1995), .B(n1978), .Z(n1623) );
  NOR2X1 U2277 ( .A(n220), .B(rdDataA[2]), .Z(n1978) );
  NAND3X1 U2278 ( .A(n1996), .B(n1997), .C(n1998), .Z(n1989) );
  NOR2X1 U2279 ( .A(n1999), .B(n2000), .Z(n1998) );
  NOR2X1 U2280 ( .A(n17), .B(n1629), .Z(n2000) );
  NAND2X1 U2281 ( .A(n1995), .B(n1988), .Z(n1629) );
  NOR2X1 U2282 ( .A(n1), .B(n1630), .Z(n1999) );
  NAND2X1 U2283 ( .A(n1994), .B(n1988), .Z(n1630) );
  NOR2X1 U2284 ( .A(n221), .B(rdDataA[1]), .Z(n1988) );
  NAND2X1 U2285 ( .A(n1631), .B(i2c_slave_addr[0]), .Z(n1997) );
  AND2X1 U2286 ( .A(n1994), .B(n1987), .Z(n1631) );
  NOR2X1 U2287 ( .A(n219), .B(rdDataA[3]), .Z(n1994) );
  NAND2X1 U2288 ( .A(n1632), .B(i2c_addr[0]), .Z(n1996) );
  AND2X1 U2289 ( .A(n1995), .B(n1987), .Z(n1632) );
  NOR2X1 U2290 ( .A(n221), .B(n220), .Z(n1987) );
  NOR2X1 U2291 ( .A(rdDataA[3]), .B(rdDataA[0]), .Z(n1995) );
  DFFQQBX1 \reg15_reg[6]  ( .D(n2135), .CLK(clk), .Q(pwm_reg7[6]), .QB(n39) );
  DFFQQBX1 \reg15_reg[5]  ( .D(n2134), .CLK(clk), .Q(pwm_reg7[5]), .QB(n38) );
  DFFQQBX1 \reg15_reg[4]  ( .D(n2133), .CLK(clk), .Q(pwm_reg7[4]), .QB(n37) );
  DFFQQBX1 \reg15_reg[3]  ( .D(n2132), .CLK(clk), .Q(pwm_reg7[3]), .QB(n36) );
  DFFQQBX1 \reg15_reg[2]  ( .D(n2131), .CLK(clk), .Q(pwm_reg7[2]), .QB(n35) );
  DFFQQBX1 \reg15_reg[1]  ( .D(n2130), .CLK(clk), .Q(pwm_reg7[1]), .QB(n34) );
  DFFQQBX1 \reg15_reg[0]  ( .D(n2129), .CLK(clk), .Q(pwm_reg7[0]), .QB(n33) );
  DFFQQBX1 \reg14_reg[6]  ( .D(n2215), .CLK(clk), .Q(pwm_reg6[6]), .QB(n87) );
  DFFQQBX1 \reg14_reg[5]  ( .D(n2214), .CLK(clk), .Q(pwm_reg6[5]), .QB(n86) );
  DFFQQBX1 \reg14_reg[4]  ( .D(n2213), .CLK(clk), .Q(pwm_reg6[4]), .QB(n85) );
  DFFQQBX1 \reg14_reg[3]  ( .D(n2212), .CLK(clk), .Q(pwm_reg6[3]), .QB(n84) );
  DFFQQBX1 \reg14_reg[2]  ( .D(n2211), .CLK(clk), .Q(pwm_reg6[2]), .QB(n83) );
  DFFQQBX1 \reg14_reg[1]  ( .D(n2210), .CLK(clk), .Q(pwm_reg6[1]), .QB(n82) );
  DFFQQBX1 \reg14_reg[0]  ( .D(n2209), .CLK(clk), .Q(pwm_reg6[0]), .QB(n81) );
  DFFQQBX1 \reg11_reg[6]  ( .D(n2199), .CLK(clk), .Q(pwm_reg3[6]), .QB(n71) );
  DFFQQBX1 \reg11_reg[5]  ( .D(n2198), .CLK(clk), .Q(pwm_reg3[5]), .QB(n70) );
  DFFQQBX1 \reg11_reg[4]  ( .D(n2197), .CLK(clk), .Q(pwm_reg3[4]), .QB(n69) );
  DFFQQBX1 \reg11_reg[3]  ( .D(n2196), .CLK(clk), .Q(pwm_reg3[3]), .QB(n68) );
  DFFQQBX1 \reg11_reg[2]  ( .D(n2195), .CLK(clk), .Q(pwm_reg3[2]), .QB(n67) );
  DFFQQBX1 \reg11_reg[1]  ( .D(n2194), .CLK(clk), .Q(pwm_reg3[1]), .QB(n66) );
  DFFQQBX1 \reg11_reg[0]  ( .D(n2193), .CLK(clk), .Q(pwm_reg3[0]), .QB(n65) );
  DFFQQBX1 \reg10_reg[6]  ( .D(n2151), .CLK(clk), .Q(pwm_reg2[6]), .QB(n55) );
  DFFQQBX1 \reg10_reg[5]  ( .D(n2150), .CLK(clk), .Q(pwm_reg2[5]), .QB(n54) );
  DFFQQBX1 \reg10_reg[4]  ( .D(n2149), .CLK(clk), .Q(pwm_reg2[4]), .QB(n53) );
  DFFQQBX1 \reg10_reg[3]  ( .D(n2148), .CLK(clk), .Q(pwm_reg2[3]), .QB(n52) );
  DFFQQBX1 \reg10_reg[2]  ( .D(n2147), .CLK(clk), .Q(pwm_reg2[2]), .QB(n51) );
  DFFQQBX1 \reg10_reg[1]  ( .D(n2146), .CLK(clk), .Q(pwm_reg2[1]), .QB(n50) );
  DFFQQBX1 \reg10_reg[0]  ( .D(n2145), .CLK(clk), .Q(pwm_reg2[0]), .QB(n49) );
  DFFQQBX1 \reg5_reg[6]  ( .D(n2055), .CLK(clk), .Q(n212), .QB(n7) );
  DFFQQBX1 \reg5_reg[5]  ( .D(n2054), .CLK(clk), .Q(n213), .QB(n6) );
  DFFQQBX1 \reg5_reg[4]  ( .D(n2053), .CLK(clk), .Q(n214), .QB(n5) );
  DFFQQBX1 \reg5_reg[3]  ( .D(n2052), .CLK(clk), .Q(n215), .QB(n4) );
  DFFQQBX1 \reg5_reg[2]  ( .D(n2051), .CLK(clk), .Q(n216), .QB(n3) );
  DFFQQBX1 \reg5_reg[1]  ( .D(n2050), .CLK(clk), .Q(n217), .QB(n2) );
  DFFQQBX1 \reg5_reg[0]  ( .D(n2049), .CLK(clk), .Q(n218), .QB(n1) );
  DFFQQBX1 \reg4_reg[6]  ( .D(n2071), .CLK(clk), .Q(n196), .QB(n23) );
  DFFQQBX1 \reg4_reg[5]  ( .D(n2070), .CLK(clk), .Q(n197), .QB(n22) );
  DFFQQBX1 \reg4_reg[4]  ( .D(n2069), .CLK(clk), .Q(n198), .QB(n21) );
  DFFQQBX1 \reg4_reg[3]  ( .D(n2068), .CLK(clk), .Q(n199), .QB(n20) );
  DFFQQBX1 \reg4_reg[2]  ( .D(n2067), .CLK(clk), .Q(n200), .QB(n19) );
  DFFQQBX1 \reg4_reg[1]  ( .D(n2066), .CLK(clk), .Q(n201), .QB(n18) );
  DFFQQBX1 \reg4_reg[0]  ( .D(n2065), .CLK(clk), .Q(n202), .QB(n17) );
  DFFQQBX1 \reg15_reg[7]  ( .D(n2136), .CLK(clk), .Q(pwm_reg7[7]), .QB(n40) );
  DFFQQBX1 \reg14_reg[7]  ( .D(n2216), .CLK(clk), .Q(pwm_reg6[7]), .QB(n88) );
  DFFQQBX1 \reg11_reg[7]  ( .D(n2200), .CLK(clk), .Q(pwm_reg3[7]), .QB(n72) );
  DFFQQBX1 \reg10_reg[7]  ( .D(n2152), .CLK(clk), .Q(pwm_reg2[7]), .QB(n56) );
  DFFQQBX1 \reg5_reg[7]  ( .D(n2056), .CLK(clk), .Q(n211), .QB(n8) );
  DFFQQBX1 \reg4_reg[7]  ( .D(n2072), .CLK(clk), .Q(n195), .QB(n24) );
  DFFQQBX1 \reg15_reg[8]  ( .D(n2137), .CLK(clk), .Q(pwm_reg7[8]), .QB(n41) );
  DFFQQBX1 \reg14_reg[8]  ( .D(n2217), .CLK(clk), .Q(pwm_reg6[8]), .QB(n89) );
  DFFQQBX1 \reg11_reg[8]  ( .D(n2201), .CLK(clk), .Q(pwm_reg3[8]), .QB(n73) );
  DFFQQBX1 \reg10_reg[8]  ( .D(n2153), .CLK(clk), .Q(pwm_reg2[8]), .QB(n57) );
  DFFQQBX1 \reg5_reg[8]  ( .D(n2057), .CLK(clk), .Q(n210), .QB(n9) );
  DFFQQBX1 \reg4_reg[8]  ( .D(n2073), .CLK(clk), .Q(n194), .QB(n25) );
  DFFQQBX1 \reg15_reg[9]  ( .D(n2138), .CLK(clk), .Q(pwm_reg7[9]), .QB(n42) );
  DFFQQBX1 \reg14_reg[9]  ( .D(n2218), .CLK(clk), .Q(pwm_reg6[9]), .QB(n90) );
  DFFQQBX1 \reg11_reg[9]  ( .D(n2202), .CLK(clk), .Q(pwm_reg3[9]), .QB(n74) );
  DFFQQBX1 \reg10_reg[9]  ( .D(n2154), .CLK(clk), .Q(pwm_reg2[9]), .QB(n58) );
  DFFQQBX1 \reg5_reg[9]  ( .D(n2058), .CLK(clk), .Q(n209), .QB(n10) );
  DFFQQBX1 \reg4_reg[9]  ( .D(n2074), .CLK(clk), .Q(n193), .QB(n26) );
  DFFQQBX1 \reg15_reg[10]  ( .D(n2139), .CLK(clk), .Q(pwm_reg7[10]), .QB(n43)
         );
  DFFQQBX1 \reg14_reg[10]  ( .D(n2219), .CLK(clk), .Q(pwm_reg6[10]), .QB(n91)
         );
  DFFQQBX1 \reg11_reg[10]  ( .D(n2203), .CLK(clk), .Q(pwm_reg3[10]), .QB(n75)
         );
  DFFQQBX1 \reg10_reg[10]  ( .D(n2155), .CLK(clk), .Q(pwm_reg2[10]), .QB(n59)
         );
  DFFQQBX1 \reg5_reg[10]  ( .D(n2059), .CLK(clk), .Q(n208), .QB(n11) );
  DFFQQBX1 \reg4_reg[10]  ( .D(n2075), .CLK(clk), .Q(n192), .QB(n27) );
  DFFQQBX1 \reg15_reg[11]  ( .D(n2140), .CLK(clk), .Q(pwm_reg7[11]), .QB(n44)
         );
  DFFQQBX1 \reg14_reg[11]  ( .D(n2220), .CLK(clk), .Q(pwm_reg6[11]), .QB(n92)
         );
  DFFQQBX1 \reg11_reg[11]  ( .D(n2204), .CLK(clk), .Q(pwm_reg3[11]), .QB(n76)
         );
  DFFQQBX1 \reg10_reg[11]  ( .D(n2156), .CLK(clk), .Q(pwm_reg2[11]), .QB(n60)
         );
  DFFQQBX1 \reg5_reg[11]  ( .D(n2060), .CLK(clk), .Q(n207), .QB(n12) );
  DFFQQBX1 \reg4_reg[11]  ( .D(n2076), .CLK(clk), .Q(n191), .QB(n28) );
  DFFQQBX1 \reg15_reg[12]  ( .D(n2141), .CLK(clk), .Q(pwm_reg7[12]), .QB(n45)
         );
  DFFQQBX1 \reg14_reg[12]  ( .D(n2221), .CLK(clk), .Q(pwm_reg6[12]), .QB(n93)
         );
  DFFQQBX1 \reg11_reg[12]  ( .D(n2205), .CLK(clk), .Q(pwm_reg3[12]), .QB(n77)
         );
  DFFQQBX1 \reg10_reg[12]  ( .D(n2157), .CLK(clk), .Q(pwm_reg2[12]), .QB(n61)
         );
  DFFQQBX1 \reg5_reg[12]  ( .D(n2061), .CLK(clk), .Q(n206), .QB(n13) );
  DFFQQBX1 \reg4_reg[12]  ( .D(n2077), .CLK(clk), .Q(n190), .QB(n29) );
  DFFQQBX1 \reg15_reg[13]  ( .D(n2142), .CLK(clk), .Q(pwm_reg7[13]), .QB(n46)
         );
  DFFQQBX1 \reg14_reg[13]  ( .D(n2222), .CLK(clk), .Q(pwm_reg6[13]), .QB(n94)
         );
  DFFQQBX1 \reg11_reg[13]  ( .D(n2206), .CLK(clk), .Q(pwm_reg3[13]), .QB(n78)
         );
  DFFQQBX1 \reg10_reg[13]  ( .D(n2158), .CLK(clk), .Q(pwm_reg2[13]), .QB(n62)
         );
  DFFQQBX1 \reg5_reg[13]  ( .D(n2062), .CLK(clk), .Q(n205), .QB(n14) );
  DFFQQBX1 \reg4_reg[13]  ( .D(n2078), .CLK(clk), .Q(n189), .QB(n30) );
  DFFQQBX1 \reg15_reg[14]  ( .D(n2143), .CLK(clk), .Q(pwm_reg7[14]), .QB(n47)
         );
  DFFQQBX1 \reg14_reg[14]  ( .D(n2223), .CLK(clk), .Q(pwm_reg6[14]), .QB(n95)
         );
  DFFQQBX1 \reg11_reg[14]  ( .D(n2207), .CLK(clk), .Q(pwm_reg3[14]), .QB(n79)
         );
  DFFQQBX1 \reg10_reg[14]  ( .D(n2159), .CLK(clk), .Q(pwm_reg2[14]), .QB(n63)
         );
  DFFQQBX1 \reg5_reg[14]  ( .D(n2063), .CLK(clk), .Q(n204), .QB(n15) );
  DFFQQBX1 \reg4_reg[14]  ( .D(n2079), .CLK(clk), .Q(n188), .QB(n31) );
  DFFQQBX1 \reg15_reg[15]  ( .D(n2144), .CLK(clk), .Q(pwm_reg7[15]), .QB(n48)
         );
  DFFQQBX1 \reg14_reg[15]  ( .D(n2224), .CLK(clk), .Q(pwm_reg6[15]), .QB(n96)
         );
  DFFQQBX1 \reg11_reg[15]  ( .D(n2208), .CLK(clk), .Q(pwm_reg3[15]), .QB(n80)
         );
  DFFQQBX1 \reg10_reg[15]  ( .D(n2160), .CLK(clk), .Q(pwm_reg2[15]), .QB(n64)
         );
  DFFQQBX1 \reg5_reg[15]  ( .D(n2064), .CLK(clk), .Q(n203), .QB(n16) );
  DFFQQBX1 \reg4_reg[15]  ( .D(n2080), .CLK(clk), .Q(n187), .QB(n32) );
  INVX2 U3 ( .A(rst), .Z(n122) );
  INVX2 U4 ( .A(n328), .Z(n2248) );
  INVX2 U5 ( .A(n278), .Z(n2247) );
  INVX2 U6 ( .A(n227), .Z(n2246) );
  INVX2 U7 ( .A(n371), .Z(n2250) );
  INVX2 U8 ( .A(n406), .Z(n2251) );
  INVX2 U9 ( .A(n440), .Z(n2252) );
  INVX2 U10 ( .A(n475), .Z(n2253) );
  INVX2 U11 ( .A(n509), .Z(n2254) );
  INVX2 U12 ( .A(n543), .Z(n2255) );
  INVX2 U13 ( .A(n578), .Z(n2256) );
  INVX2 U14 ( .A(n612), .Z(n2257) );
  INVX2 U15 ( .A(n646), .Z(n2258) );
  INVX2 U16 ( .A(n680), .Z(n2259) );
  INVX2 U17 ( .A(n714), .Z(n2260) );
  INVX2 U18 ( .A(n748), .Z(n2261) );
  INVX2 U19 ( .A(write_en), .Z(n2245) );
  INVX2 U20 ( .A(n345), .Z(n2249) );
  INVX2 U21 ( .A(n111), .Z(n121) );
  INVX2 U22 ( .A(n117), .Z(n120) );
  INVX2 U23 ( .A(wrData[0]), .Z(n2262) );
  INVX2 U24 ( .A(wrData[3]), .Z(n2265) );
  INVX2 U25 ( .A(rdDataA[1]), .Z(n220) );
  INVX2 U26 ( .A(rdDataA[2]), .Z(n221) );
  INVX2 U27 ( .A(wrData[2]), .Z(n2264) );
  INVX2 U28 ( .A(rdDataA[0]), .Z(n219) );
  INVX2 U29 ( .A(wrData[1]), .Z(n2263) );
  INVX2 U30 ( .A(rdDataB[1]), .Z(n223) );
  INVX2 U31 ( .A(rdDataB[2]), .Z(n2241) );
  INVX2 U32 ( .A(rdDataB[0]), .Z(n222) );
  INVX2 U33 ( .A(rdDataC[1]), .Z(n2243) );
  INVX2 U34 ( .A(rdDataC[2]), .Z(n2244) );
  INVX2 U35 ( .A(rdDataC[0]), .Z(n2242) );
  NAND3X1 U36 ( .A(wrData[2]), .B(n2265), .C(wrData[1]), .Z(n114) );
  NOR2X1 U37 ( .A(n2262), .B(n114), .Z(n111) );
  NAND2X1 U38 ( .A(i2c_to_reg_file_data[0]), .B(n121), .Z(n98) );
  NAND2X1 U39 ( .A(DataIn[8]), .B(n111), .Z(n97) );
  NAND2X1 U40 ( .A(n98), .B(n97), .Z(N266) );
  NAND2X1 U41 ( .A(i2c_to_reg_file_data[1]), .B(n121), .Z(n100) );
  NAND2X1 U42 ( .A(DataIn[9]), .B(n111), .Z(n99) );
  NAND2X1 U43 ( .A(n100), .B(n99), .Z(N267) );
  NAND2X1 U44 ( .A(i2c_to_reg_file_data[2]), .B(n121), .Z(n102) );
  NAND2X1 U45 ( .A(DataIn[10]), .B(n111), .Z(n101) );
  NAND2X1 U46 ( .A(n102), .B(n101), .Z(N268) );
  NAND2X1 U47 ( .A(i2c_to_reg_file_data[3]), .B(n121), .Z(n104) );
  NAND2X1 U48 ( .A(DataIn[11]), .B(n111), .Z(n103) );
  NAND2X1 U49 ( .A(n104), .B(n103), .Z(N270) );
  NAND2X1 U50 ( .A(i2c_to_reg_file_data[4]), .B(n121), .Z(n106) );
  NAND2X1 U51 ( .A(DataIn[12]), .B(n111), .Z(n105) );
  NAND2X1 U52 ( .A(n106), .B(n105), .Z(N271) );
  NAND2X1 U53 ( .A(i2c_to_reg_file_data[5]), .B(n121), .Z(n108) );
  NAND2X1 U54 ( .A(DataIn[13]), .B(n111), .Z(n107) );
  NAND2X1 U55 ( .A(n108), .B(n107), .Z(N272) );
  NAND2X1 U56 ( .A(i2c_to_reg_file_data[6]), .B(n121), .Z(n110) );
  NAND2X1 U57 ( .A(DataIn[14]), .B(n111), .Z(n109) );
  NAND2X1 U58 ( .A(n110), .B(n109), .Z(N273) );
  NAND2X1 U59 ( .A(i2c_to_reg_file_data[7]), .B(n121), .Z(n113) );
  NAND2X1 U60 ( .A(DataIn[15]), .B(n111), .Z(n112) );
  NAND2X1 U61 ( .A(n113), .B(n112), .Z(N274) );
  NOR2X1 U62 ( .A(wrData[0]), .B(n114), .Z(n117) );
  NAND2X1 U63 ( .A(i2c_sts[0]), .B(n120), .Z(n116) );
  NAND2X1 U64 ( .A(DataIn[8]), .B(n117), .Z(n115) );
  NAND2X1 U65 ( .A(n116), .B(n115), .Z(N261) );
  NAND2X1 U66 ( .A(i2c_sts[1]), .B(n120), .Z(n119) );
  NAND2X1 U67 ( .A(DataIn[9]), .B(n117), .Z(n118) );
  NAND2X1 U68 ( .A(n119), .B(n118), .Z(N263) );
endmodule


module Core_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47;

  INVX2 U1 ( .A(n36), .Z(n2) );
  INVX2 U2 ( .A(n26), .Z(n1) );
  INVX2 U3 ( .A(A[3]), .Z(n4) );
  INVX2 U4 ( .A(A[5]), .Z(n5) );
  INVX2 U5 ( .A(B[9]), .Z(n3) );
  XOR2X1 U6 ( .A(n6), .B(n7), .Z(SUM[9]) );
  NOR2X1 U7 ( .A(n8), .B(n9), .Z(n7) );
  AND2X1 U8 ( .A(n10), .B(A[8]), .Z(n9) );
  NOR2X1 U9 ( .A(n11), .B(n3), .Z(n8) );
  NOR2X1 U10 ( .A(A[8]), .B(n10), .Z(n11) );
  XOR2X1 U11 ( .A(n3), .B(A[9]), .Z(n6) );
  XOR2X1 U12 ( .A(n10), .B(n12), .Z(SUM[8]) );
  XOR2X1 U13 ( .A(B[9]), .B(A[8]), .Z(n12) );
  NAND2X1 U14 ( .A(n13), .B(n14), .Z(n10) );
  NAND2X1 U15 ( .A(B[9]), .B(n15), .Z(n14) );
  OR2X1 U16 ( .A(n16), .B(A[7]), .Z(n15) );
  NAND2X1 U17 ( .A(A[7]), .B(n16), .Z(n13) );
  XOR2X1 U18 ( .A(n17), .B(n16), .Z(SUM[7]) );
  NAND2X1 U19 ( .A(n18), .B(n19), .Z(n16) );
  NAND2X1 U20 ( .A(B[6]), .B(n20), .Z(n19) );
  OR2X1 U21 ( .A(n21), .B(A[6]), .Z(n20) );
  NAND2X1 U22 ( .A(A[6]), .B(n21), .Z(n18) );
  XOR2X1 U23 ( .A(A[7]), .B(B[9]), .Z(n17) );
  XOR2X1 U24 ( .A(n21), .B(n22), .Z(SUM[6]) );
  XOR2X1 U25 ( .A(B[6]), .B(A[6]), .Z(n22) );
  NAND2X1 U26 ( .A(n23), .B(n24), .Z(n21) );
  NAND2X1 U27 ( .A(B[5]), .B(n25), .Z(n24) );
  NAND2X1 U28 ( .A(n1), .B(n5), .Z(n25) );
  NAND2X1 U29 ( .A(A[5]), .B(n26), .Z(n23) );
  XOR2X1 U30 ( .A(n27), .B(n1), .Z(SUM[5]) );
  NAND2X1 U31 ( .A(n28), .B(n29), .Z(n26) );
  NAND2X1 U32 ( .A(B[4]), .B(n30), .Z(n29) );
  OR2X1 U33 ( .A(n31), .B(A[4]), .Z(n30) );
  NAND2X1 U34 ( .A(A[4]), .B(n31), .Z(n28) );
  XOR2X1 U35 ( .A(n5), .B(B[5]), .Z(n27) );
  XOR2X1 U36 ( .A(n31), .B(n32), .Z(SUM[4]) );
  XOR2X1 U37 ( .A(B[4]), .B(A[4]), .Z(n32) );
  NAND2X1 U38 ( .A(n33), .B(n34), .Z(n31) );
  NAND2X1 U39 ( .A(B[3]), .B(n35), .Z(n34) );
  NAND2X1 U40 ( .A(n2), .B(n4), .Z(n35) );
  NAND2X1 U41 ( .A(A[3]), .B(n36), .Z(n33) );
  XOR2X1 U42 ( .A(n37), .B(n2), .Z(SUM[3]) );
  NAND2X1 U43 ( .A(n38), .B(n39), .Z(n36) );
  NAND2X1 U44 ( .A(B[2]), .B(n40), .Z(n39) );
  OR2X1 U45 ( .A(n41), .B(A[2]), .Z(n40) );
  NAND2X1 U46 ( .A(A[2]), .B(n41), .Z(n38) );
  XOR2X1 U47 ( .A(n4), .B(B[3]), .Z(n37) );
  XOR2X1 U48 ( .A(n41), .B(n42), .Z(SUM[2]) );
  XOR2X1 U49 ( .A(B[2]), .B(A[2]), .Z(n42) );
  NAND2X1 U50 ( .A(n43), .B(n44), .Z(n41) );
  NAND2X1 U51 ( .A(B[1]), .B(n45), .Z(n44) );
  OR2X1 U52 ( .A(A[1]), .B(n46), .Z(n45) );
  NAND2X1 U53 ( .A(A[1]), .B(n46), .Z(n43) );
  XOR2X1 U54 ( .A(n46), .B(n47), .Z(SUM[1]) );
  XOR2X1 U55 ( .A(B[1]), .B(A[1]), .Z(n47) );
  AND2X1 U56 ( .A(B[0]), .B(A[0]), .Z(n46) );
  XOR2X1 U57 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module Core_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95;

  INVX2 U1 ( .A(n39), .Z(n8) );
  INVX2 U2 ( .A(B[13]), .Z(n22) );
  INVX2 U3 ( .A(B[7]), .Z(n16) );
  INVX2 U4 ( .A(B[3]), .Z(n12) );
  INVX2 U5 ( .A(B[5]), .Z(n14) );
  INVX2 U6 ( .A(B[9]), .Z(n18) );
  INVX2 U7 ( .A(B[11]), .Z(n20) );
  INVX2 U8 ( .A(B[1]), .Z(n10) );
  INVX2 U9 ( .A(B[0]), .Z(n9) );
  INVX2 U10 ( .A(B[2]), .Z(n11) );
  INVX2 U11 ( .A(B[4]), .Z(n13) );
  INVX2 U12 ( .A(n61), .Z(n1) );
  INVX2 U13 ( .A(n45), .Z(n3) );
  INVX2 U14 ( .A(n51), .Z(n2) );
  INVX2 U15 ( .A(B[8]), .Z(n17) );
  INVX2 U16 ( .A(B[6]), .Z(n15) );
  INVX2 U17 ( .A(n28), .Z(n5) );
  INVX2 U18 ( .A(n24), .Z(n4) );
  INVX2 U19 ( .A(n36), .Z(n7) );
  INVX2 U20 ( .A(n32), .Z(n6) );
  INVX2 U21 ( .A(B[10]), .Z(n19) );
  INVX2 U22 ( .A(B[12]), .Z(n21) );
  XOR2X1 U23 ( .A(n4), .B(n23), .Z(DIFF[9]) );
  XOR2X1 U24 ( .A(B[9]), .B(A[9]), .Z(n23) );
  XOR2X1 U25 ( .A(n25), .B(n26), .Z(DIFF[8]) );
  XOR2X1 U26 ( .A(A[8]), .B(n17), .Z(n26) );
  XOR2X1 U27 ( .A(n5), .B(n27), .Z(DIFF[7]) );
  XOR2X1 U28 ( .A(B[7]), .B(A[7]), .Z(n27) );
  XOR2X1 U29 ( .A(n29), .B(n30), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n15), .Z(n30) );
  XOR2X1 U31 ( .A(n6), .B(n31), .Z(DIFF[5]) );
  XOR2X1 U32 ( .A(B[5]), .B(A[5]), .Z(n31) );
  XOR2X1 U33 ( .A(n33), .B(n34), .Z(DIFF[4]) );
  XOR2X1 U34 ( .A(A[4]), .B(n13), .Z(n34) );
  XOR2X1 U35 ( .A(n7), .B(n35), .Z(DIFF[3]) );
  XOR2X1 U36 ( .A(B[3]), .B(A[3]), .Z(n35) );
  XOR2X1 U37 ( .A(n37), .B(n38), .Z(DIFF[2]) );
  XOR2X1 U38 ( .A(A[2]), .B(n11), .Z(n38) );
  XOR2X1 U39 ( .A(n39), .B(n40), .Z(DIFF[1]) );
  XOR2X1 U40 ( .A(B[1]), .B(A[1]), .Z(n40) );
  XOR2X1 U41 ( .A(n41), .B(n42), .Z(DIFF[15]) );
  XOR2X1 U42 ( .A(B[15]), .B(A[15]), .Z(n42) );
  NOR2X1 U43 ( .A(n43), .B(n44), .Z(n41) );
  AND2X1 U44 ( .A(n45), .B(A[14]), .Z(n44) );
  NOR2X1 U45 ( .A(B[14]), .B(n46), .Z(n43) );
  NOR2X1 U46 ( .A(A[14]), .B(n45), .Z(n46) );
  XOR2X1 U47 ( .A(n3), .B(n47), .Z(DIFF[14]) );
  XOR2X1 U48 ( .A(A[14]), .B(B[14]), .Z(n47) );
  NAND2X1 U49 ( .A(n48), .B(n49), .Z(n45) );
  NAND2X1 U50 ( .A(n50), .B(n22), .Z(n49) );
  OR2X1 U51 ( .A(n51), .B(A[13]), .Z(n50) );
  NAND2X1 U52 ( .A(A[13]), .B(n51), .Z(n48) );
  XOR2X1 U53 ( .A(n2), .B(n52), .Z(DIFF[13]) );
  XOR2X1 U54 ( .A(B[13]), .B(A[13]), .Z(n52) );
  NAND2X1 U55 ( .A(n53), .B(n54), .Z(n51) );
  NAND2X1 U56 ( .A(n55), .B(n21), .Z(n54) );
  OR2X1 U57 ( .A(n56), .B(A[12]), .Z(n55) );
  NAND2X1 U58 ( .A(A[12]), .B(n56), .Z(n53) );
  XOR2X1 U59 ( .A(n56), .B(n57), .Z(DIFF[12]) );
  XOR2X1 U60 ( .A(A[12]), .B(n21), .Z(n57) );
  NAND2X1 U61 ( .A(n58), .B(n59), .Z(n56) );
  NAND2X1 U62 ( .A(n60), .B(n20), .Z(n59) );
  OR2X1 U63 ( .A(n61), .B(A[11]), .Z(n60) );
  NAND2X1 U64 ( .A(A[11]), .B(n61), .Z(n58) );
  XOR2X1 U65 ( .A(n1), .B(n62), .Z(DIFF[11]) );
  XOR2X1 U66 ( .A(B[11]), .B(A[11]), .Z(n62) );
  NAND2X1 U67 ( .A(n63), .B(n64), .Z(n61) );
  NAND2X1 U68 ( .A(n65), .B(n19), .Z(n64) );
  OR2X1 U69 ( .A(n66), .B(A[10]), .Z(n65) );
  NAND2X1 U70 ( .A(A[10]), .B(n66), .Z(n63) );
  XOR2X1 U71 ( .A(n66), .B(n67), .Z(DIFF[10]) );
  XOR2X1 U72 ( .A(A[10]), .B(n19), .Z(n67) );
  NAND2X1 U73 ( .A(n68), .B(n69), .Z(n66) );
  NAND2X1 U74 ( .A(n70), .B(n18), .Z(n69) );
  OR2X1 U75 ( .A(n24), .B(A[9]), .Z(n70) );
  NAND2X1 U76 ( .A(A[9]), .B(n24), .Z(n68) );
  NAND2X1 U77 ( .A(n71), .B(n72), .Z(n24) );
  NAND2X1 U78 ( .A(n73), .B(n17), .Z(n72) );
  OR2X1 U79 ( .A(n25), .B(A[8]), .Z(n73) );
  NAND2X1 U80 ( .A(A[8]), .B(n25), .Z(n71) );
  NAND2X1 U81 ( .A(n74), .B(n75), .Z(n25) );
  NAND2X1 U82 ( .A(n76), .B(n16), .Z(n75) );
  OR2X1 U83 ( .A(n28), .B(A[7]), .Z(n76) );
  NAND2X1 U84 ( .A(A[7]), .B(n28), .Z(n74) );
  NAND2X1 U85 ( .A(n77), .B(n78), .Z(n28) );
  NAND2X1 U86 ( .A(n79), .B(n15), .Z(n78) );
  OR2X1 U87 ( .A(n29), .B(A[6]), .Z(n79) );
  NAND2X1 U88 ( .A(A[6]), .B(n29), .Z(n77) );
  NAND2X1 U89 ( .A(n80), .B(n81), .Z(n29) );
  NAND2X1 U90 ( .A(n82), .B(n14), .Z(n81) );
  OR2X1 U91 ( .A(n32), .B(A[5]), .Z(n82) );
  NAND2X1 U92 ( .A(A[5]), .B(n32), .Z(n80) );
  NAND2X1 U93 ( .A(n83), .B(n84), .Z(n32) );
  NAND2X1 U94 ( .A(n85), .B(n13), .Z(n84) );
  OR2X1 U95 ( .A(n33), .B(A[4]), .Z(n85) );
  NAND2X1 U96 ( .A(A[4]), .B(n33), .Z(n83) );
  NAND2X1 U97 ( .A(n86), .B(n87), .Z(n33) );
  NAND2X1 U98 ( .A(n88), .B(n12), .Z(n87) );
  OR2X1 U99 ( .A(n36), .B(A[3]), .Z(n88) );
  NAND2X1 U100 ( .A(A[3]), .B(n36), .Z(n86) );
  NAND2X1 U101 ( .A(n89), .B(n90), .Z(n36) );
  NAND2X1 U102 ( .A(n91), .B(n11), .Z(n90) );
  OR2X1 U103 ( .A(n37), .B(A[2]), .Z(n91) );
  NAND2X1 U104 ( .A(A[2]), .B(n37), .Z(n89) );
  NAND2X1 U105 ( .A(n92), .B(n93), .Z(n37) );
  NAND2X1 U106 ( .A(n94), .B(n10), .Z(n93) );
  OR2X1 U107 ( .A(n8), .B(A[1]), .Z(n94) );
  NAND2X1 U108 ( .A(A[1]), .B(n8), .Z(n92) );
  NAND2X1 U109 ( .A(n8), .B(n95), .Z(DIFF[0]) );
  NAND2X1 U110 ( .A(A[0]), .B(n9), .Z(n95) );
  NOR2X1 U111 ( .A(n9), .B(A[0]), .Z(n39) );
endmodule


module Core_DW01_add_1 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84;

  INVX2 U1 ( .A(n78), .Z(n6) );
  INVX2 U2 ( .A(n71), .Z(n5) );
  INVX2 U3 ( .A(n64), .Z(n4) );
  INVX2 U4 ( .A(n57), .Z(n3) );
  INVX2 U5 ( .A(n47), .Z(n2) );
  INVX2 U6 ( .A(n37), .Z(n1) );
  INVX2 U7 ( .A(A[3]), .Z(n7) );
  INVX2 U8 ( .A(A[5]), .Z(n8) );
  INVX2 U9 ( .A(A[7]), .Z(n9) );
  INVX2 U10 ( .A(A[9]), .Z(n10) );
  INVX2 U11 ( .A(A[11]), .Z(n11) );
  INVX2 U12 ( .A(A[13]), .Z(n12) );
  XOR2X1 U13 ( .A(n13), .B(n3), .Z(SUM[9]) );
  XOR2X1 U14 ( .A(n10), .B(B[9]), .Z(n13) );
  XOR2X1 U15 ( .A(n14), .B(n15), .Z(SUM[8]) );
  XOR2X1 U16 ( .A(B[8]), .B(A[8]), .Z(n15) );
  XOR2X1 U17 ( .A(n16), .B(n4), .Z(SUM[7]) );
  XOR2X1 U18 ( .A(n9), .B(B[7]), .Z(n16) );
  XOR2X1 U19 ( .A(n17), .B(n18), .Z(SUM[6]) );
  XOR2X1 U20 ( .A(B[6]), .B(A[6]), .Z(n18) );
  XOR2X1 U21 ( .A(n19), .B(n5), .Z(SUM[5]) );
  XOR2X1 U22 ( .A(n8), .B(B[5]), .Z(n19) );
  XOR2X1 U23 ( .A(n20), .B(n21), .Z(SUM[4]) );
  XOR2X1 U24 ( .A(B[4]), .B(A[4]), .Z(n21) );
  XOR2X1 U25 ( .A(n22), .B(n6), .Z(SUM[3]) );
  XOR2X1 U26 ( .A(n7), .B(B[3]), .Z(n22) );
  XOR2X1 U27 ( .A(n23), .B(n24), .Z(SUM[2]) );
  XOR2X1 U28 ( .A(B[2]), .B(A[2]), .Z(n24) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[1]) );
  XOR2X1 U30 ( .A(B[1]), .B(A[1]), .Z(n26) );
  XOR2X1 U31 ( .A(n27), .B(n28), .Z(SUM[15]) );
  XOR2X1 U32 ( .A(B[15]), .B(A[15]), .Z(n28) );
  NAND2X1 U33 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U34 ( .A(B[14]), .B(n31), .Z(n30) );
  OR2X1 U35 ( .A(n32), .B(A[14]), .Z(n31) );
  NAND2X1 U36 ( .A(A[14]), .B(n32), .Z(n29) );
  XOR2X1 U37 ( .A(n32), .B(n33), .Z(SUM[14]) );
  XOR2X1 U38 ( .A(B[14]), .B(A[14]), .Z(n33) );
  NAND2X1 U39 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U40 ( .A(B[13]), .B(n36), .Z(n35) );
  NAND2X1 U41 ( .A(n1), .B(n12), .Z(n36) );
  NAND2X1 U42 ( .A(A[13]), .B(n37), .Z(n34) );
  XOR2X1 U43 ( .A(n38), .B(n1), .Z(SUM[13]) );
  NAND2X1 U44 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U45 ( .A(B[12]), .B(n41), .Z(n40) );
  OR2X1 U46 ( .A(n42), .B(A[12]), .Z(n41) );
  NAND2X1 U47 ( .A(A[12]), .B(n42), .Z(n39) );
  XOR2X1 U48 ( .A(n12), .B(B[13]), .Z(n38) );
  XOR2X1 U49 ( .A(n42), .B(n43), .Z(SUM[12]) );
  XOR2X1 U50 ( .A(B[12]), .B(A[12]), .Z(n43) );
  NAND2X1 U51 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U52 ( .A(B[11]), .B(n46), .Z(n45) );
  NAND2X1 U53 ( .A(n2), .B(n11), .Z(n46) );
  NAND2X1 U54 ( .A(A[11]), .B(n47), .Z(n44) );
  XOR2X1 U55 ( .A(n48), .B(n2), .Z(SUM[11]) );
  NAND2X1 U56 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U57 ( .A(B[10]), .B(n51), .Z(n50) );
  OR2X1 U58 ( .A(n52), .B(A[10]), .Z(n51) );
  NAND2X1 U59 ( .A(A[10]), .B(n52), .Z(n49) );
  XOR2X1 U60 ( .A(n11), .B(B[11]), .Z(n48) );
  XOR2X1 U61 ( .A(n52), .B(n53), .Z(SUM[10]) );
  XOR2X1 U62 ( .A(B[10]), .B(A[10]), .Z(n53) );
  NAND2X1 U63 ( .A(n54), .B(n55), .Z(n52) );
  NAND2X1 U64 ( .A(B[9]), .B(n56), .Z(n55) );
  NAND2X1 U65 ( .A(n3), .B(n10), .Z(n56) );
  NAND2X1 U66 ( .A(A[9]), .B(n57), .Z(n54) );
  NAND2X1 U67 ( .A(n58), .B(n59), .Z(n57) );
  NAND2X1 U68 ( .A(B[8]), .B(n60), .Z(n59) );
  OR2X1 U69 ( .A(n14), .B(A[8]), .Z(n60) );
  NAND2X1 U70 ( .A(A[8]), .B(n14), .Z(n58) );
  NAND2X1 U71 ( .A(n61), .B(n62), .Z(n14) );
  NAND2X1 U72 ( .A(B[7]), .B(n63), .Z(n62) );
  NAND2X1 U73 ( .A(n4), .B(n9), .Z(n63) );
  NAND2X1 U74 ( .A(A[7]), .B(n64), .Z(n61) );
  NAND2X1 U75 ( .A(n65), .B(n66), .Z(n64) );
  NAND2X1 U76 ( .A(B[6]), .B(n67), .Z(n66) );
  OR2X1 U77 ( .A(n17), .B(A[6]), .Z(n67) );
  NAND2X1 U78 ( .A(A[6]), .B(n17), .Z(n65) );
  NAND2X1 U79 ( .A(n68), .B(n69), .Z(n17) );
  NAND2X1 U80 ( .A(B[5]), .B(n70), .Z(n69) );
  NAND2X1 U81 ( .A(n5), .B(n8), .Z(n70) );
  NAND2X1 U82 ( .A(A[5]), .B(n71), .Z(n68) );
  NAND2X1 U83 ( .A(n72), .B(n73), .Z(n71) );
  NAND2X1 U84 ( .A(B[4]), .B(n74), .Z(n73) );
  OR2X1 U85 ( .A(n20), .B(A[4]), .Z(n74) );
  NAND2X1 U86 ( .A(A[4]), .B(n20), .Z(n72) );
  NAND2X1 U87 ( .A(n75), .B(n76), .Z(n20) );
  NAND2X1 U88 ( .A(B[3]), .B(n77), .Z(n76) );
  NAND2X1 U89 ( .A(n6), .B(n7), .Z(n77) );
  NAND2X1 U90 ( .A(A[3]), .B(n78), .Z(n75) );
  NAND2X1 U91 ( .A(n79), .B(n80), .Z(n78) );
  NAND2X1 U92 ( .A(B[2]), .B(n81), .Z(n80) );
  OR2X1 U93 ( .A(n23), .B(A[2]), .Z(n81) );
  NAND2X1 U94 ( .A(A[2]), .B(n23), .Z(n79) );
  NAND2X1 U95 ( .A(n82), .B(n83), .Z(n23) );
  NAND2X1 U96 ( .A(B[1]), .B(n84), .Z(n83) );
  OR2X1 U97 ( .A(A[1]), .B(n25), .Z(n84) );
  NAND2X1 U98 ( .A(A[1]), .B(n25), .Z(n82) );
  AND2X1 U99 ( .A(B[0]), .B(A[0]), .Z(n25) );
  XOR2X1 U100 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module Core_DW01_ash_0 ( A, DATA_TC, SH, SH_TC, B );
  input [15:0] A;
  input [3:0] SH;
  output [15:0] B;
  input DATA_TC, SH_TC;
  wire   \ML_int[1][15] , \ML_int[1][14] , \ML_int[1][13] , \ML_int[1][12] ,
         \ML_int[1][11] , \ML_int[1][10] , \ML_int[1][9] , \ML_int[1][8] ,
         \ML_int[1][7] , \ML_int[1][6] , \ML_int[1][5] , \ML_int[1][4] ,
         \ML_int[1][3] , \ML_int[1][2] , \ML_int[1][1] , \ML_int[1][0] ,
         \ML_int[2][15] , \ML_int[2][14] , \ML_int[2][13] , \ML_int[2][12] ,
         \ML_int[2][11] , \ML_int[2][10] , \ML_int[2][9] , \ML_int[2][8] ,
         \ML_int[2][7] , \ML_int[2][6] , \ML_int[2][5] , \ML_int[2][4] ,
         \ML_int[2][3] , \ML_int[2][2] , \ML_int[3][15] , \ML_int[3][14] ,
         \ML_int[3][13] , \ML_int[3][12] , \ML_int[3][11] , \ML_int[3][10] ,
         \ML_int[3][9] , \ML_int[3][8] , \ML_int[3][7] , \ML_int[3][6] ,
         \ML_int[3][5] , \ML_int[3][4] , \ML_int[3][3] , \ML_int[3][2] ,
         \ML_int[3][1] , \ML_int[3][0] , \ML_int[4][15] , \ML_int[4][14] ,
         \ML_int[4][13] , \ML_int[4][12] , \ML_int[4][11] , \ML_int[4][10] ,
         \ML_int[4][9] , \ML_int[4][8] , \ML_int[4][7] , \ML_int[4][6] ,
         \ML_int[4][5] , \ML_int[4][4] , \ML_int[4][3] , \ML_int[4][2] ,
         \ML_int[4][1] , \ML_int[4][0] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14;
  assign B[15] = \ML_int[4][15] ;
  assign B[14] = \ML_int[4][14] ;
  assign B[13] = \ML_int[4][13] ;
  assign B[12] = \ML_int[4][12] ;
  assign B[11] = \ML_int[4][11] ;
  assign B[10] = \ML_int[4][10] ;
  assign B[9] = \ML_int[4][9] ;
  assign B[8] = \ML_int[4][8] ;
  assign B[7] = \ML_int[4][7] ;
  assign B[6] = \ML_int[4][6] ;
  assign B[5] = \ML_int[4][5] ;
  assign B[4] = \ML_int[4][4] ;
  assign B[3] = \ML_int[4][3] ;
  assign B[2] = \ML_int[4][2] ;
  assign B[1] = \ML_int[4][1] ;
  assign B[0] = \ML_int[4][0] ;

  MUX2X1 M1_3_15 ( .A(\ML_int[3][15] ), .B(\ML_int[3][7] ), .S(SH[3]), .Z(
        \ML_int[4][15] ) );
  MUX2X1 M1_3_14 ( .A(\ML_int[3][14] ), .B(\ML_int[3][6] ), .S(SH[3]), .Z(
        \ML_int[4][14] ) );
  MUX2X1 M1_3_13 ( .A(\ML_int[3][13] ), .B(\ML_int[3][5] ), .S(SH[3]), .Z(
        \ML_int[4][13] ) );
  MUX2X1 M1_3_12 ( .A(\ML_int[3][12] ), .B(\ML_int[3][4] ), .S(SH[3]), .Z(
        \ML_int[4][12] ) );
  MUX2X1 M1_3_11 ( .A(\ML_int[3][11] ), .B(\ML_int[3][3] ), .S(SH[3]), .Z(
        \ML_int[4][11] ) );
  MUX2X1 M1_3_10 ( .A(\ML_int[3][10] ), .B(\ML_int[3][2] ), .S(SH[3]), .Z(
        \ML_int[4][10] ) );
  MUX2X1 M1_3_9 ( .A(\ML_int[3][9] ), .B(\ML_int[3][1] ), .S(SH[3]), .Z(
        \ML_int[4][9] ) );
  MUX2X1 M1_3_8 ( .A(\ML_int[3][8] ), .B(\ML_int[3][0] ), .S(SH[3]), .Z(
        \ML_int[4][8] ) );
  MUX2X1 M1_2_15 ( .A(\ML_int[2][15] ), .B(\ML_int[2][11] ), .S(n6), .Z(
        \ML_int[3][15] ) );
  MUX2X1 M1_2_14 ( .A(\ML_int[2][14] ), .B(\ML_int[2][10] ), .S(n6), .Z(
        \ML_int[3][14] ) );
  MUX2X1 M1_2_13 ( .A(\ML_int[2][13] ), .B(\ML_int[2][9] ), .S(n6), .Z(
        \ML_int[3][13] ) );
  MUX2X1 M1_2_12 ( .A(\ML_int[2][12] ), .B(\ML_int[2][8] ), .S(n6), .Z(
        \ML_int[3][12] ) );
  MUX2X1 M1_2_11 ( .A(\ML_int[2][11] ), .B(\ML_int[2][7] ), .S(n6), .Z(
        \ML_int[3][11] ) );
  MUX2X1 M1_2_10 ( .A(\ML_int[2][10] ), .B(\ML_int[2][6] ), .S(n6), .Z(
        \ML_int[3][10] ) );
  MUX2X1 M1_2_9 ( .A(\ML_int[2][9] ), .B(\ML_int[2][5] ), .S(n6), .Z(
        \ML_int[3][9] ) );
  MUX2X1 M1_2_8 ( .A(\ML_int[2][8] ), .B(\ML_int[2][4] ), .S(n6), .Z(
        \ML_int[3][8] ) );
  MUX2X1 M1_2_7 ( .A(\ML_int[2][7] ), .B(\ML_int[2][3] ), .S(n6), .Z(
        \ML_int[3][7] ) );
  MUX2X1 M1_2_6 ( .A(\ML_int[2][6] ), .B(\ML_int[2][2] ), .S(n6), .Z(
        \ML_int[3][6] ) );
  MUX2X1 M1_2_5 ( .A(\ML_int[2][5] ), .B(n9), .S(n6), .Z(\ML_int[3][5] ) );
  MUX2X1 M1_2_4 ( .A(\ML_int[2][4] ), .B(n7), .S(n6), .Z(\ML_int[3][4] ) );
  MUX2X1 M1_1_15 ( .A(\ML_int[1][15] ), .B(\ML_int[1][13] ), .S(n4), .Z(
        \ML_int[2][15] ) );
  MUX2X1 M1_1_14 ( .A(\ML_int[1][14] ), .B(\ML_int[1][12] ), .S(n4), .Z(
        \ML_int[2][14] ) );
  MUX2X1 M1_1_13 ( .A(\ML_int[1][13] ), .B(\ML_int[1][11] ), .S(n4), .Z(
        \ML_int[2][13] ) );
  MUX2X1 M1_1_12 ( .A(\ML_int[1][12] ), .B(\ML_int[1][10] ), .S(n4), .Z(
        \ML_int[2][12] ) );
  MUX2X1 M1_1_11 ( .A(\ML_int[1][11] ), .B(\ML_int[1][9] ), .S(n4), .Z(
        \ML_int[2][11] ) );
  MUX2X1 M1_1_10 ( .A(\ML_int[1][10] ), .B(\ML_int[1][8] ), .S(n4), .Z(
        \ML_int[2][10] ) );
  MUX2X1 M1_1_9 ( .A(\ML_int[1][9] ), .B(\ML_int[1][7] ), .S(n4), .Z(
        \ML_int[2][9] ) );
  MUX2X1 M1_1_8 ( .A(\ML_int[1][8] ), .B(\ML_int[1][6] ), .S(n4), .Z(
        \ML_int[2][8] ) );
  MUX2X1 M1_1_7 ( .A(\ML_int[1][7] ), .B(\ML_int[1][5] ), .S(n4), .Z(
        \ML_int[2][7] ) );
  MUX2X1 M1_1_6 ( .A(\ML_int[1][6] ), .B(\ML_int[1][4] ), .S(n4), .Z(
        \ML_int[2][6] ) );
  MUX2X1 M1_1_5 ( .A(\ML_int[1][5] ), .B(\ML_int[1][3] ), .S(n4), .Z(
        \ML_int[2][5] ) );
  MUX2X1 M1_1_4 ( .A(\ML_int[1][4] ), .B(\ML_int[1][2] ), .S(n4), .Z(
        \ML_int[2][4] ) );
  MUX2X1 M1_1_3 ( .A(\ML_int[1][3] ), .B(\ML_int[1][1] ), .S(n4), .Z(
        \ML_int[2][3] ) );
  MUX2X1 M1_1_2 ( .A(\ML_int[1][2] ), .B(\ML_int[1][0] ), .S(n4), .Z(
        \ML_int[2][2] ) );
  MUX2X1 M1_0_15 ( .A(A[15]), .B(A[14]), .S(n2), .Z(\ML_int[1][15] ) );
  MUX2X1 M1_0_14 ( .A(A[14]), .B(A[13]), .S(n2), .Z(\ML_int[1][14] ) );
  MUX2X1 M1_0_13 ( .A(A[13]), .B(A[12]), .S(n2), .Z(\ML_int[1][13] ) );
  MUX2X1 M1_0_12 ( .A(A[12]), .B(A[11]), .S(n2), .Z(\ML_int[1][12] ) );
  MUX2X1 M1_0_11 ( .A(A[11]), .B(A[10]), .S(n2), .Z(\ML_int[1][11] ) );
  MUX2X1 M1_0_10 ( .A(A[10]), .B(A[9]), .S(n2), .Z(\ML_int[1][10] ) );
  MUX2X1 M1_0_9 ( .A(A[9]), .B(A[8]), .S(n2), .Z(\ML_int[1][9] ) );
  MUX2X1 M1_0_8 ( .A(A[8]), .B(A[7]), .S(n2), .Z(\ML_int[1][8] ) );
  MUX2X1 M1_0_7 ( .A(A[7]), .B(A[6]), .S(n2), .Z(\ML_int[1][7] ) );
  MUX2X1 M1_0_6 ( .A(A[6]), .B(A[5]), .S(n2), .Z(\ML_int[1][6] ) );
  MUX2X1 M1_0_5 ( .A(A[5]), .B(A[4]), .S(n2), .Z(\ML_int[1][5] ) );
  MUX2X1 M1_0_4 ( .A(A[4]), .B(A[3]), .S(n2), .Z(\ML_int[1][4] ) );
  MUX2X1 M1_0_3 ( .A(A[3]), .B(A[2]), .S(n2), .Z(\ML_int[1][3] ) );
  MUX2X1 M1_0_2 ( .A(A[2]), .B(A[1]), .S(n2), .Z(\ML_int[1][2] ) );
  MUX2X1 M1_0_1 ( .A(A[1]), .B(A[0]), .S(n2), .Z(\ML_int[1][1] ) );
  INVX2 U3 ( .A(n3), .Z(n4) );
  INVX2 U4 ( .A(n1), .Z(n2) );
  INVX2 U5 ( .A(n5), .Z(n6) );
  INVX2 U6 ( .A(\ML_int[2][2] ), .Z(n8) );
  INVX2 U7 ( .A(\ML_int[2][3] ), .Z(n10) );
  INVX2 U8 ( .A(n13), .Z(n9) );
  INVX2 U9 ( .A(n14), .Z(n7) );
  INVX2 U10 ( .A(SH[0]), .Z(n1) );
  INVX2 U11 ( .A(SH[2]), .Z(n5) );
  INVX2 U12 ( .A(SH[3]), .Z(n11) );
  INVX2 U13 ( .A(SH[1]), .Z(n3) );
  AND2X1 U14 ( .A(\ML_int[3][7] ), .B(n11), .Z(\ML_int[4][7] ) );
  AND2X1 U15 ( .A(\ML_int[3][6] ), .B(n11), .Z(\ML_int[4][6] ) );
  AND2X1 U16 ( .A(\ML_int[3][5] ), .B(n11), .Z(\ML_int[4][5] ) );
  AND2X1 U17 ( .A(\ML_int[3][4] ), .B(n11), .Z(\ML_int[4][4] ) );
  NOR2X1 U18 ( .A(n12), .B(n10), .Z(\ML_int[4][3] ) );
  NOR2X1 U19 ( .A(n12), .B(n8), .Z(\ML_int[4][2] ) );
  NOR2X1 U20 ( .A(n12), .B(n13), .Z(\ML_int[4][1] ) );
  NOR2X1 U21 ( .A(n12), .B(n14), .Z(\ML_int[4][0] ) );
  NAND2X1 U22 ( .A(n5), .B(n11), .Z(n12) );
  NOR2X1 U23 ( .A(n6), .B(n10), .Z(\ML_int[3][3] ) );
  NOR2X1 U24 ( .A(n6), .B(n8), .Z(\ML_int[3][2] ) );
  NOR2X1 U25 ( .A(n6), .B(n13), .Z(\ML_int[3][1] ) );
  NOR2X1 U26 ( .A(n6), .B(n14), .Z(\ML_int[3][0] ) );
  NAND2X1 U27 ( .A(\ML_int[1][1] ), .B(n3), .Z(n13) );
  NAND2X1 U28 ( .A(\ML_int[1][0] ), .B(n3), .Z(n14) );
  AND2X1 U29 ( .A(A[0]), .B(n1), .Z(\ML_int[1][0] ) );
endmodule


module Core_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48;

  INVX2 U1 ( .A(n37), .Z(n3) );
  INVX2 U2 ( .A(n27), .Z(n2) );
  INVX2 U3 ( .A(n17), .Z(n1) );
  INVX2 U4 ( .A(A[3]), .Z(n4) );
  INVX2 U5 ( .A(A[5]), .Z(n5) );
  INVX2 U6 ( .A(A[7]), .Z(n6) );
  XOR2X1 U7 ( .A(n7), .B(n8), .Z(SUM[9]) );
  XOR2X1 U8 ( .A(B[9]), .B(A[9]), .Z(n8) );
  NAND2X1 U9 ( .A(n9), .B(n10), .Z(n7) );
  NAND2X1 U10 ( .A(B[8]), .B(n11), .Z(n10) );
  OR2X1 U11 ( .A(n12), .B(A[8]), .Z(n11) );
  NAND2X1 U12 ( .A(A[8]), .B(n12), .Z(n9) );
  XOR2X1 U13 ( .A(n12), .B(n13), .Z(SUM[8]) );
  XOR2X1 U14 ( .A(B[8]), .B(A[8]), .Z(n13) );
  NAND2X1 U15 ( .A(n14), .B(n15), .Z(n12) );
  NAND2X1 U16 ( .A(B[7]), .B(n16), .Z(n15) );
  NAND2X1 U17 ( .A(n1), .B(n6), .Z(n16) );
  NAND2X1 U18 ( .A(A[7]), .B(n17), .Z(n14) );
  XOR2X1 U19 ( .A(n18), .B(n1), .Z(SUM[7]) );
  NAND2X1 U20 ( .A(n19), .B(n20), .Z(n17) );
  NAND2X1 U21 ( .A(B[6]), .B(n21), .Z(n20) );
  OR2X1 U22 ( .A(n22), .B(A[6]), .Z(n21) );
  NAND2X1 U23 ( .A(A[6]), .B(n22), .Z(n19) );
  XOR2X1 U24 ( .A(n6), .B(B[7]), .Z(n18) );
  XOR2X1 U25 ( .A(n22), .B(n23), .Z(SUM[6]) );
  XOR2X1 U26 ( .A(B[6]), .B(A[6]), .Z(n23) );
  NAND2X1 U27 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U28 ( .A(B[5]), .B(n26), .Z(n25) );
  NAND2X1 U29 ( .A(n2), .B(n5), .Z(n26) );
  NAND2X1 U30 ( .A(A[5]), .B(n27), .Z(n24) );
  XOR2X1 U31 ( .A(n28), .B(n2), .Z(SUM[5]) );
  NAND2X1 U32 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U33 ( .A(B[4]), .B(n31), .Z(n30) );
  OR2X1 U34 ( .A(n32), .B(A[4]), .Z(n31) );
  NAND2X1 U35 ( .A(A[4]), .B(n32), .Z(n29) );
  XOR2X1 U36 ( .A(n5), .B(B[5]), .Z(n28) );
  XOR2X1 U37 ( .A(n32), .B(n33), .Z(SUM[4]) );
  XOR2X1 U38 ( .A(B[4]), .B(A[4]), .Z(n33) );
  NAND2X1 U39 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U40 ( .A(B[3]), .B(n36), .Z(n35) );
  NAND2X1 U41 ( .A(n3), .B(n4), .Z(n36) );
  NAND2X1 U42 ( .A(A[3]), .B(n37), .Z(n34) );
  XOR2X1 U43 ( .A(n38), .B(n3), .Z(SUM[3]) );
  NAND2X1 U44 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U45 ( .A(B[2]), .B(n41), .Z(n40) );
  OR2X1 U46 ( .A(n42), .B(A[2]), .Z(n41) );
  NAND2X1 U47 ( .A(A[2]), .B(n42), .Z(n39) );
  XOR2X1 U48 ( .A(n4), .B(B[3]), .Z(n38) );
  XOR2X1 U49 ( .A(n42), .B(n43), .Z(SUM[2]) );
  XOR2X1 U50 ( .A(B[2]), .B(A[2]), .Z(n43) );
  NAND2X1 U51 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U52 ( .A(B[1]), .B(n46), .Z(n45) );
  OR2X1 U53 ( .A(A[1]), .B(n47), .Z(n46) );
  NAND2X1 U54 ( .A(A[1]), .B(n47), .Z(n44) );
  XOR2X1 U55 ( .A(n47), .B(n48), .Z(SUM[1]) );
  XOR2X1 U56 ( .A(B[1]), .B(A[1]), .Z(n48) );
  AND2X1 U57 ( .A(B[0]), .B(A[0]), .Z(n47) );
  XOR2X1 U58 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module Core_DW01_cmp6_0 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [15:0] A;
  input [15:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86;

  INVX2 U1 ( .A(n38), .Z(n5) );
  INVX2 U2 ( .A(n33), .Z(n4) );
  INVX2 U3 ( .A(GT), .Z(n1) );
  INVX2 U4 ( .A(B[5]), .Z(n16) );
  INVX2 U5 ( .A(B[3]), .Z(n14) );
  INVX2 U6 ( .A(B[7]), .Z(n18) );
  INVX2 U7 ( .A(B[9]), .Z(n20) );
  INVX2 U8 ( .A(B[8]), .Z(n19) );
  INVX2 U9 ( .A(B[4]), .Z(n15) );
  INVX2 U10 ( .A(B[6]), .Z(n17) );
  INVX2 U11 ( .A(B[2]), .Z(n13) );
  INVX2 U12 ( .A(B[13]), .Z(n24) );
  INVX2 U13 ( .A(B[11]), .Z(n22) );
  INVX2 U14 ( .A(B[1]), .Z(n12) );
  INVX2 U15 ( .A(n37), .Z(n3) );
  INVX2 U16 ( .A(n34), .Z(n6) );
  INVX2 U17 ( .A(n75), .Z(n7) );
  INVX2 U18 ( .A(n76), .Z(n8) );
  INVX2 U19 ( .A(n77), .Z(n9) );
  INVX2 U20 ( .A(n78), .Z(n10) );
  INVX2 U21 ( .A(B[12]), .Z(n23) );
  INVX2 U22 ( .A(B[10]), .Z(n21) );
  INVX2 U23 ( .A(B[14]), .Z(n25) );
  INVX2 U24 ( .A(A[0]), .Z(n2) );
  INVX2 U25 ( .A(A[15]), .Z(n11) );
  AND2X1 U26 ( .A(n26), .B(n27), .Z(EQ) );
  NOR2X1 U27 ( .A(n28), .B(n29), .Z(n27) );
  NAND3X1 U28 ( .A(n30), .B(n31), .C(n32), .Z(n29) );
  NOR2X1 U29 ( .A(n33), .B(n34), .Z(n32) );
  NAND3X1 U30 ( .A(n35), .B(n1), .C(n36), .Z(n28) );
  NOR2X1 U31 ( .A(n37), .B(n38), .Z(n36) );
  NAND2X1 U32 ( .A(n39), .B(n40), .Z(GT) );
  NAND2X1 U33 ( .A(n41), .B(n35), .Z(n40) );
  NAND2X1 U34 ( .A(n42), .B(n43), .Z(n41) );
  NAND2X1 U35 ( .A(A[14]), .B(n25), .Z(n43) );
  NAND3X1 U36 ( .A(n44), .B(n10), .C(n45), .Z(n42) );
  NAND3X1 U37 ( .A(n46), .B(n47), .C(n48), .Z(n45) );
  NAND2X1 U38 ( .A(A[13]), .B(n24), .Z(n48) );
  NAND2X1 U39 ( .A(A[12]), .B(n23), .Z(n47) );
  NAND3X1 U40 ( .A(n9), .B(n49), .C(n50), .Z(n46) );
  NAND3X1 U41 ( .A(n51), .B(n52), .C(n53), .Z(n50) );
  NAND2X1 U42 ( .A(A[11]), .B(n22), .Z(n53) );
  NAND2X1 U43 ( .A(A[10]), .B(n21), .Z(n52) );
  NAND3X1 U44 ( .A(n54), .B(n8), .C(n55), .Z(n51) );
  NAND3X1 U45 ( .A(n56), .B(n57), .C(n58), .Z(n55) );
  NAND2X1 U46 ( .A(A[9]), .B(n20), .Z(n58) );
  NAND2X1 U47 ( .A(A[8]), .B(n19), .Z(n57) );
  NAND3X1 U48 ( .A(n7), .B(n30), .C(n59), .Z(n56) );
  NAND3X1 U49 ( .A(n60), .B(n61), .C(n62), .Z(n59) );
  NAND2X1 U50 ( .A(A[7]), .B(n18), .Z(n62) );
  NAND2X1 U51 ( .A(A[6]), .B(n17), .Z(n61) );
  NAND3X1 U52 ( .A(n31), .B(n6), .C(n63), .Z(n60) );
  NAND3X1 U53 ( .A(n64), .B(n65), .C(n66), .Z(n63) );
  NAND2X1 U54 ( .A(A[5]), .B(n16), .Z(n66) );
  NAND2X1 U55 ( .A(A[4]), .B(n15), .Z(n65) );
  NAND3X1 U56 ( .A(n4), .B(n5), .C(n67), .Z(n64) );
  NAND3X1 U57 ( .A(n68), .B(n69), .C(n70), .Z(n67) );
  NAND2X1 U58 ( .A(A[3]), .B(n14), .Z(n70) );
  NAND2X1 U59 ( .A(A[2]), .B(n13), .Z(n69) );
  NAND3X1 U60 ( .A(n71), .B(n3), .C(n72), .Z(n68) );
  OR2X1 U61 ( .A(n73), .B(A[1]), .Z(n72) );
  NOR2X1 U62 ( .A(n13), .B(A[2]), .Z(n37) );
  NAND2X1 U63 ( .A(B[1]), .B(n74), .Z(n71) );
  NAND2X1 U64 ( .A(A[1]), .B(n73), .Z(n74) );
  NOR2X1 U65 ( .A(n2), .B(B[0]), .Z(n73) );
  NOR2X1 U66 ( .A(n15), .B(A[4]), .Z(n38) );
  NOR2X1 U67 ( .A(n14), .B(A[3]), .Z(n33) );
  NOR2X1 U68 ( .A(n17), .B(A[6]), .Z(n34) );
  OR2X1 U69 ( .A(n16), .B(A[5]), .Z(n31) );
  OR2X1 U70 ( .A(n19), .B(A[8]), .Z(n30) );
  OR2X1 U71 ( .A(n11), .B(B[15]), .Z(n39) );
  NAND2X1 U72 ( .A(B[15]), .B(n11), .Z(n35) );
  NOR2X1 U73 ( .A(n79), .B(n80), .Z(n26) );
  NAND3X1 U74 ( .A(n81), .B(n44), .C(n82), .Z(n80) );
  NOR2X1 U75 ( .A(n77), .B(n78), .Z(n82) );
  NOR2X1 U76 ( .A(n25), .B(A[14]), .Z(n78) );
  NOR2X1 U77 ( .A(n22), .B(A[11]), .Z(n77) );
  OR2X1 U78 ( .A(n24), .B(A[13]), .Z(n44) );
  NAND2X1 U79 ( .A(n83), .B(n84), .Z(n81) );
  NAND2X1 U80 ( .A(n85), .B(n12), .Z(n84) );
  NAND2X1 U81 ( .A(A[1]), .B(n85), .Z(n83) );
  NAND2X1 U82 ( .A(B[0]), .B(n2), .Z(n85) );
  NAND3X1 U83 ( .A(n49), .B(n54), .C(n86), .Z(n79) );
  NOR2X1 U84 ( .A(n75), .B(n76), .Z(n86) );
  NOR2X1 U85 ( .A(n21), .B(A[10]), .Z(n76) );
  NOR2X1 U86 ( .A(n18), .B(A[7]), .Z(n75) );
  OR2X1 U87 ( .A(n20), .B(A[9]), .Z(n54) );
  OR2X1 U88 ( .A(n23), .B(A[12]), .Z(n49) );
endmodule


module Core ( clk, rst, mem_to_core_data, core_to_mem_data, 
        core_to_mem_address, core_to_mem_write_enable, i2c_wr_en, i2c_sts, 
        i2c_to_core_data, core_to_i2c_data, i2c_reg_addr, i2c_addr, pwm_reg0, 
        pwm_reg1, pwm_reg2, pwm_reg3, pwm_reg4, pwm_reg5, pwm_reg6, pwm_reg7
 );
  input [15:0] mem_to_core_data;
  output [15:0] core_to_mem_data;
  output [9:0] core_to_mem_address;
  input [1:0] i2c_sts;
  input [7:0] i2c_to_core_data;
  output [7:0] core_to_i2c_data;
  output [7:0] i2c_reg_addr;
  output [8:0] i2c_addr;
  output [15:0] pwm_reg0;
  output [15:0] pwm_reg1;
  output [15:0] pwm_reg2;
  output [15:0] pwm_reg3;
  output [15:0] pwm_reg4;
  output [15:0] pwm_reg5;
  output [15:0] pwm_reg6;
  output [15:0] pwm_reg7;
  input clk, rst, i2c_wr_en;
  output core_to_mem_write_enable;
  wire   write_enable, \opcode[3] , cond, jal, N135, N136, N137, N138, N139,
         N140, N141, N142, N143, N144, N145, N146, N147, N148, N149, N150,
         N151, N152, N153, N154, N155, N156, N157, N158, N159, N160, N161,
         N162, N163, N164, N165, N166, N186, N187, N188, N189, N190, N191,
         N192, N193, N194, N195, N196, N197, N198, N199, N200, N201, N219,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N286, N287, N288, N289, N290, N291,
         N292, N293, N294, N295, N309, N310, N311, N312, N313, N314, N315,
         N316, N317, N318, N412, N419, N420, N421, N422, N423, N424, N425,
         N426, N427, N439, N440, N441, n9, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, \add_311/A[0] , \add_311/A[1] , \add_311/A[2] ,
         \add_311/A[3] , \add_311/A[4] , \add_311/A[5] , \add_311/A[6] ,
         \add_311/A[7] , \add_311/A[8] , \add_311/A[9] , n1, n2, n3, n4, n5,
         n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n58, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n144, n528, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929, n930, n931, n932, n933, n934, n935, n936, n937, n938,
         n939, n940, n941;
  wire   [3:0] reg_index1;
  wire   [3:0] reg_index2;
  wire   [3:0] reg_index3;
  wire   [15:0] write_data;
  wire   [3:0] write_index;
  wire   [15:0] reg_read1;
  wire   [15:0] reg_read2;
  wire   [15:0] reg_read3;
  wire   [3:0] dest_index;
  wire   [15:0] reg_data1;
  wire   [15:0] reg_data2;
  wire   [3:0] shift;
  wire   [1:0] flag;
  wire   [15:0] reg_data3;

  DFFQX1 \dest_index_reg[3]  ( .D(n794), .CLK(clk), .Q(dest_index[3]) );
  DFFQX1 \dest_index_reg[2]  ( .D(n795), .CLK(clk), .Q(dest_index[2]) );
  DFFQX1 \dest_index_reg[1]  ( .D(n796), .CLK(clk), .Q(dest_index[1]) );
  DFFQX1 \dest_index_reg[0]  ( .D(n797), .CLK(clk), .Q(dest_index[0]) );
  DFFQX1 jal_reg ( .D(n815), .CLK(clk), .Q(jal) );
  DFFQX1 cond_reg ( .D(n814), .CLK(clk), .Q(cond) );
  DFFQX1 \shift_reg[0]  ( .D(n813), .CLK(clk), .Q(shift[0]) );
  DFFQX1 \shift_reg[1]  ( .D(n812), .CLK(clk), .Q(shift[1]) );
  DFFQX1 \shift_reg[2]  ( .D(n811), .CLK(clk), .Q(shift[2]) );
  DFFQX1 \shift_reg[3]  ( .D(n810), .CLK(clk), .Q(shift[3]) );
  DFFQX1 \opcode_reg[3]  ( .D(n798), .CLK(clk), .Q(\opcode[3] ) );
  DFFQX1 \reg_data3_reg[0]  ( .D(n790), .CLK(clk), .Q(reg_data3[0]) );
  DFFQX1 \reg_data3_reg[1]  ( .D(n789), .CLK(clk), .Q(reg_data3[1]) );
  DFFQX1 \reg_data3_reg[2]  ( .D(n788), .CLK(clk), .Q(reg_data3[2]) );
  DFFQX1 \reg_data3_reg[3]  ( .D(n787), .CLK(clk), .Q(reg_data3[3]) );
  DFFQX1 \reg_data3_reg[4]  ( .D(n786), .CLK(clk), .Q(reg_data3[4]) );
  DFFQX1 \reg_data3_reg[5]  ( .D(n785), .CLK(clk), .Q(reg_data3[5]) );
  DFFQX1 \reg_data3_reg[6]  ( .D(n784), .CLK(clk), .Q(reg_data3[6]) );
  DFFQX1 \reg_data3_reg[7]  ( .D(n783), .CLK(clk), .Q(reg_data3[7]) );
  DFFQX1 \reg_data3_reg[8]  ( .D(n782), .CLK(clk), .Q(reg_data3[8]) );
  DFFQX1 \reg_data3_reg[9]  ( .D(n781), .CLK(clk), .Q(reg_data3[9]) );
  DFFQX1 \reg_data3_reg[10]  ( .D(n780), .CLK(clk), .Q(reg_data3[10]) );
  DFFQX1 \reg_data3_reg[11]  ( .D(n779), .CLK(clk), .Q(reg_data3[11]) );
  DFFQX1 \reg_data3_reg[12]  ( .D(n778), .CLK(clk), .Q(reg_data3[12]) );
  DFFQX1 \reg_data3_reg[13]  ( .D(n777), .CLK(clk), .Q(reg_data3[13]) );
  DFFQX1 \reg_data3_reg[14]  ( .D(n776), .CLK(clk), .Q(reg_data3[14]) );
  DFFQX1 \reg_data3_reg[15]  ( .D(n775), .CLK(clk), .Q(reg_data3[15]) );
  DFFQX1 \reg_data2_reg[0]  ( .D(n774), .CLK(clk), .Q(reg_data2[0]) );
  DFFQX1 \reg_data2_reg[1]  ( .D(n773), .CLK(clk), .Q(reg_data2[1]) );
  DFFQX1 \reg_data2_reg[2]  ( .D(n772), .CLK(clk), .Q(reg_data2[2]) );
  DFFQX1 \reg_data2_reg[3]  ( .D(n771), .CLK(clk), .Q(reg_data2[3]) );
  DFFQX1 \reg_data2_reg[4]  ( .D(n770), .CLK(clk), .Q(reg_data2[4]) );
  DFFQX1 \reg_data2_reg[5]  ( .D(n769), .CLK(clk), .Q(reg_data2[5]) );
  DFFQX1 \reg_data2_reg[6]  ( .D(n768), .CLK(clk), .Q(reg_data2[6]) );
  DFFQX1 \reg_data2_reg[7]  ( .D(n767), .CLK(clk), .Q(reg_data2[7]) );
  DFFQX1 \reg_data2_reg[8]  ( .D(n766), .CLK(clk), .Q(reg_data2[8]) );
  DFFQX1 \reg_data2_reg[9]  ( .D(n765), .CLK(clk), .Q(reg_data2[9]) );
  DFFQX1 \reg_data2_reg[10]  ( .D(n764), .CLK(clk), .Q(reg_data2[10]) );
  DFFQX1 \reg_data2_reg[11]  ( .D(n763), .CLK(clk), .Q(reg_data2[11]) );
  DFFQX1 \reg_data2_reg[12]  ( .D(n762), .CLK(clk), .Q(reg_data2[12]) );
  DFFQX1 \reg_data2_reg[13]  ( .D(n761), .CLK(clk), .Q(reg_data2[13]) );
  DFFQX1 \reg_data2_reg[14]  ( .D(n760), .CLK(clk), .Q(reg_data2[14]) );
  DFFQX1 \reg_data2_reg[15]  ( .D(n759), .CLK(clk), .Q(reg_data2[15]) );
  DFFQX1 \reg_data1_reg[10]  ( .D(n748), .CLK(clk), .Q(reg_data1[10]) );
  DFFQX1 \reg_data1_reg[11]  ( .D(n747), .CLK(clk), .Q(reg_data1[11]) );
  DFFQX1 \reg_data1_reg[12]  ( .D(n746), .CLK(clk), .Q(reg_data1[12]) );
  DFFQX1 \reg_data1_reg[13]  ( .D(n745), .CLK(clk), .Q(reg_data1[13]) );
  DFFQX1 \reg_data1_reg[14]  ( .D(n744), .CLK(clk), .Q(reg_data1[14]) );
  DFFQX1 \reg_data1_reg[15]  ( .D(n743), .CLK(clk), .Q(reg_data1[15]) );
  DFFQX1 \flag_reg[0]  ( .D(n742), .CLK(clk), .Q(flag[0]) );
  DFFQX1 \flag_reg[1]  ( .D(n741), .CLK(clk), .Q(flag[1]) );
  AND2X1 U108 ( .A(n118), .B(dest_index[3]), .Z(write_index[3]) );
  NAND2X1 U109 ( .A(n119), .B(n120), .Z(write_index[2]) );
  NAND2X1 U110 ( .A(dest_index[2]), .B(n118), .Z(n120) );
  AND2X1 U111 ( .A(n118), .B(dest_index[1]), .Z(write_index[1]) );
  NAND2X1 U112 ( .A(n119), .B(n121), .Z(write_index[0]) );
  NAND2X1 U113 ( .A(dest_index[0]), .B(n118), .Z(n121) );
  NAND2X1 U114 ( .A(n122), .B(n123), .Z(n118) );
  NAND3X1 U115 ( .A(n123), .B(n119), .C(n124), .Z(write_enable) );
  NAND2X1 U116 ( .A(n64), .B(n125), .Z(n124) );
  NAND3X1 U117 ( .A(n85), .B(n93), .C(n126), .Z(n125) );
  NOR2X1 U118 ( .A(n127), .B(n128), .Z(n126) );
  NAND2X1 U119 ( .A(n129), .B(n130), .Z(n128) );
  NAND3X1 U120 ( .A(n132), .B(n133), .C(n134), .Z(write_data[9]) );
  NAND2X1 U121 ( .A(mem_to_core_data[9]), .B(n20), .Z(n134) );
  NAND2X1 U122 ( .A(\add_311/A[9] ), .B(n60), .Z(n133) );
  NAND2X1 U123 ( .A(n64), .B(n135), .Z(n132) );
  NAND3X1 U124 ( .A(n136), .B(n137), .C(n138), .Z(n135) );
  NOR2X1 U125 ( .A(n139), .B(n140), .Z(n138) );
  NAND2X1 U126 ( .A(n141), .B(n142), .Z(n140) );
  NAND2X1 U127 ( .A(n105), .B(n131), .Z(n142) );
  NAND2X1 U128 ( .A(n90), .B(n31), .Z(n141) );
  NAND2X1 U130 ( .A(N230), .B(n86), .Z(n145) );
  NAND2X1 U131 ( .A(reg_data2[9]), .B(n146), .Z(n143) );
  NAND2X1 U132 ( .A(n147), .B(n148), .Z(n146) );
  NAND2X1 U133 ( .A(n105), .B(n91), .Z(n148) );
  AND2X1 U134 ( .A(n149), .B(n150), .Z(n137) );
  NAND2X1 U135 ( .A(N195), .B(n89), .Z(n150) );
  NAND2X1 U136 ( .A(N160), .B(n84), .Z(n149) );
  NOR2X1 U137 ( .A(n151), .B(n152), .Z(n136) );
  NOR2X1 U138 ( .A(n153), .B(n52), .Z(n152) );
  AND2X1 U139 ( .A(N144), .B(n88), .Z(n151) );
  NAND3X1 U140 ( .A(n154), .B(n155), .C(n156), .Z(write_data[8]) );
  NAND2X1 U141 ( .A(mem_to_core_data[8]), .B(n20), .Z(n156) );
  NAND2X1 U142 ( .A(\add_311/A[8] ), .B(n60), .Z(n155) );
  NAND2X1 U143 ( .A(n64), .B(n157), .Z(n154) );
  NAND3X1 U144 ( .A(n158), .B(n159), .C(n160), .Z(n157) );
  NOR2X1 U145 ( .A(n161), .B(n162), .Z(n160) );
  NAND2X1 U146 ( .A(n163), .B(n164), .Z(n162) );
  NAND2X1 U147 ( .A(n104), .B(n131), .Z(n164) );
  NAND2X1 U148 ( .A(n90), .B(n32), .Z(n163) );
  NAND2X1 U150 ( .A(N229), .B(n86), .Z(n166) );
  NAND2X1 U151 ( .A(reg_data2[8]), .B(n167), .Z(n165) );
  NAND2X1 U152 ( .A(n147), .B(n168), .Z(n167) );
  NAND2X1 U153 ( .A(n104), .B(n91), .Z(n168) );
  AND2X1 U154 ( .A(n169), .B(n170), .Z(n159) );
  NAND2X1 U155 ( .A(N194), .B(n89), .Z(n170) );
  NAND2X1 U156 ( .A(N159), .B(n84), .Z(n169) );
  NOR2X1 U157 ( .A(n171), .B(n172), .Z(n158) );
  NOR2X1 U158 ( .A(n153), .B(n53), .Z(n172) );
  AND2X1 U159 ( .A(N143), .B(n88), .Z(n171) );
  NAND3X1 U160 ( .A(n173), .B(n174), .C(n175), .Z(write_data[7]) );
  NAND2X1 U161 ( .A(mem_to_core_data[7]), .B(n20), .Z(n175) );
  NAND2X1 U162 ( .A(\add_311/A[7] ), .B(n60), .Z(n174) );
  NAND2X1 U163 ( .A(n64), .B(n176), .Z(n173) );
  NAND3X1 U164 ( .A(n177), .B(n178), .C(n179), .Z(n176) );
  NOR2X1 U165 ( .A(n180), .B(n181), .Z(n179) );
  NAND2X1 U166 ( .A(n182), .B(n183), .Z(n181) );
  NAND2X1 U167 ( .A(n103), .B(n131), .Z(n183) );
  NAND2X1 U168 ( .A(n90), .B(n33), .Z(n182) );
  NAND2X1 U170 ( .A(N228), .B(n86), .Z(n185) );
  NAND2X1 U171 ( .A(reg_data2[7]), .B(n186), .Z(n184) );
  NAND2X1 U172 ( .A(n147), .B(n187), .Z(n186) );
  NAND2X1 U173 ( .A(n103), .B(n91), .Z(n187) );
  AND2X1 U174 ( .A(n188), .B(n189), .Z(n178) );
  NAND2X1 U175 ( .A(N193), .B(n89), .Z(n189) );
  NAND2X1 U176 ( .A(N158), .B(n84), .Z(n188) );
  NOR2X1 U177 ( .A(n190), .B(n191), .Z(n177) );
  NOR2X1 U178 ( .A(n130), .B(n47), .Z(n191) );
  AND2X1 U179 ( .A(N142), .B(n88), .Z(n190) );
  NAND3X1 U180 ( .A(n192), .B(n193), .C(n194), .Z(write_data[6]) );
  NAND2X1 U181 ( .A(mem_to_core_data[6]), .B(n20), .Z(n194) );
  NAND2X1 U182 ( .A(\add_311/A[6] ), .B(n60), .Z(n193) );
  NAND2X1 U183 ( .A(n64), .B(n195), .Z(n192) );
  NAND3X1 U184 ( .A(n196), .B(n197), .C(n198), .Z(n195) );
  NOR2X1 U185 ( .A(n199), .B(n200), .Z(n198) );
  NAND2X1 U186 ( .A(n201), .B(n202), .Z(n200) );
  NAND2X1 U187 ( .A(n102), .B(n131), .Z(n202) );
  NAND2X1 U188 ( .A(n90), .B(n34), .Z(n201) );
  NAND2X1 U190 ( .A(N227), .B(n86), .Z(n204) );
  NAND2X1 U191 ( .A(reg_data2[6]), .B(n205), .Z(n203) );
  NAND2X1 U192 ( .A(n147), .B(n206), .Z(n205) );
  NAND2X1 U193 ( .A(n102), .B(n91), .Z(n206) );
  AND2X1 U194 ( .A(n207), .B(n208), .Z(n197) );
  NAND2X1 U195 ( .A(N192), .B(n89), .Z(n208) );
  NAND2X1 U196 ( .A(N157), .B(n84), .Z(n207) );
  NOR2X1 U197 ( .A(n209), .B(n210), .Z(n196) );
  NOR2X1 U198 ( .A(n130), .B(n54), .Z(n210) );
  AND2X1 U199 ( .A(N141), .B(n88), .Z(n209) );
  NAND3X1 U200 ( .A(n211), .B(n212), .C(n213), .Z(write_data[5]) );
  NAND2X1 U201 ( .A(mem_to_core_data[5]), .B(n20), .Z(n213) );
  NAND2X1 U202 ( .A(\add_311/A[5] ), .B(n60), .Z(n212) );
  NAND2X1 U203 ( .A(n64), .B(n214), .Z(n211) );
  NAND3X1 U204 ( .A(n215), .B(n216), .C(n217), .Z(n214) );
  NOR2X1 U205 ( .A(n218), .B(n219), .Z(n217) );
  NAND2X1 U206 ( .A(n220), .B(n221), .Z(n219) );
  NAND2X1 U207 ( .A(n101), .B(n131), .Z(n221) );
  NAND2X1 U208 ( .A(n90), .B(n35), .Z(n220) );
  NAND2X1 U210 ( .A(N226), .B(n86), .Z(n223) );
  NAND2X1 U211 ( .A(reg_data2[5]), .B(n224), .Z(n222) );
  NAND2X1 U212 ( .A(n147), .B(n225), .Z(n224) );
  NAND2X1 U213 ( .A(n101), .B(n91), .Z(n225) );
  AND2X1 U214 ( .A(n226), .B(n227), .Z(n216) );
  NAND2X1 U215 ( .A(N191), .B(n89), .Z(n227) );
  NAND2X1 U216 ( .A(N156), .B(n84), .Z(n226) );
  NOR2X1 U217 ( .A(n228), .B(n229), .Z(n215) );
  NOR2X1 U218 ( .A(n130), .B(n48), .Z(n229) );
  AND2X1 U219 ( .A(N140), .B(n88), .Z(n228) );
  NAND3X1 U220 ( .A(n230), .B(n231), .C(n232), .Z(write_data[4]) );
  NAND2X1 U221 ( .A(mem_to_core_data[4]), .B(n20), .Z(n232) );
  NAND2X1 U222 ( .A(\add_311/A[4] ), .B(n60), .Z(n231) );
  NAND2X1 U223 ( .A(n64), .B(n233), .Z(n230) );
  NAND3X1 U224 ( .A(n234), .B(n235), .C(n236), .Z(n233) );
  NOR2X1 U225 ( .A(n237), .B(n238), .Z(n236) );
  NAND2X1 U226 ( .A(n239), .B(n240), .Z(n238) );
  NAND2X1 U227 ( .A(n100), .B(n131), .Z(n240) );
  NAND2X1 U228 ( .A(n90), .B(n36), .Z(n239) );
  NAND2X1 U230 ( .A(N225), .B(n86), .Z(n242) );
  NAND2X1 U231 ( .A(reg_data2[4]), .B(n243), .Z(n241) );
  NAND2X1 U232 ( .A(n147), .B(n244), .Z(n243) );
  NAND2X1 U233 ( .A(n100), .B(n91), .Z(n244) );
  AND2X1 U234 ( .A(n245), .B(n246), .Z(n235) );
  NAND2X1 U235 ( .A(N190), .B(n89), .Z(n246) );
  NAND2X1 U236 ( .A(N155), .B(n84), .Z(n245) );
  NOR2X1 U237 ( .A(n247), .B(n248), .Z(n234) );
  NOR2X1 U238 ( .A(n130), .B(n49), .Z(n248) );
  AND2X1 U239 ( .A(N139), .B(n88), .Z(n247) );
  NAND3X1 U240 ( .A(n249), .B(n250), .C(n251), .Z(write_data[3]) );
  NAND2X1 U241 ( .A(mem_to_core_data[3]), .B(n20), .Z(n251) );
  NAND2X1 U242 ( .A(\add_311/A[3] ), .B(n60), .Z(n250) );
  NAND2X1 U243 ( .A(n64), .B(n252), .Z(n249) );
  NAND3X1 U244 ( .A(n253), .B(n254), .C(n255), .Z(n252) );
  NOR2X1 U245 ( .A(n256), .B(n257), .Z(n255) );
  NAND2X1 U246 ( .A(n258), .B(n259), .Z(n257) );
  NAND2X1 U247 ( .A(n99), .B(n131), .Z(n259) );
  NAND2X1 U248 ( .A(n90), .B(n37), .Z(n258) );
  NAND2X1 U250 ( .A(N224), .B(n86), .Z(n261) );
  NAND2X1 U251 ( .A(reg_data2[3]), .B(n262), .Z(n260) );
  NAND2X1 U252 ( .A(n147), .B(n263), .Z(n262) );
  NAND2X1 U253 ( .A(n99), .B(n91), .Z(n263) );
  AND2X1 U254 ( .A(n264), .B(n265), .Z(n254) );
  NAND2X1 U255 ( .A(N189), .B(n89), .Z(n265) );
  NAND2X1 U256 ( .A(N154), .B(n84), .Z(n264) );
  NOR2X1 U257 ( .A(n266), .B(n267), .Z(n253) );
  NOR2X1 U258 ( .A(n130), .B(n50), .Z(n267) );
  AND2X1 U259 ( .A(N138), .B(n88), .Z(n266) );
  NAND3X1 U260 ( .A(n268), .B(n269), .C(n270), .Z(write_data[2]) );
  NAND2X1 U261 ( .A(mem_to_core_data[2]), .B(n20), .Z(n270) );
  NAND2X1 U262 ( .A(\add_311/A[2] ), .B(n60), .Z(n269) );
  NAND2X1 U263 ( .A(n64), .B(n271), .Z(n268) );
  NAND3X1 U264 ( .A(n272), .B(n273), .C(n274), .Z(n271) );
  NOR2X1 U265 ( .A(n275), .B(n276), .Z(n274) );
  NAND2X1 U266 ( .A(n277), .B(n278), .Z(n276) );
  NAND2X1 U267 ( .A(n98), .B(n131), .Z(n278) );
  NAND2X1 U268 ( .A(n90), .B(n38), .Z(n277) );
  NAND2X1 U270 ( .A(N223), .B(n86), .Z(n280) );
  NAND2X1 U271 ( .A(reg_data2[2]), .B(n281), .Z(n279) );
  NAND2X1 U272 ( .A(n147), .B(n282), .Z(n281) );
  NAND2X1 U273 ( .A(n98), .B(n91), .Z(n282) );
  AND2X1 U274 ( .A(n283), .B(n284), .Z(n273) );
  NAND2X1 U275 ( .A(N188), .B(n89), .Z(n284) );
  NAND2X1 U276 ( .A(N153), .B(n84), .Z(n283) );
  NOR2X1 U277 ( .A(n285), .B(n286), .Z(n272) );
  NOR2X1 U278 ( .A(n130), .B(n51), .Z(n286) );
  AND2X1 U279 ( .A(N137), .B(n88), .Z(n285) );
  NAND3X1 U280 ( .A(n287), .B(n288), .C(n289), .Z(write_data[1]) );
  NAND2X1 U281 ( .A(mem_to_core_data[1]), .B(n20), .Z(n289) );
  NAND2X1 U282 ( .A(\add_311/A[1] ), .B(n60), .Z(n288) );
  NAND2X1 U283 ( .A(n64), .B(n290), .Z(n287) );
  NAND3X1 U284 ( .A(n291), .B(n292), .C(n293), .Z(n290) );
  NOR2X1 U285 ( .A(n294), .B(n295), .Z(n293) );
  NAND2X1 U286 ( .A(n296), .B(n297), .Z(n295) );
  NAND2X1 U287 ( .A(n97), .B(n131), .Z(n297) );
  NAND2X1 U288 ( .A(n90), .B(n39), .Z(n296) );
  NAND2X1 U290 ( .A(N222), .B(n86), .Z(n299) );
  NAND2X1 U291 ( .A(reg_data2[1]), .B(n300), .Z(n298) );
  NAND2X1 U292 ( .A(n147), .B(n301), .Z(n300) );
  NAND2X1 U293 ( .A(n97), .B(n91), .Z(n301) );
  AND2X1 U294 ( .A(n302), .B(n303), .Z(n292) );
  NAND2X1 U295 ( .A(N187), .B(n89), .Z(n303) );
  NAND2X1 U296 ( .A(N152), .B(n84), .Z(n302) );
  NOR2X1 U297 ( .A(n304), .B(n305), .Z(n291) );
  NOR2X1 U298 ( .A(n52), .B(n130), .Z(n305) );
  AND2X1 U299 ( .A(N136), .B(n88), .Z(n304) );
  NAND2X1 U300 ( .A(n306), .B(n307), .Z(write_data[15]) );
  NAND2X1 U301 ( .A(n64), .B(n308), .Z(n307) );
  NAND3X1 U302 ( .A(n309), .B(n310), .C(n311), .Z(n308) );
  NOR2X1 U303 ( .A(n312), .B(n313), .Z(n311) );
  NAND2X1 U304 ( .A(n314), .B(n315), .Z(n313) );
  NAND2X1 U305 ( .A(reg_data1[15]), .B(n131), .Z(n315) );
  OR2X1 U306 ( .A(n316), .B(reg_data1[15]), .Z(n314) );
  NAND2X1 U308 ( .A(N236), .B(n86), .Z(n318) );
  NAND2X1 U309 ( .A(reg_data2[15]), .B(n319), .Z(n317) );
  NAND2X1 U310 ( .A(n147), .B(n320), .Z(n319) );
  NAND2X1 U311 ( .A(reg_data1[15]), .B(n91), .Z(n320) );
  AND2X1 U312 ( .A(n321), .B(n322), .Z(n310) );
  NAND2X1 U313 ( .A(N201), .B(n89), .Z(n322) );
  NAND2X1 U314 ( .A(N166), .B(n84), .Z(n321) );
  NOR2X1 U315 ( .A(n323), .B(n324), .Z(n309) );
  NOR2X1 U316 ( .A(n153), .B(n47), .Z(n324) );
  AND2X1 U317 ( .A(N150), .B(n88), .Z(n323) );
  NAND2X1 U318 ( .A(mem_to_core_data[15]), .B(n20), .Z(n306) );
  NAND2X1 U319 ( .A(n325), .B(n326), .Z(write_data[14]) );
  NAND2X1 U320 ( .A(n64), .B(n327), .Z(n326) );
  NAND3X1 U321 ( .A(n328), .B(n329), .C(n330), .Z(n327) );
  NOR2X1 U322 ( .A(n331), .B(n332), .Z(n330) );
  NAND2X1 U323 ( .A(n333), .B(n334), .Z(n332) );
  NAND2X1 U324 ( .A(reg_data1[14]), .B(n131), .Z(n334) );
  OR2X1 U325 ( .A(n316), .B(reg_data1[14]), .Z(n333) );
  NAND2X1 U327 ( .A(N235), .B(n86), .Z(n336) );
  NAND2X1 U328 ( .A(reg_data2[14]), .B(n337), .Z(n335) );
  NAND2X1 U329 ( .A(n147), .B(n338), .Z(n337) );
  NAND2X1 U330 ( .A(reg_data1[14]), .B(n91), .Z(n338) );
  AND2X1 U331 ( .A(n339), .B(n340), .Z(n329) );
  NAND2X1 U332 ( .A(N200), .B(n89), .Z(n340) );
  NAND2X1 U333 ( .A(N165), .B(n84), .Z(n339) );
  NOR2X1 U334 ( .A(n341), .B(n342), .Z(n328) );
  NOR2X1 U335 ( .A(n153), .B(n54), .Z(n342) );
  AND2X1 U336 ( .A(N149), .B(n88), .Z(n341) );
  NAND2X1 U337 ( .A(mem_to_core_data[14]), .B(n20), .Z(n325) );
  NAND2X1 U338 ( .A(n343), .B(n344), .Z(write_data[13]) );
  NAND2X1 U339 ( .A(n64), .B(n345), .Z(n344) );
  NAND3X1 U340 ( .A(n346), .B(n347), .C(n348), .Z(n345) );
  NOR2X1 U341 ( .A(n349), .B(n350), .Z(n348) );
  NAND2X1 U342 ( .A(n351), .B(n352), .Z(n350) );
  NAND2X1 U343 ( .A(reg_data1[13]), .B(n131), .Z(n352) );
  OR2X1 U344 ( .A(n316), .B(reg_data1[13]), .Z(n351) );
  NAND2X1 U346 ( .A(N234), .B(n86), .Z(n354) );
  NAND2X1 U347 ( .A(reg_data2[13]), .B(n355), .Z(n353) );
  NAND2X1 U348 ( .A(n147), .B(n356), .Z(n355) );
  NAND2X1 U349 ( .A(reg_data1[13]), .B(n91), .Z(n356) );
  AND2X1 U350 ( .A(n357), .B(n358), .Z(n347) );
  NAND2X1 U351 ( .A(N199), .B(n89), .Z(n358) );
  NAND2X1 U352 ( .A(N164), .B(n84), .Z(n357) );
  NOR2X1 U353 ( .A(n359), .B(n360), .Z(n346) );
  NOR2X1 U354 ( .A(n153), .B(n48), .Z(n360) );
  AND2X1 U355 ( .A(N148), .B(n88), .Z(n359) );
  NAND2X1 U356 ( .A(mem_to_core_data[13]), .B(n20), .Z(n343) );
  NAND2X1 U357 ( .A(n361), .B(n362), .Z(write_data[12]) );
  NAND2X1 U358 ( .A(n64), .B(n363), .Z(n362) );
  NAND3X1 U359 ( .A(n364), .B(n365), .C(n366), .Z(n363) );
  NOR2X1 U360 ( .A(n367), .B(n368), .Z(n366) );
  NAND2X1 U361 ( .A(n369), .B(n370), .Z(n368) );
  NAND2X1 U362 ( .A(reg_data1[12]), .B(n131), .Z(n370) );
  OR2X1 U363 ( .A(n316), .B(reg_data1[12]), .Z(n369) );
  NAND2X1 U365 ( .A(N233), .B(n86), .Z(n372) );
  NAND2X1 U366 ( .A(reg_data2[12]), .B(n373), .Z(n371) );
  NAND2X1 U367 ( .A(n147), .B(n374), .Z(n373) );
  NAND2X1 U368 ( .A(reg_data1[12]), .B(n91), .Z(n374) );
  AND2X1 U369 ( .A(n375), .B(n376), .Z(n365) );
  NAND2X1 U370 ( .A(N198), .B(n89), .Z(n376) );
  NAND2X1 U371 ( .A(N163), .B(n84), .Z(n375) );
  NOR2X1 U372 ( .A(n377), .B(n378), .Z(n364) );
  NOR2X1 U373 ( .A(n153), .B(n49), .Z(n378) );
  AND2X1 U374 ( .A(N147), .B(n88), .Z(n377) );
  NAND2X1 U375 ( .A(mem_to_core_data[12]), .B(n20), .Z(n361) );
  NAND2X1 U376 ( .A(n379), .B(n380), .Z(write_data[11]) );
  NAND2X1 U377 ( .A(n64), .B(n381), .Z(n380) );
  NAND3X1 U378 ( .A(n382), .B(n383), .C(n384), .Z(n381) );
  NOR2X1 U379 ( .A(n385), .B(n386), .Z(n384) );
  NAND2X1 U380 ( .A(n387), .B(n388), .Z(n386) );
  NAND2X1 U381 ( .A(reg_data1[11]), .B(n131), .Z(n388) );
  OR2X1 U382 ( .A(n316), .B(reg_data1[11]), .Z(n387) );
  NAND2X1 U384 ( .A(N232), .B(n86), .Z(n390) );
  NAND2X1 U385 ( .A(reg_data2[11]), .B(n391), .Z(n389) );
  NAND2X1 U386 ( .A(n147), .B(n392), .Z(n391) );
  NAND2X1 U387 ( .A(reg_data1[11]), .B(n91), .Z(n392) );
  AND2X1 U388 ( .A(n393), .B(n394), .Z(n383) );
  NAND2X1 U389 ( .A(N197), .B(n89), .Z(n394) );
  NAND2X1 U390 ( .A(N162), .B(n84), .Z(n393) );
  NOR2X1 U391 ( .A(n395), .B(n396), .Z(n382) );
  NOR2X1 U392 ( .A(n153), .B(n50), .Z(n396) );
  AND2X1 U393 ( .A(N146), .B(n88), .Z(n395) );
  NAND2X1 U394 ( .A(mem_to_core_data[11]), .B(n20), .Z(n379) );
  NAND2X1 U395 ( .A(n397), .B(n398), .Z(write_data[10]) );
  NAND2X1 U396 ( .A(n64), .B(n399), .Z(n398) );
  NAND3X1 U397 ( .A(n400), .B(n401), .C(n402), .Z(n399) );
  NOR2X1 U398 ( .A(n403), .B(n404), .Z(n402) );
  NAND2X1 U399 ( .A(n405), .B(n406), .Z(n404) );
  NAND2X1 U400 ( .A(reg_data1[10]), .B(n131), .Z(n406) );
  OR2X1 U401 ( .A(n316), .B(reg_data1[10]), .Z(n405) );
  NAND2X1 U403 ( .A(N231), .B(n86), .Z(n408) );
  NAND2X1 U404 ( .A(reg_data2[10]), .B(n409), .Z(n407) );
  NAND2X1 U405 ( .A(n147), .B(n410), .Z(n409) );
  NAND2X1 U406 ( .A(reg_data1[10]), .B(n91), .Z(n410) );
  AND2X1 U407 ( .A(n411), .B(n412), .Z(n401) );
  NAND2X1 U408 ( .A(N196), .B(n89), .Z(n412) );
  NAND2X1 U409 ( .A(N161), .B(n84), .Z(n411) );
  NOR2X1 U410 ( .A(n413), .B(n414), .Z(n400) );
  NOR2X1 U411 ( .A(n153), .B(n51), .Z(n414) );
  AND2X1 U412 ( .A(N145), .B(n88), .Z(n413) );
  NAND2X1 U413 ( .A(mem_to_core_data[10]), .B(n20), .Z(n397) );
  NAND3X1 U414 ( .A(n415), .B(n416), .C(n417), .Z(write_data[0]) );
  NAND2X1 U415 ( .A(mem_to_core_data[0]), .B(n20), .Z(n417) );
  NAND2X1 U416 ( .A(\add_311/A[0] ), .B(n60), .Z(n416) );
  NAND2X1 U417 ( .A(jal), .B(n61), .Z(n119) );
  NAND2X1 U418 ( .A(n64), .B(n418), .Z(n415) );
  NAND3X1 U419 ( .A(n419), .B(n420), .C(n421), .Z(n418) );
  NOR2X1 U420 ( .A(n422), .B(n423), .Z(n421) );
  NAND2X1 U421 ( .A(n424), .B(n425), .Z(n423) );
  NAND2X1 U422 ( .A(n96), .B(n131), .Z(n425) );
  NAND2X1 U423 ( .A(n153), .B(n147), .Z(n131) );
  NAND3X1 U424 ( .A(n426), .B(n45), .C(n87), .Z(n153) );
  NAND2X1 U425 ( .A(n90), .B(n40), .Z(n424) );
  NAND3X1 U426 ( .A(n93), .B(n46), .C(n127), .Z(n316) );
  NAND2X1 U428 ( .A(N221), .B(n86), .Z(n428) );
  NAND3X1 U429 ( .A(n127), .B(n87), .C(n430), .Z(n429) );
  NOR2X1 U430 ( .A(n93), .B(N219), .Z(n430) );
  NAND2X1 U432 ( .A(reg_data2[0]), .B(n431), .Z(n427) );
  NAND2X1 U433 ( .A(n147), .B(n432), .Z(n431) );
  NAND2X1 U434 ( .A(n96), .B(n91), .Z(n432) );
  NAND2X1 U435 ( .A(n92), .B(n426), .Z(n129) );
  NAND3X1 U436 ( .A(n92), .B(n426), .C(n87), .Z(n147) );
  AND2X1 U437 ( .A(n433), .B(n434), .Z(n420) );
  NAND2X1 U438 ( .A(N186), .B(n89), .Z(n434) );
  NAND3X1 U439 ( .A(n46), .B(n44), .C(n127), .Z(n435) );
  AND2X1 U440 ( .A(\opcode[3] ), .B(n92), .Z(n127) );
  NAND2X1 U441 ( .A(N151), .B(n84), .Z(n433) );
  NAND3X1 U442 ( .A(n87), .B(n44), .C(n437), .Z(n436) );
  NOR2X1 U443 ( .A(n438), .B(n439), .Z(n419) );
  NOR2X1 U444 ( .A(n53), .B(n130), .Z(n439) );
  NAND3X1 U445 ( .A(n46), .B(n45), .C(n426), .Z(n130) );
  NOR2X1 U446 ( .A(n44), .B(\opcode[3] ), .Z(n426) );
  AND2X1 U447 ( .A(N135), .B(n88), .Z(n438) );
  NAND3X1 U448 ( .A(n46), .B(n44), .C(n437), .Z(n440) );
  AND2X1 U449 ( .A(mem_to_core_data[3]), .B(n441), .Z(reg_index3[3]) );
  AND2X1 U450 ( .A(mem_to_core_data[2]), .B(n441), .Z(reg_index3[2]) );
  AND2X1 U451 ( .A(mem_to_core_data[1]), .B(n441), .Z(reg_index3[1]) );
  AND2X1 U452 ( .A(mem_to_core_data[0]), .B(n441), .Z(reg_index3[0]) );
  NAND2X1 U453 ( .A(n442), .B(n443), .Z(reg_index2[3]) );
  NAND2X1 U454 ( .A(n18), .B(mem_to_core_data[3]), .Z(n443) );
  NAND2X1 U455 ( .A(n441), .B(mem_to_core_data[7]), .Z(n442) );
  NAND2X1 U456 ( .A(n444), .B(n445), .Z(reg_index2[2]) );
  NAND2X1 U457 ( .A(n18), .B(mem_to_core_data[2]), .Z(n445) );
  NAND2X1 U458 ( .A(n441), .B(mem_to_core_data[6]), .Z(n444) );
  NAND2X1 U459 ( .A(n446), .B(n447), .Z(reg_index2[1]) );
  NAND2X1 U460 ( .A(n18), .B(mem_to_core_data[1]), .Z(n447) );
  NAND2X1 U461 ( .A(n441), .B(mem_to_core_data[5]), .Z(n446) );
  NAND2X1 U462 ( .A(n448), .B(n449), .Z(reg_index2[0]) );
  NAND2X1 U463 ( .A(n18), .B(mem_to_core_data[0]), .Z(n449) );
  NAND2X1 U464 ( .A(n441), .B(mem_to_core_data[4]), .Z(n448) );
  NAND3X1 U465 ( .A(n450), .B(n451), .C(n452), .Z(reg_index1[3]) );
  NAND2X1 U466 ( .A(n441), .B(mem_to_core_data[11]), .Z(n452) );
  NAND2X1 U467 ( .A(n453), .B(mem_to_core_data[3]), .Z(n451) );
  NAND2X1 U468 ( .A(n18), .B(mem_to_core_data[7]), .Z(n450) );
  NAND3X1 U469 ( .A(n454), .B(n455), .C(n456), .Z(reg_index1[2]) );
  NAND2X1 U470 ( .A(n441), .B(mem_to_core_data[10]), .Z(n456) );
  NAND2X1 U471 ( .A(n453), .B(mem_to_core_data[2]), .Z(n455) );
  NAND2X1 U472 ( .A(n18), .B(mem_to_core_data[6]), .Z(n454) );
  NAND3X1 U473 ( .A(n457), .B(n458), .C(n459), .Z(reg_index1[1]) );
  NAND2X1 U474 ( .A(n441), .B(mem_to_core_data[9]), .Z(n459) );
  NAND2X1 U475 ( .A(n453), .B(mem_to_core_data[1]), .Z(n458) );
  NAND2X1 U476 ( .A(n18), .B(mem_to_core_data[5]), .Z(n457) );
  NAND3X1 U477 ( .A(n460), .B(n461), .C(n462), .Z(reg_index1[0]) );
  NAND2X1 U478 ( .A(n441), .B(mem_to_core_data[8]), .Z(n462) );
  NOR2X1 U479 ( .A(n463), .B(n464), .Z(n441) );
  NAND2X1 U480 ( .A(n453), .B(mem_to_core_data[0]), .Z(n461) );
  NOR2X1 U481 ( .A(n465), .B(n463), .Z(n453) );
  NAND2X1 U482 ( .A(n18), .B(mem_to_core_data[4]), .Z(n460) );
  NAND3X1 U483 ( .A(n19), .B(n465), .C(n464), .Z(n466) );
  AND2X1 U484 ( .A(n467), .B(n468), .Z(n464) );
  NAND3X1 U485 ( .A(n113), .B(n110), .C(mem_to_core_data[12]), .Z(n467) );
  NAND3X1 U486 ( .A(n469), .B(n470), .C(n471), .Z(n732) );
  NOR2X1 U487 ( .A(n472), .B(n473), .Z(n471) );
  NOR2X1 U488 ( .A(n474), .B(n29), .Z(n473) );
  NOR2X1 U489 ( .A(n31), .B(n475), .Z(n472) );
  NAND2X1 U490 ( .A(N318), .B(n476), .Z(n470) );
  NAND2X1 U491 ( .A(N427), .B(n5), .Z(n469) );
  NAND3X1 U492 ( .A(n477), .B(n478), .C(n479), .Z(n733) );
  NOR2X1 U493 ( .A(n480), .B(n481), .Z(n479) );
  NOR2X1 U494 ( .A(n474), .B(n22), .Z(n481) );
  NOR2X1 U495 ( .A(n32), .B(n475), .Z(n480) );
  NAND2X1 U496 ( .A(N317), .B(n476), .Z(n478) );
  NAND2X1 U497 ( .A(N426), .B(n5), .Z(n477) );
  NAND3X1 U498 ( .A(n482), .B(n483), .C(n484), .Z(n734) );
  NOR2X1 U499 ( .A(n485), .B(n486), .Z(n484) );
  NOR2X1 U500 ( .A(n474), .B(n23), .Z(n486) );
  NOR2X1 U501 ( .A(n33), .B(n475), .Z(n485) );
  NAND2X1 U502 ( .A(N316), .B(n476), .Z(n483) );
  NAND2X1 U503 ( .A(N425), .B(n5), .Z(n482) );
  NAND3X1 U504 ( .A(n487), .B(n488), .C(n489), .Z(n735) );
  NOR2X1 U505 ( .A(n490), .B(n491), .Z(n489) );
  NOR2X1 U506 ( .A(n474), .B(n24), .Z(n491) );
  NOR2X1 U507 ( .A(n34), .B(n475), .Z(n490) );
  NAND2X1 U508 ( .A(N315), .B(n476), .Z(n488) );
  NAND2X1 U509 ( .A(N424), .B(n5), .Z(n487) );
  NAND3X1 U510 ( .A(n492), .B(n493), .C(n494), .Z(n736) );
  NOR2X1 U511 ( .A(n495), .B(n496), .Z(n494) );
  NOR2X1 U512 ( .A(n474), .B(n25), .Z(n496) );
  NOR2X1 U513 ( .A(n35), .B(n475), .Z(n495) );
  NAND2X1 U514 ( .A(N314), .B(n476), .Z(n493) );
  NAND2X1 U515 ( .A(N423), .B(n5), .Z(n492) );
  NAND3X1 U516 ( .A(n497), .B(n498), .C(n499), .Z(n737) );
  NOR2X1 U517 ( .A(n500), .B(n501), .Z(n499) );
  NOR2X1 U518 ( .A(n474), .B(n26), .Z(n501) );
  NOR2X1 U519 ( .A(n36), .B(n475), .Z(n500) );
  NAND2X1 U520 ( .A(N313), .B(n476), .Z(n498) );
  NAND2X1 U521 ( .A(N422), .B(n5), .Z(n497) );
  NAND3X1 U522 ( .A(n502), .B(n503), .C(n504), .Z(n738) );
  NOR2X1 U523 ( .A(n505), .B(n506), .Z(n504) );
  NOR2X1 U524 ( .A(n474), .B(n27), .Z(n506) );
  NOR2X1 U525 ( .A(n37), .B(n475), .Z(n505) );
  NAND2X1 U526 ( .A(N312), .B(n476), .Z(n503) );
  NAND2X1 U527 ( .A(N421), .B(n5), .Z(n502) );
  NAND3X1 U528 ( .A(n507), .B(n508), .C(n509), .Z(n739) );
  NOR2X1 U529 ( .A(n510), .B(n511), .Z(n509) );
  NOR2X1 U530 ( .A(n474), .B(n28), .Z(n511) );
  NOR2X1 U531 ( .A(n38), .B(n475), .Z(n510) );
  NAND2X1 U532 ( .A(N311), .B(n476), .Z(n508) );
  NAND2X1 U533 ( .A(N420), .B(n5), .Z(n507) );
  NAND3X1 U534 ( .A(n512), .B(n513), .C(n514), .Z(n740) );
  NOR2X1 U535 ( .A(n515), .B(n516), .Z(n514) );
  NOR2X1 U536 ( .A(n474), .B(n30), .Z(n516) );
  NOR2X1 U537 ( .A(n39), .B(n475), .Z(n515) );
  NAND2X1 U538 ( .A(N310), .B(n476), .Z(n513) );
  NAND2X1 U539 ( .A(N419), .B(n5), .Z(n512) );
  NAND2X1 U540 ( .A(n517), .B(n518), .Z(n741) );
  NAND2X1 U541 ( .A(flag[1]), .B(n519), .Z(n518) );
  NAND2X1 U542 ( .A(N219), .B(n63), .Z(n517) );
  NAND3X1 U543 ( .A(n520), .B(n64), .C(n521), .Z(n519) );
  NOR2X1 U544 ( .A(rst), .B(n87), .Z(n521) );
  NAND2X1 U545 ( .A(n522), .B(n523), .Z(n742) );
  NAND2X1 U546 ( .A(flag[0]), .B(n524), .Z(n523) );
  NAND2X1 U547 ( .A(N412), .B(n62), .Z(n522) );
  NAND3X1 U548 ( .A(n520), .B(n64), .C(n525), .Z(n524) );
  NOR2X1 U549 ( .A(rst), .B(n46), .Z(n525) );
  NAND3X1 U550 ( .A(n57), .B(n55), .C(n65), .Z(n122) );
  AND2X1 U551 ( .A(n437), .B(n93), .Z(n520) );
  AND2X1 U552 ( .A(\opcode[3] ), .B(n45), .Z(n437) );
  NAND2X1 U553 ( .A(n526), .B(n527), .Z(n743) );
  NAND2X1 U554 ( .A(reg_data1[15]), .B(n6), .Z(n527) );
  NAND2X1 U555 ( .A(reg_read1[15]), .B(n5), .Z(n526) );
  NAND2X1 U556 ( .A(n529), .B(n530), .Z(n744) );
  NAND2X1 U557 ( .A(reg_data1[14]), .B(n6), .Z(n530) );
  NAND2X1 U558 ( .A(reg_read1[14]), .B(n5), .Z(n529) );
  NAND2X1 U559 ( .A(n531), .B(n532), .Z(n745) );
  NAND2X1 U560 ( .A(reg_data1[13]), .B(n6), .Z(n532) );
  NAND2X1 U561 ( .A(reg_read1[13]), .B(n5), .Z(n531) );
  NAND2X1 U562 ( .A(n533), .B(n534), .Z(n746) );
  NAND2X1 U563 ( .A(reg_data1[12]), .B(n6), .Z(n534) );
  NAND2X1 U564 ( .A(reg_read1[12]), .B(n5), .Z(n533) );
  NAND2X1 U565 ( .A(n535), .B(n536), .Z(n747) );
  NAND2X1 U566 ( .A(reg_data1[11]), .B(n6), .Z(n536) );
  NAND2X1 U567 ( .A(reg_read1[11]), .B(n5), .Z(n535) );
  NAND2X1 U568 ( .A(n537), .B(n538), .Z(n748) );
  NAND2X1 U569 ( .A(reg_data1[10]), .B(n6), .Z(n538) );
  NAND2X1 U570 ( .A(reg_read1[10]), .B(n5), .Z(n537) );
  NAND2X1 U571 ( .A(n539), .B(n540), .Z(n749) );
  NAND2X1 U572 ( .A(n105), .B(n6), .Z(n540) );
  NAND2X1 U573 ( .A(reg_read1[9]), .B(n5), .Z(n539) );
  NAND2X1 U574 ( .A(n541), .B(n542), .Z(n750) );
  NAND2X1 U575 ( .A(n104), .B(n6), .Z(n542) );
  NAND2X1 U576 ( .A(reg_read1[8]), .B(n5), .Z(n541) );
  NAND2X1 U577 ( .A(n543), .B(n544), .Z(n751) );
  NAND2X1 U578 ( .A(n103), .B(n6), .Z(n544) );
  NAND2X1 U579 ( .A(reg_read1[7]), .B(n5), .Z(n543) );
  NAND2X1 U580 ( .A(n545), .B(n546), .Z(n752) );
  NAND2X1 U581 ( .A(n102), .B(n6), .Z(n546) );
  NAND2X1 U582 ( .A(reg_read1[6]), .B(n5), .Z(n545) );
  NAND2X1 U583 ( .A(n547), .B(n548), .Z(n753) );
  NAND2X1 U584 ( .A(n101), .B(n6), .Z(n548) );
  NAND2X1 U585 ( .A(reg_read1[5]), .B(n5), .Z(n547) );
  NAND2X1 U586 ( .A(n549), .B(n550), .Z(n754) );
  NAND2X1 U587 ( .A(n100), .B(n6), .Z(n550) );
  NAND2X1 U588 ( .A(reg_read1[4]), .B(n5), .Z(n549) );
  NAND2X1 U589 ( .A(n551), .B(n552), .Z(n755) );
  NAND2X1 U590 ( .A(n99), .B(n6), .Z(n552) );
  NAND2X1 U591 ( .A(reg_read1[3]), .B(n5), .Z(n551) );
  NAND2X1 U592 ( .A(n553), .B(n554), .Z(n756) );
  NAND2X1 U593 ( .A(n98), .B(n6), .Z(n554) );
  NAND2X1 U594 ( .A(reg_read1[2]), .B(n5), .Z(n553) );
  NAND2X1 U595 ( .A(n555), .B(n556), .Z(n757) );
  NAND2X1 U596 ( .A(n97), .B(n6), .Z(n556) );
  NAND2X1 U597 ( .A(reg_read1[1]), .B(n5), .Z(n555) );
  NAND2X1 U598 ( .A(n557), .B(n558), .Z(n758) );
  NAND2X1 U599 ( .A(n96), .B(n6), .Z(n558) );
  NAND2X1 U600 ( .A(reg_read1[0]), .B(n5), .Z(n557) );
  NAND2X1 U601 ( .A(n559), .B(n560), .Z(n759) );
  NAND2X1 U602 ( .A(reg_data2[15]), .B(n6), .Z(n560) );
  NAND2X1 U603 ( .A(reg_read2[15]), .B(n5), .Z(n559) );
  NAND2X1 U604 ( .A(n561), .B(n562), .Z(n760) );
  NAND2X1 U605 ( .A(reg_data2[14]), .B(n6), .Z(n562) );
  NAND2X1 U606 ( .A(reg_read2[14]), .B(n5), .Z(n561) );
  NAND2X1 U607 ( .A(n563), .B(n564), .Z(n761) );
  NAND2X1 U608 ( .A(reg_data2[13]), .B(n6), .Z(n564) );
  NAND2X1 U609 ( .A(reg_read2[13]), .B(n5), .Z(n563) );
  NAND2X1 U610 ( .A(n565), .B(n566), .Z(n762) );
  NAND2X1 U611 ( .A(reg_data2[12]), .B(n6), .Z(n566) );
  NAND2X1 U612 ( .A(reg_read2[12]), .B(n1), .Z(n565) );
  NAND2X1 U613 ( .A(n567), .B(n568), .Z(n763) );
  NAND2X1 U614 ( .A(reg_data2[11]), .B(n6), .Z(n568) );
  NAND2X1 U615 ( .A(reg_read2[11]), .B(n1), .Z(n567) );
  NAND2X1 U616 ( .A(n569), .B(n570), .Z(n764) );
  NAND2X1 U617 ( .A(reg_data2[10]), .B(n6), .Z(n570) );
  NAND2X1 U618 ( .A(reg_read2[10]), .B(n1), .Z(n569) );
  NAND2X1 U619 ( .A(n571), .B(n572), .Z(n765) );
  NAND2X1 U620 ( .A(reg_data2[9]), .B(n6), .Z(n572) );
  NAND2X1 U621 ( .A(reg_read2[9]), .B(n1), .Z(n571) );
  NAND2X1 U622 ( .A(n573), .B(n574), .Z(n766) );
  NAND2X1 U623 ( .A(reg_data2[8]), .B(n6), .Z(n574) );
  NAND2X1 U624 ( .A(reg_read2[8]), .B(n1), .Z(n573) );
  NAND2X1 U625 ( .A(n575), .B(n576), .Z(n767) );
  NAND2X1 U626 ( .A(reg_data2[7]), .B(n6), .Z(n576) );
  NAND2X1 U627 ( .A(reg_read2[7]), .B(n1), .Z(n575) );
  NAND2X1 U628 ( .A(n577), .B(n578), .Z(n768) );
  NAND2X1 U629 ( .A(reg_data2[6]), .B(n6), .Z(n578) );
  NAND2X1 U630 ( .A(reg_read2[6]), .B(n1), .Z(n577) );
  NAND2X1 U631 ( .A(n579), .B(n580), .Z(n769) );
  NAND2X1 U632 ( .A(reg_data2[5]), .B(n6), .Z(n580) );
  NAND2X1 U633 ( .A(reg_read2[5]), .B(n1), .Z(n579) );
  NAND2X1 U634 ( .A(n581), .B(n582), .Z(n770) );
  NAND2X1 U635 ( .A(reg_data2[4]), .B(n6), .Z(n582) );
  NAND2X1 U636 ( .A(reg_read2[4]), .B(n1), .Z(n581) );
  NAND2X1 U637 ( .A(n583), .B(n584), .Z(n771) );
  NAND2X1 U638 ( .A(reg_data2[3]), .B(n6), .Z(n584) );
  NAND2X1 U639 ( .A(reg_read2[3]), .B(n1), .Z(n583) );
  NAND2X1 U640 ( .A(n585), .B(n586), .Z(n772) );
  NAND2X1 U641 ( .A(reg_data2[2]), .B(n6), .Z(n586) );
  NAND2X1 U642 ( .A(reg_read2[2]), .B(n1), .Z(n585) );
  NAND2X1 U643 ( .A(n587), .B(n588), .Z(n773) );
  NAND2X1 U644 ( .A(reg_data2[1]), .B(n6), .Z(n588) );
  NAND2X1 U645 ( .A(reg_read2[1]), .B(n5), .Z(n587) );
  NAND2X1 U646 ( .A(n589), .B(n590), .Z(n774) );
  NAND2X1 U647 ( .A(reg_data2[0]), .B(n6), .Z(n590) );
  NAND2X1 U648 ( .A(reg_read2[0]), .B(n5), .Z(n589) );
  NAND2X1 U649 ( .A(n591), .B(n592), .Z(n775) );
  NAND2X1 U650 ( .A(reg_data3[15]), .B(n6), .Z(n592) );
  NAND2X1 U651 ( .A(reg_read3[15]), .B(n5), .Z(n591) );
  NAND2X1 U652 ( .A(n593), .B(n594), .Z(n776) );
  NAND2X1 U653 ( .A(reg_data3[14]), .B(n6), .Z(n594) );
  NAND2X1 U654 ( .A(reg_read3[14]), .B(n5), .Z(n593) );
  NAND2X1 U655 ( .A(n595), .B(n596), .Z(n777) );
  NAND2X1 U656 ( .A(reg_data3[13]), .B(n6), .Z(n596) );
  NAND2X1 U657 ( .A(reg_read3[13]), .B(n5), .Z(n595) );
  NAND2X1 U658 ( .A(n597), .B(n598), .Z(n778) );
  NAND2X1 U659 ( .A(reg_data3[12]), .B(n6), .Z(n598) );
  NAND2X1 U660 ( .A(reg_read3[12]), .B(n5), .Z(n597) );
  NAND2X1 U661 ( .A(n599), .B(n600), .Z(n779) );
  NAND2X1 U662 ( .A(reg_data3[11]), .B(n6), .Z(n600) );
  NAND2X1 U663 ( .A(reg_read3[11]), .B(n5), .Z(n599) );
  NAND2X1 U664 ( .A(n601), .B(n602), .Z(n780) );
  NAND2X1 U665 ( .A(reg_data3[10]), .B(n6), .Z(n602) );
  NAND2X1 U666 ( .A(reg_read3[10]), .B(n5), .Z(n601) );
  NAND2X1 U667 ( .A(n603), .B(n604), .Z(n781) );
  NAND2X1 U668 ( .A(reg_data3[9]), .B(n6), .Z(n604) );
  NAND2X1 U669 ( .A(reg_read3[9]), .B(n5), .Z(n603) );
  NAND2X1 U670 ( .A(n605), .B(n606), .Z(n782) );
  NAND2X1 U671 ( .A(reg_data3[8]), .B(n6), .Z(n606) );
  NAND2X1 U672 ( .A(reg_read3[8]), .B(n5), .Z(n605) );
  NAND2X1 U673 ( .A(n607), .B(n608), .Z(n783) );
  NAND2X1 U674 ( .A(reg_data3[7]), .B(n6), .Z(n608) );
  NAND2X1 U675 ( .A(reg_read3[7]), .B(n5), .Z(n607) );
  NAND2X1 U676 ( .A(n609), .B(n610), .Z(n784) );
  NAND2X1 U677 ( .A(reg_data3[6]), .B(n6), .Z(n610) );
  NAND2X1 U678 ( .A(reg_read3[6]), .B(n5), .Z(n609) );
  NAND2X1 U679 ( .A(n611), .B(n612), .Z(n785) );
  NAND2X1 U680 ( .A(reg_data3[5]), .B(n6), .Z(n612) );
  NAND2X1 U681 ( .A(reg_read3[5]), .B(n5), .Z(n611) );
  NAND2X1 U682 ( .A(n613), .B(n614), .Z(n786) );
  NAND2X1 U683 ( .A(reg_data3[4]), .B(n6), .Z(n614) );
  NAND2X1 U684 ( .A(reg_read3[4]), .B(n5), .Z(n613) );
  NAND2X1 U685 ( .A(n615), .B(n616), .Z(n787) );
  NAND2X1 U686 ( .A(reg_data3[3]), .B(n6), .Z(n616) );
  NAND2X1 U687 ( .A(reg_read3[3]), .B(n5), .Z(n615) );
  NAND2X1 U688 ( .A(n617), .B(n618), .Z(n788) );
  NAND2X1 U689 ( .A(reg_data3[2]), .B(n6), .Z(n618) );
  NAND2X1 U690 ( .A(reg_read3[2]), .B(n5), .Z(n617) );
  NAND2X1 U691 ( .A(n619), .B(n620), .Z(n789) );
  NAND2X1 U692 ( .A(reg_data3[1]), .B(n6), .Z(n620) );
  NAND2X1 U693 ( .A(reg_read3[1]), .B(n5), .Z(n619) );
  NAND2X1 U694 ( .A(n621), .B(n622), .Z(n790) );
  NAND2X1 U695 ( .A(reg_data3[0]), .B(n6), .Z(n622) );
  NAND2X1 U696 ( .A(reg_read3[0]), .B(n5), .Z(n621) );
  NAND3X1 U697 ( .A(n623), .B(n624), .C(n625), .Z(n791) );
  NOR2X1 U698 ( .A(n626), .B(n627), .Z(n625) );
  NOR2X1 U699 ( .A(n474), .B(n41), .Z(n627) );
  NOR2X1 U700 ( .A(n40), .B(n475), .Z(n626) );
  NAND3X1 U701 ( .A(n61), .B(n628), .C(n629), .Z(n475) );
  NAND2X1 U702 ( .A(cond), .B(n630), .Z(n628) );
  NAND2X1 U703 ( .A(N309), .B(n476), .Z(n624) );
  AND2X1 U704 ( .A(n629), .B(n21), .Z(n476) );
  AND2X1 U705 ( .A(n474), .B(n7), .Z(n629) );
  AND2X1 U706 ( .A(n631), .B(n632), .Z(n474) );
  NAND3X1 U707 ( .A(n633), .B(n463), .C(n634), .Z(n632) );
  NOR2X1 U708 ( .A(rst), .B(n61), .Z(n634) );
  NAND3X1 U709 ( .A(n65), .B(n57), .C(n66), .Z(n635) );
  NAND3X1 U710 ( .A(n630), .B(n7), .C(n21), .Z(n631) );
  NAND3X1 U711 ( .A(n58), .B(n56), .C(n66), .Z(n633) );
  AND2X1 U712 ( .A(n636), .B(n637), .Z(n630) );
  NAND2X1 U713 ( .A(n638), .B(n43), .Z(n637) );
  XOR2X1 U714 ( .A(n42), .B(flag[0]), .Z(n638) );
  NAND2X1 U715 ( .A(n639), .B(n94), .Z(n636) );
  XOR2X1 U716 ( .A(n42), .B(flag[1]), .Z(n639) );
  NAND2X1 U717 ( .A(n41), .B(n5), .Z(n623) );
  NAND2X1 U718 ( .A(n640), .B(n641), .Z(n792) );
  NAND2X1 U719 ( .A(n5), .B(n642), .Z(n641) );
  NAND2X1 U720 ( .A(n643), .B(n644), .Z(n642) );
  NAND2X1 U721 ( .A(n111), .B(mem_to_core_data[10]), .Z(n644) );
  NAND2X1 U722 ( .A(mem_to_core_data[11]), .B(n465), .Z(n643) );
  NAND2X1 U723 ( .A(n95), .B(n6), .Z(n640) );
  NAND2X1 U724 ( .A(n645), .B(n646), .Z(n793) );
  NAND2X1 U725 ( .A(n5), .B(n647), .Z(n646) );
  NAND2X1 U726 ( .A(n648), .B(n649), .Z(n647) );
  NAND2X1 U727 ( .A(n111), .B(mem_to_core_data[7]), .Z(n649) );
  NAND2X1 U728 ( .A(mem_to_core_data[8]), .B(n465), .Z(n648) );
  NAND2X1 U729 ( .A(n94), .B(n6), .Z(n645) );
  NAND3X1 U730 ( .A(n650), .B(n651), .C(n652), .Z(n794) );
  NAND2X1 U731 ( .A(dest_index[3]), .B(n6), .Z(n652) );
  NAND2X1 U732 ( .A(n653), .B(mem_to_core_data[3]), .Z(n651) );
  NAND2X1 U733 ( .A(n654), .B(mem_to_core_data[11]), .Z(n650) );
  NAND3X1 U734 ( .A(n655), .B(n656), .C(n657), .Z(n795) );
  NAND2X1 U735 ( .A(dest_index[2]), .B(n6), .Z(n657) );
  NAND2X1 U736 ( .A(n653), .B(mem_to_core_data[2]), .Z(n656) );
  NAND2X1 U737 ( .A(n654), .B(mem_to_core_data[10]), .Z(n655) );
  NAND3X1 U738 ( .A(n658), .B(n659), .C(n660), .Z(n796) );
  NAND2X1 U739 ( .A(dest_index[1]), .B(n6), .Z(n660) );
  NAND2X1 U740 ( .A(n653), .B(mem_to_core_data[1]), .Z(n659) );
  NAND2X1 U741 ( .A(n654), .B(mem_to_core_data[9]), .Z(n658) );
  NAND3X1 U742 ( .A(n661), .B(n662), .C(n663), .Z(n797) );
  NAND2X1 U743 ( .A(dest_index[0]), .B(n6), .Z(n663) );
  NAND2X1 U744 ( .A(n653), .B(mem_to_core_data[0]), .Z(n662) );
  NOR2X1 U745 ( .A(n664), .B(n6), .Z(n653) );
  NAND2X1 U746 ( .A(n654), .B(mem_to_core_data[8]), .Z(n661) );
  NAND2X1 U747 ( .A(n665), .B(n666), .Z(n798) );
  NAND2X1 U748 ( .A(\opcode[3] ), .B(n6), .Z(n666) );
  NAND2X1 U749 ( .A(n1), .B(mem_to_core_data[15]), .Z(n665) );
  NAND2X1 U750 ( .A(n667), .B(n668), .Z(n799) );
  NAND2X1 U751 ( .A(n93), .B(n6), .Z(n668) );
  NAND2X1 U752 ( .A(n1), .B(mem_to_core_data[14]), .Z(n667) );
  NAND2X1 U753 ( .A(n669), .B(n670), .Z(n800) );
  NAND2X1 U754 ( .A(n92), .B(n6), .Z(n670) );
  NAND2X1 U755 ( .A(n1), .B(mem_to_core_data[13]), .Z(n669) );
  NAND2X1 U756 ( .A(n671), .B(n672), .Z(n801) );
  NAND2X1 U757 ( .A(n87), .B(n6), .Z(n672) );
  NAND2X1 U758 ( .A(n5), .B(mem_to_core_data[12]), .Z(n671) );
  NAND2X1 U759 ( .A(n673), .B(n674), .Z(n802) );
  NAND2X1 U760 ( .A(n83), .B(n6), .Z(n674) );
  NAND2X1 U761 ( .A(n5), .B(mem_to_core_data[7]), .Z(n673) );
  NAND2X1 U762 ( .A(n675), .B(n676), .Z(n803) );
  NAND2X1 U763 ( .A(n67), .B(n6), .Z(n676) );
  NAND2X1 U764 ( .A(n677), .B(n678), .Z(n804) );
  NAND2X1 U765 ( .A(n82), .B(n6), .Z(n678) );
  NAND2X1 U766 ( .A(n1), .B(mem_to_core_data[5]), .Z(n677) );
  NAND2X1 U767 ( .A(n679), .B(n680), .Z(n805) );
  NAND2X1 U768 ( .A(n81), .B(n6), .Z(n680) );
  NAND2X1 U769 ( .A(n1), .B(mem_to_core_data[4]), .Z(n679) );
  NAND2X1 U770 ( .A(n681), .B(n682), .Z(n806) );
  NAND2X1 U771 ( .A(n80), .B(n6), .Z(n682) );
  NAND2X1 U772 ( .A(n683), .B(n684), .Z(n807) );
  NAND2X1 U773 ( .A(n76), .B(n6), .Z(n684) );
  NAND2X1 U774 ( .A(n685), .B(n686), .Z(n808) );
  NAND2X1 U775 ( .A(n75), .B(n6), .Z(n686) );
  NAND2X1 U776 ( .A(n687), .B(n688), .Z(n809) );
  NAND2X1 U777 ( .A(n68), .B(n6), .Z(n688) );
  NAND2X1 U778 ( .A(n681), .B(n689), .Z(n810) );
  NAND2X1 U779 ( .A(shift[3]), .B(n6), .Z(n689) );
  NAND2X1 U780 ( .A(n5), .B(mem_to_core_data[3]), .Z(n681) );
  NAND2X1 U781 ( .A(n683), .B(n690), .Z(n811) );
  NAND2X1 U782 ( .A(shift[2]), .B(n6), .Z(n690) );
  NAND2X1 U783 ( .A(n5), .B(mem_to_core_data[2]), .Z(n683) );
  NAND2X1 U784 ( .A(n685), .B(n691), .Z(n812) );
  NAND2X1 U785 ( .A(shift[1]), .B(n6), .Z(n691) );
  NAND2X1 U786 ( .A(n1), .B(mem_to_core_data[1]), .Z(n685) );
  NAND2X1 U787 ( .A(n687), .B(n692), .Z(n813) );
  NAND2X1 U788 ( .A(shift[0]), .B(n6), .Z(n692) );
  NAND2X1 U789 ( .A(n1), .B(mem_to_core_data[0]), .Z(n687) );
  NAND2X1 U790 ( .A(n693), .B(n694), .Z(n814) );
  NAND2X1 U791 ( .A(cond), .B(n6), .Z(n694) );
  NAND2X1 U792 ( .A(n5), .B(mem_to_core_data[11]), .Z(n693) );
  NAND2X1 U793 ( .A(n675), .B(n695), .Z(n815) );
  NAND2X1 U794 ( .A(jal), .B(n6), .Z(n695) );
  NAND2X1 U795 ( .A(n1), .B(mem_to_core_data[6]), .Z(n675) );
  AND2X1 U796 ( .A(reg_data3[9]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[9]) );
  AND2X1 U797 ( .A(reg_data3[8]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[8]) );
  AND2X1 U798 ( .A(reg_data3[7]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[7]) );
  AND2X1 U799 ( .A(reg_data3[6]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[6]) );
  AND2X1 U800 ( .A(reg_data3[5]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[5]) );
  AND2X1 U801 ( .A(reg_data3[4]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[4]) );
  AND2X1 U802 ( .A(reg_data3[3]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[3]) );
  AND2X1 U803 ( .A(reg_data3[2]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[2]) );
  AND2X1 U804 ( .A(reg_data3[1]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[1]) );
  AND2X1 U805 ( .A(reg_data3[15]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[15]) );
  AND2X1 U806 ( .A(reg_data3[14]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[14]) );
  AND2X1 U807 ( .A(reg_data3[13]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[13]) );
  AND2X1 U808 ( .A(reg_data3[12]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[12]) );
  AND2X1 U809 ( .A(reg_data3[11]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[11]) );
  AND2X1 U810 ( .A(reg_data3[10]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[10]) );
  AND2X1 U811 ( .A(reg_data3[0]), .B(core_to_mem_write_enable), .Z(
        core_to_mem_data[0]) );
  NAND2X1 U812 ( .A(n697), .B(n698), .Z(core_to_mem_address[9]) );
  NAND2X1 U813 ( .A(\add_311/A[9] ), .B(n699), .Z(n698) );
  NAND2X1 U814 ( .A(N295), .B(n700), .Z(n697) );
  NAND2X1 U815 ( .A(n701), .B(n702), .Z(core_to_mem_address[8]) );
  NAND2X1 U816 ( .A(\add_311/A[8] ), .B(n699), .Z(n702) );
  NAND2X1 U817 ( .A(N294), .B(n700), .Z(n701) );
  NAND2X1 U818 ( .A(n703), .B(n704), .Z(core_to_mem_address[7]) );
  NAND2X1 U819 ( .A(\add_311/A[7] ), .B(n699), .Z(n704) );
  NAND2X1 U820 ( .A(N293), .B(n700), .Z(n703) );
  NAND2X1 U821 ( .A(n705), .B(n706), .Z(core_to_mem_address[6]) );
  NAND2X1 U822 ( .A(\add_311/A[6] ), .B(n699), .Z(n706) );
  NAND2X1 U823 ( .A(N292), .B(n700), .Z(n705) );
  NAND2X1 U824 ( .A(n707), .B(n708), .Z(core_to_mem_address[5]) );
  NAND2X1 U825 ( .A(\add_311/A[5] ), .B(n699), .Z(n708) );
  NAND2X1 U826 ( .A(N291), .B(n700), .Z(n707) );
  NAND2X1 U827 ( .A(n709), .B(n710), .Z(core_to_mem_address[4]) );
  NAND2X1 U828 ( .A(\add_311/A[4] ), .B(n699), .Z(n710) );
  NAND2X1 U829 ( .A(N290), .B(n700), .Z(n709) );
  NAND2X1 U830 ( .A(n711), .B(n712), .Z(core_to_mem_address[3]) );
  NAND2X1 U831 ( .A(\add_311/A[3] ), .B(n699), .Z(n712) );
  NAND2X1 U832 ( .A(N289), .B(n700), .Z(n711) );
  NAND2X1 U833 ( .A(n713), .B(n714), .Z(core_to_mem_address[2]) );
  NAND2X1 U834 ( .A(\add_311/A[2] ), .B(n699), .Z(n714) );
  NAND2X1 U835 ( .A(N288), .B(n700), .Z(n713) );
  NAND2X1 U836 ( .A(n715), .B(n716), .Z(core_to_mem_address[1]) );
  NAND2X1 U837 ( .A(\add_311/A[1] ), .B(n699), .Z(n716) );
  NAND2X1 U838 ( .A(N287), .B(n700), .Z(n715) );
  NAND2X1 U839 ( .A(n717), .B(n718), .Z(core_to_mem_address[0]) );
  NAND2X1 U840 ( .A(\add_311/A[0] ), .B(n699), .Z(n718) );
  NAND2X1 U841 ( .A(n719), .B(n463), .Z(n699) );
  NAND2X1 U842 ( .A(N286), .B(n700), .Z(n717) );
  NAND2X1 U843 ( .A(n123), .B(n696), .Z(n700) );
  NAND3X1 U844 ( .A(n57), .B(n56), .C(n66), .Z(n696) );
  NAND3X1 U845 ( .A(n58), .B(n55), .C(n65), .Z(n123) );
  AND2X1 U846 ( .A(n654), .B(n720), .Z(N441) );
  NAND3X1 U847 ( .A(n465), .B(n468), .C(n721), .Z(n720) );
  NAND2X1 U848 ( .A(n722), .B(n113), .Z(n468) );
  AND2X1 U849 ( .A(n5), .B(n664), .Z(n654) );
  AND2X1 U850 ( .A(n5), .B(n723), .Z(N440) );
  NAND3X1 U851 ( .A(n465), .B(n664), .C(n724), .Z(n723) );
  NOR2X1 U852 ( .A(n725), .B(n726), .Z(n724) );
  NOR2X1 U853 ( .A(mem_to_core_data[14]), .B(n110), .Z(n726) );
  NOR2X1 U854 ( .A(n727), .B(n112), .Z(n725) );
  AND2X1 U855 ( .A(mem_to_core_data[15]), .B(n728), .Z(n727) );
  NAND3X1 U856 ( .A(mem_to_core_data[13]), .B(n114), .C(n722), .Z(n465) );
  NAND2X1 U857 ( .A(n729), .B(n730), .Z(N439) );
  NAND2X1 U858 ( .A(n5), .B(n731), .Z(n730) );
  NAND2X1 U859 ( .A(n721), .B(n664), .Z(n731) );
  NAND3X1 U860 ( .A(n114), .B(n113), .C(n722), .Z(n664) );
  NAND2X1 U861 ( .A(n728), .B(n722), .Z(n721) );
  NOR2X1 U862 ( .A(mem_to_core_data[15]), .B(mem_to_core_data[14]), .Z(n722)
         );
  NOR2X1 U863 ( .A(n114), .B(n113), .Z(n728) );
  NAND3X1 U865 ( .A(n56), .B(n55), .C(n58), .Z(n463) );
  OR2X1 U866 ( .A(n719), .B(rst), .Z(n729) );
  NAND3X1 U867 ( .A(n56), .B(n55), .C(n57), .Z(n719) );
  reg_file _reg_file ( .clk(clk), .rst(rst), .write_en(write_enable), .wrData(
        write_index), .DataIn(write_data), .rdDataA(reg_index1), .rdDataB(
        reg_index2), .rdDataC(reg_index3), .A(reg_read1), .B(reg_read2), .C(
        reg_read3), .i2c_wr_en(i2c_wr_en), .i2c_sts(i2c_sts), 
        .i2c_to_reg_file_data(i2c_to_core_data), .reg_file_to_i2c_data(
        core_to_i2c_data), .i2c_slave_addr(i2c_reg_addr), .i2c_addr(i2c_addr), 
        .pwm_reg0(pwm_reg0), .pwm_reg1(pwm_reg1), .pwm_reg2(pwm_reg2), 
        .pwm_reg3(pwm_reg3), .pwm_reg4(pwm_reg4), .pwm_reg5(pwm_reg5), 
        .pwm_reg6(pwm_reg6), .pwm_reg7(pwm_reg7) );
  Core_DW01_add_0 add_205 ( .A({\add_311/A[9] , \add_311/A[8] , \add_311/A[7] , 
        \add_311/A[6] , \add_311/A[5] , \add_311/A[4] , \add_311/A[3] , 
        \add_311/A[2] , \add_311/A[1] , \add_311/A[0] }), .B({n83, n83, n83, 
        n67, n82, n81, n80, n76, n75, n68}), .CI(n9), .SUM({N318, N317, N316, 
        N315, N314, N313, N312, N311, N310, N309}) );
  Core_DW01_sub_0 sub_182 ( .A({reg_data1[15:10], n105, n104, n103, n102, n101, 
        n100, n99, n98, n97, n96}), .B(reg_data2), .CI(n9), .DIFF({N236, N235, 
        N234, N233, N232, N231, N230, N229, N228, N227, N226, N225, N224, N223, 
        N222, N221}) );
  Core_DW01_add_1 add_176 ( .A({reg_data1[15:10], n105, n104, n103, n102, n101, 
        n100, n99, n98, n97, n96}), .B(reg_data2), .CI(n9), .SUM({N201, N200, 
        N199, N198, N197, N196, N195, N194, N193, N192, N191, N190, N189, N188, 
        N187, N186}) );
  Core_DW01_ash_0 sll_169 ( .A({reg_data1[15:10], n105, n104, n103, n102, n101, 
        n100, n99, n98, n97, n96}), .DATA_TC(n9), .SH(shift), .SH_TC(n9), .B({
        N150, N149, N148, N147, N146, N145, N144, N143, N142, N141, N140, N139, 
        N138, N137, N136, N135}) );
  Core_DW01_add_3 r117 ( .A({n105, n104, n103, n102, n101, n100, n99, n98, n97, 
        n96}), .B(reg_data2[9:0]), .CI(n9), .SUM({N295, N294, N293, N292, N291, 
        N290, N289, N288, N287, N286}) );
  Core_DW01_cmp6_0 r115 ( .A(reg_data2), .B({reg_data1[15:10], n105, n104, 
        n103, n102, n101, n100, n99, n98, n97, n96}), .TC(n9), .GT(N219), .EQ(
        N412) );
  DFFQQBX1 \core_state_reg[1]  ( .D(N440), .CLK(clk), .Q(n65), .QB(n56) );
  DFFQQBX1 \core_state_reg[0]  ( .D(N439), .CLK(clk), .Q(n58), .QB(n57) );
  DFFQQBX1 \core_state_reg[2]  ( .D(N441), .CLK(clk), .Q(n66), .QB(n55) );
  DFFQQBX1 flag_idx_reg ( .D(n793), .CLK(clk), .Q(n94), .QB(n43) );
  DFFQQBX1 cb_reg ( .D(n792), .CLK(clk), .Q(n95), .QB(n42) );
  DFFQQBX1 \opcode_reg[2]  ( .D(n799), .CLK(clk), .Q(n93), .QB(n44) );
  DFFQQBX1 \opcode_reg[1]  ( .D(n800), .CLK(clk), .Q(n92), .QB(n45) );
  DFFQQBX1 \opcode_reg[0]  ( .D(n801), .CLK(clk), .Q(n87), .QB(n46) );
  DFFQQBX1 \immediate_reg[7]  ( .D(n802), .CLK(clk), .Q(n83), .QB(n47) );
  DFFQQBX1 \immediate_reg[6]  ( .D(n803), .CLK(clk), .Q(n67), .QB(n54) );
  DFFQQBX1 \immediate_reg[5]  ( .D(n804), .CLK(clk), .Q(n82), .QB(n48) );
  DFFQQBX1 \immediate_reg[4]  ( .D(n805), .CLK(clk), .Q(n81), .QB(n49) );
  DFFQQBX1 \immediate_reg[3]  ( .D(n806), .CLK(clk), .Q(n80), .QB(n50) );
  DFFQQBX1 \immediate_reg[2]  ( .D(n807), .CLK(clk), .Q(n76), .QB(n51) );
  DFFQQBX1 \immediate_reg[1]  ( .D(n808), .CLK(clk), .Q(n75), .QB(n52) );
  DFFQQBX1 \immediate_reg[0]  ( .D(n809), .CLK(clk), .Q(n68), .QB(n53) );
  DFFQQBX1 \pc_reg[4]  ( .D(n737), .CLK(clk), .Q(\add_311/A[4] ), .QB(n26) );
  DFFQQBX1 \pc_reg[3]  ( .D(n738), .CLK(clk), .Q(\add_311/A[3] ), .QB(n27) );
  DFFQQBX1 \pc_reg[2]  ( .D(n739), .CLK(clk), .Q(\add_311/A[2] ), .QB(n28) );
  DFFQQBX1 \pc_reg[1]  ( .D(n740), .CLK(clk), .Q(\add_311/A[1] ), .QB(n30) );
  DFFQQBX1 \pc_reg[0]  ( .D(n791), .CLK(clk), .Q(\add_311/A[0] ), .QB(n41) );
  DFFQQBX1 \pc_reg[5]  ( .D(n736), .CLK(clk), .Q(\add_311/A[5] ), .QB(n25) );
  DFFQQBX1 \reg_data1_reg[9]  ( .D(n749), .CLK(clk), .Q(n105), .QB(n31) );
  DFFQQBX1 \reg_data1_reg[8]  ( .D(n750), .CLK(clk), .Q(n104), .QB(n32) );
  DFFQQBX1 \reg_data1_reg[7]  ( .D(n751), .CLK(clk), .Q(n103), .QB(n33) );
  DFFQQBX1 \reg_data1_reg[6]  ( .D(n752), .CLK(clk), .Q(n102), .QB(n34) );
  DFFQQBX1 \reg_data1_reg[5]  ( .D(n753), .CLK(clk), .Q(n101), .QB(n35) );
  DFFQQBX1 \reg_data1_reg[4]  ( .D(n754), .CLK(clk), .Q(n100), .QB(n36) );
  DFFQQBX1 \reg_data1_reg[3]  ( .D(n755), .CLK(clk), .Q(n99), .QB(n37) );
  DFFQQBX1 \reg_data1_reg[2]  ( .D(n756), .CLK(clk), .Q(n98), .QB(n38) );
  DFFQQBX1 \reg_data1_reg[1]  ( .D(n757), .CLK(clk), .Q(n97), .QB(n39) );
  DFFQQBX1 \reg_data1_reg[0]  ( .D(n758), .CLK(clk), .Q(n96), .QB(n40) );
  DFFQQBX1 \pc_reg[6]  ( .D(n735), .CLK(clk), .Q(\add_311/A[6] ), .QB(n24) );
  DFFQQBX1 \pc_reg[7]  ( .D(n734), .CLK(clk), .Q(\add_311/A[7] ), .QB(n23) );
  DFFQQBX1 \pc_reg[8]  ( .D(n733), .CLK(clk), .Q(\add_311/A[8] ), .QB(n22) );
  DFFQQBX1 \pc_reg[9]  ( .D(n732), .CLK(clk), .Q(\add_311/A[9] ), .QB(n29) );
  INVX2 U3 ( .A(reg_data1[11]), .Z(n4) );
  INVX2 U4 ( .A(reg_data1[13]), .Z(n3) );
  AND2X1 U5 ( .A(n19), .B(n7), .Z(n1) );
  INVX2 U6 ( .A(n6), .Z(n5) );
  INVX2 U7 ( .A(n131), .Z(n85) );
  INVX2 U8 ( .A(n129), .Z(n91) );
  INVX2 U9 ( .A(n1), .Z(n6) );
  INVX4 U10 ( .A(n429), .Z(n86) );
  INVX2 U11 ( .A(n933), .Z(n69) );
  INVX2 U12 ( .A(n938), .Z(n73) );
  INVX2 U13 ( .A(n920), .Z(n70) );
  INVX2 U14 ( .A(n925), .Z(n72) );
  INVX2 U15 ( .A(n122), .Z(n64) );
  INVX2 U16 ( .A(n123), .Z(n20) );
  INVX2 U17 ( .A(n316), .Z(n90) );
  INVX2 U18 ( .A(n937), .Z(n77) );
  INVX2 U19 ( .A(n119), .Z(n60) );
  INVX2 U20 ( .A(n927), .Z(n78) );
  INVX4 U21 ( .A(n466), .Z(n18) );
  INVX4 U22 ( .A(n11), .Z(n17) );
  INVX4 U23 ( .A(n8), .Z(n16) );
  INVX2 U24 ( .A(n463), .Z(n19) );
  INVX2 U25 ( .A(n633), .Z(n21) );
  XOR2X1 U26 ( .A(\add_311/A[2] ), .B(n2), .Z(N420) );
  AND2X1 U27 ( .A(\add_311/A[1] ), .B(\add_311/A[0] ), .Z(n2) );
  INVX2 U28 ( .A(n696), .Z(core_to_mem_write_enable) );
  INVX2 U29 ( .A(n465), .Z(n111) );
  INVX2 U30 ( .A(n907), .Z(n71) );
  INVX2 U31 ( .A(n524), .Z(n62) );
  INVX2 U32 ( .A(shift[0]), .Z(n74) );
  INVX2 U33 ( .A(reg_data1[14]), .Z(n108) );
  INVX2 U34 ( .A(shift[2]), .Z(n79) );
  INVX2 U35 ( .A(reg_data1[12]), .Z(n107) );
  INVX2 U36 ( .A(reg_data1[10]), .Z(n106) );
  INVX4 U37 ( .A(n440), .Z(n88) );
  INVX4 U38 ( .A(n435), .Z(n89) );
  INVX4 U39 ( .A(n436), .Z(n84) );
  INVX2 U40 ( .A(reg_data1[15]), .Z(n109) );
  INVX2 U41 ( .A(n519), .Z(n63) );
  INVX4 U42 ( .A(n635), .Z(n61) );
  INVX2 U43 ( .A(rst), .Z(n7) );
  INVX2 U44 ( .A(mem_to_core_data[13]), .Z(n113) );
  INVX2 U45 ( .A(mem_to_core_data[12]), .Z(n114) );
  INVX2 U46 ( .A(mem_to_core_data[15]), .Z(n110) );
  INVX2 U47 ( .A(mem_to_core_data[14]), .Z(n112) );
  TIE0 U48 ( .Z(n9) );
  XOR2X1 U49 ( .A(\add_311/A[1] ), .B(\add_311/A[0] ), .Z(N419) );
  NAND3X1 U50 ( .A(\add_311/A[1] ), .B(\add_311/A[0] ), .C(\add_311/A[2] ), 
        .Z(n8) );
  XOR2X1 U51 ( .A(\add_311/A[3] ), .B(n16), .Z(N421) );
  AND2X1 U52 ( .A(n16), .B(\add_311/A[3] ), .Z(n10) );
  XOR2X1 U53 ( .A(\add_311/A[4] ), .B(n10), .Z(N422) );
  NAND3X1 U54 ( .A(\add_311/A[3] ), .B(n16), .C(\add_311/A[4] ), .Z(n11) );
  XOR2X1 U55 ( .A(\add_311/A[5] ), .B(n17), .Z(N423) );
  AND2X1 U56 ( .A(n17), .B(\add_311/A[5] ), .Z(n12) );
  XOR2X1 U57 ( .A(\add_311/A[6] ), .B(n12), .Z(N424) );
  NAND3X1 U58 ( .A(\add_311/A[5] ), .B(n17), .C(\add_311/A[6] ), .Z(n13) );
  XOR2X1 U59 ( .A(n23), .B(n13), .Z(N425) );
  NOR2X1 U60 ( .A(n23), .B(n13), .Z(n14) );
  XOR2X1 U61 ( .A(\add_311/A[8] ), .B(n14), .Z(N426) );
  AND2X1 U62 ( .A(n14), .B(\add_311/A[8] ), .Z(n15) );
  XOR2X1 U63 ( .A(\add_311/A[9] ), .B(n15), .Z(N427) );
  NAND2X1 U64 ( .A(n143), .B(n145), .Z(n139) );
  NAND2X1 U65 ( .A(n165), .B(n166), .Z(n161) );
  NAND2X1 U66 ( .A(n184), .B(n185), .Z(n180) );
  NAND2X1 U67 ( .A(n203), .B(n204), .Z(n199) );
  NAND2X1 U68 ( .A(n222), .B(n223), .Z(n218) );
  NAND2X1 U69 ( .A(n241), .B(n242), .Z(n237) );
  NAND2X1 U70 ( .A(n260), .B(n261), .Z(n256) );
  NAND2X1 U71 ( .A(n279), .B(n280), .Z(n275) );
  NAND2X1 U72 ( .A(n298), .B(n299), .Z(n294) );
  NAND2X1 U73 ( .A(n317), .B(n318), .Z(n312) );
  NAND2X1 U74 ( .A(n335), .B(n336), .Z(n331) );
  NAND2X1 U75 ( .A(n353), .B(n354), .Z(n349) );
  NAND2X1 U76 ( .A(n371), .B(n372), .Z(n367) );
  NAND2X1 U77 ( .A(n389), .B(n390), .Z(n385) );
  NAND2X1 U78 ( .A(n407), .B(n408), .Z(n403) );
  NAND2X1 U79 ( .A(n427), .B(n428), .Z(n422) );
  NOR2X1 U80 ( .A(shift[2]), .B(shift[3]), .Z(n937) );
  NOR2X1 U81 ( .A(shift[0]), .B(shift[1]), .Z(n898) );
  NAND2X1 U82 ( .A(n96), .B(n898), .Z(n528) );
  NOR2X1 U83 ( .A(n74), .B(shift[1]), .Z(n899) );
  NAND2X1 U84 ( .A(n97), .B(n899), .Z(n144) );
  NAND2X1 U85 ( .A(shift[0]), .B(shift[1]), .Z(n900) );
  NOR2X1 U86 ( .A(n900), .B(n37), .Z(n116) );
  NAND2X1 U87 ( .A(shift[1]), .B(n74), .Z(n901) );
  NOR2X1 U88 ( .A(n901), .B(n38), .Z(n115) );
  NOR2X1 U89 ( .A(n116), .B(n115), .Z(n117) );
  NAND3X1 U90 ( .A(n528), .B(n144), .C(n117), .Z(n816) );
  NAND2X1 U91 ( .A(n937), .B(n816), .Z(n836) );
  NOR2X1 U92 ( .A(n79), .B(shift[3]), .Z(n939) );
  NAND2X1 U93 ( .A(n100), .B(n898), .Z(n821) );
  NAND2X1 U94 ( .A(n101), .B(n899), .Z(n820) );
  NOR2X1 U95 ( .A(n900), .B(n33), .Z(n818) );
  NOR2X1 U96 ( .A(n901), .B(n34), .Z(n817) );
  NOR2X1 U97 ( .A(n818), .B(n817), .Z(n819) );
  NAND3X1 U98 ( .A(n821), .B(n820), .C(n819), .Z(n911) );
  NAND2X1 U99 ( .A(n939), .B(n911), .Z(n835) );
  NAND2X1 U100 ( .A(reg_data1[12]), .B(n898), .Z(n826) );
  NAND2X1 U101 ( .A(reg_data1[13]), .B(n899), .Z(n825) );
  NOR2X1 U102 ( .A(n109), .B(n900), .Z(n823) );
  NOR2X1 U103 ( .A(n901), .B(n108), .Z(n822) );
  NOR2X1 U104 ( .A(n823), .B(n822), .Z(n824) );
  NAND3X1 U105 ( .A(n826), .B(n825), .C(n824), .Z(n933) );
  NAND2X1 U106 ( .A(shift[3]), .B(shift[2]), .Z(n886) );
  NOR2X1 U107 ( .A(n69), .B(n886), .Z(n833) );
  NAND2X1 U129 ( .A(n104), .B(n898), .Z(n831) );
  NAND2X1 U149 ( .A(n105), .B(n899), .Z(n830) );
  NOR2X1 U169 ( .A(n900), .B(n4), .Z(n828) );
  NOR2X1 U189 ( .A(n901), .B(n106), .Z(n827) );
  NOR2X1 U209 ( .A(n828), .B(n827), .Z(n829) );
  NAND3X1 U229 ( .A(n831), .B(n830), .C(n829), .Z(n932) );
  NAND2X1 U249 ( .A(shift[3]), .B(n79), .Z(n927) );
  AND2X1 U269 ( .A(n932), .B(n78), .Z(n832) );
  NOR2X1 U289 ( .A(n833), .B(n832), .Z(n834) );
  NAND3X1 U307 ( .A(n836), .B(n835), .C(n834), .Z(N151) );
  NAND2X1 U326 ( .A(reg_data1[10]), .B(n898), .Z(n841) );
  NAND2X1 U345 ( .A(reg_data1[11]), .B(n899), .Z(n840) );
  NOR2X1 U364 ( .A(n3), .B(n900), .Z(n838) );
  NOR2X1 U383 ( .A(n901), .B(n107), .Z(n837) );
  NOR2X1 U402 ( .A(n838), .B(n837), .Z(n839) );
  NAND3X1 U427 ( .A(n841), .B(n840), .C(n839), .Z(n919) );
  NAND2X1 U431 ( .A(n937), .B(n919), .Z(n845) );
  NAND2X1 U864 ( .A(n898), .B(reg_data1[14]), .Z(n843) );
  NAND2X1 U868 ( .A(n899), .B(reg_data1[15]), .Z(n842) );
  NAND2X1 U869 ( .A(n843), .B(n842), .Z(n920) );
  NAND2X1 U870 ( .A(n939), .B(n920), .Z(n844) );
  NAND2X1 U871 ( .A(n845), .B(n844), .Z(N161) );
  NAND2X1 U872 ( .A(n898), .B(reg_data1[15]), .Z(n926) );
  NAND2X1 U873 ( .A(reg_data1[11]), .B(n898), .Z(n850) );
  NAND2X1 U874 ( .A(reg_data1[12]), .B(n899), .Z(n849) );
  NOR2X1 U875 ( .A(n108), .B(n900), .Z(n847) );
  NOR2X1 U876 ( .A(n901), .B(n3), .Z(n846) );
  NOR2X1 U877 ( .A(n847), .B(n846), .Z(n848) );
  NAND3X1 U878 ( .A(n850), .B(n849), .C(n848), .Z(n925) );
  MUX2X1 U879 ( .A(n926), .B(n72), .S(n79), .Z(n907) );
  NOR2X1 U880 ( .A(shift[3]), .B(n907), .Z(N162) );
  NOR2X1 U881 ( .A(n69), .B(n77), .Z(N163) );
  NAND2X1 U882 ( .A(reg_data1[14]), .B(n899), .Z(n853) );
  OR2X1 U883 ( .A(n109), .B(n901), .Z(n852) );
  NAND2X1 U884 ( .A(reg_data1[13]), .B(n898), .Z(n851) );
  NAND3X1 U885 ( .A(n853), .B(n852), .C(n851), .Z(n938) );
  NOR2X1 U886 ( .A(n73), .B(n77), .Z(N164) );
  NOR2X1 U887 ( .A(n70), .B(n77), .Z(N165) );
  NOR2X1 U888 ( .A(n77), .B(n926), .Z(N166) );
  NAND2X1 U889 ( .A(n97), .B(n898), .Z(n858) );
  NAND2X1 U890 ( .A(n98), .B(n899), .Z(n857) );
  NOR2X1 U891 ( .A(n900), .B(n36), .Z(n855) );
  NOR2X1 U892 ( .A(n901), .B(n37), .Z(n854) );
  NOR2X1 U893 ( .A(n855), .B(n854), .Z(n856) );
  NAND3X1 U894 ( .A(n858), .B(n857), .C(n856), .Z(n859) );
  NAND2X1 U895 ( .A(n937), .B(n859), .Z(n874) );
  NAND2X1 U896 ( .A(n101), .B(n898), .Z(n864) );
  NAND2X1 U897 ( .A(n102), .B(n899), .Z(n863) );
  NOR2X1 U898 ( .A(n900), .B(n32), .Z(n861) );
  NOR2X1 U899 ( .A(n901), .B(n33), .Z(n860) );
  NOR2X1 U900 ( .A(n861), .B(n860), .Z(n862) );
  NAND3X1 U901 ( .A(n864), .B(n863), .C(n862), .Z(n915) );
  NAND2X1 U902 ( .A(n939), .B(n915), .Z(n873) );
  NOR2X1 U903 ( .A(n73), .B(n886), .Z(n871) );
  NAND2X1 U904 ( .A(n105), .B(n898), .Z(n869) );
  NAND2X1 U905 ( .A(reg_data1[10]), .B(n899), .Z(n868) );
  NOR2X1 U906 ( .A(n900), .B(n107), .Z(n866) );
  NOR2X1 U907 ( .A(n901), .B(n4), .Z(n865) );
  NOR2X1 U908 ( .A(n866), .B(n865), .Z(n867) );
  NAND3X1 U909 ( .A(n869), .B(n868), .C(n867), .Z(n936) );
  AND2X1 U910 ( .A(n936), .B(n78), .Z(n870) );
  NOR2X1 U911 ( .A(n871), .B(n870), .Z(n872) );
  NAND3X1 U912 ( .A(n874), .B(n873), .C(n872), .Z(N152) );
  NAND2X1 U913 ( .A(n98), .B(n898), .Z(n879) );
  NAND2X1 U914 ( .A(n99), .B(n899), .Z(n878) );
  NOR2X1 U915 ( .A(n900), .B(n35), .Z(n876) );
  NOR2X1 U916 ( .A(n901), .B(n36), .Z(n875) );
  NOR2X1 U917 ( .A(n876), .B(n875), .Z(n877) );
  NAND3X1 U918 ( .A(n879), .B(n878), .C(n877), .Z(n880) );
  NAND2X1 U919 ( .A(n937), .B(n880), .Z(n891) );
  NAND2X1 U920 ( .A(n102), .B(n898), .Z(n885) );
  NAND2X1 U921 ( .A(n103), .B(n899), .Z(n884) );
  NOR2X1 U922 ( .A(n900), .B(n31), .Z(n882) );
  NOR2X1 U923 ( .A(n901), .B(n32), .Z(n881) );
  NOR2X1 U924 ( .A(n882), .B(n881), .Z(n883) );
  NAND3X1 U925 ( .A(n885), .B(n884), .C(n883), .Z(n921) );
  NAND2X1 U926 ( .A(n939), .B(n921), .Z(n890) );
  NOR2X1 U927 ( .A(n70), .B(n886), .Z(n888) );
  AND2X1 U928 ( .A(n919), .B(n78), .Z(n887) );
  NOR2X1 U929 ( .A(n888), .B(n887), .Z(n889) );
  NAND3X1 U930 ( .A(n891), .B(n890), .C(n889), .Z(N153) );
  NAND2X1 U931 ( .A(n99), .B(n898), .Z(n896) );
  NAND2X1 U932 ( .A(n100), .B(n899), .Z(n895) );
  NOR2X1 U933 ( .A(n900), .B(n34), .Z(n893) );
  NOR2X1 U934 ( .A(n901), .B(n35), .Z(n892) );
  NOR2X1 U935 ( .A(n893), .B(n892), .Z(n894) );
  NAND3X1 U936 ( .A(n896), .B(n895), .C(n894), .Z(n897) );
  NAND2X1 U937 ( .A(n937), .B(n897), .Z(n910) );
  NAND2X1 U938 ( .A(n103), .B(n898), .Z(n906) );
  NAND2X1 U939 ( .A(n104), .B(n899), .Z(n905) );
  NOR2X1 U940 ( .A(n900), .B(n106), .Z(n903) );
  NOR2X1 U941 ( .A(n901), .B(n31), .Z(n902) );
  NOR2X1 U942 ( .A(n903), .B(n902), .Z(n904) );
  NAND3X1 U943 ( .A(n906), .B(n905), .C(n904), .Z(n928) );
  NAND2X1 U944 ( .A(n939), .B(n928), .Z(n909) );
  NAND2X1 U945 ( .A(shift[3]), .B(n71), .Z(n908) );
  NAND3X1 U946 ( .A(n910), .B(n909), .C(n908), .Z(N154) );
  NAND2X1 U947 ( .A(n939), .B(n932), .Z(n914) );
  NAND2X1 U948 ( .A(n78), .B(n933), .Z(n913) );
  NAND2X1 U949 ( .A(n937), .B(n911), .Z(n912) );
  NAND3X1 U950 ( .A(n914), .B(n913), .C(n912), .Z(N155) );
  NAND2X1 U951 ( .A(n939), .B(n936), .Z(n918) );
  NAND2X1 U952 ( .A(n78), .B(n938), .Z(n917) );
  NAND2X1 U953 ( .A(n937), .B(n915), .Z(n916) );
  NAND3X1 U954 ( .A(n918), .B(n917), .C(n916), .Z(N156) );
  NAND2X1 U955 ( .A(n939), .B(n919), .Z(n924) );
  NAND2X1 U956 ( .A(n78), .B(n920), .Z(n923) );
  NAND2X1 U957 ( .A(n937), .B(n921), .Z(n922) );
  NAND3X1 U958 ( .A(n924), .B(n923), .C(n922), .Z(N157) );
  NAND2X1 U959 ( .A(n939), .B(n925), .Z(n931) );
  OR2X1 U960 ( .A(n927), .B(n926), .Z(n930) );
  NAND2X1 U961 ( .A(n937), .B(n928), .Z(n929) );
  NAND3X1 U962 ( .A(n931), .B(n930), .C(n929), .Z(N158) );
  NAND2X1 U963 ( .A(n937), .B(n932), .Z(n935) );
  NAND2X1 U964 ( .A(n939), .B(n933), .Z(n934) );
  NAND2X1 U965 ( .A(n935), .B(n934), .Z(N159) );
  NAND2X1 U966 ( .A(n937), .B(n936), .Z(n941) );
  NAND2X1 U967 ( .A(n939), .B(n938), .Z(n940) );
  NAND2X1 U968 ( .A(n941), .B(n940), .Z(N160) );
endmodule


module counter_0 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n3, n4, n5, n6, n7, n8, n9, n10, n11, n1, n2, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n3), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n3), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n3), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n3), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n3), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n3), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n3), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n3), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n4), .Z(n3) );
  NOR2X1 U13 ( .A(N3), .B(n5), .Z(n4) );
  NOR2X1 U14 ( .A(n6), .B(n7), .Z(n5) );
  NAND2X1 U15 ( .A(n8), .B(n9), .Z(n7) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n9) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n8) );
  NAND2X1 U18 ( .A(n10), .B(n11), .Z(n6) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n11) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n10) );
  INVX2 U5 ( .A(count[0]), .Z(n46) );
  XOR2X1 U21 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U22 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U23 ( .A(count[2]), .Z(n42) );
  INVX2 U24 ( .A(count[3]), .Z(n43) );
  INVX2 U25 ( .A(count[4]), .Z(n44) );
  INVX2 U26 ( .A(count[6]), .Z(n45) );
  INVX4 U27 ( .A(n2), .Z(n17) );
  INVX2 U28 ( .A(count[5]), .Z(n16) );
  INVX2 U29 ( .A(count_to[7]), .Z(n41) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_0 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_0 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(count[2]), .Z(n27) );
  INVX2 U6 ( .A(count[3]), .Z(n28) );
  INVX2 U7 ( .A(count[1]), .Z(n26) );
  INVX2 U8 ( .A(pwm_reg[0]), .Z(n24) );
  AND2X1 U9 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U10 ( .A(count[5]), .Z(n30) );
  INVX2 U11 ( .A(count[4]), .Z(n29) );
  INVX2 U12 ( .A(count[6]), .Z(n31) );
  INVX2 U13 ( .A(pwm_reg[7]), .Z(n25) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_7 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count[0]), .Z(n46) );
  XOR2X1 U21 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U22 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U23 ( .A(count[2]), .Z(n42) );
  INVX2 U24 ( .A(count[3]), .Z(n43) );
  INVX2 U25 ( .A(count[4]), .Z(n44) );
  INVX2 U26 ( .A(count[6]), .Z(n45) );
  INVX4 U27 ( .A(n2), .Z(n17) );
  INVX2 U28 ( .A(count[5]), .Z(n16) );
  INVX2 U29 ( .A(count_to[7]), .Z(n41) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_7 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_7 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(count[2]), .Z(n27) );
  INVX2 U6 ( .A(count[3]), .Z(n28) );
  INVX2 U7 ( .A(count[1]), .Z(n26) );
  INVX2 U8 ( .A(pwm_reg[0]), .Z(n24) );
  AND2X1 U9 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U10 ( .A(count[5]), .Z(n30) );
  INVX2 U11 ( .A(count[4]), .Z(n29) );
  INVX2 U12 ( .A(count[6]), .Z(n31) );
  INVX2 U13 ( .A(pwm_reg[7]), .Z(n25) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_6 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count_to[7]), .Z(n41) );
  INVX2 U21 ( .A(count[0]), .Z(n46) );
  XOR2X1 U22 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U23 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U24 ( .A(count[2]), .Z(n42) );
  INVX2 U25 ( .A(count[3]), .Z(n43) );
  INVX2 U26 ( .A(count[4]), .Z(n44) );
  INVX2 U27 ( .A(count[6]), .Z(n45) );
  INVX4 U28 ( .A(n2), .Z(n17) );
  INVX2 U29 ( .A(count[5]), .Z(n16) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_6 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_6 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(pwm_reg[0]), .Z(n24) );
  INVX2 U6 ( .A(pwm_reg[7]), .Z(n25) );
  AND2X1 U7 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U8 ( .A(count[2]), .Z(n27) );
  INVX2 U9 ( .A(count[3]), .Z(n28) );
  INVX2 U10 ( .A(count[1]), .Z(n26) );
  INVX2 U11 ( .A(count[5]), .Z(n30) );
  INVX2 U12 ( .A(count[4]), .Z(n29) );
  INVX2 U13 ( .A(count[6]), .Z(n31) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_5 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count_to[7]), .Z(n41) );
  INVX2 U21 ( .A(count[0]), .Z(n46) );
  XOR2X1 U22 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U23 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U24 ( .A(count[2]), .Z(n42) );
  INVX2 U25 ( .A(count[3]), .Z(n43) );
  INVX2 U26 ( .A(count[4]), .Z(n44) );
  INVX2 U27 ( .A(count[6]), .Z(n45) );
  INVX4 U28 ( .A(n2), .Z(n17) );
  INVX2 U29 ( .A(count[5]), .Z(n16) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_5 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_5 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(pwm_reg[0]), .Z(n24) );
  INVX2 U6 ( .A(pwm_reg[7]), .Z(n25) );
  AND2X1 U7 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U8 ( .A(count[2]), .Z(n27) );
  INVX2 U9 ( .A(count[3]), .Z(n28) );
  INVX2 U10 ( .A(count[1]), .Z(n26) );
  INVX2 U11 ( .A(count[5]), .Z(n30) );
  INVX2 U12 ( .A(count[4]), .Z(n29) );
  INVX2 U13 ( .A(count[6]), .Z(n31) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_4 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count[0]), .Z(n46) );
  XOR2X1 U21 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U22 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U23 ( .A(count[2]), .Z(n42) );
  INVX2 U24 ( .A(count[3]), .Z(n43) );
  INVX2 U25 ( .A(count[4]), .Z(n44) );
  INVX2 U26 ( .A(count[6]), .Z(n45) );
  INVX4 U27 ( .A(n2), .Z(n17) );
  INVX2 U28 ( .A(count[5]), .Z(n16) );
  INVX2 U29 ( .A(count_to[7]), .Z(n41) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_4 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_4 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(count[2]), .Z(n27) );
  INVX2 U6 ( .A(count[3]), .Z(n28) );
  INVX2 U7 ( .A(count[1]), .Z(n26) );
  INVX2 U8 ( .A(pwm_reg[0]), .Z(n24) );
  AND2X1 U9 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U10 ( .A(count[5]), .Z(n30) );
  INVX2 U11 ( .A(count[4]), .Z(n29) );
  INVX2 U12 ( .A(count[6]), .Z(n31) );
  INVX2 U13 ( .A(pwm_reg[7]), .Z(n25) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_3 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count[0]), .Z(n46) );
  XOR2X1 U21 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U22 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U23 ( .A(count[2]), .Z(n42) );
  INVX2 U24 ( .A(count[3]), .Z(n43) );
  INVX2 U25 ( .A(count[4]), .Z(n44) );
  INVX2 U26 ( .A(count[6]), .Z(n45) );
  INVX4 U27 ( .A(n2), .Z(n17) );
  INVX2 U28 ( .A(count[5]), .Z(n16) );
  INVX2 U29 ( .A(count_to[7]), .Z(n41) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_3 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_3 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(count[2]), .Z(n27) );
  INVX2 U6 ( .A(count[3]), .Z(n28) );
  INVX2 U7 ( .A(count[1]), .Z(n26) );
  INVX2 U8 ( .A(pwm_reg[0]), .Z(n24) );
  AND2X1 U9 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U10 ( .A(count[5]), .Z(n30) );
  INVX2 U11 ( .A(count[4]), .Z(n29) );
  INVX2 U12 ( .A(count[6]), .Z(n31) );
  INVX2 U13 ( .A(pwm_reg[7]), .Z(n25) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_2 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count_to[7]), .Z(n41) );
  INVX2 U21 ( .A(count[0]), .Z(n46) );
  XOR2X1 U22 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U23 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U24 ( .A(count[2]), .Z(n42) );
  INVX2 U25 ( .A(count[3]), .Z(n43) );
  INVX2 U26 ( .A(count[4]), .Z(n44) );
  INVX2 U27 ( .A(count[6]), .Z(n45) );
  INVX4 U28 ( .A(n2), .Z(n17) );
  INVX2 U29 ( .A(count[5]), .Z(n16) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_2 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_2 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(pwm_reg[0]), .Z(n24) );
  INVX2 U6 ( .A(pwm_reg[7]), .Z(n25) );
  AND2X1 U7 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U8 ( .A(count[2]), .Z(n27) );
  INVX2 U9 ( .A(count[3]), .Z(n28) );
  INVX2 U10 ( .A(count[1]), .Z(n26) );
  INVX2 U11 ( .A(count[5]), .Z(n30) );
  INVX2 U12 ( .A(count[4]), .Z(n29) );
  INVX2 U13 ( .A(count[6]), .Z(n31) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module counter_1 ( clk, reset, count_to, count );
  input [7:0] count_to;
  output [7:0] count;
  input clk, reset;
  wire   N3, N7, N8, N9, N10, N11, N12, N13, N25, N26, N27, N28, N29, N30, N31,
         N32, n1, n2, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;

  DFFQX1 \count_reg[0]  ( .D(N25), .CLK(clk), .Q(count[0]) );
  DFFQX1 \count_reg[7]  ( .D(N32), .CLK(clk), .Q(count[7]) );
  DFFQX1 \count_reg[6]  ( .D(N31), .CLK(clk), .Q(count[6]) );
  DFFQX1 \count_reg[5]  ( .D(N30), .CLK(clk), .Q(count[5]) );
  DFFQX1 \count_reg[4]  ( .D(N29), .CLK(clk), .Q(count[4]) );
  DFFQX1 \count_reg[3]  ( .D(N28), .CLK(clk), .Q(count[3]) );
  DFFQX1 \count_reg[2]  ( .D(N27), .CLK(clk), .Q(count[2]) );
  DFFQX1 \count_reg[1]  ( .D(N26), .CLK(clk), .Q(count[1]) );
  AND2X1 U3 ( .A(N13), .B(n55), .Z(N32) );
  AND2X1 U4 ( .A(N12), .B(n55), .Z(N31) );
  AND2X1 U6 ( .A(N11), .B(n55), .Z(N30) );
  AND2X1 U7 ( .A(N10), .B(n55), .Z(N29) );
  AND2X1 U8 ( .A(N9), .B(n55), .Z(N28) );
  AND2X1 U9 ( .A(N8), .B(n55), .Z(N27) );
  AND2X1 U10 ( .A(N7), .B(n55), .Z(N26) );
  AND2X1 U11 ( .A(n46), .B(n55), .Z(N25) );
  NOR2X1 U12 ( .A(reset), .B(n54), .Z(n55) );
  NOR2X1 U13 ( .A(N3), .B(n53), .Z(n54) );
  NOR2X1 U14 ( .A(n52), .B(n51), .Z(n53) );
  NAND2X1 U15 ( .A(n50), .B(n49), .Z(n51) );
  NOR2X1 U16 ( .A(count_to[3]), .B(count_to[2]), .Z(n49) );
  NOR2X1 U17 ( .A(count_to[1]), .B(count_to[0]), .Z(n50) );
  NAND2X1 U18 ( .A(n48), .B(n47), .Z(n52) );
  NOR2X1 U19 ( .A(count_to[7]), .B(count_to[6]), .Z(n47) );
  NOR2X1 U20 ( .A(count_to[5]), .B(count_to[4]), .Z(n48) );
  INVX2 U5 ( .A(count_to[7]), .Z(n41) );
  INVX2 U21 ( .A(count[0]), .Z(n46) );
  XOR2X1 U22 ( .A(count[2]), .B(n1), .Z(N8) );
  AND2X1 U23 ( .A(count[1]), .B(count[0]), .Z(n1) );
  INVX2 U24 ( .A(count[2]), .Z(n42) );
  INVX2 U25 ( .A(count[3]), .Z(n43) );
  INVX2 U26 ( .A(count[4]), .Z(n44) );
  INVX2 U27 ( .A(count[6]), .Z(n45) );
  INVX4 U28 ( .A(n2), .Z(n17) );
  INVX2 U29 ( .A(count[5]), .Z(n16) );
  XOR2X1 U30 ( .A(count[1]), .B(count[0]), .Z(N7) );
  NAND3X1 U31 ( .A(count[1]), .B(count[0]), .C(count[2]), .Z(n2) );
  XOR2X1 U32 ( .A(count[3]), .B(n17), .Z(N9) );
  AND2X1 U33 ( .A(n17), .B(count[3]), .Z(n12) );
  XOR2X1 U34 ( .A(count[4]), .B(n12), .Z(N10) );
  NAND3X1 U35 ( .A(count[3]), .B(n17), .C(count[4]), .Z(n13) );
  XOR2X1 U36 ( .A(n16), .B(n13), .Z(N11) );
  NOR2X1 U37 ( .A(n16), .B(n13), .Z(n14) );
  XOR2X1 U38 ( .A(count[6]), .B(n14), .Z(N12) );
  AND2X1 U39 ( .A(n14), .B(count[6]), .Z(n15) );
  XOR2X1 U40 ( .A(count[7]), .B(n15), .Z(N13) );
  OR2X1 U41 ( .A(n41), .B(count[7]), .Z(n40) );
  OR2X1 U42 ( .A(n16), .B(count_to[5]), .Z(n34) );
  OR2X1 U43 ( .A(n43), .B(count_to[3]), .Z(n28) );
  NAND2X1 U44 ( .A(count_to[0]), .B(n46), .Z(n18) );
  NAND2X1 U45 ( .A(count[1]), .B(n18), .Z(n22) );
  NOR2X1 U46 ( .A(count[1]), .B(n18), .Z(n19) );
  OR2X1 U47 ( .A(count_to[1]), .B(n19), .Z(n21) );
  OR2X1 U48 ( .A(n42), .B(count_to[2]), .Z(n20) );
  NAND3X1 U49 ( .A(n22), .B(n21), .C(n20), .Z(n25) );
  NAND2X1 U50 ( .A(count_to[2]), .B(n42), .Z(n24) );
  NAND2X1 U51 ( .A(count_to[3]), .B(n43), .Z(n23) );
  NAND3X1 U52 ( .A(n25), .B(n24), .C(n23), .Z(n27) );
  OR2X1 U53 ( .A(n44), .B(count_to[4]), .Z(n26) );
  NAND3X1 U54 ( .A(n28), .B(n27), .C(n26), .Z(n31) );
  NAND2X1 U55 ( .A(count_to[4]), .B(n44), .Z(n30) );
  NAND2X1 U56 ( .A(count_to[5]), .B(n16), .Z(n29) );
  NAND3X1 U57 ( .A(n31), .B(n30), .C(n29), .Z(n33) );
  OR2X1 U58 ( .A(n45), .B(count_to[6]), .Z(n32) );
  NAND3X1 U59 ( .A(n34), .B(n33), .C(n32), .Z(n36) );
  NAND2X1 U60 ( .A(count_to[6]), .B(n45), .Z(n35) );
  NAND2X1 U61 ( .A(n36), .B(n35), .Z(n38) );
  NAND2X1 U62 ( .A(count[7]), .B(n41), .Z(n37) );
  NAND2X1 U63 ( .A(n38), .B(n37), .Z(n39) );
  NAND2X1 U64 ( .A(n40), .B(n39), .Z(N3) );
endmodule


module pwm_1 ( clk, reset, pwm_reg, pwm_out );
  input [15:0] pwm_reg;
  input clk, reset;
  output pwm_out;
  wire   N4, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31;
  wire   [7:0] count;

  DFFQX1 pwm_out_reg ( .D(N4), .CLK(clk), .Q(pwm_out) );
  NOR2X1 U5 ( .A(reset), .B(n1), .Z(N4) );
  counter_1 U1 ( .clk(clk), .reset(reset), .count_to(pwm_reg[15:8]), .count(
        count) );
  INVX2 U4 ( .A(pwm_reg[0]), .Z(n24) );
  INVX2 U6 ( .A(pwm_reg[7]), .Z(n25) );
  AND2X1 U7 ( .A(n23), .B(n22), .Z(n1) );
  INVX2 U8 ( .A(count[2]), .Z(n27) );
  INVX2 U9 ( .A(count[3]), .Z(n28) );
  INVX2 U10 ( .A(count[1]), .Z(n26) );
  INVX2 U11 ( .A(count[5]), .Z(n30) );
  INVX2 U12 ( .A(count[4]), .Z(n29) );
  INVX2 U13 ( .A(count[6]), .Z(n31) );
  OR2X1 U14 ( .A(n25), .B(count[7]), .Z(n23) );
  OR2X1 U15 ( .A(n30), .B(pwm_reg[5]), .Z(n17) );
  OR2X1 U16 ( .A(n28), .B(pwm_reg[3]), .Z(n11) );
  OR2X1 U17 ( .A(n26), .B(pwm_reg[1]), .Z(n5) );
  NAND2X1 U18 ( .A(pwm_reg[1]), .B(n26), .Z(n2) );
  NAND3X1 U19 ( .A(n2), .B(n24), .C(count[0]), .Z(n4) );
  OR2X1 U20 ( .A(n27), .B(pwm_reg[2]), .Z(n3) );
  NAND3X1 U21 ( .A(n5), .B(n4), .C(n3), .Z(n8) );
  NAND2X1 U22 ( .A(pwm_reg[2]), .B(n27), .Z(n7) );
  NAND2X1 U23 ( .A(pwm_reg[3]), .B(n28), .Z(n6) );
  NAND3X1 U24 ( .A(n8), .B(n7), .C(n6), .Z(n10) );
  OR2X1 U25 ( .A(n29), .B(pwm_reg[4]), .Z(n9) );
  NAND3X1 U26 ( .A(n11), .B(n10), .C(n9), .Z(n14) );
  NAND2X1 U27 ( .A(pwm_reg[4]), .B(n29), .Z(n13) );
  NAND2X1 U28 ( .A(pwm_reg[5]), .B(n30), .Z(n12) );
  NAND3X1 U29 ( .A(n14), .B(n13), .C(n12), .Z(n16) );
  OR2X1 U30 ( .A(n31), .B(pwm_reg[6]), .Z(n15) );
  NAND3X1 U31 ( .A(n17), .B(n16), .C(n15), .Z(n19) );
  NAND2X1 U32 ( .A(pwm_reg[6]), .B(n31), .Z(n18) );
  NAND2X1 U33 ( .A(n19), .B(n18), .Z(n21) );
  NAND2X1 U34 ( .A(count[7]), .B(n25), .Z(n20) );
  NAND2X1 U35 ( .A(n21), .B(n20), .Z(n22) );
endmodule


module I2C_state_controller ( clock, reset, req_next, ack_failed, 
        dev_address_s, reg_address_s, data_s, send_next_state, send_byte_data
 );
  input [8:0] dev_address_s;
  input [7:0] reg_address_s;
  input [7:0] data_s;
  output [2:0] send_next_state;
  output [7:0] send_byte_data;
  input clock, reset, req_next, ack_failed;
  wire   n1, n2, n3, n4, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16,
         n17, n18, n19, n20;

  NOR2X1 U23 ( .A(reset), .B(n21), .Z(send_next_state[2]) );
  NOR2X1 U24 ( .A(n22), .B(n23), .Z(n21) );
  NOR2X1 U25 ( .A(n24), .B(n25), .Z(n23) );
  NOR2X1 U26 ( .A(n26), .B(n27), .Z(n25) );
  NOR2X1 U27 ( .A(n14), .B(n10), .Z(n27) );
  NOR2X1 U28 ( .A(n28), .B(n3), .Z(n26) );
  NAND3X1 U29 ( .A(n16), .B(n12), .C(n30), .Z(n29) );
  NOR2X1 U30 ( .A(n14), .B(reset), .Z(n30) );
  AND2X1 U31 ( .A(n31), .B(n5), .Z(send_next_state[0]) );
  NAND3X1 U32 ( .A(n13), .B(n32), .C(n33), .Z(n31) );
  NOR2X1 U33 ( .A(n22), .B(n9), .Z(n33) );
  NAND3X1 U34 ( .A(n2), .B(n3), .C(n34), .Z(n32) );
  OR2X1 U35 ( .A(dev_address_s[8]), .B(n16), .Z(n34) );
  AND2X1 U36 ( .A(n36), .B(n5), .Z(send_byte_data[7]) );
  NAND3X1 U37 ( .A(n37), .B(n38), .C(n39), .Z(n36) );
  NAND2X1 U38 ( .A(reg_address_s[7]), .B(n9), .Z(n39) );
  NAND2X1 U39 ( .A(dev_address_s[7]), .B(n35), .Z(n38) );
  NAND2X1 U40 ( .A(data_s[7]), .B(n22), .Z(n37) );
  AND2X1 U41 ( .A(n40), .B(n5), .Z(send_byte_data[6]) );
  NAND3X1 U42 ( .A(n41), .B(n42), .C(n43), .Z(n40) );
  NAND2X1 U43 ( .A(reg_address_s[6]), .B(n9), .Z(n43) );
  NAND2X1 U44 ( .A(dev_address_s[6]), .B(n35), .Z(n42) );
  NAND2X1 U45 ( .A(data_s[6]), .B(n22), .Z(n41) );
  AND2X1 U46 ( .A(n44), .B(n5), .Z(send_byte_data[5]) );
  NAND3X1 U47 ( .A(n45), .B(n46), .C(n47), .Z(n44) );
  NAND2X1 U48 ( .A(reg_address_s[5]), .B(n9), .Z(n47) );
  NAND2X1 U49 ( .A(dev_address_s[5]), .B(n35), .Z(n46) );
  NAND2X1 U50 ( .A(data_s[5]), .B(n22), .Z(n45) );
  AND2X1 U51 ( .A(n48), .B(n5), .Z(send_byte_data[4]) );
  NAND3X1 U52 ( .A(n49), .B(n50), .C(n51), .Z(n48) );
  NAND2X1 U53 ( .A(reg_address_s[4]), .B(n9), .Z(n51) );
  NAND2X1 U54 ( .A(dev_address_s[4]), .B(n35), .Z(n50) );
  NAND2X1 U55 ( .A(data_s[4]), .B(n22), .Z(n49) );
  AND2X1 U56 ( .A(n52), .B(n5), .Z(send_byte_data[3]) );
  NAND3X1 U57 ( .A(n53), .B(n54), .C(n55), .Z(n52) );
  NAND2X1 U58 ( .A(reg_address_s[3]), .B(n9), .Z(n55) );
  NAND2X1 U59 ( .A(dev_address_s[3]), .B(n35), .Z(n54) );
  NAND2X1 U60 ( .A(data_s[3]), .B(n22), .Z(n53) );
  AND2X1 U61 ( .A(n56), .B(n5), .Z(send_byte_data[2]) );
  NAND3X1 U62 ( .A(n57), .B(n58), .C(n59), .Z(n56) );
  NAND2X1 U63 ( .A(reg_address_s[2]), .B(n9), .Z(n59) );
  NAND2X1 U64 ( .A(dev_address_s[2]), .B(n35), .Z(n58) );
  NAND2X1 U65 ( .A(data_s[2]), .B(n22), .Z(n57) );
  AND2X1 U66 ( .A(n60), .B(n5), .Z(send_byte_data[1]) );
  NAND3X1 U67 ( .A(n61), .B(n62), .C(n63), .Z(n60) );
  NAND2X1 U68 ( .A(reg_address_s[1]), .B(n9), .Z(n63) );
  NAND2X1 U69 ( .A(dev_address_s[1]), .B(n35), .Z(n62) );
  NAND2X1 U70 ( .A(n64), .B(n65), .Z(n35) );
  NAND2X1 U71 ( .A(n66), .B(n67), .Z(n65) );
  NAND2X1 U72 ( .A(data_s[1]), .B(n22), .Z(n61) );
  AND2X1 U73 ( .A(n68), .B(n5), .Z(send_byte_data[0]) );
  NAND3X1 U74 ( .A(n69), .B(n64), .C(n70), .Z(n68) );
  NAND2X1 U75 ( .A(reg_address_s[0]), .B(n9), .Z(n70) );
  NAND3X1 U76 ( .A(n16), .B(n3), .C(n66), .Z(n64) );
  NAND2X1 U77 ( .A(data_s[0]), .B(n22), .Z(n69) );
  NAND2X1 U78 ( .A(n71), .B(n72), .Z(n100) );
  NAND2X1 U79 ( .A(n18), .B(n14), .Z(n72) );
  NAND3X1 U80 ( .A(n73), .B(n5), .C(req_next), .Z(n71) );
  NAND2X1 U81 ( .A(n74), .B(n75), .Z(n73) );
  NAND3X1 U82 ( .A(n28), .B(n7), .C(n14), .Z(n75) );
  NAND2X1 U83 ( .A(n10), .B(n1), .Z(n28) );
  NAND2X1 U84 ( .A(n24), .B(n77), .Z(n74) );
  NAND2X1 U85 ( .A(n78), .B(n79), .Z(n77) );
  NAND2X1 U86 ( .A(n80), .B(n3), .Z(n79) );
  NAND2X1 U87 ( .A(dev_address_s[0]), .B(n1), .Z(n80) );
  NAND2X1 U88 ( .A(n14), .B(n1), .Z(n78) );
  NAND2X1 U89 ( .A(n81), .B(n82), .Z(n101) );
  NAND2X1 U90 ( .A(n83), .B(n84), .Z(n82) );
  NAND3X1 U91 ( .A(n85), .B(n86), .C(req_next), .Z(n84) );
  NAND2X1 U92 ( .A(n8), .B(n87), .Z(n85) );
  XOR2X1 U93 ( .A(n16), .B(n24), .Z(n87) );
  NAND2X1 U94 ( .A(n18), .B(n16), .Z(n81) );
  NAND3X1 U95 ( .A(n88), .B(n89), .C(n90), .Z(n102) );
  NAND2X1 U96 ( .A(n18), .B(n15), .Z(n90) );
  NAND3X1 U97 ( .A(n8), .B(n76), .C(n83), .Z(n88) );
  NAND2X1 U98 ( .A(n12), .B(n91), .Z(n76) );
  NAND2X1 U99 ( .A(n15), .B(n4), .Z(n91) );
  NOR2X1 U100 ( .A(n4), .B(n15), .Z(n66) );
  NAND3X1 U101 ( .A(n92), .B(n89), .C(n93), .Z(n103) );
  NAND2X1 U102 ( .A(n18), .B(n6), .Z(n93) );
  NAND2X1 U103 ( .A(n83), .B(n20), .Z(n89) );
  NAND3X1 U104 ( .A(n8), .B(n4), .C(n83), .Z(n92) );
  NOR2X1 U105 ( .A(n18), .B(reset), .Z(n83) );
  NAND3X1 U106 ( .A(n20), .B(n5), .C(n19), .Z(n94) );
  NAND3X1 U107 ( .A(n96), .B(n86), .C(n97), .Z(n95) );
  NAND3X1 U108 ( .A(n14), .B(n4), .C(n98), .Z(n97) );
  NOR2X1 U109 ( .A(n16), .B(n15), .Z(n98) );
  NAND2X1 U110 ( .A(dev_address_s[0]), .B(n9), .Z(n86) );
  NAND3X1 U111 ( .A(n15), .B(n4), .C(n67), .Z(n99) );
  NAND2X1 U112 ( .A(n22), .B(n17), .Z(n96) );
  AND2X1 U113 ( .A(n24), .B(n67), .Z(n22) );
  NOR2X1 U114 ( .A(n14), .B(n16), .Z(n67) );
  NOR2X1 U115 ( .A(n2), .B(n4), .Z(n24) );
  DFFQQBX1 \state_list_reg[3]  ( .D(n100), .CLK(clock), .Q(n14), .QB(n3) );
  DFFQQBX1 \state_list_reg[1]  ( .D(n102), .CLK(clock), .Q(n15), .QB(n2) );
  DFFQQBX1 \state_list_reg[0]  ( .D(n103), .CLK(clock), .Q(n6), .QB(n4) );
  DFFQQBX1 \state_list_reg[2]  ( .D(n101), .CLK(clock), .Q(n16), .QB(n1) );
  INVX2 U3 ( .A(reset), .Z(n5) );
  INVX2 U4 ( .A(n24), .Z(n7) );
  INVX2 U5 ( .A(n66), .Z(n12) );
  INVX2 U6 ( .A(n76), .Z(n10) );
  INVX2 U7 ( .A(req_next), .Z(n20) );
  INVX4 U8 ( .A(n29), .Z(send_next_state[1]) );
  INVX2 U9 ( .A(n35), .Z(n13) );
  INVX4 U10 ( .A(n99), .Z(n9) );
  INVX4 U11 ( .A(n94), .Z(n18) );
  INVX2 U12 ( .A(ack_failed), .Z(n19) );
  INVX4 U13 ( .A(n95), .Z(n8) );
  INVX2 U14 ( .A(dev_address_s[0]), .Z(n17) );
endmodule


module I2C ( clock, reset, device_address, reg_address, data_in, sda_read, 
        scl_read, sda_out, scl_out, data_out, i2c_status, WE );
  input [8:0] device_address;
  input [7:0] reg_address;
  input [7:0] data_in;
  output [7:0] data_out;
  output [1:0] i2c_status;
  input clock, reset, sda_read, scl_read;
  output sda_out, scl_out, WE;
  wire   ack_failed, ended, \counter[0] , N139, N140, N141, N142, N143, N144,
         N145, N146, N147, N148, N494, N495, N496, N497, N498, N499, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, \r130/LT_LE ,
         \r129/A[1] , \r129/A[2] , \r129/A[3] , \r129/A[4] , \r129/A[5] ,
         \r129/A[6] , \r129/A[7] , \r129/A[8] , \r129/A[9] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96;
  wire   [2:0] next_state_s;
  wire   [7:0] send_byte_data;
  wire   [2:0] next_state;
  wire   [5:0] sample_counter;

  DFFQX1 ack_failed_reg ( .D(n417), .CLK(clock), .Q(ack_failed) );
  DFFQX1 ended_reg ( .D(n403), .CLK(clock), .Q(ended) );
  DFFQX1 \counter_reg[0]  ( .D(n414), .CLK(clock), .Q(\counter[0] ) );
  DFFQX1 sda_out_reg ( .D(n404), .CLK(clock), .Q(sda_out) );
  DFFQX1 \sample_counter_reg[5]  ( .D(n397), .CLK(clock), .Q(sample_counter[5]) );
  DFFQX1 \sample_counter_reg[0]  ( .D(n402), .CLK(clock), .Q(sample_counter[0]) );
  DFFQX1 \sample_counter_reg[1]  ( .D(n401), .CLK(clock), .Q(sample_counter[1]) );
  DFFQX1 \sample_counter_reg[2]  ( .D(n400), .CLK(clock), .Q(sample_counter[2]) );
  DFFQX1 \sample_counter_reg[3]  ( .D(n399), .CLK(clock), .Q(sample_counter[3]) );
  DFFQX1 \sample_counter_reg[4]  ( .D(n398), .CLK(clock), .Q(sample_counter[4]) );
  DFFQX1 \data_out_reg[7]  ( .D(n389), .CLK(clock), .Q(data_out[7]) );
  DFFQX1 \data_out_reg[6]  ( .D(n390), .CLK(clock), .Q(data_out[6]) );
  DFFQX1 \data_out_reg[5]  ( .D(n391), .CLK(clock), .Q(data_out[5]) );
  DFFQX1 \data_out_reg[4]  ( .D(n392), .CLK(clock), .Q(data_out[4]) );
  DFFQX1 \data_out_reg[3]  ( .D(n393), .CLK(clock), .Q(data_out[3]) );
  DFFQX1 \data_out_reg[2]  ( .D(n394), .CLK(clock), .Q(data_out[2]) );
  DFFQX1 \data_out_reg[1]  ( .D(n395), .CLK(clock), .Q(data_out[1]) );
  DFFQX1 \data_out_reg[0]  ( .D(n396), .CLK(clock), .Q(data_out[0]) );
  DFFQX1 WE_reg ( .D(n405), .CLK(clock), .Q(WE) );
  DFFQX1 \i2c_status_reg[0]  ( .D(n388), .CLK(clock), .Q(i2c_status[0]) );
  DFFQX1 \i2c_status_reg[1]  ( .D(n387), .CLK(clock), .Q(i2c_status[1]) );
  NAND3X1 U90 ( .A(n99), .B(n1), .C(ended), .Z(n98) );
  NAND3X1 U91 ( .A(n100), .B(n101), .C(n102), .Z(n99) );
  NAND2X1 U92 ( .A(n60), .B(n24), .Z(n102) );
  NAND2X1 U93 ( .A(n56), .B(n20), .Z(n101) );
  NAND2X1 U94 ( .A(n85), .B(n23), .Z(n100) );
  NAND2X1 U95 ( .A(n103), .B(n104), .Z(next_state[2]) );
  NAND3X1 U96 ( .A(n56), .B(n105), .C(n106), .Z(n104) );
  NAND2X1 U97 ( .A(next_state_s[2]), .B(n34), .Z(n103) );
  NAND2X1 U98 ( .A(n107), .B(n108), .Z(next_state[1]) );
  NAND3X1 U99 ( .A(n60), .B(n109), .C(n106), .Z(n108) );
  NAND2X1 U100 ( .A(next_state_s[1]), .B(n34), .Z(n107) );
  NAND2X1 U101 ( .A(n110), .B(n111), .Z(next_state[0]) );
  NAND3X1 U102 ( .A(n85), .B(n112), .C(n106), .Z(n111) );
  NOR2X1 U103 ( .A(ended), .B(reset), .Z(n106) );
  NAND2X1 U104 ( .A(next_state_s[0]), .B(n34), .Z(n110) );
  NAND3X1 U105 ( .A(n59), .B(n1), .C(device_address[8]), .Z(n113) );
  NAND2X1 U106 ( .A(n115), .B(n116), .Z(n387) );
  NAND2X1 U107 ( .A(i2c_status[1]), .B(n38), .Z(n116) );
  NAND2X1 U108 ( .A(n118), .B(n117), .Z(n115) );
  NAND3X1 U109 ( .A(n119), .B(n120), .C(n121), .Z(n117) );
  NAND2X1 U110 ( .A(n45), .B(n68), .Z(n121) );
  NAND2X1 U111 ( .A(n119), .B(n122), .Z(n388) );
  NAND2X1 U112 ( .A(i2c_status[0]), .B(n123), .Z(n122) );
  NAND2X1 U113 ( .A(n63), .B(n45), .Z(n123) );
  NAND2X1 U114 ( .A(n124), .B(n125), .Z(n389) );
  NAND2X1 U115 ( .A(n126), .B(n127), .Z(n125) );
  NAND2X1 U116 ( .A(n128), .B(n129), .Z(n126) );
  NAND2X1 U117 ( .A(data_in[7]), .B(n57), .Z(n129) );
  NAND2X1 U118 ( .A(data_out[7]), .B(n54), .Z(n124) );
  NAND2X1 U119 ( .A(n130), .B(n131), .Z(n127) );
  NAND2X1 U120 ( .A(n132), .B(n63), .Z(n131) );
  NAND2X1 U121 ( .A(n133), .B(n134), .Z(n390) );
  NAND2X1 U122 ( .A(n135), .B(n136), .Z(n134) );
  NAND2X1 U123 ( .A(n128), .B(n137), .Z(n135) );
  NAND2X1 U124 ( .A(data_in[6]), .B(n57), .Z(n137) );
  NAND2X1 U125 ( .A(data_out[6]), .B(n53), .Z(n133) );
  NAND2X1 U126 ( .A(n130), .B(n138), .Z(n136) );
  NAND2X1 U127 ( .A(n78), .B(n132), .Z(n138) );
  NAND2X1 U128 ( .A(n139), .B(n140), .Z(n391) );
  NAND2X1 U129 ( .A(n141), .B(n142), .Z(n140) );
  NAND2X1 U130 ( .A(n128), .B(n143), .Z(n141) );
  NAND2X1 U131 ( .A(data_in[5]), .B(n57), .Z(n143) );
  NAND2X1 U132 ( .A(data_out[5]), .B(n52), .Z(n139) );
  NAND2X1 U133 ( .A(n130), .B(n144), .Z(n142) );
  NAND2X1 U134 ( .A(n81), .B(n132), .Z(n144) );
  NAND2X1 U135 ( .A(n145), .B(n146), .Z(n392) );
  NAND2X1 U136 ( .A(n147), .B(n148), .Z(n146) );
  NAND2X1 U137 ( .A(n128), .B(n149), .Z(n147) );
  NAND2X1 U138 ( .A(data_in[4]), .B(n57), .Z(n149) );
  NAND2X1 U139 ( .A(data_out[4]), .B(n51), .Z(n145) );
  NAND2X1 U140 ( .A(n130), .B(n150), .Z(n148) );
  NAND2X1 U141 ( .A(n82), .B(n132), .Z(n150) );
  NAND2X1 U142 ( .A(n151), .B(n152), .Z(n393) );
  NAND2X1 U143 ( .A(n153), .B(n154), .Z(n152) );
  NAND2X1 U144 ( .A(n128), .B(n155), .Z(n153) );
  NAND2X1 U145 ( .A(data_in[3]), .B(n57), .Z(n155) );
  NAND2X1 U146 ( .A(data_out[3]), .B(n50), .Z(n151) );
  NAND2X1 U147 ( .A(n130), .B(n156), .Z(n154) );
  NAND2X1 U148 ( .A(n84), .B(n132), .Z(n156) );
  NAND2X1 U149 ( .A(n157), .B(n158), .Z(n394) );
  NAND2X1 U150 ( .A(n159), .B(n160), .Z(n158) );
  NAND2X1 U151 ( .A(n128), .B(n161), .Z(n159) );
  NAND2X1 U152 ( .A(data_in[2]), .B(n57), .Z(n161) );
  NAND2X1 U153 ( .A(data_out[2]), .B(n49), .Z(n157) );
  NAND2X1 U154 ( .A(n130), .B(n162), .Z(n160) );
  NAND2X1 U155 ( .A(n76), .B(n132), .Z(n162) );
  NAND2X1 U156 ( .A(n163), .B(n164), .Z(n395) );
  NAND2X1 U157 ( .A(n165), .B(n166), .Z(n164) );
  NAND2X1 U158 ( .A(n128), .B(n167), .Z(n165) );
  NAND2X1 U159 ( .A(data_in[1]), .B(n57), .Z(n167) );
  NAND2X1 U160 ( .A(data_out[1]), .B(n48), .Z(n163) );
  NAND2X1 U161 ( .A(n130), .B(n168), .Z(n166) );
  NAND2X1 U162 ( .A(n77), .B(n132), .Z(n168) );
  NAND2X1 U163 ( .A(n169), .B(n170), .Z(n396) );
  NAND2X1 U164 ( .A(n171), .B(n172), .Z(n170) );
  NAND2X1 U165 ( .A(n128), .B(n173), .Z(n171) );
  NAND2X1 U166 ( .A(data_in[0]), .B(n57), .Z(n173) );
  NAND2X1 U167 ( .A(n132), .B(\r130/LT_LE ), .Z(n128) );
  NAND2X1 U168 ( .A(data_out[0]), .B(n47), .Z(n169) );
  NAND2X1 U169 ( .A(n174), .B(n175), .Z(n397) );
  NAND2X1 U170 ( .A(N499), .B(n176), .Z(n175) );
  NAND2X1 U171 ( .A(sample_counter[5]), .B(n36), .Z(n174) );
  NAND2X1 U172 ( .A(n177), .B(n178), .Z(n398) );
  NAND2X1 U173 ( .A(N498), .B(n176), .Z(n178) );
  NAND2X1 U174 ( .A(sample_counter[4]), .B(n36), .Z(n177) );
  NAND2X1 U175 ( .A(n179), .B(n180), .Z(n399) );
  NAND2X1 U176 ( .A(N497), .B(n176), .Z(n180) );
  NAND2X1 U177 ( .A(sample_counter[3]), .B(n36), .Z(n179) );
  NAND2X1 U178 ( .A(n181), .B(n182), .Z(n400) );
  NAND2X1 U179 ( .A(N496), .B(n176), .Z(n182) );
  NAND2X1 U180 ( .A(sample_counter[2]), .B(n36), .Z(n181) );
  NAND2X1 U181 ( .A(n183), .B(n184), .Z(n401) );
  NAND2X1 U182 ( .A(N495), .B(n176), .Z(n184) );
  NAND2X1 U183 ( .A(sample_counter[1]), .B(n36), .Z(n183) );
  NAND2X1 U184 ( .A(n185), .B(n186), .Z(n402) );
  NAND2X1 U185 ( .A(N494), .B(n176), .Z(n186) );
  AND2X1 U186 ( .A(n187), .B(n188), .Z(n176) );
  NAND2X1 U187 ( .A(sample_counter[0]), .B(n36), .Z(n185) );
  NAND3X1 U188 ( .A(n189), .B(n114), .C(n190), .Z(n188) );
  NOR2X1 U189 ( .A(n191), .B(n192), .Z(n190) );
  NOR2X1 U190 ( .A(n37), .B(n193), .Z(n192) );
  NAND3X1 U191 ( .A(n187), .B(n62), .C(sda_read), .Z(n189) );
  NAND2X1 U192 ( .A(n195), .B(n196), .Z(n187) );
  NAND2X1 U193 ( .A(n64), .B(n132), .Z(n196) );
  NAND2X1 U194 ( .A(n65), .B(n118), .Z(n195) );
  NAND3X1 U195 ( .A(n66), .B(n71), .C(n199), .Z(n198) );
  NAND2X1 U196 ( .A(n201), .B(n202), .Z(n403) );
  NAND2X1 U197 ( .A(n203), .B(n40), .Z(n202) );
  OR2X1 U198 ( .A(n205), .B(n206), .Z(n203) );
  NAND2X1 U199 ( .A(n204), .B(ended), .Z(n201) );
  NOR2X1 U200 ( .A(n207), .B(n208), .Z(n204) );
  NAND3X1 U201 ( .A(n209), .B(n210), .C(n47), .Z(n208) );
  NAND2X1 U202 ( .A(n130), .B(n211), .Z(n172) );
  NAND2X1 U203 ( .A(n74), .B(n132), .Z(n211) );
  NAND2X1 U204 ( .A(n58), .B(n63), .Z(n210) );
  NAND2X1 U205 ( .A(n212), .B(n118), .Z(n209) );
  NAND3X1 U206 ( .A(n213), .B(n114), .C(n214), .Z(n207) );
  NAND2X1 U207 ( .A(n68), .B(n43), .Z(n214) );
  NAND2X1 U208 ( .A(n215), .B(n216), .Z(n404) );
  NAND2X1 U209 ( .A(n217), .B(n218), .Z(n216) );
  NAND3X1 U210 ( .A(n219), .B(n220), .C(n221), .Z(n217) );
  NOR2X1 U211 ( .A(n58), .B(n222), .Z(n221) );
  NOR2X1 U212 ( .A(n223), .B(n224), .Z(n222) );
  NAND2X1 U213 ( .A(n225), .B(n224), .Z(n220) );
  NAND2X1 U214 ( .A(n118), .B(n226), .Z(n219) );
  NAND3X1 U215 ( .A(n227), .B(n228), .C(n229), .Z(n226) );
  NOR2X1 U216 ( .A(n230), .B(n231), .Z(n229) );
  NAND2X1 U217 ( .A(n232), .B(n233), .Z(n231) );
  NAND2X1 U218 ( .A(send_byte_data[1]), .B(n76), .Z(n233) );
  NAND2X1 U219 ( .A(send_byte_data[2]), .B(n84), .Z(n232) );
  NAND3X1 U220 ( .A(n235), .B(n236), .C(n237), .Z(n230) );
  NAND2X1 U221 ( .A(send_byte_data[0]), .B(n77), .Z(n237) );
  NAND2X1 U222 ( .A(send_byte_data[6]), .B(n63), .Z(n235) );
  AND2X1 U223 ( .A(n238), .B(n239), .Z(n228) );
  NAND2X1 U224 ( .A(send_byte_data[3]), .B(n82), .Z(n239) );
  NAND2X1 U225 ( .A(send_byte_data[4]), .B(n81), .Z(n238) );
  AND2X1 U226 ( .A(n242), .B(n243), .Z(n227) );
  NAND2X1 U227 ( .A(send_byte_data[5]), .B(n78), .Z(n243) );
  NAND2X1 U228 ( .A(send_byte_data[7]), .B(n70), .Z(n242) );
  NAND2X1 U229 ( .A(sda_out), .B(n39), .Z(n215) );
  NAND3X1 U230 ( .A(n245), .B(n246), .C(n247), .Z(n218) );
  NOR2X1 U231 ( .A(n57), .B(n248), .Z(n247) );
  NOR2X1 U232 ( .A(n249), .B(n224), .Z(n248) );
  OR2X1 U233 ( .A(n250), .B(n251), .Z(n246) );
  NAND2X1 U234 ( .A(n118), .B(n200), .Z(n245) );
  NAND3X1 U235 ( .A(n252), .B(n253), .C(n254), .Z(n200) );
  NOR2X1 U236 ( .A(n74), .B(n70), .Z(n252) );
  NAND3X1 U237 ( .A(n90), .B(n96), .C(n255), .Z(n250) );
  AND2X1 U238 ( .A(n256), .B(n257), .Z(n255) );
  NAND2X1 U239 ( .A(n258), .B(n259), .Z(n405) );
  NAND3X1 U240 ( .A(n260), .B(n261), .C(n45), .Z(n259) );
  NAND2X1 U241 ( .A(WE), .B(n44), .Z(n258) );
  NAND2X1 U242 ( .A(n114), .B(n262), .Z(n260) );
  OR2X1 U243 ( .A(n263), .B(n264), .Z(n262) );
  NAND3X1 U244 ( .A(n94), .B(n265), .C(n45), .Z(n264) );
  NAND3X1 U245 ( .A(\r129/A[1] ), .B(n16), .C(n256), .Z(n263) );
  NAND2X1 U246 ( .A(n266), .B(n267), .Z(n406) );
  NAND2X1 U247 ( .A(N147), .B(n268), .Z(n267) );
  NAND2X1 U248 ( .A(n41), .B(\r129/A[8] ), .Z(n266) );
  NAND2X1 U249 ( .A(n269), .B(n270), .Z(n407) );
  NAND2X1 U250 ( .A(N146), .B(n268), .Z(n270) );
  NAND2X1 U251 ( .A(n41), .B(\r129/A[7] ), .Z(n269) );
  NAND2X1 U252 ( .A(n271), .B(n272), .Z(n408) );
  NAND2X1 U253 ( .A(N145), .B(n268), .Z(n272) );
  NAND2X1 U254 ( .A(n41), .B(\r129/A[6] ), .Z(n271) );
  NAND2X1 U255 ( .A(n273), .B(n274), .Z(n409) );
  NAND2X1 U256 ( .A(N144), .B(n268), .Z(n274) );
  NAND2X1 U257 ( .A(n41), .B(\r129/A[5] ), .Z(n273) );
  NAND2X1 U258 ( .A(n275), .B(n276), .Z(n410) );
  NAND2X1 U259 ( .A(N143), .B(n268), .Z(n276) );
  NAND2X1 U260 ( .A(n41), .B(\r129/A[4] ), .Z(n275) );
  NAND2X1 U261 ( .A(n277), .B(n278), .Z(n411) );
  NAND2X1 U262 ( .A(N142), .B(n268), .Z(n278) );
  NAND2X1 U263 ( .A(n41), .B(\r129/A[3] ), .Z(n277) );
  NAND2X1 U264 ( .A(n279), .B(n280), .Z(n412) );
  NAND2X1 U265 ( .A(N141), .B(n268), .Z(n280) );
  NAND2X1 U266 ( .A(n41), .B(\r129/A[2] ), .Z(n279) );
  NAND2X1 U267 ( .A(n281), .B(n282), .Z(n413) );
  NAND2X1 U268 ( .A(N140), .B(n268), .Z(n282) );
  NAND2X1 U269 ( .A(n41), .B(\r129/A[1] ), .Z(n281) );
  NAND2X1 U270 ( .A(n283), .B(n284), .Z(n414) );
  NAND2X1 U271 ( .A(N139), .B(n268), .Z(n284) );
  NAND2X1 U272 ( .A(n41), .B(\counter[0] ), .Z(n283) );
  NAND2X1 U273 ( .A(n285), .B(n286), .Z(n415) );
  NAND2X1 U274 ( .A(n287), .B(n35), .Z(n286) );
  NAND3X1 U275 ( .A(n289), .B(n290), .C(n291), .Z(n287) );
  NOR2X1 U276 ( .A(n292), .B(n293), .Z(n291) );
  AND2X1 U277 ( .A(n261), .B(n225), .Z(n293) );
  NOR2X1 U278 ( .A(n79), .B(n294), .Z(n292) );
  NAND2X1 U279 ( .A(n118), .B(n295), .Z(n290) );
  NOR2X1 U280 ( .A(n45), .B(n191), .Z(n289) );
  NOR2X1 U281 ( .A(n296), .B(n46), .Z(n191) );
  NAND2X1 U282 ( .A(n288), .B(scl_out), .Z(n285) );
  NOR2X1 U283 ( .A(n297), .B(n298), .Z(n288) );
  NAND3X1 U284 ( .A(n299), .B(n300), .C(n301), .Z(n298) );
  NAND2X1 U285 ( .A(n225), .B(n68), .Z(n301) );
  OR2X1 U286 ( .A(n37), .B(n199), .Z(n300) );
  NOR2X1 U287 ( .A(n302), .B(n303), .Z(n199) );
  NAND3X1 U288 ( .A(n304), .B(n305), .C(n67), .Z(n303) );
  NAND2X1 U289 ( .A(n296), .B(n193), .Z(n295) );
  NAND3X1 U290 ( .A(n89), .B(\r129/A[8] ), .C(n86), .Z(n193) );
  NAND2X1 U291 ( .A(n86), .B(n306), .Z(n305) );
  NAND2X1 U292 ( .A(n307), .B(n308), .Z(n306) );
  NAND2X1 U293 ( .A(n309), .B(n94), .Z(n307) );
  NAND2X1 U294 ( .A(n310), .B(n311), .Z(n304) );
  NAND3X1 U295 ( .A(n312), .B(n313), .C(n314), .Z(n311) );
  NAND3X1 U296 ( .A(n96), .B(\r129/A[1] ), .C(n315), .Z(n312) );
  NOR2X1 U297 ( .A(\r129/A[3] ), .B(n316), .Z(n315) );
  NAND3X1 U298 ( .A(n317), .B(n318), .C(n319), .Z(n302) );
  AND2X1 U299 ( .A(n320), .B(n321), .Z(n319) );
  NAND3X1 U300 ( .A(n93), .B(n256), .C(n88), .Z(n321) );
  NAND3X1 U301 ( .A(n69), .B(\r129/A[3] ), .C(n322), .Z(n320) );
  NAND3X1 U302 ( .A(n87), .B(\r129/A[1] ), .C(n323), .Z(n317) );
  NOR2X1 U303 ( .A(n324), .B(n72), .Z(n323) );
  NAND2X1 U304 ( .A(n79), .B(n58), .Z(n299) );
  NAND3X1 U305 ( .A(n322), .B(n80), .C(n326), .Z(n325) );
  NOR2X1 U306 ( .A(\r129/A[9] ), .B(\counter[0] ), .Z(n326) );
  NAND3X1 U307 ( .A(n327), .B(n130), .C(n328), .Z(n297) );
  NAND2X1 U308 ( .A(n132), .B(n197), .Z(n328) );
  NAND3X1 U309 ( .A(n329), .B(n253), .C(n254), .Z(n197) );
  NOR2X1 U310 ( .A(n330), .B(n331), .Z(n254) );
  NAND2X1 U311 ( .A(n234), .B(n240), .Z(n331) );
  NAND3X1 U312 ( .A(n257), .B(n94), .C(n332), .Z(n240) );
  NOR2X1 U313 ( .A(n333), .B(n83), .Z(n332) );
  NAND3X1 U314 ( .A(n95), .B(n310), .C(n334), .Z(n234) );
  NOR2X1 U315 ( .A(n316), .B(n92), .Z(n334) );
  NAND3X1 U316 ( .A(n244), .B(n224), .C(n241), .Z(n330) );
  NAND3X1 U317 ( .A(n335), .B(n18), .C(n336), .Z(n241) );
  NOR2X1 U318 ( .A(n337), .B(n83), .Z(n336) );
  NAND3X1 U319 ( .A(n90), .B(n80), .C(n338), .Z(n244) );
  NOR2X1 U320 ( .A(n12), .B(n339), .Z(n338) );
  NOR2X1 U321 ( .A(n76), .B(n77), .Z(n253) );
  NAND3X1 U322 ( .A(n80), .B(n94), .C(n341), .Z(n340) );
  NOR2X1 U323 ( .A(n19), .B(n316), .Z(n341) );
  NAND3X1 U324 ( .A(n80), .B(\r129/A[9] ), .C(n89), .Z(n342) );
  NAND2X1 U325 ( .A(n90), .B(n343), .Z(n308) );
  AND2X1 U326 ( .A(n236), .B(n296), .Z(n329) );
  NOR2X1 U327 ( .A(n344), .B(n345), .Z(n296) );
  NAND3X1 U328 ( .A(n346), .B(n347), .C(n348), .Z(n345) );
  NAND2X1 U329 ( .A(\r129/A[3] ), .B(n349), .Z(n348) );
  NAND2X1 U330 ( .A(n350), .B(n351), .Z(n349) );
  NAND3X1 U331 ( .A(n322), .B(n310), .C(n352), .Z(n351) );
  AND2X1 U332 ( .A(\counter[0] ), .B(\r129/A[1] ), .Z(n352) );
  AND2X1 U333 ( .A(n265), .B(n343), .Z(n322) );
  NAND3X1 U334 ( .A(n353), .B(n69), .C(n95), .Z(n350) );
  NAND3X1 U335 ( .A(\r129/A[6] ), .B(\r129/A[4] ), .C(\r129/A[7] ), .Z(n354)
         );
  NAND3X1 U336 ( .A(n93), .B(n310), .C(n88), .Z(n347) );
  NAND3X1 U337 ( .A(\r129/A[6] ), .B(n16), .C(n90), .Z(n355) );
  NOR2X1 U338 ( .A(n21), .B(\r129/A[9] ), .Z(n310) );
  NAND3X1 U339 ( .A(n96), .B(n309), .C(n86), .Z(n346) );
  NAND3X1 U340 ( .A(\r129/A[9] ), .B(n16), .C(\r129/A[1] ), .Z(n356) );
  NAND3X1 U341 ( .A(n357), .B(n261), .C(n358), .Z(n344) );
  NAND3X1 U342 ( .A(n359), .B(n21), .C(\r129/A[9] ), .Z(n358) );
  NAND2X1 U343 ( .A(n313), .B(n314), .Z(n359) );
  NAND2X1 U344 ( .A(n93), .B(n87), .Z(n314) );
  NAND3X1 U345 ( .A(\r129/A[3] ), .B(n13), .C(n90), .Z(n360) );
  NAND3X1 U346 ( .A(n17), .B(n14), .C(\counter[0] ), .Z(n333) );
  NAND3X1 U347 ( .A(n335), .B(\r129/A[6] ), .C(n93), .Z(n313) );
  NAND3X1 U348 ( .A(\r129/A[1] ), .B(n15), .C(\r129/A[7] ), .Z(n361) );
  NAND3X1 U349 ( .A(n257), .B(n362), .C(n91), .Z(n236) );
  NAND2X1 U350 ( .A(n57), .B(n75), .Z(n130) );
  OR2X1 U351 ( .A(n357), .B(n251), .Z(n327) );
  NAND3X1 U352 ( .A(n353), .B(n69), .C(n363), .Z(n357) );
  NOR2X1 U353 ( .A(n324), .B(n364), .Z(n363) );
  NAND2X1 U354 ( .A(n16), .B(n13), .Z(n364) );
  NAND2X1 U355 ( .A(n365), .B(n366), .Z(n416) );
  NAND2X1 U356 ( .A(N148), .B(n268), .Z(n366) );
  AND2X1 U357 ( .A(n367), .B(n368), .Z(n268) );
  NAND3X1 U358 ( .A(n369), .B(n370), .C(n371), .Z(n367) );
  NOR2X1 U359 ( .A(n372), .B(n206), .Z(n371) );
  NAND2X1 U360 ( .A(n37), .B(n46), .Z(n206) );
  NOR2X1 U361 ( .A(n112), .B(n85), .Z(n132) );
  NAND2X1 U362 ( .A(n60), .B(n56), .Z(n112) );
  NOR2X1 U363 ( .A(n75), .B(n119), .Z(n372) );
  NAND3X1 U364 ( .A(n91), .B(n19), .C(n80), .Z(n373) );
  NAND3X1 U365 ( .A(n18), .B(n21), .C(\r129/A[3] ), .Z(n374) );
  NAND3X1 U366 ( .A(n353), .B(\counter[0] ), .C(n96), .Z(n375) );
  NAND3X1 U367 ( .A(n13), .B(n12), .C(n15), .Z(n337) );
  NOR2X1 U368 ( .A(n14), .B(\r129/A[2] ), .Z(n353) );
  NAND2X1 U369 ( .A(n43), .B(n261), .Z(n370) );
  NAND3X1 U370 ( .A(n69), .B(n94), .C(n376), .Z(n261) );
  AND2X1 U371 ( .A(n16), .B(n265), .Z(n376) );
  NAND3X1 U372 ( .A(\r129/A[4] ), .B(n13), .C(\r129/A[7] ), .Z(n377) );
  NAND3X1 U373 ( .A(\r129/A[1] ), .B(\counter[0] ), .C(n256), .Z(n378) );
  NOR2X1 U374 ( .A(\r129/A[9] ), .B(\r129/A[8] ), .Z(n256) );
  NAND2X1 U375 ( .A(n58), .B(n224), .Z(n369) );
  NAND3X1 U376 ( .A(n257), .B(n309), .C(n379), .Z(n224) );
  NOR2X1 U377 ( .A(\r129/A[7] ), .B(n339), .Z(n379) );
  NAND3X1 U378 ( .A(n15), .B(n19), .C(\r129/A[6] ), .Z(n339) );
  NOR2X1 U379 ( .A(n316), .B(\r129/A[8] ), .Z(n309) );
  NAND2X1 U380 ( .A(n41), .B(\r129/A[9] ), .Z(n365) );
  NAND3X1 U381 ( .A(n42), .B(n114), .C(n194), .Z(n368) );
  NOR2X1 U382 ( .A(scl_read), .B(n22), .Z(n194) );
  NAND3X1 U383 ( .A(n23), .B(n24), .C(n20), .Z(n114) );
  NAND3X1 U384 ( .A(n119), .B(n213), .C(n251), .Z(n205) );
  NOR2X1 U385 ( .A(n43), .B(n58), .Z(n251) );
  NAND3X1 U386 ( .A(n20), .B(n24), .C(n60), .Z(n294) );
  NOR2X1 U387 ( .A(n225), .B(n45), .Z(n249) );
  NAND3X1 U388 ( .A(n20), .B(n23), .C(n56), .Z(n223) );
  NOR2X1 U389 ( .A(n105), .B(n56), .Z(n225) );
  OR2X1 U390 ( .A(n105), .B(n24), .Z(n213) );
  NAND2X1 U391 ( .A(n60), .B(n85), .Z(n105) );
  NAND3X1 U392 ( .A(n23), .B(n24), .C(n85), .Z(n119) );
  NAND2X1 U393 ( .A(n120), .B(n380), .Z(n417) );
  NAND2X1 U394 ( .A(ack_failed), .B(n381), .Z(n380) );
  NAND2X1 U395 ( .A(n118), .B(n382), .Z(n381) );
  NAND2X1 U396 ( .A(n71), .B(n318), .Z(n382) );
  NOR2X1 U397 ( .A(n383), .B(n384), .Z(n212) );
  NAND3X1 U398 ( .A(n265), .B(\r129/A[7] ), .C(n257), .Z(n384) );
  NOR2X1 U399 ( .A(\r129/A[3] ), .B(\r129/A[1] ), .Z(n257) );
  NOR2X1 U400 ( .A(n17), .B(\r129/A[5] ), .Z(n265) );
  NAND3X1 U401 ( .A(n15), .B(n13), .C(n385), .Z(n383) );
  NOR2X1 U402 ( .A(\counter[0] ), .B(n72), .Z(n385) );
  NAND3X1 U403 ( .A(n118), .B(n73), .C(\r130/LT_LE ), .Z(n120) );
  NAND3X1 U404 ( .A(\r129/A[1] ), .B(n343), .C(n386), .Z(n318) );
  AND2X1 U405 ( .A(n335), .B(n362), .Z(n386) );
  NOR2X1 U406 ( .A(n19), .B(n21), .Z(n362) );
  NOR2X1 U407 ( .A(n16), .B(n316), .Z(n335) );
  NAND3X1 U408 ( .A(\r129/A[2] ), .B(\counter[0] ), .C(\r129/A[5] ), .Z(n316)
         );
  NOR2X1 U409 ( .A(n13), .B(n324), .Z(n343) );
  NAND2X1 U410 ( .A(\r129/A[4] ), .B(n12), .Z(n324) );
  NOR2X1 U411 ( .A(n109), .B(n60), .Z(n118) );
  NAND2X1 U412 ( .A(n85), .B(n56), .Z(n109) );
  I2C_state_controller i2c_state ( .clock(clock), .reset(reset), .req_next(n55), .ack_failed(ack_failed), .dev_address_s(device_address), .reg_address_s(
        reg_address), .data_s(data_in), .send_next_state(next_state_s), 
        .send_byte_data(send_byte_data) );
  DFFQQBX1 \state_reg[1]  ( .D(next_state[1]), .CLK(clock), .Q(n60), .QB(n23)
         );
  DFFQQBX1 \state_reg[2]  ( .D(next_state[2]), .CLK(clock), .Q(n56), .QB(n24)
         );
  DFFQQBX1 \state_reg[0]  ( .D(next_state[0]), .CLK(clock), .Q(n85), .QB(n20)
         );
  DFFQQBX1 \counter_reg[9]  ( .D(n416), .CLK(clock), .Q(\r129/A[9] ), .QB(n19)
         );
  DFFQQBX1 \counter_reg[8]  ( .D(n406), .CLK(clock), .Q(\r129/A[8] ), .QB(n21)
         );
  DFFQQBX1 \counter_reg[7]  ( .D(n407), .CLK(clock), .Q(\r129/A[7] ), .QB(n12)
         );
  DFFQQBX1 \counter_reg[6]  ( .D(n408), .CLK(clock), .Q(\r129/A[6] ), .QB(n13)
         );
  DFFQQBX1 \counter_reg[5]  ( .D(n409), .CLK(clock), .Q(\r129/A[5] ), .QB(n14)
         );
  DFFQQBX1 \counter_reg[4]  ( .D(n410), .CLK(clock), .Q(\r129/A[4] ), .QB(n15)
         );
  DFFQQBX1 \counter_reg[3]  ( .D(n411), .CLK(clock), .Q(\r129/A[3] ), .QB(n16)
         );
  DFFQQBX1 \counter_reg[2]  ( .D(n412), .CLK(clock), .Q(\r129/A[2] ), .QB(n17)
         );
  DFFQQBX1 \counter_reg[1]  ( .D(n413), .CLK(clock), .Q(\r129/A[1] ), .QB(n18)
         );
  DFFQQBX1 scl_out_reg ( .D(n415), .CLK(clock), .Q(scl_out), .QB(n22) );
  INVX2 U3 ( .A(n295), .Z(n67) );
  INVX2 U4 ( .A(n250), .Z(n70) );
  INVX2 U5 ( .A(n249), .Z(n43) );
  INVX2 U6 ( .A(n172), .Z(n47) );
  INVX4 U7 ( .A(n198), .Z(n65) );
  INVX2 U8 ( .A(n200), .Z(n66) );
  INVX2 U9 ( .A(n197), .Z(n64) );
  INVX2 U10 ( .A(n368), .Z(n41) );
  INVX2 U11 ( .A(n224), .Z(n63) );
  INVX2 U12 ( .A(n132), .Z(n46) );
  INVX2 U13 ( .A(n118), .Z(n37) );
  INVX2 U14 ( .A(n236), .Z(n74) );
  INVX2 U15 ( .A(n234), .Z(n84) );
  INVX2 U16 ( .A(n240), .Z(n82) );
  INVX2 U17 ( .A(n308), .Z(n89) );
  INVX2 U18 ( .A(n204), .Z(n40) );
  INVX2 U19 ( .A(n288), .Z(n35) );
  INVX2 U20 ( .A(n333), .Z(n90) );
  INVX2 U21 ( .A(n188), .Z(n36) );
  INVX2 U22 ( .A(n205), .Z(n42) );
  INVX2 U23 ( .A(n318), .Z(n73) );
  INVX2 U24 ( .A(n257), .Z(n92) );
  INVX2 U25 ( .A(n119), .Z(n57) );
  INVX2 U26 ( .A(n223), .Z(n45) );
  INVX2 U27 ( .A(n294), .Z(n58) );
  INVX2 U28 ( .A(n261), .Z(n68) );
  INVX2 U29 ( .A(n337), .Z(n96) );
  INVX4 U30 ( .A(n5), .Z(n11) );
  INVX2 U31 ( .A(n310), .Z(n83) );
  INVX4 U32 ( .A(n342), .Z(n76) );
  INVX2 U33 ( .A(n244), .Z(n78) );
  INVX2 U34 ( .A(n241), .Z(n81) );
  INVX2 U35 ( .A(n362), .Z(n72) );
  INVX4 U36 ( .A(n354), .Z(n95) );
  INVX2 U37 ( .A(n212), .Z(n71) );
  INVX2 U38 ( .A(n194), .Z(n62) );
  INVX4 U39 ( .A(n26), .Z(N496) );
  INVX2 U40 ( .A(sample_counter[0]), .Z(N494) );
  INVX4 U41 ( .A(n378), .Z(n69) );
  INVX4 U42 ( .A(n355), .Z(n88) );
  INVX4 U43 ( .A(n360), .Z(n87) );
  INVX2 U44 ( .A(n260), .Z(n44) );
  INVX2 U45 ( .A(n218), .Z(n39) );
  INVX2 U46 ( .A(n166), .Z(n48) );
  INVX2 U47 ( .A(n160), .Z(n49) );
  INVX2 U48 ( .A(n154), .Z(n50) );
  INVX2 U49 ( .A(n148), .Z(n51) );
  INVX2 U50 ( .A(n142), .Z(n52) );
  INVX2 U51 ( .A(n136), .Z(n53) );
  INVX2 U52 ( .A(n127), .Z(n54) );
  INVX2 U53 ( .A(n117), .Z(n38) );
  INVX2 U54 ( .A(\counter[0] ), .Z(N139) );
  INVX4 U55 ( .A(n98), .Z(n55) );
  INVX4 U56 ( .A(n3), .Z(n10) );
  INVX4 U57 ( .A(n374), .Z(n80) );
  INVX4 U58 ( .A(n377), .Z(n94) );
  INVX4 U59 ( .A(n361), .Z(n93) );
  INVX4 U60 ( .A(n356), .Z(n86) );
  INVX4 U61 ( .A(n340), .Z(n77) );
  INVX4 U62 ( .A(n375), .Z(n91) );
  INVX4 U63 ( .A(n325), .Z(n79) );
  INVX4 U64 ( .A(n373), .Z(n75) );
  INVX4 U65 ( .A(n113), .Z(n34) );
  INVX2 U66 ( .A(n114), .Z(n59) );
  INVX2 U67 ( .A(sample_counter[3]), .Z(n30) );
  INVX2 U68 ( .A(reset), .Z(n1) );
  XOR2X1 U69 ( .A(\r129/A[1] ), .B(\counter[0] ), .Z(N140) );
  NAND2X1 U70 ( .A(\r129/A[1] ), .B(\counter[0] ), .Z(n2) );
  XOR2X1 U71 ( .A(n17), .B(n2), .Z(N141) );
  NAND3X1 U72 ( .A(\r129/A[1] ), .B(\counter[0] ), .C(\r129/A[2] ), .Z(n3) );
  XOR2X1 U73 ( .A(\r129/A[3] ), .B(n10), .Z(N142) );
  AND2X1 U74 ( .A(n10), .B(\r129/A[3] ), .Z(n4) );
  XOR2X1 U75 ( .A(\r129/A[4] ), .B(n4), .Z(N143) );
  NAND3X1 U76 ( .A(\r129/A[3] ), .B(n10), .C(\r129/A[4] ), .Z(n5) );
  XOR2X1 U77 ( .A(\r129/A[5] ), .B(n11), .Z(N144) );
  AND2X1 U78 ( .A(n11), .B(\r129/A[5] ), .Z(n6) );
  XOR2X1 U79 ( .A(\r129/A[6] ), .B(n6), .Z(N145) );
  NAND3X1 U80 ( .A(\r129/A[5] ), .B(n11), .C(\r129/A[6] ), .Z(n7) );
  XOR2X1 U81 ( .A(n12), .B(n7), .Z(N146) );
  NOR2X1 U82 ( .A(n12), .B(n7), .Z(n8) );
  XOR2X1 U83 ( .A(\r129/A[8] ), .B(n8), .Z(N147) );
  AND2X1 U84 ( .A(n8), .B(\r129/A[8] ), .Z(n9) );
  XOR2X1 U85 ( .A(\r129/A[9] ), .B(n9), .Z(N148) );
  XOR2X1 U86 ( .A(sample_counter[1]), .B(sample_counter[0]), .Z(N495) );
  NAND2X1 U87 ( .A(sample_counter[1]), .B(sample_counter[0]), .Z(n25) );
  XOR2X1 U88 ( .A(sample_counter[2]), .B(n25), .Z(n26) );
  NAND3X1 U89 ( .A(sample_counter[1]), .B(sample_counter[0]), .C(
        sample_counter[2]), .Z(n27) );
  XOR2X1 U413 ( .A(n30), .B(n27), .Z(N497) );
  NOR2X1 U414 ( .A(n30), .B(n27), .Z(n28) );
  XOR2X1 U415 ( .A(sample_counter[4]), .B(n28), .Z(N498) );
  AND2X1 U416 ( .A(n28), .B(sample_counter[4]), .Z(n29) );
  XOR2X1 U417 ( .A(sample_counter[5]), .B(n29), .Z(N499) );
  NAND3X1 U418 ( .A(sample_counter[4]), .B(sample_counter[3]), .C(
        sample_counter[0]), .Z(n32) );
  NAND2X1 U419 ( .A(sample_counter[2]), .B(sample_counter[1]), .Z(n31) );
  NOR2X1 U420 ( .A(n32), .B(n31), .Z(n33) );
  OR2X1 U421 ( .A(sample_counter[5]), .B(n33), .Z(\r130/LT_LE ) );
endmodule

module synth_top_top(reset_io, clk_io, data_in_io, data_out_io, addr_out_io, 
        core_to_mem_enable_io, sda_io, scl_io, pwm0_io, pwm1_io, pwm2_io, 
		pwm3_io, pwm4_io, pwm5_io, pwm6_io, pwm7_io);
  input [15:0] data_in_io;
  output [15:0] data_out_io;
  output [9:0] addr_out_io;
  inout sda_io, scl_io;
  input reset_io, clk_io, sda_read_io, scl_read_io;
  output core_to_mem_enable_io, pwm0_io, pwm1_io, pwm2_io, 
						pwm3_io, pwm4_io, pwm5_io, pwm6_io, pwm7_io;

wire [15:0] data_in_pad;
wire [15:0] data_out_pad;
wire [9:0] addr_out_pad;
wire reset_pad, clk_pad, core_to_mem_enable_pad, 
		sda_out, scl_out, sda_read, scl_read, 
		pwm0_pad, pwm1_pad, pwm2_pad, pwm3_pad, 
		pwm4_pad, pwm5_pad, pwm6_pad, pwm7_pad;

  pad_vdd pad_vdd ();
  pad_gnd pad_gnd ();
  pad_corner corner0 ();     
  pad_corner corner1 ();
  pad_corner corner2 ();
  pad_corner corner3 ();
  
  pad_bidirhe_buffered pad_sda(.out(sda_out), pad(sda_io), in(sda_read));
  pad_bidirhe_buffered pad_scl(.out(scl_out), pad(scl_io), in(scl_read));

	pad_in pad_clk   (.pad(clk_io),    .DataIn(clk_pad));
	pad_in pad_reset (.pad(reset_io),  .DataIn(reset_pad));

  pad_in pad_data_in0  (.pad(data_in_io[0]),  .DataIn(data_in_pad[0]));
  pad_in pad_data_in1  (.pad(data_in_io[1]),  .DataIn(data_in_pad[1]));
  pad_in pad_data_in2  (.pad(data_in_io[2]),  .DataIn(data_in_pad[2]));
  pad_in pad_data_in3  (.pad(data_in_io[3]),  .DataIn(data_in_pad[3]));
  pad_in pad_data_in4  (.pad(data_in_io[4]),  .DataIn(data_in_pad[4]));
  pad_in pad_data_in5  (.pad(data_in_io[5]),  .DataIn(data_in_pad[5]));
  pad_in pad_data_in6  (.pad(data_in_io[6]),  .DataIn(data_in_pad[6]));
  pad_in pad_data_in7  (.pad(data_in_io[7]),  .DataIn(data_in_pad[7]));
  pad_in pad_data_in8  (.pad(data_in_io[8]),  .DataIn(data_in_pad[8]));
  pad_in pad_data_in9  (.pad(data_in_io[9]),  .DataIn(data_in_pad[9]));
  pad_in pad_data_in10 (.pad(data_in_io[10]), .DataIn(data_in_pad[10]));
  pad_in pad_data_in11 (.pad(data_in_io[11]), .DataIn(data_in_pad[11]));
  pad_in pad_data_in12 (.pad(data_in_io[12]), .DataIn(data_in_pad[12]));
  pad_in pad_data_in13 (.pad(data_in_io[13]), .DataIn(data_in_pad[13]));
  pad_in pad_data_in14 (.pad(data_in_io[14]), .DataIn(data_in_pad[14]));
  pad_in pad_data_in15 (.pad(data_in_io[15]), .DataIn(data_in_pad[15]));

  pad_out_buffered pad_core_to_mem_en  (.pad(core_to_mem_enable_io),  .out(core_to_mem_enable_pad));

  pad_out_buffered pad_data_out0  (.pad(data_out_io[0]),  .out(data_out_pad[0]));
  pad_out_buffered pad_data_out1  (.pad(data_out_io[1]),  .out(data_out_pad[1]));
  pad_out_buffered pad_data_out2  (.pad(data_out_io[2]),  .out(data_out_pad[2]));
  pad_out_buffered pad_data_out3  (.pad(data_out_io[3]),  .out(data_out_pad[3]));
  pad_out_buffered pad_data_out4  (.pad(data_out_io[4]),  .out(data_out_pad[4]));
  pad_out_buffered pad_data_out5  (.pad(data_out_io[5]),  .out(data_out_pad[5]));
  pad_out_buffered pad_data_out6  (.pad(data_out_io[6]),  .out(data_out_pad[6]));
  pad_out_buffered pad_data_out7  (.pad(data_out_io[7]),  .out(data_out_pad[7]));
  pad_out_buffered pad_data_out8  (.pad(data_out_io[8]),  .out(data_out_pad[8]));
  pad_out_buffered pad_data_out9  (.pad(data_out_io[9]),  .out(data_out_pad[9]));
  pad_out_buffered pad_data_out10 (.pad(data_out_io[10]), .out(data_out_pad[10]));
  pad_out_buffered pad_data_out11 (.pad(data_out_io[11]), .out(data_out_pad[11]));
  pad_out_buffered pad_data_out12 (.pad(data_out_io[12]), .out(data_out_pad[12]));
  pad_out_buffered pad_data_out13 (.pad(data_out_io[13]), .out(data_out_pad[13]));
  pad_out_buffered pad_data_out14 (.pad(data_out_io[14]), .out(data_out_pad[14]));
  pad_out_buffered pad_data_out15 (.pad(data_out_io[15]), .out(data_out_pad[15]));

  pad_out_buffered pad_addr_out0  (.pad(addr_out_io[0]),  .out(addr_out_pad[0]));
  pad_out_buffered pad_addr_out1  (.pad(addr_out_io[1]),  .out(addr_out_pad[1]));
  pad_out_buffered pad_addr_out2  (.pad(addr_out_io[2]),  .out(addr_out_pad[2]));
  pad_out_buffered pad_addr_out3  (.pad(addr_out_io[3]),  .out(addr_out_pad[3]));
  pad_out_buffered pad_addr_out4  (.pad(addr_out_io[4]),  .out(addr_out_pad[4]));
  pad_out_buffered pad_addr_out5  (.pad(addr_out_io[5]),  .out(addr_out_pad[5]));
  pad_out_buffered pad_addr_out6  (.pad(addr_out_io[6]),  .out(addr_out_pad[6]));
  pad_out_buffered pad_addr_out7  (.pad(addr_out_io[7]),  .out(addr_out_pad[7]));
  pad_out_buffered pad_addr_out8  (.pad(addr_out_io[8]),  .out(addr_out_pad[8]));
  pad_out_buffered pad_addr_out9  (.pad(addr_out_io[9]),  .out(addr_out_pad[9]));

  pad_out_buffered pad_pwm0  (.pad(pwm0_io),  .out(pwm0_pad));
  pad_out_buffered pad_pwm1  (.pad(pwm1_io),  .out(pwm1_pad));
  pad_out_buffered pad_pwm2  (.pad(pwm2_io),  .out(pwm2_pad));
  pad_out_buffered pad_pwm3  (.pad(pwm3_io),  .out(pwm3_pad));
  pad_out_buffered pad_pwm4  (.pad(pwm4_io),  .out(pwm4_pad));
  pad_out_buffered pad_pwm5  (.pad(pwm5_io),  .out(pwm5_pad));
  pad_out_buffered pad_pwm6  (.pad(pwm6_io),  .out(pwm6_pad));
  pad_out_buffered pad_pwm7  (.pad(pwm7_io),  .out(pwm7_pad));
  
  synth_top synthesizer( 	.reset_io  	 			(reset_pad),
							.clk_io		 			(clk_pad),
							.data_in_io	 			(data_in_pad),
							.data_out_io 			(data_out_pad),
							.addr_out_io 			(addr_out_pad),
							.core_to_mem_enable_io	(core_to_mem_enable_pad),
							.sda_read_io			(sda_read),
							.scl_read_io			(scl_read),
							.sda_out_io				(sda_out),
							.scl_out_io				(scl_out),
							.pwm0_io				(pwm0_pad),
							.pwm1_io				(pwm1_pad),
							.pwm2_io				(pwm2_pad),
							.pwm3_io				(pwm3_pad),
							.pwm4_io				(pwm4_pad),
							.pwm5_io				(pwm5_pad),
							.pwm6_io				(pwm6_pad),
							.pwm7_io				(pw7_pad));
endmodule

module synth_top ( reset_io, clk_io, data_in_io, data_out_io, addr_out_io, 
        core_to_mem_enable_io, sda_read_io, scl_read_io, sda_out_io, 
        scl_out_io, pwm0_io, pwm1_io, pwm2_io, pwm3_io, pwm4_io, pwm5_io, 
        pwm6_io, pwm7_io );
  input [15:0] data_in_io;
  output [15:0] data_out_io;
  output [9:0] addr_out_io;
  input reset_io, clk_io, sda_read_io, scl_read_io;
  output core_to_mem_enable_io, sda_out_io, scl_out_io, pwm0_io, pwm1_io,
         pwm2_io, pwm3_io, pwm4_io, pwm5_io, pwm6_io, pwm7_io;
  wire   net19438;
  wire   [1:0] i2c_sts_wire;
  wire   [7:0] i2c_to_core_data_wire;
  wire   [7:0] core_to_i2c_data_wire;
  wire   [7:0] i2c_to_core_reg_addr_wire;
  wire   [8:0] i2c_addr_wire;
  wire   [15:0] core_to_r0;
  wire   [15:0] core_to_r1;
  wire   [15:0] core_to_r2;
  wire   [15:0] core_to_r3;
  wire   [15:0] core_to_r4;
  wire   [15:0] core_to_r5;
  wire   [15:0] core_to_r6;
  wire   [15:0] core_to_r7;

  Core c1 ( .clk(clk_io), .rst(reset_io), .mem_to_core_data(data_in_io), 
        .core_to_mem_data(data_out_io), .core_to_mem_address(addr_out_io), 
        .core_to_mem_write_enable(core_to_mem_enable_io), .i2c_wr_en(net19438), 
        .i2c_sts(i2c_sts_wire), .i2c_to_core_data(i2c_to_core_data_wire), 
        .core_to_i2c_data(core_to_i2c_data_wire), .i2c_reg_addr(
        i2c_to_core_reg_addr_wire), .i2c_addr(i2c_addr_wire), .pwm_reg0(
        core_to_r0), .pwm_reg1(core_to_r1), .pwm_reg2(core_to_r2), .pwm_reg3(
        core_to_r3), .pwm_reg4(core_to_r4), .pwm_reg5(core_to_r5), .pwm_reg6(
        core_to_r6), .pwm_reg7(core_to_r7) );
  pwm_0 p0 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r0), .pwm_out(
        pwm0_io) );
  pwm_7 p1 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r1), .pwm_out(
        pwm1_io) );
  pwm_6 p2 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r2), .pwm_out(
        pwm2_io) );
  pwm_5 p3 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r3), .pwm_out(
        pwm3_io) );
  pwm_4 p4 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r4), .pwm_out(
        pwm4_io) );
  pwm_3 p5 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r5), .pwm_out(
        pwm5_io) );
  pwm_2 p6 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r6), .pwm_out(
        pwm6_io) );
  pwm_1 p7 ( .clk(clk_io), .reset(reset_io), .pwm_reg(core_to_r7), .pwm_out(
        pwm7_io) );
  I2C i2c_1 ( .clock(clk_io), .reset(reset_io), .device_address(i2c_addr_wire), 
        .reg_address(i2c_to_core_reg_addr_wire), .data_in(
        core_to_i2c_data_wire), .sda_read(sda_read_io), .scl_read(scl_read_io), 
        .sda_out(sda_out_io), .scl_out(scl_out_io), .data_out(
        i2c_to_core_data_wire), .i2c_status(i2c_sts_wire) );
  TIE0 U1 ( .Z(net19438) );
endmodule

