----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2026 17:29:33
-- Design Name: 
-- Module Name: Colour_generator - Behavioral
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

entity Color_generator is
port(
    Clk100, Reset : in std_logic;
    VGA_Red, VGA_Green, VGA_Blue : out std_logic_vector(3 downto 0);
    Hsync, Vsync : out std_logic
);
end Color_generator;

architecture Behavioral of Color_generator is

begin


end Behavioral;
