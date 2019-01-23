module TRI_STATE
	#(parameter w = 8)
	(input [w-1 : 0] i, input en, output [w-1 : 0] o);

	assign o = en ? i : 'bz;
endmodule
