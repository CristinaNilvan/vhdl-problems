library ieee;			   
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bcd_to_excess3 is
	port(in_number : in std_logic_vector(3 downto 0);
	result : out std_logic_vector(3 downto 0));
end entity;

architecture arch_bcd_to_excess3 of bcd_to_excess3 is

begin
	process(in_number)
	begin
		case in_number is
			when "0000" => result <= "0011";  
				report "The result is 0011." severity note;
			when "0001" => result <= "0100";  
				report "The result is 0100." severity note;
			when "0010" => result <= "0101";  
				report "The result is 0101." severity note;
			when "0011" => result <= "0110";
				report "The result is 0110." severity note;
			when "0100" => result <= "0111";	 
				report "The result is 0111." severity note;
			when "0101" => result <= "1000";			   
				report "The result is 1000." severity note;
			when "0110" => result <= "1001";			   
				report "The result is 1001." severity note;
			when "0111" => result <= "1010";			   
				report "The result is 1010." severity note;
			when "1000" => result <= "1011";			   
				report "The result is 1011." severity note;
			when "1001" => result <= "1100";			   
				report "The result is 1100." severity note;
			when "1010" => result <= "1101";
				report "The result is 1101." severity note;
			when "1011" => result <= "1110";			   
				report "The result is 1110." severity note;
			when "1100" => result <= "1111";			   
				report "The result is 1111." severity note;
			when "1101" => result <= "0000";			   
				report "The result is 0000." severity note;
			when "1110" => result <= "0001";  			   
				report "The result is 0001." severity note;
			when "1111" => result <= "0010";			   
				report "The result is 0010." severity note;
			when others => result <= "ZZZZ";	  
				report "No result." severity error;
		end case;	
	end process;
end architecture;