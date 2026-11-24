----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2026 16:50:11
-- Design Name: 
-- Module Name: Simu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Simu is
--  Port ( );
end Simu;

architecture Behavioral of Simu is
signal Clk100 : std_logic := '0';
signal Reset : std_logic;
signal RED_Out, GREEN_Out, BLUE_Out : std_logic_vector(3 downto 0);
begin
    my_Moving_colors : entity work.Moving_colors
        port map(
            Clk100,
            Reset,
            RED_Out,
            GREEN_Out,
            BLUE_Out
       );
    
   
    
    Clk100 <= not Clk100 after 5 ns;
    Reset <= '0' , '1' after 10ns;
    

end Behavioral;
