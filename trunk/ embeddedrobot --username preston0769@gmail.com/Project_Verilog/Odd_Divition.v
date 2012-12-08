module Odd_division(clk,rst,count1,count2,clk_odd);
input        clk,rst;
output[3:0] count1,count2;
output       clk_odd;
reg[3:0]     count1,count2;
reg          clkA,clkB;
wire         clk_odd;
wire 			 clk_re;


parameter    N = 5;

    assign clk_re   = ~clk;
    assign clk_odd = clkA | clkB;
    
    always @(posedge clk)
      if(! rst) 
        begin
          count1 <= 1'b0;
          clkA <= 1'b0;           
        end
      else
        if(count1 < (N - 1))
          begin
            count1 <= count1 + 1'b1;             
            if(count1 == (N - 1)/2)
              begin
                clkA <= ~clkA;
              end                
          end          
        else
          begin
            clkA <= ~clkA;
            count1 <= 1'b0;
          end           
          
always @ (posedge clk_re)
    if(! rst)
      begin
        count2 <= 1'b0;
        clkB <= 1'b0;
      end
    else
      if(count2 < (N - 1))
        begin
          count2 <= count2 + 1'b1;             
            if(count2 == (N - 1)/2)
              begin
                clkB <= ~clkB;
              end                
        end          
      else
        begin
          clkB <= ~clkB;
          count2 <= 1'b0;
        end           
endmodule     