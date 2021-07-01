library ieee;
use ieee.std_logic_1164.all; 

entity ring_counter is
	port (clock, reset : in std_logic;
	q : out std_logic_vector(3 downto 0));
end entity;

architecture arch_ring_counter of ring_counter is

signal auxiliary_signal : std_logic_vector(3 downto 0) := "0000";

begin
	process(clock, reset)
	begin
		if (reset = '1') then
			auxiliary_signal <= "0001";
		elsif (clock = '1' and clock'event) then
			auxiliary_signal(1) <= auxiliary_signal(0);
			auxiliary_signal(2) <= auxiliary_signal(1);
			auxiliary_signal(3) <= auxiliary_signal(2);
			auxiliary_signal(0) <= auxiliary_signal(3);
		end if;
		
		q <= auxiliary_signal;
	end process;
end architecture;


library ieee;
use ieee.std_logic_1164.all; 

entity ring_counter_test_bench is
end entity;

architecture arch_ring_counter_test_bench of ring_counter_test_bench is

component ring_counter 
	port (clock, reset : in std_logic;
	q : out std_logic_vector(3 downto 0));
end component;

signal clock, reset : std_logic;	   
signal q : std_logic_vector(3 downto 0);	

begin
	TB : ring_counter port map (clock => clock, reset => reset, q => q);
	
	clock_process : process
	begin
		if (clock = 'U') then
			clock <= '0';
		else
			clock <= not clock;	
		end if;
			
		wait for 10 ns;
	end process;
	
	reset_process : process
	begin
		reset <= '1';
		wait for 10 ns;	 
		
		reset <= '0';		
		wait for 180 ns;
	end process;	
	
end architecture;