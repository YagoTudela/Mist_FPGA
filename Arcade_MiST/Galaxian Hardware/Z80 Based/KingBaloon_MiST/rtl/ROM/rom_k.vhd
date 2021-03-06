library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rom_k is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rom_k is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"38",X"7C",X"C2",X"82",X"86",X"7C",X"38",X"00",X"02",X"02",X"FE",X"FE",X"42",X"02",X"00",X"00",
		X"62",X"F2",X"BA",X"9A",X"9E",X"CE",X"46",X"00",X"8C",X"DE",X"F2",X"B2",X"92",X"86",X"04",X"00",
		X"08",X"FE",X"FE",X"C8",X"68",X"38",X"18",X"00",X"1C",X"BE",X"A2",X"A2",X"A2",X"E6",X"E4",X"00",
		X"0C",X"9E",X"92",X"92",X"D2",X"7E",X"3C",X"00",X"C0",X"E0",X"B0",X"9E",X"8E",X"C0",X"C0",X"00",
		X"0C",X"6E",X"9A",X"9A",X"B2",X"F2",X"6C",X"00",X"78",X"FC",X"96",X"92",X"92",X"F2",X"60",X"00",
		X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",
		X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",
		X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",X"80",X"90",X"90",X"90",X"90",X"FE",X"FE",X"00",
		X"9E",X"9E",X"92",X"82",X"C6",X"7C",X"38",X"00",X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",X"00",
		X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",X"FC",X"FE",X"02",X"02",X"02",X"06",X"04",X"00",
		X"82",X"C6",X"6E",X"3C",X"18",X"FE",X"FE",X"00",X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",
		X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",
		X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",
		X"7A",X"FC",X"8E",X"8A",X"82",X"FE",X"7C",X"00",X"72",X"F6",X"9E",X"8C",X"88",X"FE",X"FE",X"00",
		X"0C",X"5E",X"D2",X"92",X"92",X"F6",X"64",X"00",X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",
		X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",X"00",
		X"FE",X"FE",X"1C",X"38",X"1C",X"FE",X"FE",X"00",X"C6",X"EE",X"7C",X"38",X"7C",X"EE",X"C6",X"00",
		X"E0",X"F0",X"1E",X"1E",X"F0",X"E0",X"00",X"00",X"C2",X"E2",X"F2",X"BA",X"9E",X"8E",X"86",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"01",X"07",X"0F",X"1F",X"28",X"28",X"00",X"00",X"C0",X"80",X"80",X"C0",X"80",X"80",
		X"EA",X"22",X"22",X"1F",X"0F",X"07",X"01",X"00",X"FF",X"81",X"83",X"C0",X"80",X"80",X"C0",X"00",
		X"00",X"00",X"01",X"07",X"0F",X"11",X"2E",X"2E",X"F1",X"3F",X"20",X"1F",X"0F",X"07",X"01",X"00",
		X"00",X"00",X"01",X"00",X"04",X"03",X"01",X"07",X"00",X"C0",X"FE",X"06",X"7E",X"0E",X"5E",X"1E",
		X"01",X"03",X"04",X"00",X"01",X"00",X"00",X"00",X"5E",X"0E",X"7E",X"06",X"FE",X"C0",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"FF",
		X"00",X"00",X"01",X"07",X"1F",X"FF",X"FF",X"FF",X"00",X"E0",X"F0",X"F8",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"FF",X"FF",X"F3",X"E3",X"00",X"00",X"00",X"00",X"F0",X"F0",X"F0",X"F8",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"1F",X"07",X"01",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"F8",X"F0",X"E0",X"00",X"00",
		X"F3",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"F8",X"F8",X"F8",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"F8",X"F8",X"F8",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"07",X"07",X"07",X"FF",X"FF",X"FF",X"FF",
		X"F8",X"F0",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"27",X"07",X"17",X"07",X"03",X"13",X"03",X"23",X"00",X"C0",X"E0",X"F0",X"38",X"02",X"00",X"00",
		X"00",X"00",X"03",X"01",X"00",X"11",X"0C",X"04",X"00",X"00",X"FD",X"8D",X"1D",X"FD",X"3D",X"78",
		X"03",X"03",X"0F",X"8F",X"C7",X"E7",X"FF",X"FF",X"1C",X"04",X"0C",X"11",X"00",X"01",X"03",X"00",
		X"78",X"78",X"3D",X"FD",X"1D",X"8D",X"FD",X"00",X"E3",X"FF",X"FF",X"E7",X"C7",X"8F",X"0F",X"03",
		X"00",X"01",X"03",X"00",X"00",X"11",X"0C",X"04",X"00",X"81",X"FD",X"0D",X"1D",X"FD",X"3D",X"78",
		X"03",X"0F",X"8F",X"C7",X"E7",X"FF",X"FF",X"E3",X"1C",X"04",X"0C",X"11",X"00",X"00",X"03",X"01",
		X"78",X"78",X"3D",X"FD",X"1D",X"0D",X"FD",X"81",X"E3",X"E3",X"FF",X"FF",X"E7",X"C7",X"8F",X"0F",
		X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",
		X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",
		X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",
		X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",
		X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3F",X"EF",X"C7",X"FF",X"0B",X"03",X"03",X"03",X"07",X"3F",X"EF",X"C7",X"FB",X"0B",X"03",X"03",
		X"07",X"07",X"3F",X"EF",X"C3",X"FB",X"0B",X"03",X"07",X"07",X"07",X"3F",X"EB",X"C3",X"FB",X"0B",
		X"07",X"07",X"07",X"07",X"03",X"C3",X"FB",X"CB",X"07",X"07",X"07",X"07",X"03",X"03",X"C3",X"FB",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"C3",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",
		X"11",X"00",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",
		X"07",X"07",X"07",X"07",X"CB",X"FB",X"C3",X"03",X"07",X"07",X"07",X"07",X"03",X"CB",X"FB",X"C3",
		X"07",X"07",X"07",X"07",X"03",X"03",X"CB",X"FB",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"CB",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"0B",X"CF",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"FF",X"CF",X"07",X"07",X"03",X"03",X"03",X"03",X"C7",X"FF",X"C7",X"07",X"03",X"03",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",
		X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"C7",X"07",X"07",X"07",X"03",X"03",X"03",X"03",X"FF",X"C7",X"07",X"07",X"03",X"03",X"03",X"03",
		X"FF",X"C7",X"EF",X"3F",X"03",X"03",X"03",X"03",X"0F",X"FF",X"C7",X"EF",X"3B",X"03",X"03",X"03",
		X"07",X"0F",X"FF",X"C7",X"EB",X"3B",X"03",X"03",X"07",X"07",X"0F",X"FF",X"C3",X"EB",X"3B",X"03",
		X"03",X"28",X"02",X"48",X"00",X"20",X"44",X"40",X"00",X"92",X"04",X"21",X"02",X"02",X"20",X"04",
		X"00",X"22",X"00",X"20",X"08",X"00",X"44",X"09",X"00",X"14",X"00",X"02",X"00",X"64",X"02",X"10",
		X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"07",X"07",X"07",X"C7",X"FB",X"CB",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"07",X"07",X"CF",X"FF",X"C3",X"03",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"3F",X"7F",X"3F",X"03",X"3B",X"7B",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"17",X"17",X"37",X"33",X"13",X"13",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"7F",X"3F",X"07",X"3B",X"7B",X"3B",X"03",
		X"00",X"00",X"00",X"03",X"07",X"0F",X"1F",X"1F",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C7",X"C7",
		X"1F",X"0F",X"07",X"03",X"00",X"00",X"00",X"00",X"C7",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"07",X"0F",X"1F",X"3F",X"00",X"00",X"00",X"00",X"00",X"80",X"8E",X"8E",
		X"3F",X"3F",X"3F",X"1F",X"07",X"00",X"00",X"00",X"8E",X"80",X"80",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"0E",X"1F",X"3F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"1C",X"1C",
		X"7F",X"3F",X"1F",X"0E",X"00",X"00",X"00",X"00",X"1C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"07",X"1F",X"3F",X"3F",X"3F",X"3F",X"00",X"00",X"00",X"80",X"80",X"80",X"8E",X"8E",
		X"1F",X"0F",X"07",X"00",X"00",X"00",X"00",X"00",X"8E",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"02",X"0E",X"01",X"02",X"00",X"00",X"00",X"00",X"50",X"20",X"40",X"B0",
		X"07",X"0B",X"02",X"0A",X"00",X"00",X"00",X"00",X"D8",X"90",X"A0",X"50",X"20",X"00",X"00",X"00",
		X"00",X"02",X"01",X"05",X"13",X"42",X"35",X"12",X"00",X"00",X"20",X"44",X"14",X"88",X"24",X"D8",
		X"24",X"03",X"05",X"02",X"0A",X"04",X"00",X"00",X"42",X"E4",X"98",X"B0",X"08",X"D4",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"01",X"1F",X"C3",X"47",X"C7",X"80",X"C3",X"A3",X"B1",X"B9",X"BF",X"1F",X"18",
		X"47",X"C3",X"1F",X"01",X"00",X"00",X"00",X"00",X"1F",X"BF",X"B9",X"B1",X"A3",X"C3",X"80",X"00",
		X"00",X"18",X"3F",X"01",X"1F",X"C3",X"47",X"C7",X"00",X"03",X"A3",X"B1",X"B9",X"BF",X"1F",X"18",
		X"47",X"C3",X"1F",X"01",X"3F",X"18",X"00",X"00",X"1F",X"BF",X"B9",X"B1",X"A3",X"03",X"00",X"00",
		X"00",X"00",X"00",X"01",X"1F",X"C3",X"47",X"C7",X"83",X"C3",X"A1",X"B1",X"BB",X"BF",X"1E",X"18",
		X"47",X"C3",X"1F",X"03",X"FF",X"00",X"00",X"00",X"1E",X"BF",X"BB",X"B1",X"A1",X"03",X"03",X"00",
		X"00",X"30",X"7F",X"01",X"1F",X"C3",X"47",X"C7",X"00",X"03",X"A3",X"B1",X"B9",X"BF",X"1F",X"18",
		X"47",X"C3",X"1F",X"03",X"FF",X"00",X"00",X"00",X"1F",X"BF",X"B9",X"B1",X"A3",X"03",X"00",X"00",
		X"3C",X"42",X"81",X"A5",X"A5",X"99",X"42",X"3C",X"C0",X"C0",X"C0",X"C0",X"FF",X"FF",X"00",X"00",
		X"DB",X"DB",X"DF",X"1F",X"00",X"00",X"7F",X"FF",X"FF",X"00",X"00",X"7F",X"FF",X"DB",X"DB",X"DB",
		X"FF",X"C0",X"C0",X"FF",X"FF",X"C0",X"C0",X"FF",X"C3",X"C3",X"C3",X"FF",X"7E",X"00",X"00",X"7F",
		X"C3",X"FF",X"7E",X"00",X"00",X"C3",X"C3",X"C3",X"00",X"00",X"00",X"7E",X"FF",X"C3",X"C3",X"C3",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"0F",X"0F",X"1F",X"1F",X"1F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"1F",X"0F",X"0F",X"07",X"03",X"00",X"00",
		X"F8",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"00",X"00",X"00",X"00",X"00",X"1F",X"1F",X"1F",
		X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"F8",X"00",X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"03",X"0F",X"1F",X"3F",X"7F",X"7F",X"00",X"00",X"80",X"00",X"00",X"80",X"00",X"00",
		X"7F",X"7F",X"7F",X"3F",X"1F",X"0F",X"03",X"00",X"80",X"00",X"00",X"83",X"07",X"00",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"08",X"08",X"FF",X"08",X"08",X"08",X"08",X"00",X"00",X"00",X"00",X"00",X"06",X"06",X"00",
		X"00",X"00",X"0E",X"3F",X"7F",X"7F",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",
		X"FF",X"FF",X"7F",X"7F",X"3F",X"0E",X"00",X"00",X"0F",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"07",X"0E",X"18",X"20",X"07",X"00",X"00",X"C0",X"80",X"00",X"00",X"00",X"80",
		X"FF",X"07",X"20",X"18",X"0E",X"07",X"01",X"00",X"FF",X"81",X"03",X"00",X"00",X"80",X"C0",X"00",
		X"38",X"7C",X"C2",X"82",X"86",X"7C",X"38",X"00",X"02",X"02",X"FE",X"FE",X"42",X"02",X"00",X"00",
		X"62",X"F2",X"BA",X"9A",X"9E",X"CE",X"46",X"00",X"8C",X"DE",X"F2",X"B2",X"92",X"86",X"04",X"00",
		X"08",X"FE",X"FE",X"C8",X"68",X"38",X"18",X"00",X"1C",X"BE",X"A2",X"A2",X"A2",X"E6",X"E4",X"00",
		X"0C",X"9E",X"92",X"92",X"D2",X"7E",X"3C",X"00",X"C0",X"E0",X"B0",X"9E",X"8E",X"C0",X"C0",X"00",
		X"0C",X"6E",X"9A",X"9A",X"B2",X"F2",X"6C",X"00",X"78",X"FC",X"96",X"92",X"92",X"F2",X"60",X"00",
		X"3E",X"7E",X"C8",X"88",X"C8",X"7E",X"3E",X"00",X"6C",X"FE",X"92",X"92",X"92",X"FE",X"FE",X"00",
		X"44",X"C6",X"82",X"82",X"C6",X"7C",X"38",X"00",X"38",X"7C",X"C6",X"82",X"82",X"FE",X"FE",X"00",
		X"82",X"92",X"92",X"92",X"FE",X"FE",X"00",X"00",X"80",X"90",X"90",X"90",X"90",X"FE",X"FE",X"00",
		X"9E",X"9E",X"92",X"82",X"C6",X"7C",X"38",X"00",X"FE",X"FE",X"10",X"10",X"10",X"FE",X"FE",X"00",
		X"82",X"82",X"FE",X"FE",X"82",X"82",X"00",X"00",X"FC",X"FE",X"02",X"02",X"02",X"06",X"04",X"00",
		X"82",X"C6",X"6E",X"3C",X"18",X"FE",X"FE",X"00",X"02",X"02",X"02",X"02",X"FE",X"FE",X"00",X"00",
		X"FE",X"FE",X"70",X"38",X"70",X"FE",X"FE",X"00",X"FE",X"FE",X"1C",X"38",X"70",X"FE",X"FE",X"00",
		X"7C",X"FE",X"82",X"82",X"82",X"FE",X"7C",X"00",X"70",X"F8",X"88",X"88",X"88",X"FE",X"FE",X"00",
		X"7A",X"FC",X"8E",X"8A",X"82",X"FE",X"7C",X"00",X"72",X"F6",X"9E",X"8C",X"88",X"FE",X"FE",X"00",
		X"0C",X"5E",X"D2",X"92",X"92",X"F6",X"64",X"00",X"80",X"80",X"FE",X"FE",X"80",X"80",X"00",X"00",
		X"FC",X"FE",X"02",X"02",X"02",X"FE",X"FC",X"00",X"F0",X"F8",X"1C",X"0E",X"1C",X"F8",X"F0",X"00",
		X"FE",X"FE",X"1C",X"38",X"1C",X"FE",X"FE",X"00",X"C6",X"EE",X"7C",X"38",X"7C",X"EE",X"C6",X"00",
		X"E0",X"F0",X"1E",X"1E",X"F0",X"E0",X"00",X"00",X"C2",X"E2",X"F2",X"BA",X"9E",X"8E",X"86",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"01",X"07",X"0F",X"1F",X"28",X"28",X"00",X"00",X"C0",X"80",X"80",X"C0",X"80",X"80",
		X"EA",X"22",X"22",X"1F",X"0F",X"07",X"01",X"00",X"FF",X"81",X"83",X"C0",X"80",X"80",X"C0",X"00",
		X"00",X"00",X"01",X"07",X"0F",X"11",X"2E",X"2E",X"F1",X"3F",X"20",X"1F",X"0F",X"07",X"01",X"00",
		X"00",X"00",X"01",X"00",X"04",X"03",X"01",X"07",X"00",X"C0",X"FE",X"06",X"7E",X"0E",X"5E",X"1E",
		X"01",X"03",X"04",X"00",X"01",X"00",X"00",X"00",X"5E",X"0E",X"7E",X"06",X"FE",X"C0",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"FF",
		X"00",X"00",X"01",X"07",X"1F",X"FF",X"FF",X"FF",X"00",X"E0",X"F0",X"F8",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"FF",X"FF",X"F3",X"E3",X"00",X"00",X"00",X"00",X"F0",X"F0",X"F0",X"F8",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"1F",X"07",X"01",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"F8",X"F0",X"E0",X"00",X"00",
		X"F3",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"F8",X"F8",X"F8",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F0",X"F8",X"F8",X"F8",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"07",X"07",X"07",X"FF",X"FF",X"FF",X"FF",
		X"F8",X"F0",X"F0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"27",X"07",X"17",X"07",X"03",X"13",X"03",X"23",X"00",X"C0",X"E0",X"F0",X"38",X"02",X"00",X"00",
		X"00",X"00",X"03",X"01",X"00",X"11",X"0C",X"04",X"00",X"00",X"FD",X"8D",X"1D",X"FD",X"3D",X"78",
		X"03",X"03",X"0F",X"8F",X"C7",X"E7",X"FF",X"FF",X"1C",X"04",X"0C",X"11",X"00",X"01",X"03",X"00",
		X"78",X"78",X"3D",X"FD",X"1D",X"8D",X"FD",X"00",X"E3",X"FF",X"FF",X"E7",X"C7",X"8F",X"0F",X"03",
		X"00",X"01",X"03",X"00",X"00",X"11",X"0C",X"04",X"00",X"81",X"FD",X"0D",X"1D",X"FD",X"3D",X"78",
		X"03",X"0F",X"8F",X"C7",X"E7",X"FF",X"FF",X"E3",X"1C",X"04",X"0C",X"11",X"00",X"00",X"03",X"01",
		X"78",X"78",X"3D",X"FD",X"1D",X"0D",X"FD",X"81",X"E3",X"E3",X"FF",X"FF",X"E7",X"C7",X"8F",X"0F",
		X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",
		X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"03",
		X"FF",X"03",X"03",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"03",
		X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"03",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"03",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"03",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",
		X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",
		X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3F",X"EF",X"C7",X"FF",X"0B",X"03",X"03",X"03",X"07",X"3F",X"EF",X"C7",X"FB",X"0B",X"03",X"03",
		X"07",X"07",X"3F",X"EF",X"C3",X"FB",X"0B",X"03",X"07",X"07",X"07",X"3F",X"EB",X"C3",X"FB",X"0B",
		X"07",X"07",X"07",X"07",X"03",X"C3",X"FB",X"CB",X"07",X"07",X"07",X"07",X"03",X"03",X"C3",X"FB",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"C3",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",
		X"11",X"00",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"00",X"00",X"00",
		X"07",X"07",X"07",X"07",X"CB",X"FB",X"C3",X"03",X"07",X"07",X"07",X"07",X"03",X"CB",X"FB",X"C3",
		X"07",X"07",X"07",X"07",X"03",X"03",X"CB",X"FB",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"CB",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"0B",X"CF",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"FF",X"CF",X"07",X"07",X"03",X"03",X"03",X"03",X"C7",X"FF",X"C7",X"07",X"03",X"03",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3B",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"00",
		X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",
		X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"00",X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",
		X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"C7",X"07",X"07",X"07",X"03",X"03",X"03",X"03",X"FF",X"C7",X"07",X"07",X"03",X"03",X"03",X"03",
		X"FF",X"C7",X"EF",X"3F",X"03",X"03",X"03",X"03",X"0F",X"FF",X"C7",X"EF",X"3B",X"03",X"03",X"03",
		X"07",X"0F",X"FF",X"C7",X"EB",X"3B",X"03",X"03",X"07",X"07",X"0F",X"FF",X"C3",X"EB",X"3B",X"03",
		X"03",X"28",X"02",X"48",X"00",X"20",X"44",X"40",X"00",X"92",X"04",X"21",X"02",X"02",X"20",X"04",
		X"00",X"22",X"00",X"20",X"08",X"00",X"44",X"09",X"00",X"14",X"00",X"02",X"00",X"64",X"02",X"10",
		X"00",X"00",X"00",X"3B",X"3B",X"3B",X"11",X"00",X"07",X"07",X"07",X"C7",X"FB",X"CB",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"07",X"07",X"07",X"03",X"03",X"03",X"03",
		X"00",X"11",X"3B",X"3B",X"3B",X"00",X"00",X"00",X"07",X"07",X"CF",X"FF",X"C3",X"03",X"03",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"3F",X"7F",X"3F",X"03",X"3B",X"7B",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"17",X"17",X"37",X"33",X"13",X"13",X"3B",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"7F",X"3F",X"07",X"3B",X"7B",X"3B",X"03",
		X"00",X"00",X"00",X"03",X"07",X"0F",X"1F",X"1F",X"00",X"00",X"00",X"80",X"C0",X"C0",X"C7",X"C7",
		X"1F",X"0F",X"07",X"03",X"00",X"00",X"00",X"00",X"C7",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"07",X"0F",X"1F",X"3F",X"00",X"00",X"00",X"00",X"00",X"80",X"8E",X"8E",
		X"3F",X"3F",X"3F",X"1F",X"07",X"00",X"00",X"00",X"8E",X"80",X"80",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"0E",X"1F",X"3F",X"7F",X"7F",X"00",X"00",X"00",X"00",X"00",X"00",X"1C",X"1C",
		X"7F",X"3F",X"1F",X"0E",X"00",X"00",X"00",X"00",X"1C",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"07",X"1F",X"3F",X"3F",X"3F",X"3F",X"00",X"00",X"00",X"80",X"80",X"80",X"8E",X"8E",
		X"1F",X"0F",X"07",X"00",X"00",X"00",X"00",X"00",X"8E",X"80",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"02",X"0E",X"01",X"02",X"00",X"00",X"00",X"00",X"50",X"20",X"40",X"B0",
		X"07",X"0B",X"02",X"0A",X"00",X"00",X"00",X"00",X"D8",X"90",X"A0",X"50",X"20",X"00",X"00",X"00",
		X"00",X"02",X"01",X"05",X"13",X"42",X"35",X"12",X"00",X"00",X"20",X"44",X"14",X"88",X"24",X"D8",
		X"24",X"03",X"05",X"02",X"0A",X"04",X"00",X"00",X"42",X"E4",X"98",X"B0",X"08",X"D4",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"01",X"1F",X"C3",X"47",X"C7",X"80",X"C3",X"A3",X"B1",X"B9",X"BF",X"1F",X"18",
		X"47",X"C3",X"1F",X"01",X"00",X"00",X"00",X"00",X"1F",X"BF",X"B9",X"B1",X"A3",X"C3",X"80",X"00",
		X"00",X"18",X"3F",X"01",X"1F",X"C3",X"47",X"C7",X"00",X"03",X"A3",X"B1",X"B9",X"BF",X"1F",X"18",
		X"47",X"C3",X"1F",X"01",X"3F",X"18",X"00",X"00",X"1F",X"BF",X"B9",X"B1",X"A3",X"03",X"00",X"00",
		X"00",X"00",X"00",X"01",X"1F",X"C3",X"47",X"C7",X"83",X"C3",X"A1",X"B1",X"BB",X"BF",X"1E",X"18",
		X"47",X"C3",X"1F",X"03",X"FF",X"00",X"00",X"00",X"1E",X"BF",X"BB",X"B1",X"A1",X"03",X"03",X"00",
		X"00",X"30",X"7F",X"01",X"1F",X"C3",X"47",X"C7",X"00",X"03",X"A3",X"B1",X"B9",X"BF",X"1F",X"18",
		X"47",X"C3",X"1F",X"03",X"FF",X"00",X"00",X"00",X"1F",X"BF",X"B9",X"B1",X"A3",X"03",X"00",X"00",
		X"3C",X"42",X"81",X"A5",X"A5",X"99",X"42",X"3C",X"C0",X"C0",X"C0",X"C0",X"FF",X"FF",X"00",X"00",
		X"DB",X"DB",X"DF",X"1F",X"00",X"00",X"7F",X"FF",X"FF",X"00",X"00",X"7F",X"FF",X"DB",X"DB",X"DB",
		X"FF",X"C0",X"C0",X"FF",X"FF",X"C0",X"C0",X"FF",X"C3",X"C3",X"C3",X"FF",X"7E",X"00",X"00",X"7F",
		X"C3",X"FF",X"7E",X"00",X"00",X"C3",X"C3",X"C3",X"00",X"00",X"00",X"7E",X"FF",X"C3",X"C3",X"C3",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"07",X"0F",X"0F",X"1F",X"1F",X"1F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"1F",X"0F",X"0F",X"07",X"03",X"00",X"00",
		X"F8",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"00",X"00",X"00",X"00",X"00",X"1F",X"1F",X"1F",
		X"FC",X"FC",X"FC",X"FC",X"FC",X"FC",X"F8",X"00",X"1F",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"03",X"0F",X"1F",X"3F",X"7F",X"7F",X"00",X"00",X"80",X"00",X"00",X"80",X"00",X"00",
		X"7F",X"7F",X"7F",X"3F",X"1F",X"0F",X"03",X"00",X"80",X"00",X"00",X"83",X"07",X"00",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"08",X"08",X"FF",X"08",X"08",X"08",X"08",X"00",X"00",X"00",X"00",X"00",X"06",X"06",X"00",
		X"00",X"00",X"0E",X"3F",X"7F",X"7F",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",
		X"FF",X"FF",X"7F",X"7F",X"3F",X"0E",X"00",X"00",X"0F",X"0F",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"07",X"0E",X"18",X"20",X"07",X"00",X"00",X"C0",X"80",X"00",X"00",X"00",X"80",
		X"FF",X"07",X"20",X"18",X"0E",X"07",X"01",X"00",X"FF",X"81",X"03",X"00",X"00",X"80",X"C0",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
