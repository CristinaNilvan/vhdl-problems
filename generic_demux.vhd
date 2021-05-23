library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity generic_demux is
	generic (number : natural := 2);
	port (input : in std_logic;
	selection : in std_logic_vector(0 to number - 1);
	output : out std_logic_vector(0 to (2 ** number) - 1));
end entity;

architecture arch_generic_demux of generic_demux is

begin
	process(selection, input)
	variable selected_output : integer;
	begin
		selected_output := 0; 
		
		for i in 0 to number - 1 loop
			if selection(i) = '1' then
				selected_output := selected_output + (2 ** i);
			end if;
		end loop;	
		
		for i in 0 to (2 ** number) - 1 loop 
			output(i) <= '0';	
		end loop;  
		
		output(selected_output) <= input;
	end process;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity demux_3 is
end demux_3;

architecture arch_demux_3 of demux_3 is
	constant number : natural := 3;
	signal selection : std_logic_vector(0 to number - 1);
	signal input : std_logic;
	signal output : std_logic_vector(0 to (2 ** number) - 1);
begin
	demux_3_et : entity work.generic_demux(arch_generic_demux) generic map(number) port map(input => input, selection => selection, output => output);
end architecture;