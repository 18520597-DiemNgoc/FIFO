library verilog;
use verilog.vl_types.all;
entity MUX2to1_nbit is
    generic(
        n               : integer := 10
    );
    port(
        Y               : out    vl_logic_vector;
        I0              : in     vl_logic_vector;
        I1              : in     vl_logic_vector;
        Sel             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end MUX2to1_nbit;
