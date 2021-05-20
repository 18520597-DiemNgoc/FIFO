library verilog;
use verilog.vl_types.all;
entity Counter is
    port(
        Q               : out    vl_logic_vector(9 downto 0);
        Out_MSB         : out    vl_logic;
        E               : in     vl_logic;
        Reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end Counter;
