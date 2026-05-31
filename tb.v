`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ApexPluse
// Engineer: Karanam Udaykumar
// 
// Create Date: 29.05.2026 22:00:04
// Design Name: FIR Filter
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module tb_top;

reg clk;
reg rst;

reg signed [15:0] data_in;
reg data_valid;
   
wire signed [15:0] data_out;
wire data_out_valid;
wire signed [15:0] int_out;
wire signed [23:0] dec_out;

integer infile;
integer outfile;

integer r;

top_module uut (

    .clk(clk),
    .rst(rst),

    .data_in(data_in),
    .data_valid(data_valid),

    .data_out(data_out),
    .data_out_valid(data_out_valid),
    .int_out(int_out),
    .dec_out(dec_out)
);


// Clock Generation


initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Main Test


initial begin
    clk=0;
    rst = 1;
    data_in=0;
    data_valid=0;
   

    #100;
    rst = 0;
    data_valid=1;

    infile = $fopen("input_signal.txt","r");
    
    if(infile == 0)
    $display("INPUT FILE NOT OPENED");
else
    $display("INPUT FILE OPENED SUCCESSFULLY");
    
    outfile = $fopen("output_signal.txt","w");
if(infile == 0) begin
    $display("ERROR: Input file not found");
    $finish;
end

if(outfile == 0) begin
    $display("ERROR: Output file not created");
    $finish;
end

    while(!$feof(infile)) begin

        @(posedge clk);

        r = $fscanf(infile,"%d\n",data_in);

        data_valid = 1;

    end
    @(posedge clk)

    data_valid = 0;

    repeat(200)@(posedge clk);

    $fclose(infile);
    $fclose(outfile);

    $stop;

end

// Store Output

always @(posedge clk) begin
    if(data_out_valid) begin
        // console print
        $display("dec_out=%0d int_out=%0d data_out=%0d",
                 dec_out, int_out, data_out);
        // FILE write (THIS LINE GOES HERE)
        $fwrite(outfile, "%0d %0d %0d\n",
                dec_out, int_out, data_out);         
    end
end

endmodule
