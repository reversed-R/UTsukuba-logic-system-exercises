`include "parameters_task43.v" 

module task43_example_top (
    input clk,
    input [IO_WIDTH-1:0]sw,
    input push,
    input pop,
    input add,
    input push_result,
    output [IO_WIDTH-1:0]ld,
    output ld_full,
    output ld_empty
);

wire [3:0] pulse_btn;
wire pushed, poped;
wire [3:0] din;
wire [3:0] dout;

reg [3:0] opr[0:1];//幅4ビットのレジスタの配列
reg [3:0] result;

// ステート
localparam WAIT_PUSH = 0;
localparam WAIT_SECOND_POP = 1; 
localparam WAIT_ADD = 2;
localparam WAIT_PUSH_RESULT = 3;

reg [1:0] state;

initial begin
    state <= WAIT_PUSH;
    pushed <= 0;
    poped <= 0;
end

//ワンショットパルスに変換
pulse_generator _btn0(.clk(clk),._in(push),._out(pulse_btn[0]));
pulse_generator _btn1(.clk(clk),._in(pop),._out(pulse_btn[1]));
pulse_generator _btn2(.clk(clk),._in(add),._out(pulse_btn[2]));
pulse_generator _btn3(.clk(clk),._in(push_result),._out(pulse_btn[3]));

stack_ctrl s0(
    .clk(clk),
    .din(din),
    ._push(pulse_btn[0] && state == WAIT_PUSH || pulse_btn[3] && state == WAIT_PUSH_RESULT),
    ._pop(pulse_btn[1] && state == WAIT_PUSH || pulse_btn[1] && state == WAIT_SECOND_POP),
    .dout(dout),
    ._pushed(pushed),
    ._poped(poped),
    ._full(ld_full),
    ._empty(ld_empty),
    .stack_pointer()
);



always@(posedge clk)begin
    if (poped && state == WAIT_PUSH) begin
        din <= sw;
        opr[0] <= dout; //レジスタ配列oprの「第0要素」にswを代入。紛らわしいが、「oprの0ビット目」ではない。
        opr[1] <= opr[0]; //oprの第1要素にoprの第0要素を代入
        state <= WAIT_SECOND_POP;
    end else if (poped && state == WAIT_SECOND_POP) begin
        opr[0] <= dout;
        opr[1] <= opr[0];
        state <= WAIT_ADD;
    end else if(pulse_btn[2] && state == WAIT_ADD)begin
        result <= opr[0] + opr[1];
        state <= WAIT_PUSH_RESULT;
    end else if(pulse_btn[3] && state == WAIT_PUSH_RESULT)begin
        din <= result;
        state <= WAIT_PUSH;
    end
end


assign ld = dout;

endmodule
