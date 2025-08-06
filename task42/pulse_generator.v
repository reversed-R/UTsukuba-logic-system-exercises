
module pulse_generator(
  input clk,
  input _in,
  output _out
);

localparam SAMPLING_PERIOD = 1250000-1;//実装用
//localparam SAMPLING_PERIOD = 10;//シミュレーション用

reg [1:0]r;
reg [31:0]cnt;

always@(posedge clk)begin
    if(cnt < SAMPLING_PERIOD)cnt <= cnt + 1;
    else cnt <= 0;
    if(cnt == SAMPLING_PERIOD)r[0] <= _in; //chattering周期より長い周期で _in をサンプリング       
    r[1] <= r[0];
end

assign _out = r[1] & ~r[0];

endmodule

