library verilog;
use verilog.vl_types.all;
entity Decoder4to16 is
    port(
        Out4_Dec        : out    vl_logic_vector(15 downto 0);
        In4_Dec         : in     vl_logic_vector(3 downto 0);
        EN              : in     vl_logic
    );
end Decoder4to16;
