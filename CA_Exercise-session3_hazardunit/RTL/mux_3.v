module mux_3 
  #(
   parameter integer DATA_W = 64
   )(
      input  wire [DATA_W-1:0] input_a,
      input  wire [DATA_W-1:0] input_b,
      input  wire [DATA_W-1:0] input_c,
      input  wire  [1      :0] sel,
      output reg  [DATA_W-1:0] mux_out
   );

   always@(*)begin
      
      if(sel == 2'b01)begin
         mux_out = input_b;
      end else if(sel == 2'b10)begin
         mux_out = input_c;
      end else begin 
         mux_out = input_a;
      end
   end
endmodule


