module CONTROL_SAP
	(
		input [3 : 0] opcode,
		input clk, clr,
		output reg [11 : 0] cntrlcodes
	);

	wire [5 : 0] tstate;
	RC_SAP counter (clk, clr, tstate);

	always @ (negedge clk) begin
		casez ({tstate, opcode})
			{6'b000000, 4'b????} : cntrlcodes <= 12'h000;
			//T0 state
			{6'b000001, 4'b????} : cntrlcodes <= 12'h600;
			//T1 state
			{6'b000010, 4'b????} : cntrlcodes <= 12'h800;
			//T2 state
			{6'b000100, 4'b????} : cntrlcodes <= 12'h180;

			//LDA T3 state
			{6'b001000, 4'b0000} : cntrlcodes <= 12'h240;
			//LDA T4 state
			{6'b010000, 4'b0000} : cntrlcodes <= 12'h120;
			//LDA T5 state
			{6'b100000, 4'b0000} : cntrlcodes <= 12'h000;

			//ADD T3 state
			{6'b001000, 4'b0001} : cntrlcodes <= 12'h240;
			//ADD T4 state
			{6'b010000, 4'b0001} : cntrlcodes <= 12'h102;
			//ADD T5 state
			{6'b100000, 4'b0001} : cntrlcodes <= 12'h024;

			//SUB T3 state
			{6'b001000, 4'b0010} : cntrlcodes <= 12'h240;
			//SUB T4 state
			{6'b010000, 4'b0010} : cntrlcodes <= 12'h102;
			//SUB T5 state
			{6'b100000, 4'b0010} : cntrlcodes <= 12'h02C;

			//OUT T3 state
			{6'b001000, 4'b1110} : cntrlcodes <= 12'h011;
			//SUB T4 state
			{6'b010000, 4'b1110} : cntrlcodes <= 12'h000;
			//SUB T5 state
			{6'b100000, 4'b1110} : cntrlcodes <= 12'h000;

			//HLT T3 state
			{6'b001000, 4'b1111} : $finish;
		endcase
	end
endmodule
