// Implement binary state machine
module binary (
    input w, clk, reset,
    output z_bin,
    output [2:0] state_bin
);

//current state wires (Q)
wire y2, y1, y0;
assign state_bin[2] = y2;
assign state_bin[1] = y1;
assign state_bin[0] = y0;

//Next state wires (D)
wire Y2, Y1, Y0;

//Output Logic
//z is asserted in state C (010) or E (100)
assign z_bin = (~y0 & (~y2 & y1)) | (~y0 & (y2 & ~y1));

//Next-State Logic (Combinatorial from K-Maps)
//D0
assign Y0 = (~w & ~y1 & ~y0) | (w & ~y2 & ~y0) | (w & ~y2 & ~y1);
//D1
assign Y1 = (~w & ~y2 & y1 & ~y0) | (w & ~y2 & ~y1) | (~w & ~y2 & ~y1 & y0);
//D2
assign Y2 = (w & ~y2 & y1 & y0) | (w & y2 & ~y1 & ~y0);

//State storage (DFF instantiation)
//Initial State A (00), so all DFFs reset to 0
dff dff0 (.D(Y0), .clk(clk), .reset(reset), .Default(1'b0),. Q(y0)); //LSB
dff dff1 (.D(Y1), .clk(clk), .reset(reset), .Default(1'b0),. Q(y1));
dff dff2 (.D(Y2), .clk(clk), .reset(reset), .Default(1'b0),. Q(y2)); //MSB

endmodule