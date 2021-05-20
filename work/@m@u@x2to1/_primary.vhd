library verilog;
use verilog.vl_types.all;
entity MUX2to1 is
    port(
        Y               : out    vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic;
        Sel             : in     vl_logic
    );
end MUX2to1;
