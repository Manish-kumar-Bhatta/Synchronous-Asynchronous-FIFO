module fifo(clk,res,wr_en,rd_en,wdata,rdata,empty,full,overflow,underflow);
	parameter WIDTH=8;
	parameter FIFO_SIZE=16;
	parameter PTR_WIDTH=$clog2(FIFO_SIZE);

	input clk,res,wr_en,rd_en;
	input [WIDTH-1:0]wdata;
	output reg empty,full,overflow,underflow;
	output reg[WIDTH-1:0]rdata;
	integer i;
	reg[WIDTH-1:0]fifo[FIFO_SIZE-1:0];

	reg[PTR_WIDTH-1:0]wr_ptr,rd_ptr;
	reg wr_tg_f,rd_tg_f;

	always@(posedge clk) begin
		if(res==1) begin
			empty=0;
			full=0;
			overflow=0;
			underflow=0;
			rdata=0;
			wr_ptr=0;
			rd_ptr=0;
			wr_tg_f=0;
			rd_tg_f=0;
			for(i=0;i<FIFO_SIZE;i=i+1) fifo[i]=0;
		end
		else begin
			if(wr_en==1) begin
				if(full==1) overflow=1;
				else begin
					fifo[wr_ptr]=wdata;
					if(wr_ptr==FIFO_SIZE-1) begin
						wr_ptr=0;
						wr_tg_f=~wr_tg_f;
					end
					else wr_ptr=wr_ptr+1;
				end
			end
			if(rd_en==1) begin
				if(empty==1) underflow=1;
				else begin
					rdata=fifo[rd_ptr];
					if(rd_ptr==FIFO_SIZE-1) begin
						rd_ptr=0;
						rd_tg_f=~rd_tg_f;
					end
					else rd_ptr=rd_ptr+1;
				end
			end
		end
	end
	always@(*) begin
		if(wr_ptr==rd_ptr && wr_tg_f!=rd_tg_f)full=1;
		else full=0;

		if(wr_ptr==rd_ptr && wr_tg_f==rd_tg_f) empty=1;
		else empty=0;
	end
endmodule
