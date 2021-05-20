library verilog;
use verilog.vl_types.all;
entity Decoder3to8 is
    port(
        Out3_Dec        : out    vl_logic_vector(7 downto 0);
        In3_Dec         : in     vl_logic_vector(2 downto 0);
        EN              : in     vl_logic
    );
end Decoder3to8;
