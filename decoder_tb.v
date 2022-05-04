module  decoder_tb;
reg clk;
reg rst;

  parameter PERIOD  = 20;
  parameter real DUTY_CYCLE  = 0.5;
  parameter OFFSET  = 0;
  initial
  begin
      #OFFSET;
      forever
      begin
        clk = 1'b0;
        #(PERIOD-(PERIOD*DUTY_CYCLE))
        clk = 1'b1;
        #(PERIOD*DUTY_CYCLE);
        end
      end
    initial begin
      rst = 1'b1;
      #5 rst = 1'b0;
      #100 $finish;
    end
    initial
    begin
          $dumpfile("decoder.vcd");
          $dumpvars(0,decoder_tb);
    end
    decoder decoder_tb( .clk(clk), .rst(rst));
    endmodule
