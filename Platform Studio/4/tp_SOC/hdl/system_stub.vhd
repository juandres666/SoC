-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    clock_generator_0_CLKIN_pin : in std_logic;
    clock_generator_0_RST_pin : in std_logic;
    xps_gpio_0_GPIO_IO_O_pin : out std_logic_vector(0 to 7);
    xps_gpio_1_GPIO_IO_I_pin : in std_logic_vector(0 to 7);
    xps_spi_0_SPISEL_pin : in std_logic;
    xps_spi_0_SCK_pin : inout std_logic;
    xps_spi_0_MISO_pin : inout std_logic;
    xps_spi_0_MOSI_pin : inout std_logic;
    xps_spi_0_SS_pin : inout std_logic;
    xps_timer_0_PWM0_pin : out std_logic;
    xps_timer_0_GenerateOut0_pin : out std_logic;
    xps_timer_0_GenerateOut1_pin : out std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      clock_generator_0_CLKIN_pin : in std_logic;
      clock_generator_0_RST_pin : in std_logic;
      xps_gpio_0_GPIO_IO_O_pin : out std_logic_vector(0 to 7);
      xps_gpio_1_GPIO_IO_I_pin : in std_logic_vector(0 to 7);
      xps_spi_0_SPISEL_pin : in std_logic;
      xps_spi_0_SCK_pin : inout std_logic;
      xps_spi_0_MISO_pin : inout std_logic;
      xps_spi_0_MOSI_pin : inout std_logic;
      xps_spi_0_SS_pin : inout std_logic;
      xps_timer_0_PWM0_pin : out std_logic;
      xps_timer_0_GenerateOut0_pin : out std_logic;
      xps_timer_0_GenerateOut1_pin : out std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      clock_generator_0_CLKIN_pin => clock_generator_0_CLKIN_pin,
      clock_generator_0_RST_pin => clock_generator_0_RST_pin,
      xps_gpio_0_GPIO_IO_O_pin => xps_gpio_0_GPIO_IO_O_pin,
      xps_gpio_1_GPIO_IO_I_pin => xps_gpio_1_GPIO_IO_I_pin,
      xps_spi_0_SPISEL_pin => xps_spi_0_SPISEL_pin,
      xps_spi_0_SCK_pin => xps_spi_0_SCK_pin,
      xps_spi_0_MISO_pin => xps_spi_0_MISO_pin,
      xps_spi_0_MOSI_pin => xps_spi_0_MOSI_pin,
      xps_spi_0_SS_pin => xps_spi_0_SS_pin,
      xps_timer_0_PWM0_pin => xps_timer_0_PWM0_pin,
      xps_timer_0_GenerateOut0_pin => xps_timer_0_GenerateOut0_pin,
      xps_timer_0_GenerateOut1_pin => xps_timer_0_GenerateOut1_pin
    );

end architecture STRUCTURE;

