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
typedef enum bit [3:0] {ADD = 4'b0001, AND = 4'b0101, NOT = 4'b1001, LD = 0010, LDR = 0110, LDI = 1010, LEA = 1110, ST = 0011, STR = 0111, STI = 1011, BR = 0000, JMP = 1100}  opcode_t;
typedef enum bit [2:0] {Z = 010, NP = 101, P = 001, ZP = 011, N = 100, NZ = 110, NZP = 111} nzp_t;

// pragma uvmf custom additional begin
// pragma uvmf custom additional end

