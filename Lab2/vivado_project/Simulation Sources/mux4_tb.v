`timescale 1ns / 1ps
//--------------------------------------------------------------------------
//  CS/ECE-UY 2204  Digital Logic   -   Lab 2, Question 3
//
//  Instantiates your mux4 twice, once at WIDTH = 8 and once at WIDTH = 1,
//  and checks both against the expected selection.
//
//  Your modules must be named exactly:
//      mux2   #(parameter WIDTH = 8)   ports:  a, b, s, y
//      mux4   #(parameter WIDTH = 8)   ports:  d0, d1, d2, d3, sel, y
//
//  mux4 must be built from THREE instances of mux2.
//
//  Do not modify this file.
//--------------------------------------------------------------------------

module mux4_tb();

    // -------- WIDTH = 8 --------
    reg  [7:0] d0_8, d1_8, d2_8, d3_8;
    wire [7:0] y_8;
    reg  [7:0] exp_8;

    // -------- WIDTH = 1 --------
    reg        d0_1, d1_1, d2_1, d3_1;
    wire       y_1;
    reg        exp_1;

    reg  [1:0] sel;

    integer t;
    integer i;
    integer e_8;
    integer e_1;

    // ---------------- devices under test ----------------
    mux4 #(.WIDTH(8)) dut8 (
        .d0(d0_8), .d1(d1_8), .d2(d2_8), .d3(d3_8), .sel(sel), .y(y_8)
    );

    mux4 #(.WIDTH(1)) dut1 (
        .d0(d0_1), .d1(d1_1), .d2(d2_1), .d3(d3_1), .sel(sel), .y(y_1)
    );

    initial begin
        e_8 = 0;
        e_1 = 0;

        $display("");
        $display("=== Lab 2, Question 3 : mux4 at WIDTH=8 and WIDTH=1 ===");
        $display("");

        for (t = 0; t < 32; t = t + 1) begin

            d0_8 = $random;  d1_8 = $random;  d2_8 = $random;  d3_8 = $random;
            d0_1 = $random;  d1_1 = $random;  d2_1 = $random;  d3_1 = $random;

            for (i = 0; i < 4; i = i + 1) begin
                sel = i;          // 32-bit i truncates into the 2-bit select
                #5;

                case (sel)
                    2'd0: begin exp_8 = d0_8; exp_1 = d0_1; end
                    2'd1: begin exp_8 = d1_8; exp_1 = d1_1; end
                    2'd2: begin exp_8 = d2_8; exp_1 = d2_1; end
                    2'd3: begin exp_8 = d3_8; exp_1 = d3_1; end
                endcase

                if (y_8 !== exp_8) begin
                    e_8 = e_8 + 1;
                    if (e_8 <= 4)
                        $display("  WIDTH=8 : sel=%0d  got=%02h  want=%02h",
                                 sel, y_8, exp_8);
                end

                if (y_1 !== exp_1) begin
                    e_1 = e_1 + 1;
                    if (e_1 <= 4)
                        $display("  WIDTH=1 : sel=%0d  got=%b  want=%b",
                                 sel, y_1, exp_1);
                end
            end
        end

        // ---------------- summary ----------------
        $display("");
        if (e_8 == 0) $display("  mux4 at WIDTH = 8 : PASS");
        else          $display("  mux4 at WIDTH = 8 : FAIL  (%0d of 128 wrong)", e_8);

        if (e_1 == 0) $display("  mux4 at WIDTH = 1 : PASS");
        else          $display("  mux4 at WIDTH = 1 : FAIL  (%0d of 128 wrong)", e_1);

        $display("");
        if (e_8 == 0 && e_1 == 0)
            $display("=== BOTH WIDTHS PASS ===");
        else
            $display("=== ONE OR BOTH WIDTHS FAILED ===");
        $display("");

        $finish;
    end

endmodule
