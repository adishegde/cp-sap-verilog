`include "TRI_STATE.v"
`include "RC_SAP.v"
`include "CONTROL_SAP.v"
`include "IR_SAP.v"
`include "RAM_SAP.v"
`include "MAR_SAP.v"
`include "PC_SAP.v"
`include "ACC_SAP.v"
`include "B_SAP.v"
`include "ALU_SAP.v"
`include "OUT_SAP.v"
`include "SAP.v"

module TB_SAP;
	reg clk, clr;
	SAP sap (clk, clr);

	initial begin
		// $dumpfile("SAP.vcd");
  		// $dumpvars(0, TB_SAP);
		clr = 1;
		clk = 0;

		//Program RAM
		force sap.ram.mem[0] = 8'h09;
		force sap.ram.mem[1] = 8'hE0;
		force sap.ram.mem[2] = 8'h1A;
		force sap.ram.mem[3] = 8'h2B;
		force sap.ram.mem[4] = 8'hE0;
		force sap.ram.mem[5] = 8'hF0;
		force sap.ram.mem[9] = 8'h36;
		force sap.ram.mem[10] = 8'h0F;
		force sap.ram.mem[11] = 8'h0E;

		#100 clr = 0;
	end

	always #50 clk = ~clk;
endmodule
