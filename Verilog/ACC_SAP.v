module ACC_SAP
	(
		input clk, la, ea,
		input [7 : 0] fromBus,
		output [7 : 0] toBus,
		output reg [7 : 0] toALU
	);

	TRI_STATE bus (toALU, ea, toBus);

	always @ (posedge clk)
		if(la) toALU <= fromBus;
endmodule
