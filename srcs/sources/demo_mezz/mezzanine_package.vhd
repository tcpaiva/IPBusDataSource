library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mezzanine_package is

    --type array84x32 is array(83 downto 0) of std_logic_vector(31 downto 0);
    type array127x32 is array(126 downto 0) of std_logic_vector(31 downto 0);
    type array151x32 is array(150 downto 0) of std_logic_vector(31 downto 0);
    type array8x32 is array( 7 downto 0) of std_logic_vector(31 downto 0);
    type array32x32 is array(31 downto 0) of std_logic_vector(31 downto 0);
    --type array84x20 is array(83 downto 0) of std_logic_vector(19 downto 0);
    type array127x20 is array(126 downto 0) of std_logic_vector(19 downto 0);
    type array151x20 is array(150 downto 0) of std_logic_vector(19 downto 0);
    type array32x20 is array(31 downto 0) of std_logic_vector(19 downto 0);
    type array8x20 is array(7 downto 0) of std_logic_vector(19 downto 0);
	type array8x8 is array(7 downto 0) of std_logic_vector(7 downto 0);
	type match_array is array (31 downto 0) of std_logic_vector( 7 downto 0);
	type pattern_address_array is array (3 downto 0) of std_logic_vector( 4 downto 0);
	type match_rev_array is array ( 7 downto 0) of std_logic_vector(31 downto 0);

    constant IDENTITY: std_logic_vector(31 downto 0) := X"DEADBEEF";
    constant VERSION:  std_logic_vector(31 downto 0) := X"00000001";

    -- 32 bit address map

    constant CONTROL_OFFSET:  std_logic_vector(19 downto 0) := X"00000";
    constant GOREG_OFFSET:    std_logic_vector(19 downto 0) := X"00001";
    constant FIRMWARE_OFFSET: std_logic_vector(19 downto 0) := X"00002";
    constant IDENTITY_OFFSET: std_logic_vector(19 downto 0) := X"00003";
    constant TESTREG_OFFSET:  std_logic_vector(19 downto 0) := X"00004";
    constant TESTREG2_OFFSET:  std_logic_vector(19 downto 0) := X"00005";

    -- power registers

    constant POWER_DVDD_OFFSET: std_logic_vector(19 downto 0) := X"00100";
    constant POWER_VDD_OFFSET:  std_logic_vector(19 downto 0) := X"00103";
    constant POWER_VPRE_OFFSET: std_logic_vector(19 downto 0) := X"00106";

    constant POWER_STAT_OFFSET: std_logic_vector(19 downto 0) := X"0010B";
    constant POWER_VCC_OFFSET:  std_logic_vector(19 downto 0) := X"0010A";
    constant POWER_TEMP_OFFSET: std_logic_vector(19 downto 0) := X"00109";

    constant POWER_VDVDD_OFFSET: std_logic_vector(19 downto 0) := X"00101";
    constant POWER_VVDD_OFFSET:  std_logic_vector(19 downto 0) := X"00104";
    constant POWER_VVPRE_OFFSET: std_logic_vector(19 downto 0) := X"00107";

    constant POWER_IDVDD_OFFSET: std_logic_vector(19 downto 0) := X"00102";
    constant POWER_IVDD_OFFSET:  std_logic_vector(19 downto 0) := X"00105";
    constant POWER_IVPRE_OFFSET: std_logic_vector(19 downto 0) := X"00108";

    constant LEDs_OFFSET:  std_logic_vector(19 downto 0) := X"0010C";
    constant AM_PATTERN_LOAD_OFFSET:  std_logic_vector(19 downto 0) := X"0010D";
    constant AM_PATTERN_MATCH_OFFSET:  std_logic_vector(19 downto 0) := X"0010E";
    constant AM_MODE_OFFSET:  std_logic_vector(19 downto 0) := X"0010F";


    constant MMCM_OFFSET: std_logic_vector(19 downto 0) := "0000000000100-------";  -- clock config registers: 0x200-0x27F

    --constant OVEC_OFFSET: array127x20 := ( 
    constant OVEC_OFFSET: array151x20 := ( 
		-- output channel 0 output vector buffer address (size = 1024 = 0x3FF)
        "0000000100----------",
        "0000001000----------", 
        "0000001100----------",
        "0000010000----------",
        "0000010100----------",
        "0000011000----------",
        "0000011100----------",
        "0000100000----------",
        "0000100100----------",
        "0000101000----------",
        "0000101100----------",
        "0000110000----------",
        "0000110100----------",
        "0000111000----------",
        "0000111100----------",
        "0001000000----------",
        "0001000100----------",
        "0001001000----------",
        "0001001100----------",
        "0001010000----------",
        "0001010100----------",
        "0001011000----------",
        "0001011100----------",
        "0001100000----------",
        "0001100100----------",
        "0001101000----------",
        "0001101100----------",
        "0001110000----------",
        "0001110100----------",
        "0001111000----------",
        "0001111100----------",
        "0010000000----------",
        "0010000100----------",
        "0010001000----------",
        "0010001100----------",
        "0010010000----------",
        "0010010100----------",
        "0010011000----------",
        "0010011100----------",
        "0010100000----------",
        "0010100100----------",
        "0010101000----------",
        "0010101100----------",
        "0010110000----------",
        "0010110100----------",
        "0010111000----------",
        "0010111100----------",
        "0011000000----------",
        "0011000100----------",
        "0011001000----------",
        "0011001100----------",
        "0011010000----------",
        "0011010100----------",
        "0011011000----------",
        "0011011100----------",
        "0011100000----------",
        "0011100100----------",
        "0011101000----------",
        "0011101100----------",
        "0011110000----------",
        "0011110100----------",
        "0011111000----------",
        "0011111100----------",
        "0100000000----------",
        "0100000100----------",
        "0100001000----------",
        "0100001100----------",
        "0100010000----------",
        "0100010100----------",
        "0100011000----------",
        "0100011100----------",
        "0100100000----------",
        "0100100100----------",
        "0100101000----------",
        "0100101100----------",
        "0100110000----------",
        "0100110100----------",
        "0100111000----------",
        "0100111100----------",
        "0101000000----------",
        "0101000100----------",
        "0101001000----------", 
        "0101001100----------",
        "0101010000----------",
        "0101010100----------",
        "0101011000----------",
        "0101011100----------",
        "0101100000----------",
        "0101100100----------",
        "0101101000----------",
        "0101101100----------",
        "0101110000----------",
        "0101110100----------",
        "0101111000----------",
        "0101111100----------",
        "0110000000----------",
        "0110000100----------",
        "0110001000----------",
        "0110001100----------",
        "0110010000----------",
        "0110010100----------",
        "0110011000----------",
        "0110011100----------",
        "0110100000----------",
        "0110100100----------",
        "0110101000----------",
        "0110101100----------",
        "0110110000----------",
        "0110110100----------",
        "0110111000----------",
        "0110111100----------",
        "0111000000----------",
        "0111000100----------",
        "0111001000----------",
        "0111001100----------",
        "0111010000----------",
        "0111010100----------",
        "0111011000----------",
        "0111011100----------",
        "0111100000----------",
        "0111100100----------",
        "0111101000----------",
        "0111101100----------",
        "0111110000----------",
        "0111110100----------",
        "0111111000----------",
        "0111111100----------",
        "1000000000----------",
        "1000000100----------",
        "1000001000----------",
        "1000001100----------",
        "1000010000----------",
        "1000010100----------",
        "1000011000----------",
        "1000011100----------",
        "1000100000----------",
        "1000100100----------",
        "1000101000----------",
        "1000101100----------",
        "1000110000----------",
        "1000110100----------",
        "1000111000----------",
        "1000111100----------",
        "1001000000----------",
        "1001000100----------",
        "1001001000----------",
        "1001001100----------",
        "1001010000----------",
        "1001010100----------",
        "1001011000----------",
        "1001011100----------"
	);

    constant IVEC_OFFSET: array8x20 := (
				   -- input channel 0 vector buffer base address (len=1024=0x3FF)
        "1001100000----------",
        "1001100100----------",
        "1001101000----------",
        "1001101100----------",
        "1001110000----------",
        "1001110100----------",
        "1001111000----------",
        "1001111100----------"
	);

end package;

