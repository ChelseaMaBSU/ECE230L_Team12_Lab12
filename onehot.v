// Implement one-hot state machine
module onehot (
    input w, clk, reset,
    output z_oh, 
    output A_state,
    output B_state,
    output C_state,
    output D_state,
    output E_state
);

//wires for next state inputs (D)
wire DA, DB, DC, DD, DE;

//current state output (Q)
wire A, B, C, D, E;
assign A_state = A;
assign B_state = B;
assign C_state = C;
assign D_state = D;
assign E_state = E;

//z is asserted in state C or E
//z = C + E
assign z_oh = C | E;

//Combinatorial Logic
//DA never returns to A (DA = 0)
assign DA = 1'b0;

//DB goes to B when w=0 from A, D, or E
assign DB = ~w & (A | D | E);

//DC goes to C when w=0 from B or C
assign DC = ~w & (B | C);

//DD goes to D when w=1 from A, B, or C
assign DD = w & (A | B | C);

//DE goes to E when w=1 from D or E
assign DE = w & (D | E);

//state storage (DFF Instantiation)
//State A is initial state (Default = 1)
dff Adff (.D(DA), .clk(clk), .reset(reset), .Default(1'b1), .Q(A));

//States B, C, D, E are initially 0
dff Bdff (.D(DB), .clk(clk), .reset(reset), .Default(1'b0), .Q(B));
dff Cdff (.D(DC), .clk(clk), .reset(reset), .Default(1'b0), .Q(C));
dff Ddff (.D(DD), .clk(clk), .reset(reset), .Default(1'b0), .Q(D));
dff Edff (.D(DE), .clk(clk), .reset(reset), .Default(1'b0), .Q(E));

endmodule