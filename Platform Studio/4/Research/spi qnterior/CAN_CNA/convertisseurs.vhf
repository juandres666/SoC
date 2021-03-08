--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : convertisseurs.vhf
-- /___/   /\     Timestamp : 07/23/2014 10:58:11
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl D:/stage/test_ADC/convertisseurs.vhf -w D:/stage/test_ADC/convertisseurs.sch
--Design Name: convertisseurs
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity convertisseurs is
   port ( can_on          : in    std_logic; 
          clk             : in    std_logic; 
          cna_on          : in    std_logic; 
          cna0            : in    std_logic_vector (11 downto 0); 
          rst             : in    std_logic; 
          spi_miso        : in    std_logic; 
          ad_conv         : out   std_logic; 
          amp_cs          : out   std_logic; 
          amp_shdn        : out   std_logic; 
          can0            : out   std_logic_vector (13 downto 0); 
          dac_clr         : out   std_logic; 
          dac_cs          : out   std_logic; 
          fin_can         : out   std_logic; 
          fin_cna         : out   std_logic; 
          fpga_init_b     : out   std_logic; 
          sf_ce0          : out   std_logic; 
          spi_miso_signal : out   std_logic; 
          spi_mosi        : out   std_logic; 
          spi_sck         : out   std_logic; 
          spi_ss_b        : out   std_logic);
end convertisseurs;

architecture BEHAVIORAL of convertisseurs is
   attribute BOX_TYPE   : string ;
   signal en_amp          : std_logic;
   signal en_can          : std_logic;
   signal en_cna          : std_logic;
   signal fin_amp         : std_logic;
   signal iamp_spi_mosi   : std_logic;
   signal iamp_spi_sck    : std_logic;
   signal ican_spi_sck    : std_logic;
   signal icna_spi_mosi   : std_logic;
   signal icna_spi_sck    : std_logic;
   signal XLXN_139        : std_logic;
   signal XLXN_140        : std_logic;
   signal fin_can_DUMMY   : std_logic;
   signal fin_cna_DUMMY   : std_logic;
   component can_cna_commande
      port ( clk           : in    std_logic; 
             rst           : in    std_logic; 
             ispi_ss_b     : in    std_logic; 
             isf_ce0       : in    std_logic; 
             ifpga_init_b  : in    std_logic; 
             fin_amp       : in    std_logic; 
             fin_can       : in    std_logic; 
             fin_cna       : in    std_logic; 
             iamp_spi_sck  : in    std_logic; 
             ican_spi_sck  : in    std_logic; 
             icna_spi_sck  : in    std_logic; 
             iamp_spi_mosi : in    std_logic; 
             icna_spi_mosi : in    std_logic; 
             can_on        : in    std_logic; 
             cna_on        : in    std_logic; 
             spi_mosi      : out   std_logic; 
             spi_sck       : out   std_logic; 
             spi_ss_b      : out   std_logic; 
             sf_ce0        : out   std_logic; 
             en_can        : out   std_logic; 
             en_cna        : out   std_logic; 
             en_amp        : out   std_logic; 
             fpga_init_b   : out   std_logic);
   end component;
   
   component amplificateurs
      port ( clk      : in    std_logic; 
             rst      : in    std_logic; 
             en_amp   : in    std_logic; 
             spi_mosi : out   std_logic; 
             amp_cs   : out   std_logic; 
             spi_sck  : out   std_logic; 
             amp_shdn : out   std_logic; 
             fin_amp  : out   std_logic);
   end component;
   
   component can
      port ( clk             : in    std_logic; 
             rst             : in    std_logic; 
             spi_miso        : in    std_logic; 
             en_can          : in    std_logic; 
             spi_miso_signal : out   std_logic; 
             spi_sck         : out   std_logic; 
             ad_conv         : out   std_logic; 
             fin_can         : out   std_logic; 
             can0            : out   std_logic_vector (13 downto 0); 
             can1            : out   std_logic_vector (13 downto 0));
   end component;
   
   component cna
      port ( clk      : in    std_logic; 
             rst      : in    std_logic; 
             en_cna   : in    std_logic; 
             data     : in    std_logic_vector (11 downto 0); 
             spi_mosi : out   std_logic; 
             dac_cs   : out   std_logic; 
             spi_sck  : out   std_logic; 
             dac_clr  : out   std_logic; 
             fin_cna  : out   std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   fin_can <= fin_can_DUMMY;
   fin_cna <= fin_cna_DUMMY;
   XLXI_1 : can_cna_commande
      port map (can_on=>can_on,
                clk=>clk,
                cna_on=>cna_on,
                fin_amp=>fin_amp,
                fin_can=>fin_can_DUMMY,
                fin_cna=>fin_cna_DUMMY,
                iamp_spi_mosi=>iamp_spi_mosi,
                iamp_spi_sck=>iamp_spi_sck,
                ican_spi_sck=>ican_spi_sck,
                icna_spi_mosi=>icna_spi_mosi,
                icna_spi_sck=>icna_spi_sck,
                ifpga_init_b=>XLXN_139,
                isf_ce0=>XLXN_140,
                ispi_ss_b=>XLXN_140,
                rst=>rst,
                en_amp=>en_amp,
                en_can=>en_can,
                en_cna=>en_cna,
                fpga_init_b=>fpga_init_b,
                sf_ce0=>sf_ce0,
                spi_mosi=>spi_mosi,
                spi_sck=>spi_sck,
                spi_ss_b=>spi_ss_b);
   
   XLXI_2 : amplificateurs
      port map (clk=>clk,
                en_amp=>en_amp,
                rst=>rst,
                amp_cs=>amp_cs,
                amp_shdn=>amp_shdn,
                fin_amp=>fin_amp,
                spi_mosi=>iamp_spi_mosi,
                spi_sck=>iamp_spi_sck);
   
   XLXI_3 : can
      port map (clk=>clk,
                en_can=>en_can,
                rst=>rst,
                spi_miso=>spi_miso,
                ad_conv=>ad_conv,
                can0(13 downto 0)=>can0(13 downto 0),
                can1=>open,
                fin_can=>fin_can_DUMMY,
                spi_miso_signal=>spi_miso_signal,
                spi_sck=>ican_spi_sck);
   
   XLXI_4 : cna
      port map (clk=>clk,
                data(11 downto 0)=>cna0(11 downto 0),
                en_cna=>en_cna,
                rst=>rst,
                dac_clr=>dac_clr,
                dac_cs=>dac_cs,
                fin_cna=>fin_cna_DUMMY,
                spi_mosi=>icna_spi_mosi,
                spi_sck=>icna_spi_sck);
   
   XLXI_12 : VCC
      port map (P=>XLXN_140);
   
   XLXI_13 : GND
      port map (G=>XLXN_139);
   
end BEHAVIORAL;


