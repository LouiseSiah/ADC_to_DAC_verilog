module ram
(
	clock,
	reset,
	write1_read0,
	data_in,
	data_out_display,

);

parameter data_size = 32;

input clock, reset, write1_read0;
input [data_size-1:0]data_in;

output reg [data_size-1:0]data_out_display;

reg [16:0]address; // address_for_bit;
reg [data_size-1:0]register[65535:0];

always@(posedge clock or negedge reset)
begin
	if(!reset)
	begin
		address <= 0;
	end
	else
	begin
		address = address + 1;
	end
end


always@(posedge clock)
begin
	if(write1_read0) //write
		register[address] <= data_in;
	else	//read
		data_out_display <= register[address];
end

endmodule

