module B_SAP
	(
		input clk, lb,
		input [7 : 0] fromBus,
		output reg [7 : 0] toALU
	);

	always @ (posedge clk)
		if(lb) toALU <= fromBus;
endmodule
