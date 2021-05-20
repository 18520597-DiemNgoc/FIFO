library verilog;
use verilog.vl_types.all;
entity D_FF is
    port(
        Q               : out    vl_logic;
        Din             : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end D_FF;
