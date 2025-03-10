`timescale 1 ns/10 ps
module sequence_detector_tb ();
	// declaration
	localparam T=20; //clock period
	reg clk, reset;
	reg w;
	wire z;
	// design under test
	sequence_detector dut (.clk(clk), .reset(reset), .w(w), .z(z));
	// clock
	always
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end
	//reset 
	initial 
	begin          
		reset = 1'b1;
		#(T); #(T/2);
		reset = 1'b0;
		#(T/2);
		w = 0;	
		#(T);
		w = 1;	
		#(T);
		w = 0;
		#(T);
		w = 1;
		#(2*T);
		w = 0;
		#(T);
		w = 1;
		#(3*T);
		w = 0;
		#(T);
		w = 1;
	end

endmodule
