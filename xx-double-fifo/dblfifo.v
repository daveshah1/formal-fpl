`default_nettype	none
module dblfifo(i_clk, i_ce, i_data, o_data);
	input	wire	i_clk, i_ce;
	
	input	wire	i_data;
	output	wire	o_data;

	wire	a_data, b_data;

	fifo	one(i_clk, 1'b0, i_ce, i_data, a_data);
	fifo	two(i_clk, 1'b0, i_ce, i_data, b_data);

	initial	o_data = 1'b0;
	always @(posedge i_clk)
		o_data <= a_data ^ b_data;

    `ifdef FORMAL
        // your properties here
    `endif
endmodule
