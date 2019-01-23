/*
This is the main SAP module. If 4 bits are input/output to the bus by a module
then only the lower nibble is given as input/output; making the upper nibble to
float.

In case all 8 bits are input/output, the entire bus is given as input/output to
the module.
*/

module SAP (input clk, clr);
	wire [7 : 0] bus, fromACC, fromBREG, out;
	wire cp, ep, lm, ce, li, ei, la, ea, su, eu, lb, lo;
	wire [3 : 0] fromIR, fromMAR;

	CONTROL_SAP cs (fromIR, clk, clr, {cp, ep, lm, ce, li, ei, la, ea, su, eu, lb, lo});
	IR_SAP ir (clk, clr, li, ei, bus, bus[3 : 0], fromIR);
	MAR_SAP mar (clk, lm, bus[3 : 0], fromMAR);
	RAM_SAP ram (ce, fromMAR, bus);
	PC_SAP pc (clk, clr, cp, ep, bus[3 : 0]);
	ACC_SAP acc (clk, la, ea, bus, bus, fromACC);
	ALU_SAP alu (su, eu, fromACC, fromBREG, bus);
	B_SAP breg (clk, lb, bus, fromBREG);
	OUT_SAP outreg (clk, lo, bus, out);

	//Display Module Equivalent
	always @ (negedge clk)
		if(lo) $display("OUTPUT (Decimal): %d", out);
endmodule
