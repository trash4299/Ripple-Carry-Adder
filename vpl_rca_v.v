module vpl_rca_v(s, Cout, x, y, As_Sel);
	output Cout;
	output [3:0] s;
	input [3:0] x,y;
	input As_Sel;
	
	xor(d0,y[0],As_Sel);
	xor(d1,y[1],As_Sel);
	xor(d2,y[2],As_Sel);
	xor(d3,y[3],As_Sel);
	
	vpl_fa_v FA1(s[0],c1,x[0],d0,As_Sel),
		FA2(s[1],c2,x[1],d1,c1),
		FA3(s[2],c3,x[2],d2,c2),
		FA4(s[3],Cout,x[3],d3,c3);

endmodule

module vpl_fa_v (s, Cout, x, y, Cin);
	input Cin, x, y;
	output s, Cout;
	wire z1,z2,z3,z4;
	
		xor (z1, x, y);
		xor (s, Cin, z1);
		and (z2, x, y);
		and (z3, x, Cin);
		and (z4, y, Cin);
		or (Cout, z2, z3, z4);
		
endmodule

