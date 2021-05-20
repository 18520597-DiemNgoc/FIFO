library verilog;
use verilog.vl_types.all;
entity TestBench is
    generic(
        n               : integer := 8;
        t               : integer := 20
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of t : constant is 1;
end TestBench;
