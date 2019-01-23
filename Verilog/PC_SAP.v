module PC_SAP
	(
		input clk, clr, cp, ep,
		output [3 : 0] toBUS
	);

	reg [3 : 0] counter;
	TRI_STATE #(4) bus (counter, ep, toBUS);

	always @ (posedge clk, posedge clr)
		if(clr) counter <= 4'h0;
		else if(cp) counter <= counter + 1;
endmodule
