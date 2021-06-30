library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

entity jk_flip_flop is
	port (j, k, set, reset : in std_logic;
	q : out std_logic);
end entity;

architecture arch_jk_flip_flop of jk_flip_flop is

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
	
	process(clock, j, k, set, reset)
	begin
		if (set = '1') then
			auxiliary_signal <= '1';
		elsif (reset = '1') then
			auxiliary_signal <= '0';
		elsif (clock = '1' and clock'event) then
			if (j = '0') then
				if (k = '0') then
					null;
				else
					auxiliary_signal <= '0';
				end if;
			else
				if (k = '0') then
					auxiliary_signal <= '1';
				else
					auxiliary_signal <= not(auxiliary_signal);
				end if;
			end if;
		end if;
		
		q <= auxiliary_signal;
	end process;
end architecture;