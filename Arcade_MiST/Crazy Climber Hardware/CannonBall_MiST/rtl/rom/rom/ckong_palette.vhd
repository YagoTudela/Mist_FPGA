library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ckong_palette is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(5 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ckong_palette is
	type rom is array(0 to  63) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"79",X"04",X"87",X"00",X"B7",X"FF",X"5F",X"00",X"C0",X"E8",X"F4",X"00",X"3F",X"04",X"38",
		X"00",X"0D",X"7A",X"B7",X"00",X"07",X"26",X"02",X"00",X"27",X"16",X"30",X"00",X"B7",X"F4",X"0C",
		X"00",X"2F",X"C0",X"16",X"00",X"07",X"27",X"D0",X"00",X"17",X"27",X"E8",X"80",X"07",X"1F",X"FF",
		X"00",X"E8",X"D8",X"07",X"00",X"3D",X"FF",X"E8",X"00",X"07",X"3F",X"D2",X"00",X"FF",X"D0",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
