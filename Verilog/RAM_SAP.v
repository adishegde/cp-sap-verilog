module RAM_SAP
	(
		input ce,
		input [3 : 0] fromMAR,
		output [7 : 0] toBus
	);

	wire [7 : 0] mem[15 : 0];

	assign mem[0] = 8'h19;
	assign mem[9] = 8'hFF;
	
	TRI_STATE bus (mem[fromMAR], ce, toBus);
endmodule
