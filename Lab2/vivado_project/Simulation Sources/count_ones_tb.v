`timescale 1ns / 1ps
//--------------------------------------------------------------------------
//  CS/ECE-UY 2204  Digital Logic   -   Lab 2, Question 2
//
//  Checks your looped and unlooped bit-counters against each other and
//  against the expected count, over all 256 possible input values.
//
//  Your two modules must be named exactly:
//      count_ones          (built with an always @(*) block and a for loop)
//      count_ones_noloop   (built with one continuous assignment, no loop)
//
//  and each must have the ports:
//      input  [7:0] in
//      output [3:0] count
//
//  NOTE:  the for loop below really does iterate, once per simulation step.
//         The for loop inside your always @(*) block does not.  Make sure
//         you can explain the difference.
//
//  Do not modify this file.
//--------------------------------------------------------------------------

module count_ones_tb();

    reg  [7:0] in;
    reg  [3:0] expected;

    wire [3:0] c_loop;
    wire [3:0] c_noloop;

    integer i;
    integer b;
    integer e_loop;
    integer e_noloop;

    // ---------------- devices under test ----------------
    count_ones        dut_loop   (.in(in), .count(c_loop));
    count_ones_noloop dut_noloop (.in(in), .count(c_noloop));

    initial begin
        e_loop   = 0;
        e_noloop = 0;

        $display("");
        $display("=== Lab 2, Question 2 : sweeping all 256 input values ===");
        $display("");

        for (i = 0; i < 256; i = i + 1) begin
            in = i;               // 32-bit i truncates into the 8-bit input
            #5;

            expected = 0;
            for (b = 0; b < 8; b = b + 1)
                expected = expected + in[b];

            if (c_loop !== expected) begin
                e_loop = e_loop + 1;
                if (e_loop <= 4)
                    $display("  count_ones        : in=%b  got=%0d  want=%0d",
                             in, c_loop, expected);
            end

            if (c_noloop !== expected) begin
                e_noloop = e_noloop + 1;
                if (e_noloop <= 4)
                    $display("  count_ones_noloop : in=%b  got=%0d  want=%0d",
                             in, c_noloop, expected);
            end
        end

        // ---------------- summary ----------------
        $display("");
        if (e_loop   == 0) $display("  count_ones        : PASS");
        else               $display("  count_ones        : FAIL  (%0d of 256 wrong)", e_loop);

        if (e_noloop == 0) $display("  count_ones_noloop : PASS");
        else               $display("  count_ones_noloop : FAIL  (%0d of 256 wrong)", e_noloop);

        $display("");
        if (e_loop == 0 && e_noloop == 0)
            $display("=== BOTH IMPLEMENTATIONS PASS ===");
        else
            $display("=== ONE OR BOTH IMPLEMENTATIONS FAILED ===");
        $display("");

        $finish;
    end

endmodule
