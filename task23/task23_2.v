module task23_2(
    input clk,
    input btn0,
    input [3:0]din,
    output [3:0]dout,
    output weout
);

reg [31:0] ccnt; // chattering カウンタ(32bitもいらないがそれより細かくメモリを切る意味もないので)

reg r0, r1;
wire pulse;
reg en; // running 状態を記録

parameter CMAX = 1250000 - 1; // chattering期間 10 msec を指定

initial begin
  ccnt <= 0;
  en <= 1;
end

always@ (posedge clk) begin
  // chattering 除去とパルス出力
  
  if (ccnt < CMAX) begin
    ccnt <= ccnt + 1;
  end else begin
    ccnt <= 0;
  end

  
  if (ccnt == CMAX) begin
    r0 <= btn0;
    r1 <= r0;
  end
  

  if (pulse = 1) begin
    en <= ~en;
  end
end

assign pulse = r1 & ~r0;
assign weout = en;

ram_task23 ram_inst(
    .addra(5'b00001),//5'b00001: 5ビットの2進数 00001 の意味
    .clka(clk),
    .dina(din),
    .douta(dout),
    .wea(en)
);

endmodule
