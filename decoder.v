module BCD(clk,rst,Load,Q_seg,Din);
input clk;
input rst;
input Load;
input[3:0] Din;
output [3:0]  Q1;
reg [3:0] Q1;
output [7:0] Q_seg;
reg [7:0] Q_seg;

always@(posedge clk)
begin
  if(!rst)
    Q1 <= 4'b0000;
  else if(Load)
    Q1 <= Din;
  else if(Q1==9)
    Q1  <= 4'b0000;
  else
    Q1<=Q1+1;
  end
 always@(*) begin
   case(Q1)
     4'b0000: Q_seg = 8'b11000000;
     4'b0001: Q_seg = 8'b11111001;
     4'b0010: Q_seg = 8'b10100100;
     4'b0011: Q_seg = 8'b10110000;
     4'b0100: Q_seg = 8'b10011001;
     4'b0101: Q_seg = 8'b10010010;
     4'b0110: Q_seg = 8'b10000010;
     4'b0111: Q_seg = 8'b11111000;
     4'b1000: Q_seg = 8'b10000000;
     4'b1001: Q_seg = 8'b00100000;
     4'b1010: Q_seg = 8'b00000000;
   endcase
 end
endmodule
