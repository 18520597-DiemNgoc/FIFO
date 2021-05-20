library verilog;
use verilog.vl_types.all;
entity WORD is
    port(
        OUT_Word        : out    vl_logic_vector(7 downto 0);
        IN_Word         : in     vl_logic_vector(7 downto 0);
        WriteEn         : in     vl_logic;
        Row             : in     vl_logic
    );
end WORD;
