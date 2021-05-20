library verilog;
use verilog.vl_types.all;
entity Decoder8to256 is
    port(
        Out8_Dec        : out    vl_logic_vector(255 downto 0);
        In8_Dec         : in     vl_logic_vector(7 downto 0);
        EN              : in     vl_logic
    );
end Decoder8to256;
