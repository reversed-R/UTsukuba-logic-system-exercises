
module task22_2 (
  input clk,
  input btn0,
  output [3:0]ld
);

reg [3:0] hexcnt;
reg [31:0] scnt;
reg [31:0] ccnt; // chattering カウンタ(32bitもいらないがそれより細かくメモリを切る意味もないので)

reg r0, r1;
wire pulse;
reg en; // running 状態を記録

parameter SMAX = 125000000 - 1;
parameter CMAX = 1250000 - 1; // chattering期間 10 msec を指定

initial begin
  hexcnt <= 0;
  scnt <= 0;
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
  

  if (pulse == 1) begin
    en <= ~en;
  end


  // アップカウンタ
  
  if (scnt < SMAX) begin
    scnt <= scnt + 1;
  end else begin
    scnt <= 0;
  end

  
  if (scnt == SMAX) begin
    if (en == 1) begin
      hexcnt <= hexcnt + 1;
    end
  end
end

assign ld = hexcnt;
assign pulse = r1 & ~r0;

endmodule
