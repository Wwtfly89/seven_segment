module BCD(clk,rst,Load,Q_out,Din);
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
    Q1 =4'b0000;
  else if(Q_seg==9)
    Q1 = 4'b0000;
  else if(Load)
    Q1  = Din;
  else
    Q1+=1;
  end
endmodule
 always@(*) begin
   case(Q1)
     4'h1: Q_seg = 7'b111_1001;
     4'h2: Q_seg = 7'b010_0100;
     4'h3: Q_seg = 7'b011_0000;
     4'h4: Q_seg = 7'b001_1001;
     4'h5: Q_seg = 7'b001_0010;
     4'h6: Q_seg = 7'b000_0010;
     4'h7: Q_seg = 7'b111_1000;
     4'h8: Q_seg = 7'b000_0000;
     4'h9: Q_seg = 7'b001_1000;
     4'ha: Q_seg = 7'b000_1000;
     4'hb: Q_seg = 7'b000_0011;
     4'hc: Q_seg = 7'b100_0110;
     4'hd: Q_seg = 7'b010_0001;
     4'he: Q_seg = 7'b000_0110;
     4'hf: Q_seg = 7'b000_1110;
     4'h0: Q_seg = 7'b100_0000;
   endcase
 end
endmodule
