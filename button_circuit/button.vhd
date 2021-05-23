library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  

entity d_flip_flop is
	port (d, clk, clr : in std_logic;
	q : out std_logic);
end entity;

architecture arch_d_flil_flop of d_flip_flop is

signal auxiliary : std_logic;

begin
	process(clk, clr)
	begin
		if (clr = '1') then
			auxiliary <= '0';
		elsif (clk'event and clk = '1') then
			auxiliary <= d;
		end if;		   
		
		q <= auxiliary;

	end process;
end architecture;


library ieee;
use ieee.std_logic_1164.all;  

entity and_3_inputs is
	port (a, b, c : in std_logic;
	y : out std_logic);			
end entity;		 

architecture arch_and_3_inputs of and_3_inputs is
begin
	y <= (a and b and c);
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 

entity button is 
	port (btn, reset, clock : in std_logic;
	btn_out : out std_logic);
end entity;

architecture arch_button of button is

component d_flip_flop
	port (d, clk, clr : in std_logic;
	q : out std_logic);
end component;

component and_3_inputs 
	port (a, b, c : in std_logic;
	y : out std_logic);			
end component;

signal auxiliary : std_logic_vector(0 to 2);

begin
	first_flip_flop : d_flip_flop port map (d => btn, clk => clock, clr => reset, q => auxiliary(0));
	
	other_flip_flops : for i in 1 to 2 generate
		flip_flops : d_flip_flop port map (d => auxiliary(i - 1), clk => clock, clr => reset, q => auxiliary(i));  
	end generate;
	
	check_condition : and_3_inputs port map (a => auxiliary(0), b => auxiliary(1), c => auxiliary(2), y => btn_out);
end architecture;