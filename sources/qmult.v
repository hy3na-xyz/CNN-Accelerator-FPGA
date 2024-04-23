`timescale 1ns / 1ps

module qmult #(
	//Parameterized values
	parameter Q = 15,
	parameter N = 32
	)
	(
	 input			[N-1:0]	i_multiplicand,
	 input			[N-1:0]	i_multiplier,
	 output			[2*N-1:0]	r_result
	 //output	reg				ovr
	 );

	reg [2*N-1:0]	r_result;		//	Multiplication by 2 values of N bits requires a 
											//		register that is N+N = 2N deep...
    always @(i_multiplicand, i_multiplier)	begin						//	Do the multiply any time the inputs change
		r_result <= i_multiplicand[N-2:0] * i_multiplier[N-2:0];	//	Removing the sign bits from the multiply - that 
																					//		would introduce *big* errors	
	//	ovr <= 1'b0;															//	reset overflow flag to zero
		end
endmodule