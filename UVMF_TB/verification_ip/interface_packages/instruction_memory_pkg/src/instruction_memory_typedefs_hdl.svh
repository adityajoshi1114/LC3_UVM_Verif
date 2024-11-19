//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains defines and typedefs to be compiled for use in
// the simulation running on the emulator when using Veloce.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
                                                                               

typedef enum bit [2:0] {R0 = 0, R1 = 1, R2 = 2, R3 = 3, R4 = 4, R5 = 5, R6 = 6, R7 = 7} reg_t;
typedef enum bit [3:0] {ADD = 4'b0001, AND = 4'b0101, NOT = 4'b1001, LD = 4'b0010, LDR = 4'b0110, LDI = 4'b1010, LEA = 4'b1110, ST = 4'b0011, STR = 4'b0111, STI = 4'b1011, BR = 4'b0000, JMP = 4'b1100}  opcode_t;
typedef enum bit [2:0] {Z = 3'b010, NP = 3'b101, P = 3'b001, ZP = 3'b011, N = 3'b100, NZ = 3'b110, NZP = 3'b111} nzp_t;

// pragma uvmf custom additional begin
// pragma uvmf custom additional end

