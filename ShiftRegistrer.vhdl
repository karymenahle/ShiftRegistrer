library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity shift_register_8bits is
    port(
        x: in std_logic_vector(7 downto 0);
        s: in std_logic_vector(1 downto 0);
        rsd,lsd,clearb,clk: in std_logic;
        y: inout std_logic_vector(7 downto 0)
    );
end shift_register;
architecture test of shift_register_8bits is
    component shiftR is
        port(
            clear, clk, sdr, sdl : in std_logic;
            mode : in std_logic_vector(1 downto 0);
            d : in std_logic_vector(3 downto 0);
            q : inout std_logic_vector(3 downto 0)
        );
    end component;
begin
    S0: shiftR port map(clearb, clk, y(4), lsd, s, x(3 downto 0), y(3 downto 0));
    S1: shiftR port map(clearb, clk, rsd, y(3), s, x(7 downto 4), y(7 downto 4));
end test;
