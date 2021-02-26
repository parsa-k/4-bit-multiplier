
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplication4 is
port (a,b : in std_logic_vector(3 downto 0);
	z : out std_logic_vector(7 downto 0));
end entity Multiplication4;

architecture Behavioral of Multiplication4 is
constant zeros4 : std_logic_vector(3 downto 0) := (others => '0');
constant zeros8 : std_logic_vector(7 downto 0) := (others => '0');
signal z0 : std_logic_vector(7 downto 0) ;
signal z1 : std_logic_vector(7 downto 0) ;
signal z2 : std_logic_vector(7 downto 0) ;
signal z3 : std_logic_vector(7 downto 0) ;
signal b8 : std_logic_vector(7 downto 0);
signal b8L1 : std_logic_vector(7 downto 0);
signal b8L2 : std_logic_vector(7 downto 0);
signal b8L3 : std_logic_vector(7 downto 0);
signal result0 : unsigned(7 downto 0);
signal result1 : unsigned(7 downto 0);

begin
p1 : process (a , b) is
begin
b8 <= (zeros4 & b);

if a(0) = '0' then
z0 <= zeros8;
elsif a(0) = '1' then
z0 <= b8;
end if;
if a(1) = '0' then
z1 <= zeros8;
elsif a(1) = '1' then
b8L1 <= std_logic_vector(unsigned(b8) sll 1);
z1 <= b8L1;
end if;
if a(2) = '0' then
z2 <= zeros8;
elsif a(2) = '1' then
b8L2 <= std_logic_vector(unsigned(b8) sll 2);
z2 <= b8L2;
end if;
if a(3) = '0' then
z3 <= zeros8;
elsif a(3) = '1' then
b8L3 <= std_logic_vector(unsigned(b8) sll 3);
z3 <= b8L3;
end if;

result0 <= unsigned(z0) + unsigned(z1);
result1 <= unsigned(z2) + unsigned(result0);
z <= std_logic_vector (unsigned(z3) + unsigned(result1));
end process p1;

end Behavioral;


--for testing you can activate the following code

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.numeric_std.all;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--
--entity TB_Multiplication4 is 
--end entity TB_Multiplication4;
--
--architecture TB of TB_Multiplication4 is
--	signal a,b :  std_logic_vector (3 downto 0);
--	signal z :  std_logic_vector (7 downto 0);
--begin
-- 
--    g1: entity WORK.Multiplication4(Behavioral) port map (a,b,z);
--	 
--    a <= "0000" , "0001" after 20 ns, "0010" after 40 ns, "1111" after 60 ns, "1000" after 80 ns;
--    b <=  "0000" , "1111" after 300 ns, "1010" after 70 ns;
--end TB;