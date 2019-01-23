module OUT_SAP
	(
		input clk, lo,
		input [7 : 0] fromBus,
		output reg [7 : 0] out
	);

	always @ (posedge clk)
		if(lo) out <= fromBus;
endmodule
