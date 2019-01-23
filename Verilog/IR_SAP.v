module IR_SAP
	(
		input clk, clr, li, ei,
		input [7 : 0] in,
		output [3 : 0] tobus,
		output reg [3 : 0] tocs
	);

	reg [3 : 0] temp;

	TRI_STATE #(4) bus (temp, ei, tobus);

	always @ (posedge clk, posedge clr)
		if(clr) {tocs, temp} <= 8'h00;
		else if(li) {tocs, temp} <= in;
endmodule
