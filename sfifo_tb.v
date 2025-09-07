`include "sfifo.v"
module tb;
	parameter WIDTH=8;
	parameter FIFO_SIZE=16;
	parameter PTR_WIDTH=$clog2(FIFO_SIZE);

	reg clk,res,wr_en,rd_en;
	reg [WIDTH-1:0]wdata;
	wire empty,full,overflow,underflow;
	wire[WIDTH-1:0]rdata;
	integer i,j;
	reg[20*8-1:0]testcase;

	fifo dut(clk,res,wr_en,rd_en,wdata,rdata,empty,full,overflow,underflow);

	always #5 clk=~clk;
	initial begin
		clk=0;
		res=1;
		wr_en=0;
		rd_en=0;
		wdata=0;
		repeat(2)@(posedge clk);
		res=0;

		$value$plusargs("testcase=%0s",testcase);

		case(testcase)
			"full":begin
				write(FIFO_SIZE);
			end
			"empty":begin
				write(FIFO_SIZE);
				read(FIFO_SIZE);
			end
			"overflow":begin
				write(FIFO_SIZE+1);
			end
			"underflow":begin
				write(FIFO_SIZE);
				read(FIFO_SIZE+1);
			end

		endcase
	end


	//write
	task write(input integer N);
		begin
			for(i=0;i<N;i=i+1) begin
				@(posedge clk);
					wr_en=1;
					wdata=$random;
				end
				@(posedge clk);
					wr_en=0;
					wdata=0;
			end
		endtask


	//read
	task read(input integer N);
		begin
			for(j=0;j<N;j=j+1) begin
				@(posedge clk);
					rd_en=1;
				end
				@(posedge clk);
					rd_en=0;
			end
		endtask

		initial begin
			#1000;
			$finish;
		end
	endmodule


