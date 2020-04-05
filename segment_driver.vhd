----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:18 01/08/2020 
-- Design Name: 
-- Module Name:    segment_driver - Behavioral 
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

entity segment_driver is

PORT(
      display_A : IN std_logic_vector(3 downto 0);
		display_B : IN std_logic_vector(3 downto 0);
		display_C : IN std_logic_vector(3 downto 0);
		display_D : IN std_logic_vector(3 downto 0);
		Anode0 : OUT std_logic;
		Anode1 : OUT std_logic;
		Anode2 : OUT std_logic;
		Anode3 : OUT std_logic;
		rst : IN std_logic;
		seg : OUT std_logic_vector(6 downto 0);
		clk : IN std_logic);
end segment_driver;

architecture Behavioral of segment_driver is




begin


 


sevenseg:process(clk,rst)
	   variable counter: std_logic_vector(19 downto 0);
	   
	begin
		  
	     if rst = '1' then
				
			 counter := "00000000000000000000";
			 Anode0 <= '1';
			 Anode1 <= '1';
			 Anode2 <= '1';
			 Anode3 <= '1';
		
         
        elsif clk'event and clk = '1' then
	 
          counter := counter + "00000000000000000001";
			 
		     if counter < "110000110101000000" then    --displaying first digit
				 
				     Anode0 <= '0';
			        Anode1 <= '1';
			        Anode2 <= '1';
			        Anode3 <= '1';
				 
		        case display_A IS 
		          when "0000" =>
		      
                seg <= "1000000";

 
          	   when "0001" =>

                  seg <= "1111001";
					 

       		   when "0010" =>
        
                   seg <= "0100100";	 
		     

    			    when "0011" =>
	  
	                seg <= "0110000";	
	  
		  
         		 when "0100" =>

			           seg <= "0011001";	
		
		
		          when "0101" =>
    
	                  seg <= "0010010";	
		  
             	when "0110" =>
		           
					      seg <= "0000010";
	
		  
          		when "0111" =>

                    seg <= "1111000";

				
			      when "1000" =>
	 
		             seg <= "0000000";

     		      when "1001" =>

                  seg <= "0011000";
		 
		 
			
		          when others => NULL;

            end case;
				     
				 
				 
				 
		elsif  "110000110101000000" < counter and counter < "1100001101010000000" then    --displaying second digit
				 
				     Anode0 <= '1';
			        Anode1 <= '0';
			        Anode2 <= '1';
			        Anode3 <= '1';
				 
		        case display_B IS 
		            when "0000" =>
		      
                seg <= "1000000";

 
          	   when "0001" =>

                  seg <= "1111001";
					 

       		   when "0010" =>
        
                   seg <= "0100100";	 
		     

    			    when "0011" =>
	  
	                seg <= "0110000";	
	  
		  
         		 when "0100" =>

			             seg <= "0011001";	
		
		
		          when "0101" =>
    
	                  seg <= "0010010";	
		  
             	when "0110" =>
		           
					      seg <= "0000010";
	
		  
          		when "0111" =>

                    seg <= "1111000";

				
			      when "1000" =>
	 
		             seg <= "0000000";

     		      when "1001" =>

                  seg <= "0011000";
		 
		 
			
		          when others => NULL;

            end case;
				     
				 
				 
				 
		

    elsif  "1100001101010000000" < counter  and counter < "10010010011111000000" then    --displaying third digit
				 
				     Anode0 <= '1';
			        Anode1 <= '1';
			        Anode2 <= '0';
			        Anode3 <= '1';
				 
		        case display_C IS 
		           when "0000" =>
		      
                seg <= "1000000";

 
          	   when "0001" =>

                  seg <= "1111001";
					 

       		   when "0010" =>
        
                   seg <= "0100100";	 
		     

    			    when "0011" =>
	  
	                seg <= "0110000";	
	  
		  
         		 when "0100" =>

			             seg <= "0011001";	
		
		
		          when "0101" =>
    
	                  seg <= "0010010";	
		  
             	when "0110" =>
		           
					      seg <= "0000010";
	
		  
          		when "0111" =>

                    seg <= "1111000";

				
			      when "1000" =>
	 
		             seg <= "0000000";

     		      when "1001" =>

                  seg <= "0011000";
		 
		 
			
		          when others => NULL;

            end case;		









    elsif  "10010010011111000000"< counter  and counter < "11000011010100000000" then    --displaying fourth digit
				 
				     Anode0 <= '1';
			        Anode1 <= '1';
			        Anode2 <= '1';
			        Anode3 <= '0';
				 
		        case display_D IS 
		            when "0000" =>
		      
                seg <= "1000000";

 
          	   when "0001" =>

                  seg <= "1111001";
					 

       		   when "0010" =>
        
                   seg <= "0100100";	 
		     

    			    when "0011" =>
	  
	                seg <= "0110000";	
	  
		  
         		 when "0100" =>

			            seg <= "0011001";	
		
		
		          when "0101" =>
    
	                  seg <= "0010010";	
		  
             	when "0110" =>
		           
					      seg <= "0000010";
	
		  
          		when "0111" =>

                    seg <= "1111000";

				
			      when "1000" =>
	 
		             seg <= "0000000";

     		      when "1001" =>

                  seg <= "0011000";
		 
		 
			
		          when others => NULL;

                end case;     


          elsif counter="11000011010100000000" then 
			          counter := "00000000000000000000";
            end if;
			 
			 end if;

      end process;



end Behavioral;     		 
		       
		 


	

