
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_converter is
    Port ( distance_input : in  STD_LOGIC_VECTOR (31 downto 0);
         thousands: out  STD_LOGIC_VECTOR (3 downto 0);
			  hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
          tens : out  STD_LOGIC_VECTOR (3 downto 0);
           unit : out  STD_LOGIC_VECTOR (3 downto 0)
			);
end BCD_converter;

architecture Behavioral of BCD_converter is

begin
process(distance_input)



variable i : integer := 0;
variable bcd : std_logic_vector(67 downto 0);

begin

bcd := (others => '0');
bcd( 31 downto 0) := distance_input;

for i in 0 to 31 loop

bcd(67 downto 0) := bcd(66 downto 0) & '0';	

if(i<31 and bcd(67 downto 64) > "0100") then
	bcd(67 downto 64) := bcd(67 downto 64) + "0011";

end if;




if(i<31 and bcd(63 downto 60) > "0100") then
	bcd(63 downto 60) := bcd(63 downto 60) + "0011";

end if;



if(i<31 and bcd(59 downto 56) > "0100") then
	bcd(59 downto 56) := bcd(59 downto 56) + "0011";


end if;



if(i<31 and bcd(55 downto 52)> "0100") then
	bcd(55 downto 52) := bcd(55 downto 52) + "0011";


end if;



if(i<31 and bcd(51 downto 48)> "0100") then
	bcd(51 downto 48) := bcd(51 downto 48) + "0011";


end if;


if(i<31 and bcd(47 downto 44)> "0100") then
	bcd(47 downto 44) := bcd(47 downto 44) + "0011";


end if;



if(i<31 and bcd(43 downto 40)> "0100") then
	bcd(43 downto 40) := bcd(43 downto 40) + "0011";


end if;



if(i<31 and bcd(39 downto 36)> "0100") then
	bcd(39 downto 36) := bcd(39 downto 36) + "0011";


end if;

	

if(i<31 and bcd(35 downto 32)> "0100") then
	bcd(35 downto 32) := bcd(35 downto 32) + "0011";

   
end if;

	
end loop;

thousands <= bcd(67 downto 64);
hundreds <=  bcd(63 downto 60);
tens <= bcd(59 downto 56);
unit <= bcd(55 downto 52);

end process;
end Behavioral;

