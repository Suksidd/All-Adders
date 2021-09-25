module adder16(X,Y,Z,Sign,Zero,Carry,Parity,Overflow);
input [15:0]X;
input [15:0]Y;
output [15:0]Z;
output Sign,Zero,Carry,Parity,Overflow;
wire c[3:1];

assign Sign = Z[15];
assign Zero = ~|Z;
assign Parity = ~^Z;
assign Overflow = (X[15] & Y[15] & ~Z[15]) | (~X[15] & ~Y[15] & Z[15]);

adder4 A1(Z[3:0],c[1],X[3:0],Y[3:0],1'b0);
adder4 A2(Z[7:4],c[2],X[7:4],Y[7:4],c[1]);
adder4 A3(Z[11:8],c[3],X[11:8],Y[11:8],c[2]);
adder4 A4(Z[15:12],Carry,X[15:12],Y[15:12],c[3]);
endmodule

module adder4(Sum,Cout,A,B,Cin);
input [3:0]A,B;
input Cin;
output [3:0]Sum;
output Cout;
wire c[3:1], p[3:0], g[3:0];

assign p[0]=A[0]^B[0], p[1]=A[1]^B[1], p[2]=A[2]^B[2], p[3]=A[3]^B[3];
assign g[0]=A[0]^B[0], g[1]=A[1]^B[1], g[2]=A[2]^B[2], g[3]=A[3]^B[3];

assign c[1]=g[0] | (p[0]&Cin);
assign c[2]=g[1] | (p[1]&g[0]) | (p[1]&p[0]&Cin);
assign c[3]=g[2] | (p[2]&g[1]) | (p[2]&p[1]&g[0]) | (p[2]&p[1]&p[0]&Cin);
assign Cout=g[3] | (p[2]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]) | (p[3]&p[2]&p[1]&p[0]&Cin);

assign Sum[0]=p[0]^Cin, Sum[1]=p[1]^c[1], Sum[2]=p[2]^c[2], Sum[3]=p[3]^c[3];
endmodule

