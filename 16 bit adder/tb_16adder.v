module tb_16adder();
reg [15:0]X;
reg [15:0]Y;
wire [15:0]Z;
wire Sign,Zero,Carry,Parity,Overflow;
adder16 DUT(X,Y,Z,Sign,Zero,Carry,Parity,Overflow);
initial 
begin
	$dumpfile("alu.vcd");
	$dumpvars(0,tb_16adder);
	$monitor($time," X= %h, Y= %h, Z=%h, Sign= %b, Zero= %b, Carry= %b, Parity= %b, Overflow= %b",X,Y,Z,Sign,Zero,Carry,Parity,Overflow);
	#5 X=16'h8fff; Y=16'h8000;
	#5 X=16'hfffe; Y=16'h0002;
	#5 X=16'hAAAA; Y=16'h5555;
	#5 $finish;
end
endmodule
