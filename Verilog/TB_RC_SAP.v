`include "RC_SAP.v"

module TB_RC_SAP;
	wire [5 : 0] tstate;
	reg clk, clr;

	RC_SAP counter (clk, clr, tstate);

	initial begin
		clr = 1;
		clk = 0;
		#25 clr = 0;
		#1250 $finish;
	end

	always #50 clk = ~clk;

	always @ (posedge clk) begin
		$display("State: %b", tstate);
	end
endmodule
