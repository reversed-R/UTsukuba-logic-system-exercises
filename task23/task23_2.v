`timescale 1ns / 1ps

module task23_2(
    input clk,
    input btn0,
    input [3:0]din,
    output [3:0]dout,
    output weout
);

wire pulse;
reg en; // running 状態を記録

pulse_generator _btn0(.clk(clk),._in(btn0),._out(pulse));

always@ (posedge clk) begin
  // chattering 除去とパルス出力

  if (pulse) begin
    en <= ~en;
  end
end

assign weout = en;

ram_task23 ram_inst(
    .addra(5'b00001),//5'b00001: 5ビットの2進数 00001 の意味
    .clka(clk),
    .dina(din),
    .douta(dout),
    .wea(en)
);

endmodule