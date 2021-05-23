library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  

entity count_and_display is
	port(clock, reset : in std_logic;
	seven_segment_code : out std_logic_vector(0 to 6);
	number_integer : out integer);
end entity;

architecture arch_count_and_display of count_and_display is

signal number : std_logic_vector(0 to 3);

begin
	counter_process : process(clock, reset)
	begin
		if (reset = '1') then
			number <= "0000";
		elsif (clock'event and clock = '1') then
			number <= number + '1';	
			if (number = "1001") then 
				number <= "0000";
			end if;
		end if;
	end process;  
	
	display_process : process(number)
	begin
		case number is
			when "0000" => 
			seven_segment_code <= "0000001"; 	
			number_integer <= conv_integer(number);	
			
			when "0001" =>
			seven_segment_code <= "1001111"; 	
			number_integer <= conv_integer(number);	 
			
			when "0010" => 
			seven_segment_code <= "0010010"; 	
			number_integer <= conv_integer(number);
			
			when "0011" =>
			seven_segment_code <= "0000110"; 
			number_integer <= conv_integer(number);	
			
			when "0100" =>
			seven_segment_code <= "1001100"; 	
			number_integer <= conv_integer(number);
			
			when "0101" => 
			seven_segment_code <= "0100100"; 	
			number_integer <= conv_integer(number);
			
			when "0110" => 
			seven_segment_code <= "0100000";
			number_integer <= conv_integer(number);
			
			when "0111" => 
			seven_segment_code <= "0001111"; 	   
			number_integer <= conv_integer(number);	 
			
			when "1000" =>
			seven_segment_code <= "0000000"; 	
			number_integer <= conv_integer(number);
			
			when "1001" => 
			seven_segment_code <= "0000100"; 	
			number_integer <= conv_integer(number);
			
			when others => 
			seven_segment_code <= "1111111";  
		end case;  
	end process;
end architecture; 


-- Test bench

library ieee;
use ieee.std_logic_1164.all;

entity test_bench is
end entity;

architecture arch_test_bench of test_bench is

component count_and_display 
	port(clock, reset : in std_logic;
	seven_segment_code : out std_logic_vector(0 to 6);
	number_integer : out integer);
end component;

signal clock, reset	: std_logic;
signal seven_segment_code : std_logic_vector(0 to 6);  
signal number_integer : integer;

begin
	test_bench : count_and_display port map(clock => clock, reset => reset, seven_segment_code => seven_segment_code, number_integer => number_integer);	
	
	clock_process : process
	begin
		clock <= '0';
		wait for 20 ns;
		clock <= '1';
		wait for 20 ns;
	end process;
	
	reset_process : process
	begin
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		wait;
	end process; 
end architecture;
	
	
