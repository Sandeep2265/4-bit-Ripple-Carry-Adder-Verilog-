`timescale 1ns/100ps

module adder (
    output sum, output cout,
    input a, input b, input cin
);
    wire nand_ab, a_nand_ab, b_nand_ab;
    wire xor_ab, nand_ab_cin;
    wire ab_nand_ab_cin, cin_nand_ab_cin;

    nand #1 nand_ab_gate(nand_ab, a, b);
    nand #1 a_nand_ab_gate(a_nand_ab, a, nand_ab);
    nand #1 b_nand_ab_gate(b_nand_ab, b, nand_ab);
    nand #1 xor_ab_gate(xor_ab, a_nand_ab, b_nand_ab);

    nand #1 nand_xorab_cin_gate(nand_ab_cin, xor_ab, cin);
    nand #1 ab_nand_ab_cin_gate(ab_nand_ab_cin, xor_ab, nand_ab_cin);
    nand #1 cin_nand_ab_cin_gate(cin_nand_ab_cin, cin, nand_ab_cin);

    nand #1 sum_gate(sum, ab_nand_ab_cin, cin_nand_ab_cin);
    nand #1 nandgate2(cout, nand_ab, nand_ab_cin);
endmodule

module circuit (
    output [3:0] SUM, output OVERFLOW,
    input [3:0] A, input [3:0] B, input cin
);
    wire [3:0] c;
    adder a0(SUM[0], c[0], A[0], B[0], cin);
    adder a1(SUM[1], c[1], A[1], B[1], c[0]);
    adder a2(SUM[2], c[2], A[2], B[2], c[1]);
    adder a3(SUM[3], c[3], A[3], B[3], c[2]);
    assign OVERFLOW = c[3];
endmodule
