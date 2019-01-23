module RC_SAP
	(
		input clk, clr,
		output reg [5 : 0] T
	);

	always @ (negedge clk, posedge clr) begin
		if(clr) T = 6'b000000;
		else if(T == 6'b000000) T[0] = 1'b1;
		else if(T == 6'b100000) T = 6'b000001;
		else T = T << 1;
	end
endmodule
