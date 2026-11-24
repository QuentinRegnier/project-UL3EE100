----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2026 17:34:34
-- Design Name: 
-- Module Name: Moving_colors - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Moving_colors is
port(
    Clk100, Reset : in std_logic;
    RED_Out, GREEN_Out, BLUE_Out : out std_logic_vector(3 downto 0)
);
end Moving_colors;

architecture Behavioral of Moving_colors is
type STATE is (S1,S2,S3);
signal EP, EF : STATE;
signal clk_int : std_logic;
signal CPT_Red, CPT_Green, CPT_Blue : unsigned(4 downto 0);
begin

    process(Clk100, Reset)
    variable CPT_20Hz : unsigned(2 downto 0) := "000";
    begin
        -- Reset Asynchrone
        if Reset = '0' then 
            
            CPT_20Hz := "000"; clk_int <= '0';
        
        -- Sinon Test Front d'Horloge
        elsif rising_edge(clk100) then
            -- Incrémentation du Compteur de Division
            CPT_20Hz := CPT_20Hz + 1;
                      
            -- Si la Valeur Limite Est Atteinte
            if CPT_20Hz = "100" then
                     
                -- RAZ Compteur et Changement Etat Horloge 20 Hz (pour les test 10MHz)
                CPT_20Hz := "000";
                clk_int <= not clk_int;
            end if;
	   end if;
    end process;
    
    -- Registre d'état de la MAE
    process (Clk100, Reset)
    begin
    	if (Reset = '0') then EP <= S1;
        elsif rising_edge(Clk100) then EP <= EF;
        end if;
	end process;
	
	-- Combinatoire des états futurs
    process (EP, CPT_Red, CPT_Green, CPT_Blue)
    begin
    	case EP is
            when S1 => if CPT_Green = "11111" then EF <= S2; else EF <= EP; end if;
            when S2 => if CPT_Blue = "11111" then EF <= S3; else EF <= EP; end if;
           	when S3 => if CPT_Red = "11111" then EF <= S1; else EF <= EP; end if;
           	when others => EF <= EP;
        end case;
	end process;
	
	-- Compteur 5 bits RGB
	process(clk_int, Reset)
    begin
        -- Reset Asynchrone
        if Reset = '0' then 
            
            CPT_Red <= "11111";
            CPT_Green <= "00000";
            CPT_Blue <= "00000";
        
        -- Sinon Front d'Horloge
        elsif rising_edge(clk_int) then
            case EP is
                when S1 => CPT_Red <= CPT_Red - 1; CPT_Green <= CPT_Green + 1;
                when S2 => CPT_Green <= CPT_Green - 1; CPT_Blue <= CPT_Blue + 1;
                when S3 => CPT_Blue <= CPT_Blue - 1; CPT_Red <= CPT_Red + 1;
                when others => NULL;
            end case;
	   end if;
    end process;
    
    -- Transmission valeur de sortie
     process(clk_int)
     begin
        if rising_edge(clk_int) then
            RED_Out <= std_logic_vector(CPT_Red(4 downto 1));
            GREEN_Out <= std_logic_vector(CPT_Green(4 downto 1));
            BLUE_Out <= std_logic_vector(CPT_Blue(4 downto 1));
        end if;
     end process;
     
end Behavioral;
