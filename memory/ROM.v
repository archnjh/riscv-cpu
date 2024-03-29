`timescale 1ns / 1ps

module ROM (
    input   [10:0]  address,
    output  [31:0]  out
);
    reg [31:0] rom [0:2047];

    initial begin
        $readmemh("test//test.hex", rom);
    end

    assign out = rom[address];
endmodule
