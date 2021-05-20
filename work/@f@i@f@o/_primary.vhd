library verilog;
use verilog.vl_types.all;
entity FIFO is
    generic(
        n               : integer := 8
    );
    port(
        \INOUT\         : inout  vl_logic_vector;
        EMPTY           : out    vl_logic;
        FULL            : out    vl_logic;
        EN              : in     vl_logic;
        READ_WRITE      : in     vl_logic;
        RESET           : in     vl_logic;
        CLK             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end FIFO;
