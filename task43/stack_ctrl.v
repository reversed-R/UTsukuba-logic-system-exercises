`include "parameters.v" 

module stack_ctrl (
    input clk,
    input [IO_WIDTH-1:0]din,
    input _push,
    input _pop, 
    output [IO_WIDTH-1:0]dout,
    output _pushed,
    output _poped,
    output _full,
    output _empty,
    output [4:0] stack_pointer
);

reg [4:0] stack_pointer;

localparam LOGICAL_STACK_DEPTH = 8;//物理的な領域のうち0～7だけを使用

wire push_w,pop_w;
assign push_w = _push;
assign pop_w = _pop;

reg pushed, poped;
assign _pushed = pushed;
assign _poped = poped;

wire [MEM_WIDTH-1:0]douta_w;

ram_task43 ram_inst(
    .clka(clk),
    .addra(stack_pointer),
    .dina(din),
    .douta(douta_w),
    .wea(push_w & (stack_pointer < LOGICAL_STACK_DEPTH))
);

assign dout = douta_w;

assign _full  = (stack_pointer == LOGICAL_STACK_DEPTH)?1:0;
assign _empty  = (stack_pointer == 0 )?1:0;

initial begin
    stack_pointer <= 0;
    poped <= 0;
end

always@(posedge clk)begin
    poped <= 0;
//push // input
    if(push_w && stack_pointer < LOGICAL_STACK_DEPTH)begin
        stack_pointer <= stack_pointer + 1;
    end
//pop // add
    if(pop_w && stack_pointer > 0)begin
        stack_pointer <= stack_pointer - 1;  
        poped <= 1;
    end    
end

endmodule

