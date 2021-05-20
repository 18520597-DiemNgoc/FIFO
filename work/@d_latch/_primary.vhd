library verilog;
use verilog.vl_types.all;
entity D_latch is
    port(
        Q_latch         : out    vl_logic;
        Qn_latch        : out    vl_logic;
        Din_latch       : in     vl_logic;
        clk_d           : in     vl_logic
    );
end D_latch;
