entity ONE_BIT_FULL_ADDER is
	port(A, B, CIN : in bit;
		S, COUT: out bit);
end entity;

architecture FULL_ADDER_1B of ONE_BIT_FULL_ADDER is	
begin
	S <= A xor B xor CIN;
	COUT <= (A and B) or (CIN and (A xor B));
end architecture;	


library	ieee;
use ieee.std_logic_1164.all;

entity EIGHT_BIT_FULL_ADDER is 
	port(A : in bit_vector(7 downto 0); 
		B : in bit_vector(7 downto 0);
		CIN : in bit;
		S : out bit_vector(7 downto 0);	 
		COUT : out bit);
end entity;

architecture FULL_ADDER_8B of EIGHT_BIT_FULL_ADDER is
signal carry_out_signal : bit_vector(0 to 6);

component ONE_BIT_FULL_ADDER 
	port(A, B, CIN : in bit;
		S, COUT: out bit);
end component; 

for all : ONE_BIT_FULL_ADDER use entity ONE_BIT_FULL_ADDER(FULL_ADDER_1B);  
	
begin
	FIRST_VALUE : ONE_BIT_FULL_ADDER port map(A(0), B(0), CIN, S(0), carry_out_signal(0));
	
	OTHER_VALUES : for i in 1 to 6 generate
		I_VALUE : ONE_BIT_FULL_ADDER port map(A(i), B(i), carry_out_signal(i - 1), S(i), carry_out_signal(i)); 
	end generate OTHER_VALUES;
	
	LAST_VALUE : ONE_BIT_FULL_ADDER port map(A(7), B(7), carry_out_signal(6), S(7), COUT); 
end architecture;