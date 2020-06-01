----------------------------------------------------------------------------------
-- Company: University of Regina
-- Engineer: Mckenzie Busenius
-- 
-- Create Date: 12/01/2019 06:18:58 PM
-- Design Name: 
-- Module Name: DesignProject - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DesignProject is
Port (clock: in STD_LOGIC;   -- Clock 
      clear: in STD_LOGIC; -- Clear is used to clear currrent 
      sw: in STD_LOGIC_VECTOR (15 downto 8); -- The switches 
      btn: in STD_LOGIC_VEctor (3 downto 0); -- The two bit input from the three switches
      pass: out STD_LOGIC;
      fail: out STD_LOGIC);

end DesignProject;

architecture Behavioral of DesignProject is

type stateType is (start, correctInput1, correctInput2, correctInput3, 
                    correctInput4, passState, error1, error2, error3, error4, failState);
signal currentState, nextState : stateType;
signal DIV : STD_LOGIC_VECTOR(22 downto 0) := "00000000000000000000000";

begin
sreg: process (clock, clear)

begin
--    if (clock = '1' and clock'event) then
--        if clear = '1' then
--            currentState <= start;
--            DIV <= DIV + 1;
       
--        if DIV = "1111111111111111111111" and clock'event and clock = '1' then
--              currentState <= nextState;  
--              DIV <= "00000000000000000000000000";
--        end if;
--        end if;
--    end if;
      
-- Orignal setup
    if clear = '1' then
        currentState <= start;
    elsif clock'event and clock = '1' then
        currentState <= nextState;
    end if;
    
    
end process;
      
c1: process (currentState, btn, sw)
begin
    case currentState is
        
        when start =>
            if btn = sw(15 downto 14) then
                nextState <= correctInput1;
            else 
                nextState <= error1;
            end if;
            
        when correctInput1 =>
            if btn = sw(13 downto 12) then
                nextState <= correctInput2;
            else
                nextState <= error2;
            end if;
            
        when correctInput2 =>
            if btn = sw(11 downto 10) then
                nextState <= correctInput3;
            else
                nextState <= error3;
            end if;
            
        when correctInput3 =>
            if btn = sw(9 downto 8) then
                nextState <= correctInput4;
            else
                nextState <= error4;
            end if;
            
        when correctInput4 =>
            if btn = sw(7 downto 6) then
                nextState <=  passState;
            else
                nextState <= failState;
            end if;
            
        when passState =>
            if btn = sw(15 downto 14) then
                nextState <= correctInput1;
            else 
                nextState <= error1;
            end if;
        
        when error1 =>
            nextState <= error2;
        when error2 =>
            nextstate <= error3;
        when error3 =>
            nextState <= error4;
        when error4 =>
            nextState <= failState;
            
        when error4 =>
            if btn = sw(15 downto 14) then
                nextState <= correctInput1;
            else 
                nextState <= error1;
            end if;
        
        when others =>
            nextState <= start;
    end case;
end process;

c2: process (currentState)
begin 
    if currentState = passState then
        pass <= '1';
    else 
        pass <= '0';
    end if;
    
    if currentState = failState then
        fail <= '1';
    else 
        fail <= '0';
    end if;
    
end process;
end Behavioral;
