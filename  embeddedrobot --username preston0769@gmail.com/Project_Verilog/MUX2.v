//=================================================================================//
//		File Name: MUX8
//   	Author 	: Yuantao Zhang
//		Version	: V0.1
//		Date Create: 7/Dec/2012
//================================================================================//
module MUX8(
			select,
			dataOne,
			dataTwo,
			data,
);
input 	wire [7:0] dataOne;
input 	wire [7:0] dataTwo;
output 	reg  [7:0] data;
input    wire select;

always@(*)
	if(select)
		data = dataTwo;
	else
		data = dataOne;
endmodule
