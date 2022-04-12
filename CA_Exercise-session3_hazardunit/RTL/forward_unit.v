module forward_unit(
    input wire [4:0]  rs1_ex,
    input wire [4:0]  rs2_ex,
    input wire [4:0]  rd_mem,
    input wire [4:0]  rd_wb,
    input wire        reg_write_mem,
    input wire        reg_write_wb,

    output reg [1:0]  forwardA,
    output reg [1:0]  forwardB
);

wire x ,x1, y,y1;
assign x  = reg_write_mem && (rd_mem != 5'd0) && (rd_mem == rs1_ex);
assign x1 = reg_write_wb  && (rd_wb  != 5'd0) && (rd_wb  == rs1_ex);
assign y  = reg_write_mem && (rd_mem != 5'd0) && (rd_mem == rs2_ex);
assign y1 = reg_write_wb  && (rd_wb  != 5'd0) && (rd_wb  == rs2_ex);

    always@(*) 
    begin
        forwardA =0;
        forwardB =0;

        // EX hazard
        if(x) begin 
            forwardA =2;
        end
        if(y) begin 
            forwardB =2;
        end 

        // MEM hazard
        if(x1 && !x) begin 
            forwardA =1;
        end 
        if(y1 && !y) begin 
            forwardB =1;
        end

    end
                                      
endmodule

