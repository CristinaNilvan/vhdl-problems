entity COMPARATOR is
	port(A, B : in bit;
		Y1, Y2, Y3 : out bit);
end entity;	  

entity INV is
	port(X : in bit;
		Y : out bit);
end entity;

entity AND2 is
	port(X1, X2 : in bit;
		Y : out bit);
end entity;	  

entity XOR2 is
	port(X1, X2: in bit;
		Y : out bit);
end entity;	 


architecture NOT_GATE of INV is
begin
	Y <= not X;
end architecture;

architecture AND_GATE of AND2 is
begin
	Y <= X1 and X2;
end architecture;

architecture XOR_GATE of XOR2 is
begin
	Y <= X1 xor X2;
end architecture;

architecture STRUCTURAL of COMPARATOR is
	component INV 
		port(X : in bit;
			Y : out bit);
	end component;

	component AND2
		port(X1, X2 : in bit;
			Y : out bit); 
	end component; 
	
	component XOR2 
		port(X1, X2: in bit;
			Y : out bit);
	end component;
	
	signal signal_1, signal_2, signal_3: bit;
	
begin
	et_1 : INV port map(X => A, Y => signal_1);
	et_2 : INV port map(X => B, Y => signal_2);
	et_3 : AND2 port map(X1 => A, X2 => signal_2, Y => Y1);
	et_4 : XOR2 port map(X1 => A, X2 => B, Y => signal_3); 
	et_5 : INV port map(X => signal_3, Y => Y2);
	et_6 : AND2 port map(X1 => signal_1, X2 => B, Y => Y3);
end architecture;