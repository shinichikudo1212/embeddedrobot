//=================================================================================//
//		File Name: SwDebounce
//   	Author 	: Yuantao Zhang
//		Version	: V0.1
//		Date Create: 7/Dec/2012
//================================================================================//

module SwDebounce(input wire clk,
			input wire X,
		  output reg Z);

//X = Switch input
//Y = Syncrhonised output
   parameter WIDTH = 17;
   
   reg    YY;
   reg 	  U;
   reg 	  V;
   reg 	  W;

   reg [WIDTH-1:0] counter = {WIDTH{1'b0}};

   assign Y = U&V&W;

   always @(posedge clk) 
      counter <= counter + 1;
    
   always @(posedge clk) begin
      if(&counter) begin
	 U <= X;
	 V <= U;
	 W <= V;
      end
      YY <= Y;
      Z <= (~YY)&Y;
   end
endmodule
   
   