`timescale 1ns / 1ps
//--------------------------------------------------------------------------
//  CS/ECE-UY 2204  Digital Logic   -   Lab 2, Question 1
//
//  Checks all four of your pin_match implementations against the
//  specification, over all 256 possible input values.
//
//  Your four modules must be named exactly:
//      pin_match_assign    pin_match_cond    pin_match_if    pin_match_case
//
//  and each must have the ports:
//      input  [7:0] user_in
//      output       door_unlock
//
//  Do not modify this file.
//--------------------------------------------------------------------------

module pin_match_compare_tb();

    reg  [7:0] user_in;
    reg        expected;

    wire       d_assign;
    wire       d_cond;
    wire       d_if;
    wire       d_case;

    integer i;
    integer e_assign;
    integer e_cond;
    integer e_if;
    integer e_case;

    // ---------------- devices under test ----------------
    pin_match_assign dut_assign (.user_in(user_in), .door_unlock(d_assign));
    pin_match_cond   dut_cond   (.user_in(user_in), .door_unlock(d_cond));
    pin_match_if     dut_if     (.user_in(user_in), .door_unlock(d_if));
    pin_match_case   dut_case   (.user_in(user_in), .door_unlock(d_case));

    initial begin
        e_assign = 0;
        e_cond   = 0;
        e_if     = 0;
        e_case   = 0;

        $display("");
        $display("=== Lab 2, Question 1 : sweeping all 256 input values ===");
        $display("");

        for (i = 0; i < 256; i = i + 1) begin
            user_in = i;          // 32-bit i truncates into the 8-bit input
            #5;

            expected = (user_in == 8'h8d) ||
                       (user_in == 8'h74) ||
                       (user_in == 8'h34);

            if (d_assign !== expected) begin
                e_assign = e_assign + 1;
                if (e_assign <= 4)
                    $display("  pin_match_assign : in=%02h  got=%b  want=%b",
                             user_in, d_assign, expected);
            end

            if (d_cond !== expected) begin
                e_cond = e_cond + 1;
                if (e_cond <= 4)
                    $display("  pin_match_cond   : in=%02h  got=%b  want=%b",
                             user_in, d_cond, expected);
            end

            if (d_if !== expected) begin
                e_if = e_if + 1;
                if (e_if <= 4)
                    $display("  pin_match_if     : in=%02h  got=%b  want=%b",
                             user_in, d_if, expected);
            end

            if (d_case !== expected) begin
                e_case = e_case + 1;
                if (e_case <= 4)
                    $display("  pin_match_case   : in=%02h  got=%b  want=%b",
                             user_in, d_case, expected);
            end
        end

        // ---------------- summary ----------------
        $display("");
        if (e_assign == 0) $display("  pin_match_assign : PASS");
        else               $display("  pin_match_assign : FAIL  (%0d of 256 wrong)", e_assign);

        if (e_cond   == 0) $display("  pin_match_cond   : PASS");
        else               $display("  pin_match_cond   : FAIL  (%0d of 256 wrong)", e_cond);

        if (e_if     == 0) $display("  pin_match_if     : PASS");
        else               $display("  pin_match_if     : FAIL  (%0d of 256 wrong)", e_if);

        if (e_case   == 0) $display("  pin_match_case   : PASS");
        else               $display("  pin_match_case   : FAIL  (%0d of 256 wrong)", e_case);

        $display("");
        if (e_assign == 0 && e_cond == 0 && e_if == 0 && e_case == 0)
            $display("=== ALL FOUR IMPLEMENTATIONS PASS ===");
        else
            $display("=== ONE OR MORE IMPLEMENTATIONS FAILED ===");
        $display("");

        $finish;
    end

endmodule
