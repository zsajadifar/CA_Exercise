module hazard_detection
( 
    input wire [4:0] rd_ex,
    input wire [4:0] rs1_id,
    input wire [4:0] rs2_id,
    input wire       mem_read_ex,

    output reg  pc_write,
    output reg  if_id_write,
    output reg  mux_hazard_sel

);

initial begin
if_id_write = 1'b1;
pc_write = 1'b1;
mux_hazard_sel = 1'b1;
end

always@(*) 
    begin
        if((mem_read_ex) && (rd_ex == rs1_id || rd_ex == rs2_id)) begin 
            if_id_write = 1'b0;
            pc_write = 1'b0;
            mux_hazard_sel = 1'b0;
        end
        else begin 
            if_id_write = 1'b1;
            pc_write = 1'b1;
            mux_hazard_sel = 1'b1;
        end

    end                                     
endmodule