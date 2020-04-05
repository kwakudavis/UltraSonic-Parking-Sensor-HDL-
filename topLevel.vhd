
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopDesign is
    Port ( 
      Anode0 : OUT std_logic;
		Anode1 : OUT std_logic;
		Anode2 : OUT std_logic;
		Anode3 : OUT std_logic;
		seg : OUT std_logic_vector(6 downto 0);
		rst : IN std_logic;
		buzz : OUT STD_LOGIC;
		trig   : OUT std_Logic;
		echo : IN std_logic;
		clk : IN std_logic);
end TopDesign;

	architecture Behavioral of TopDesign is


COMPONENT segment_driver
PORT(
      display_A : IN std_logic_vector(3 downto 0);
		display_B : IN std_logic_vector(3 downto 0);
		display_C : IN std_logic_vector(3 downto 0);
		display_D : IN std_logic_vector(3 downto 0);
		Anode3 : OUT std_logic;
		Anode2 : OUT std_logic;
		Anode1 : OUT std_logic;
		Anode0 : OUT std_logic;
		
		seg : OUT std_logic_vector(6 downto 0);
		clk,rst : IN std_logic);
	END COMPONENT;
	

COMPONENT sensor
		PORT(
     
		Trig   : OUT std_logic;
		echo   : IN std_logic;
		distance : OUT std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic);
   END COMPONENT;
 
	
COMPONENT BCD_converter
       PORT ( 
		     distance_input : in  STD_LOGIC_VECTOR (31 downto 0);
		     thousands: out  STD_LOGIC_VECTOR (3 downto 0);
           hundreds : out  STD_LOGIC_VECTOR (3 downto 0);
           tens : out  STD_LOGIC_VECTOR (3 downto 0);
           unit : out  STD_LOGIC_VECTOR (3 downto 0));


END COMPONENT;	
	


COMPONENT buzzer

    PORT(
	        thousand: IN STD_LOGIC_VECTOR (3 downto 0);
			  hundred : IN  STD_LOGIC_VECTOR (3 downto 0);
           ten : IN  STD_LOGIC_VECTOR (3 downto 0);
			  rst : IN std_logic;
			    clk : IN std_logic;
			  buzz : OUT STD_LOGIC
	 );

END COMPONENT;
	
	
signal Ai : std_logic_vector(3 downto 0);
signal Bi : std_logic_vector(3 downto 0);
signal Ci : std_logic_vector(3 downto 0);
signal Di : std_logic_vector(3 downto 0);

signal distanceBinary  : std_logic_vector(31 downto 0);


begin





uut3: segment_driver PORT MAP(
		display_A => Di,
		display_B => Ci,
		display_C => Bi,
		display_D => Ai,
		seg => seg,
		
		Anode0 => Anode0,
		Anode1 => Anode1,
		Anode2 => Anode2,
		Anode3 => Anode3,
      rst => rst,
		clk => clk 
	);



uut4: sensor PORT MAP(
      
		Trig => trig,
      echo => echo,
     -- distance => distanceBinary,
      rst => rst,
		clk => clk 
);


 	
uut5: BCD_CONVERTER PORT MAP(

      distance_input => distanceBinary,
		thousands => Ai,
		hundreds =>  Bi,
		tens => Ci,
		unit => Di

);	     
		
		
uut6: buzzer PORT MAP(
 
    thousand => Ai,
	 hundred  =>Bi,
	 ten      =>Ci,
	  rst =>rst,
	  clk => clk ,
	  buzz => buzz

);
		
		
		
		
--Ai <= distanceBinary(15 downto 12);
--Bi <= digitsBinary(11 downto 8);
---Ci <= digitsBinary(7 downto 4);
--Di <= digitsBinary(3 downto 0);
    --  Ai <= "0101";
	 --  Bi <= "0110";
	  -- Ci <= "0111";
	  -- Di <= "1000";
	

--distancebinary <= "010100010000111111110100000";-- 42500000maximum value 





end Behavioral;

