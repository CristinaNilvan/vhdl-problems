library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

entity t_flip_flop is
	port (t, set, reset : in std_logic;
	q : out std_logic);
end entity;

architecture arch_t_flip_flop of t_flip_flop is

signal clock : std_logic;
signal auxiliary_signal : std_logic;

begin
	clock_process : process
	begin
		if (clock = 'U') then
			clock <= '0';
		else
			clock <= not clock;	
		end if;
			
		wait for 10 ns;
	end process;	
	
	process(clock, t, set, reset)
	begin
		if (set = '1') then
			auxiliary_signal <= '1';
		elsif (reset = '1') then
			auxiliary_signal <= '0';	   
		elsif (clock = '1' and clock'event) then
			if (t = '1') then
				auxiliary_signal <= not(auxiliary_signal);	 
			end if;
		end if;
		
		q <= auxiliary_signal;
	end process;
end architecture;