entity FULL_ADDER is
	port(A, B, CIN : in bit;
		S, COUT: out bit);
end entity;

entity AND2 is
	port(X1, X2: in bit;
		Y : out bit);
end entity; 

entity OR3 is
	port(X1, X2, X3: in bit;
		Y : out bit);
end entity;

entity XOR3 is
	port(X1, X2, X3: in bit;
		Y : out bit);
end entity;


architecture AND_GATE of AND2 is
begin
	Y <= X1 and X2;
end architecture;

architecture OR_GATE of OR3 is
begin
	Y <= X1 or X2 or X3;
end architecture; 

architecture XOR_GATE of XOR3 is
begin
	Y <= X1 xor X2 xor X3;
end architecture;

architecture STRUCTURAL of FULL_ADDER is	
	component AND2
		port(X1, X2: in bit;
			Y : out bit);
	end component;
	
	component OR3 
		port(X1, X2, X3: in bit;
			Y : out bit);
	end component; 
	
	component XOR3 
		port(X1, X2, X3: in bit;
			Y : out bit);
	end component;	
	
	signal signal_1, signal_2, signal_3: bit;
	
begin
	et_1 : AND2 port map(X1 => A, X2 => B, Y => signal_1);  
	et_2 : AND2 port map(X1 => A, X2 => CIN, Y => signal_2);	  
	et_3 : AND2 port map(X1 => B, X2 => CIN, Y => signal_3);
	et_4 : OR3 port map(X1 => signal_1, X2 => signal_2, X3 => signal_3, Y => COUT); 
	et_5 : XOR3 port map(X1 => A, X2 => B, X3 => CIN, Y => S); 
end architecture;