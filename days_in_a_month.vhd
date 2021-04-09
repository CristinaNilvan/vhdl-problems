library	ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DAYS_IN_A_MONTH is
	port (month : in unsigned(3 downto 0);
		is_leap : in std_logic;
		number_of_days : out unsigned(4 downto 0));
end entity;

architecture COUNTS_DAYS of DAYS_IN_A_MONTH is
   
	signal month_28_days : std_logic;  
	signal month_29_days : std_logic;  
	signal month_30_days : std_logic;
	signal month_31_days : std_logic;	 
	
begin
	
	month_28_days <= '1' when month = 2 and is_leap = '0'
				else '0';
	
	month_29_days <= '1' when month = 2 and is_leap = '1'
				else '0'; 
							 
	month_30_days <= '1' when month = 9 or month = 4 or month = 6 or month = 11
				else '0';
							
	month_31_days <= '1' when month_30_days = '0' and month_28_days = '0' and month_29_days = '0'
				else '0';
		
	number_of_days <= to_unsigned(30, number_of_days'length) when month_30_days = '1' else   
			to_unsigned(28, number_of_days'length) when month_28_days = '1' else 
			to_unsigned(29, number_of_days'length) when month_29_days = '1' else 
			to_unsigned(31, number_of_days'length) when month_31_days = '1' 
			else to_unsigned(0, number_of_days'length);
	
end architecture;

