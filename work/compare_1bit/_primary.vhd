library verilog;
use verilog.vl_types.all;
entity compare_1bit is
    port(
        \Out\           : out    vl_logic;
        I0              : in     vl_logic;
        I1              : in     vl_logic
    );
end compare_1bit;
