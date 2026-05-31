`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2026 21:54:48
// Design Name: 
// Module Name: top
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

module top_module(

    input clk,
    input rst,

    input signed [15:0] data_in,
    input data_valid,

    output signed [15:0] data_out,
    output data_out_valid,
    output signed [15:0] int_out,
    output signed [23:0] dec_out
);

// wires for decimator output
wire signed [23:0] dec_out;
wire dec_valid;

// scaled signal
wire signed [15:0] scaled_data;

// wires for interpolator output
wire signed [23:0] int_out;
wire int_valid;
wire ready1;
wire ready2;
wire dec_ready;
assign dec_ready= 1'b1;
assign int_ready=1'b1;


// FIR DECIMATOR


fir_decimator my_decimator (

    .aclk(clk),
    
    .aclken(1'b1),
    
    .aresetn(~rst),

    .s_axis_data_tvalid(data_valid),
    
    .s_axis_data_tready(ready1),

    .s_axis_data_tdata(data_in),

    .m_axis_data_tvalid(dec_valid),
    
    .m_axis_data_tready(dec_ready),

    .m_axis_data_tdata(dec_out)
);


// Scaling to Q1.15


assign scaled_data = dec_out[23:8];


// FIR INTERPOLATOR


fir_interpolator my_interpolator (

    .aclk(clk),

    .s_axis_data_tvalid(dec_valid),
    
    .s_axis_data_tready(ready2),

    .s_axis_data_tdata(scaled_data),

    .m_axis_data_tvalid(int_valid),

    .m_axis_data_tdata(int_out)
);


// Final Output

assign data_out = dec_out[15:0];

assign data_out_valid = dec_valid;
// Debug print
always@ ( posedge clk) begin
  if(dec_valid)
   $display("dec_out=%d",dec_out);
end   

endmodule
