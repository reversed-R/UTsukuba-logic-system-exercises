//逆ポーランド法加算器もどき
module task42(
    input clk,
    input [3:0]sw,
    input [1:0]btn,
    output reg [3:0]ld //レジスタ付き出力端子
);

localparam N = 2;
reg [1:0] opr_counter;

reg [3:0] opr[0:N-1];//幅4ビットのレジスタの配列(深さN)
wire[1:0] pulse_btn;

pulse_generator _btn0(.clk(clk),._in(btn[0]),._out(pulse_btn[0]));
pulse_generator _btn1(.clk(clk),._in(btn[1]),._out(pulse_btn[1]));

always@(posedge clk)begin
    // WAIT
    if (opr_counter < N) begin
        if(pulse_btn[0])begin
            opr[0] <= sw; //レジスタ配列oprの「第0要素」にswを代入。紛らわしいが、「oprの0ビット目」ではない。
            opr[1] <= opr[0]; //oprの第1要素にoprの第0要素を代入
            opr_counter <= opr_counter + 1;
        end
    end else begin
    // READY
        if(pulse_btn[1])begin
            ld <= opr[0] + opr[1];
            opr_counter <= 0;
        end
    end
end

endmodule

