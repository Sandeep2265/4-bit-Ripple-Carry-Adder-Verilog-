`timescale 1ns/100ps

module testbench;
    reg [3:0] A, B;
    reg cin;
    wire [3:0] SUM;
    wire OVERFLOW;

    circuit uut (
        .A(A), .B(B), .cin(cin),
        .SUM(SUM), .OVERFLOW(OVERFLOW)
    );

    initial begin
        A = 4'b0000; B = 4'b0000; cin = 0; #10;
        $display("Test 1: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        A = 4'b1001; B = 4'b0111; cin = 0; #10;
        $display("Test 2: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        A = 4'b1000; B = 4'b1001; cin = 0; #10;
        $display("Test 3: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        A = 4'b1110; B = 4'b1011; cin = 0; #10;
        $display("Test 4: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        A = 4'b1011; B = 4'b1000; cin = 0; #10;
        $display("Test 5: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        A = 4'b1011; B = 4'b1001; cin = 0; #10;
        $display("Test 6: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        A = 4'b1111; B = 4'b1000; cin = 0; #10;
        $display("Test 7: A=%b B=%b SUM=%b OVERFLOW=%b", A, B, SUM, OVERFLOW);

        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);
    end
endmodule
