module ALU_SAP
	(
		input su, eu,
		input [7 : 0] fromAcc, fromBreg,
		output [7 : 0] toBus
	);

	wire [7 : 0] ans;
	TRI_STATE bus (ans, eu, toBus);

	assign ans = su ? (fromAcc - fromBreg) : (fromAcc + fromBreg);
endmodule
