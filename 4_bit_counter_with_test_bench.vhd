library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;  

entity counter_2_bit is
	port(clock, clear, enable : in std_logic;  
	carry_out : out std_logic;
	result : out std_logic_vector(1 downto 0));
end entity;

architecture arch_counter_2_bit of counter_2_bit is

signal number : std_logic_vector(1 downto 0) := "00";

begin
	process(clock, clear, enable)
	begin
		if (enable = '1') then
			if (clear = '1') then 
				number <= "00";
			elsif (clock'event and clock = '1') then
					number <= number + "01";
					if (number = "11") then
						number <= "00";
					end if;
			end if;	
			
			if (number = "11") then
				carry_out <= '1';
			else 
				carry_out <= '0';
			end if;
			 
		end if;	  
		
		result <= number;	
		
	end process;
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;  

entity counter_4_bit is
	port(clock, clear, enable : in std_logic;
	result_4_bit : out std_logic_vector(3 downto 0));
end entity;

architecture arch_counter_4_bit of counter_4_bit is

component counter_2_bit 
	port(clock, clear, enable : in std_logic;	
	carry_out : out std_logic;
	result : out std_logic_vector(1 downto 0));
end component;
 	 
signal carry_aux : std_logic; 
signal carry_aux_2 : std_logic;		

signal result_1 : std_logic_vector(1 downto 0); 
signal result_2 : std_logic_vector(1 downto 0);

begin
	
	first_counter : counter_2_bit port map (clock => clock, clear => clear, enable => enable, 
		carry_out => carry_aux, result => result_1);
	
	second_counter : counter_2_bit port map (clock => clock, clear => clear, enable => carry_aux, 
		carry_out => carry_aux_2, result => result_2);
	
	result_4_bit(1 downto 0) <= result_1; 
	result_4_bit(3 downto 2) <= result_2;
	
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_bench is
end entity;

architecture arch_test_bench of test_bench is

component counter_4_bit 
	port(clock, clear, enable : in std_logic;
	result_4_bit : out std_logic_vector(3 downto 0));
end component; 

signal clock, clear, enable : std_logic;
signal result_4_bit : std_logic_vector(3 downto 0);

begin
	TB : counter_4_bit port map (clock => clock, clear => clear, enable => enable, result_4_bit => result_4_bit);
	
	clock_process : process
	begin
		if clock = 'U' then
			clock <= '0';
			wait for 10 ns;
		else
			clock <= not clock;
			wait for 10 ns;
		end if;
	end process; 	 		  

	clear_process : process
	begin
		clear <= '0';
		wait for 340 ns;
		
		clear <= '1';
		wait for 20 ns;
	end process;
	
	enable <= '1';
		
end architecture;	  

