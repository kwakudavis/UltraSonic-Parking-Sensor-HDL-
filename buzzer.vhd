----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:07 01/11/2020 
-- Design Name: 
-- Module Name:    buzzer - Behavioral 
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

entity buzzer is
      PORT(
	        thousand: IN STD_LOGIC_VECTOR (3 downto 0);
			  hundred : IN  STD_LOGIC_VECTOR (3 downto 0);
           ten : IN  STD_LOGIC_VECTOR (3 downto 0);
			  rst : IN std_logic;
			  buzz : OUT STD_LOGIC;
			  clk: IN STD_LOGIC
	 );

end buzzer;

architecture Behavioral of buzzer is
 

type state_type is (s0,s1,s2,s3); --state0 reset, state1 1sec, state2 2 seconds ,state 3 3 seconds
 signal next_state, state : state_type;

begin

    clock:process(clk,rst)
	 
	     begin
		  
		      if rst = '1' then
			     
				state <= s0;
				elsif clk'event and clk = '1' then
				 
				     state <= next_state;    
		  
		  
		      end if;
		  end process;

     
	  inprocess:process(state,thousand,hundred,ten)
	      variable buzz_counter :std_logic_vector(15 downto 0);
	      begin
			
		
				
				
			
			
		       if ten >= "0001" then
			           
			        buzz <= '1';
			
			    elsif  ten < "0001" then
				 
				     buzz <= '0';
			   end if;
				
			end process;





end Behavioral;

