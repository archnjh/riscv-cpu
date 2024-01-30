`timescale 1ns / 1ps

module MuxPC(
    input   [31:0]  I0,         // pc+4
    input   [31:0]  I1,         // JALR
    input   [31:0]  I2,         // JAL
    input   [31:0]  I3,         // branch
    input   [1:0]   s,          // pc_src
    input           branch,     // 是否分支
    input           b_type,     // 0 bne, 1 beq
    input   [31:0]  alu_res,    
    output  [31:0]  o           // 结果的 pc
);
    reg [31:0] out;
    always @(*) begin
        if (branch) begin
            if (b_type) begin // beq
                if (alu_res == 32'b0)   out <= I3;
                else                    out <= I0;
            end
            else begin // bne
                if (alu_res == 32'b0)   out <= I0;
                else                    out <= I3;
            end
        end
        else begin
            case (s)
                2'b00: out <= I0;
                2'b01: out <= I1;
                2'b10: out <= I2;
                2'b11: out <= I3;
            endcase
        end
    end
    assign o = out;
endmodule