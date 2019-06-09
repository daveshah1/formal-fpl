module counter (input clk);
    reg [15:0] counter;

    initial counter=0;

    always @(posedge clk)
        if(counter == 16'd22)
            counter <= 0;
        else
            counter <= counter +1'b1;

    `ifdef FORMAL
    always @(*)
        assert(counter != 16'd500);
    `endif
endmodule
