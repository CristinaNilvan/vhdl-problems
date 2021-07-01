library ieee;			   
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity state_diagram is
	port (clock : in std_logic;
	I1, I2 : in std_logic;
	Z1, Z2, Z3 : out std_logic);
end entity;

architecture arch_state_diagram of state_diagram is

type state is (A, B, C, D, E);
signal current_state, next_state : state;

begin
	clock_process : process(clock)
	begin
		if (clock = '1' and clock'event) then
			current_state <= next_state;
		end if;
	end process;
	
	state_process : process(current_state, I1, I2)
	begin
		if (current_state = A) then
			next_state <= B;
		end if;
		
		if (current_state = B) then
			if (I1 = '1') then
				next_state <= C;
			else
				next_state <= D;
			end if;
		end if;
		
		if (current_state = C) then
			if (I1 = '1') then
				next_state <= B;
			else
				next_state <= C;
			end if;
		end if;					
		
		if (current_state = D) then
			if (I2 = '1') then
				next_state <= E;
			else
				next_state <= A;
			end if;
		end if;	 
		
		if (current_state = E) then
			if (I2 = '1') then
				next_state <= A;
			else
				next_state <= E;
			end if;
		end if;	 
	end process;
	
	output_process : process(current_state, I2)
	begin
		Z1 <= '0';
		Z2 <= '0';
		Z3 <= '0';
		
		if (current_state = B) then
			Z1 <= '1';
		end if;
		
		if (current_state = C) then
			Z2 <= '1';
		end if;
		
		if (current_state = E) then
			if (I2 = '1') then
				Z3 <= '1';
			end if;
		end if;
	end process;
end architecture;
		