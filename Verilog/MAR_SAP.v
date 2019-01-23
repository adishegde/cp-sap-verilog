module MAR_SAP
	(
		input clk, lm,
		input [3 : 0] fromBus,
		output reg [3 : 0] toRAM
	);

	always @ (posedge clk)
		if(lm) toRAM <= fromBus;
endmodule
