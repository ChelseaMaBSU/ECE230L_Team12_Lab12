module top(
    input [0:0] sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

wire w = sw[0];
wire clk = btnC;
wire reset = btnU;

//One-Hot Outputs
wire z_oh;
wire A_state, B_state, C_state, D_state, E_state;

//Binary outputs
wire z_bin;
wire [2:0] state_bin;

//FSM Instantiations
onehot OH_FSM (
    .w(w),
    .clk(clk),
    .reset(reset),
    .z_oh(z_oh),
    .A_state(A_state),
    .B_state(B_state),
    .C_state(C_state),
    .D_state(D_state),
    .E_state(E_state)
);

binary BIN_FSM (
    .w(w),
    .clk(clk),
    .reset(reset),
    .z_bin(z_bin),
    .state_bin(state_bin)
);

//Output mapping
assign led[0] = z_oh;
assign led[1] = z_bin;
assign led[2] = A_state;
assign led[3] = B_state;
assign led[4] = C_state;
assign led[5] = D_state;
assign led[6] = E_state;
assign led[7] = state_bin[0]; //LSB(y0)
assign led[8] = state_bin[1]; //y1
assign led[9] = state_bin[2]; //y2

endmodule