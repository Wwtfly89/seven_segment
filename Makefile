VERILOG = iverilog
TARGET = decoder.vcd
TEMP = simple.vpp
$(TARGET) : simple.vvp
	vvp simple.vvp

simple.vvp: decoder_tb.v decoder.v
	$(VERILOG) -o simple.vvp decoder_tb.v decoder.v
clean:
	-del $(TARGET)
	-del $(TEMP)
