`include "parameters_task43.v" 

module task43_5_2 (
    input clk,
    input [SWITCH_INPUT_WIDTH-1:0]sw,
    input push,
    input add,
    
    output  [6:0]seg,
    output  sel_out,
    
    output ld_full,
    output ld_empty
);


wire [1:0] pulse_btn;
wire pushed, poped;
reg [3:0] din;
wire [7:0] dout;

reg [7:0] opr[0:1]; // 幅8ビットのレジスタの配列
reg [7:0] result;
reg [7:0] display_result;

// ステート
localparam WAIT_PUSH = 0;
localparam WAIT_SECOND_POP = 1; 
localparam WAIT_ADD = 2;
localparam WAIT_PUSH_RESULT = 3;

reg [1:0] state;

// 7セグ用セレクタ
reg sel_in;
reg [3:0] seg_in;

reg [7:0] seg_count;
localparam SEG_COUNT_MAX = 255;
    // 125000000 Hz = 125 MHz 環境において、256 ~= 125 * 2 クロック毎に更新で約0.5 MHz になる

// ワンショットパルスに変換
pulse_generator _btn0(.clk(clk),._in(push),._out(pulse_btn[0]));
pulse_generator _btn1(.clk(clk),._in(add),._out(pulse_btn[1]));

stack_ctrl s0(
    .clk(clk),
    .din(din),
    ._push(~pushed && pulse_btn[0] && state == WAIT_PUSH || state == WAIT_PUSH_RESULT),
    ._pop(pulse_btn[1] && state == WAIT_PUSH || state == WAIT_SECOND_POP),
    .dout(dout),
    ._pushed(pushed),
    ._poped(poped),
    ._full(ld_full),
    ._empty(ld_empty),
    .stack_pointer()
);


seven_seg seg0(
    .din(seg_in),
    .sel_in(sel_in),
    .seg(seg),
    .sel_out(sel_out)
);


initial begin
    state <= WAIT_PUSH;
    sel_in <= 0;
    seg_in <= 4'h0;
    display_result <= 8'h00;
end


always@(posedge clk)begin
    if (pushed) begin
      din <= {4'b0000, sw[3:0]};
    end
    
    if (poped && state == WAIT_PUSH) begin
        opr[0] <= dout; //レジスタ配列oprの「第0要素」にswを代入。紛らわしいが、「oprの0ビット目」ではない。
        state <= WAIT_SECOND_POP;
    end else if (poped && state == WAIT_SECOND_POP) begin
        opr[1] <= dout;
        state <= WAIT_ADD;
    end else if(state == WAIT_ADD)begin
        result <= opr[0] + opr[1];
        state <= WAIT_PUSH_RESULT;
    end else if(state == WAIT_PUSH_RESULT)begin
        din <= result;
        display_result <= result;
        state <= WAIT_PUSH;
    end


    if (seg_count == SEG_COUNT_MAX) begin
        if (~sel_in) begin
            // 下位4bit
            seg_in <= display_result[3:0];
        end else begin
            // 上位4bit
            seg_in <= display_result[7:4];
        end

        sel_in <= ~sel_in;
        seg_count <= 0;
    end else begin
        seg_count <= seg_count + 1;
    end
end

endmodule
