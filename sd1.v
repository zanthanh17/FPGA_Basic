module sequence_detector
(
	input wire clk, reset,
	input wire w, 
	output reg z
);

	// symbolic state declaration
	localparam [1:0]	A = 2'b00,B = 2'b01,C = 2'b10;

	// signal declaration
	reg [1:0] state_reg, state_next;

	// state register
	always @(posedge clk, posedge reset)	
		if (reset)
			state_reg <= A;
		else
			state_reg <= state_next;

	// next state logic
	always @*
		case (state_reg)
			A: if (w)
                            state_next = B;
			   else
			    state_next = A;
			
			//-- 
			B: if (w)
			    state_next = C;
			   else
			    state_next = A;

			//--
			C: if (w)
                            state_next = C;
			   else
			    state_next = A;
			
			//default: state_next = A;
		endcase
       always @(state_reg)
        begin
             case(state_reg)
                 A: z = 0;
                 B: z = 0;
                 C: z = 1;
             endcase
        end
endmodule

