----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:07:14 01/09/2020 
-- Design Name: 
-- Module Name:    sensor - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_misc.all;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sensor is

   
		PORT(
     
		Trig   : OUT std_logic;
		echo   : IN std_logic;
		distance : OUT std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic);




end sensor;

architecture Behavioral of sensor is

begin
    

   
   sensorproc:process(clk,rst)
	    variable counter: std_logic_vector(20 downto 0) := "000000000000000000000";
		 variable  tempdistance :  std_logic_vector(31 downto 0);
	    variable  bcdoutput : std_logic_vector(31 downto 0);
		 variable  bcd_counter: std_logic_vector(5 downto 0);
		 variable  speed_ratio: std_logic_vector(10 downto 0);
		 
		 
	  begin
		
		   
	     if rst = '1' then
				
             counter := "000000000000000000000";
				 distance <= "00000000000000000000000000000000";
             Trig <= '0';
        elsif clk'event and clk = '1' then
		
		                

                      
								
								if counter = "000000000000000000000" then -- counter  = 0
				                   
										 
 								     	 Trig <= '0';
										 
										 counter  := counter + "000000000000000000001";
								
                        elsif counter = "000000000000000000001" then -- counter  = 1
								       Trig <= '1';
										 counter  := counter + "000000000000000000001";
										 
				            elsif counter > "000000000000000000001" and counter < "000000000000111110100" then  -- counter greater than 0 but less than 500

                               counter  := counter + "000000000000000000001";
										 
								elsif counter = "000000000000111110100" then --counter = 500
                                    

                              Trig <= '0';
										counter  := counter + "000000000000000000001";
                             
								elsif counter > "000000000000111110100" and counter < "000000111010100110000" then -- counter is greater than 500 but less than 10000	  
								
								     counter  := counter + "000000000000000000001";
									  
								elsif counter >= "00000010011100010000" and counter <= "0100110001001011010000"	 then -- counter is greater than 10000 but less than 1250000
								   
									        --   computing range if echo is received
												  
												  if echo = '1' then
												     speed_ratio:= "00000100010";
													
													  tempdistance := unsigned(speed_ratio) * unsigned(counter);
											      
											    
													  distance <= 	tempdistance;	 
	
											     
											
											  
												elsif echo = '0' then 
												 
												    counter  := counter + "000000000000000000001";
														
								              end if;   

								

                       elsif counter > "0100110001001011010000" and counter <  "111001111110111100000" then
							                
												 counter  := counter + "000000000000000000001";
								
							
                       elsif counter = "111001111110111100000" then

                                      Trig <= '0';
												  counter := "000000000000000000000";
				                          distance <= "00000000000000000000000000000000";
							  end if;
		             
		                  
		
		
		
		  end if;
		
		end process;



end Behavioral;

