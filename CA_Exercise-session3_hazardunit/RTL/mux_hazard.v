module mux_hazard(
    input reg        alu_src, mem_write, mem_read, branch, jump, reg_write, mem_2_reg,
    input reg  [1:0] alu_op,
    input wire       select,

    output reg [8:0] out
);

always@(*)
    begin 
        if(select)begin 
            out = {alu_src, mem_write, mem_read, branch, jump, reg_write, mem_2_reg, alu_op};
        end
        else begin 
            out = 9'b000000000;
        end
        
    end
endmodule