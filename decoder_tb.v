module  decoder_tb();
reg clk;
reg rst;
reg Load;
reg [3:0] Din;
wire[3:0] Q1;
wire[7:0] Q_seg;

  parameter PERIOD  = 20;
  parameter real DUTY_CYCLE  = 0.5;
  parameter OFFSET  = 0;
  initial
  begin
      #OFFSET;
      forever
      begin
        clk = 1'b1;
        #(PERIOD-(PERIOD*DUTY_CYCLE))
        clk = 1'b0;
        #(PERIOD*DUTY_CYCLE);
        end
      end
    initial begin
          rst = 1'b0;
      Load = 1'b0;
      Din = 4;
      #5 rst = 1'b1;
      #350 Load = 1'b0;
      #20 Load = 1'b1;
      #10 Load  = 1'b0;
      #200 rst = 1'b0;
      #50 rst = 1'b1;
      #1000 $finish;
    end
    initial
    begin
          $dumpfile("decoder.vcd");
          $dumpvars(0,decoder_tb);
    end
    BCD decoder_tb( .clk(clk), .rst(rst), .Q_seg(Q_seg), .Din(Din), .Load(Load));
    endmodule
