library verilog;
use verilog.vl_types.all;
entity Decoder2to4 is
    port(
        Out_De0         : out    vl_logic;
        Out_De1         : out    vl_logic;
        Out_De2         : out    vl_logic;
        Out_De3         : out    vl_logic;
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        En              : in     vl_logic
    );
end Decoder2to4;
