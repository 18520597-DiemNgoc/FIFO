library verilog;
use verilog.vl_types.all;
entity RAM is
    port(
        \INOUT\         : inout  vl_logic_vector(7 downto 0);
        IN_DEC          : in     vl_logic_vector(9 downto 0);
        EN              : in     vl_logic;
        RWS             : in     vl_logic;
        CS              : in     vl_logic;
        clk             : in     vl_logic
    );
end RAM;
