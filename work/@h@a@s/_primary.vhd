library verilog;
use verilog.vl_types.all;
entity HAS is
    port(
        D_out           : out    vl_logic;
        C_out           : out    vl_logic;
        Cin             : in     vl_logic;
        Qin             : in     vl_logic
    );
end HAS;
