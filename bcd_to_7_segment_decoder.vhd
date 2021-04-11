library ieee;
use ieee.std_logic_1164.all; 

entity BCD_TO_7_SEGMENT is
	port (led_bcd : in std_logic_vector(3 downto 0);
	led_out : out std_logic_vector(6 downto 0));
end entity;	

architecture DECODER of BCD_TO_7_SEGMENT is 

 type segment_type is array (0 to 9) of std_logic_vector(6 downto 0);

 signal displayed : segment_type := ("0000001", "1001111", "0010010", "0000110", 
		"1001100", "0100100", "0100000", "0001111", "1111111", "0000100");	
	
begin
	process(led_bcd)
	begin
		case led_bcd is
			when "0000" => led_out <= displayed(0); 	
			when "0001" => led_out <= displayed(1); 	
			when "0010" => led_out <= displayed(2); 	
			when "0011" => led_out <= displayed(3); 	
			when "0100" => led_out <= displayed(4); 	
			when "0101" => led_out <= displayed(5); 	
			when "0110" => led_out <= displayed(6); 
			when "0111" => led_out <= displayed(7); 	
			when "1000" => led_out <= displayed(8); 	
			when "1001" => led_out <= displayed(9); 	 
			when others => led_out <= "0000000";  	
		end case;
	end process;
end architecture;

