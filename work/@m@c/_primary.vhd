library verilog;
use verilog.vl_types.all;
entity MC is
    port(
        Out_MC          : out    vl_logic;
        In_MC           : in     vl_logic;
        RowSel          : in     vl_logic;
        WrEn            : in     vl_logic
    );
end MC;
