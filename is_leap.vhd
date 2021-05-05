library	ieee;
use ieee.std_logic_1164.all;

entity two_bit_adder is
	port(bcd : in std_logic_vector(2 downto 0);
	z : out std_logic);
end entity;

architecture behavioral of two_bit_adder is

signal choice : std_logic_vector(1 downto 0);
signal result : std_logic_vector(1 downto 0);
signal cin : std_logic_vector(2 downto 0);

begin
	process(bcd)
	begin
		if (bcd(2) = '0') then choice <= "00";
		elsif (bcd(2) = '1') then choice <= "10";
		else choice <= "XX";
		end if;
	end process;
	
	cin(0) <= '0';	
	
	label_1 : for i in 0 to 1 generate
		result(i) <= choice(i) xor bcd(i) xor cin(i);
		cin(i + 1) <= (choice(i) and bcd(i)) or (bcd(i) and cin(i)) or (cin(i) and choice(i));
	end generate label_1;
	
	z <= not(result(0) or result(1));
	
end architecture;


library	ieee;
use ieee.std_logic_1164.all;

entity leap_detecting_circuit is
	port(bcd : in std_logic_vector(15 downto 0);
	is_leap : out std_logic);
end entity;

architecture behavioral of leap_detecting_circuit is   

component two_bit_adder is
	port(bcd : in std_logic_vector(2 downto 0);
	z : out std_logic);
end component;

signal x : std_logic_vector(2 downto 0);
signal y : std_logic_vector(2 downto 0);
signal result : std_logic_vector(1 downto 0);

begin
	x(1 downto 0) <= bcd(1 downto 0);
	x(2) <= bcd(4);	
	
	y(1 downto 0) <= bcd(9 downto 8);
	y(2) <= bcd(12);			   
	
	label_1 : two_bit_adder port map(x, result(0));
	label_2 : two_bit_adder port map(y, result(1));	
	
	process(result)
	begin
		if (bcd(15 downto 0) = "0000000000000000") then
			is_leap <= '0';
		elsif (bcd(7 downto 0) = "00000000") then
			is_leap <= result(1);
		else 
			is_leap <= result(0);
		end if;
	end process;
end architecture;