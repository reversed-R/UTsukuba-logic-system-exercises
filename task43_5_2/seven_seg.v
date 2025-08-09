module seven_seg(
    input [3:0]din,
    input sel_in,
    output  [6:0]seg,
    output  sel_out
);

// JB, JCの上側に挿すこと．間違えると動かない．

// 活線挿抜 (電源を入れたまま抜き差し) しないこと．ボード破損の原因となる．



//デコーダ (16進表示用)
assign seg[6] = ~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];
assign seg[5] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];
assign seg[4] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&~din[1]&din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];
assign seg[3] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&~din[1]&din[0]|din[3]&din[2]&din[1]&~din[0];
assign seg[2] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&~din[1]&din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|~din[3]&din[2]&din[1]&din[0]| din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&~din[2]&din[1]&din[0]|din[3]&din[2]&~din[1]&din[0]; 
assign seg[1] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&~din[1]&din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&~din[0]|~din[3]&din[2]&din[1]&din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&din[2]&~din[1]&din[0];
assign seg[0] = ~din[3]&~din[2]&~din[1]&~din[0]|~din[3]&~din[2]&din[1]&~din[0]|~din[3]&~din[2]&din[1]&din[0]|~din[3]&din[2]&~din[1]&din[0]|~din[3]&din[2]&din[1]&~din[0]|~din[3]&din[2]&din[1]&din[0]|din[3]&~din[2]&~din[1]&~din[0]|din[3]&~din[2]&~din[1]&din[0]|din[3]&~din[2]&din[1]&~din[0]|din[3]&din[2]&~din[1]&~din[0]|din[3]&din[2]&din[1]&~din[0]|din[3]&din[2]&din[1]&din[0];

assign sel_out = sel_in;

endmodule

