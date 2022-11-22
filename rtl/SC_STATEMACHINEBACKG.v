///*######################################################################
//#	G0B1T: HDL EXAMPLES. 2018.
//######################################################################
//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================
module SC_STATEMACHINEBACKG #(parameter SPEEDCOMPARATOR_DATAWIDTH)(
	//////////// OUTPUTS //////////
	SC_STATEMACHINEBACKG_clear_OutLow,
	SC_STATEMACHINEBACKG_load_OutLow,
	SC_STATEMACHINEBACKG_shiftselection_Out,
	SC_STATEMACHINEBACKG_upcount_out,
	SC_STATEMACHINEBACKG_limit_OutBus,
	//////////// INPUTS //////////
	SC_STATEMACHINEBACKG_CLOCK_50,
	SC_STATEMACHINEBACKG_RESET_InHigh,
	SC_STATEMACHINEBACKG_T0_InLow,
	SC_STATEMACHINEBACKG_level_InBus
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_CHECK_0									= 1;
localparam STATE_LEVEL_1									= 2;
localparam STATE_LEVEL_2									= 3;
localparam STATE_LEVEL_3									= 4;
localparam STATE_LEVEL_4									= 5;
localparam STATE_LEVEL_5									= 6;
localparam STATE_SHIFT_0									= 7;
//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEBACKG_clear_OutLow;
output reg		SC_STATEMACHINEBACKG_load_OutLow;
output reg		[1:0] SC_STATEMACHINEBACKG_shiftselection_Out;
output reg 		SC_STATEMACHINEBACKG_upcount_out;
output reg 		[SPEEDCOMPARATOR_DATAWIDTH-1:0] SC_STATEMACHINEBACKG_limit_OutBus;
input			SC_STATEMACHINEBACKG_CLOCK_50;
input 		SC_STATEMACHINEBACKG_RESET_InHigh;
input			SC_STATEMACHINEBACKG_T0_InLow;
input			[2:0] SC_STATEMACHINEBACKG_level_InBus;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [3:0] STATE_Register;
reg [3:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: if (SC_STATEMACHINEBACKG_level_InBus == 3'b000) STATE_Signal = STATE_RESET_0;
						else STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINEBACKG_level_InBus == 3'b001) STATE_Signal = STATE_LEVEL_1;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b010) STATE_Signal = STATE_LEVEL_2;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b011) STATE_Signal = STATE_LEVEL_3;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b100) STATE_Signal = STATE_LEVEL_4;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b101) STATE_Signal = STATE_LEVEL_4;
						else STATE_Signal = STATE_RESET_0;
						
		STATE_LEVEL_1: if (SC_STATEMACHINEBACKG_T0_InLow == 1'b0) STATE_Signal = STATE_SHIFT_0;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b001) STATE_Signal = STATE_LEVEL_1;
						else STATE_Signal = STATE_CHECK_0;
		STATE_LEVEL_2: if (SC_STATEMACHINEBACKG_T0_InLow == 1'b0) STATE_Signal = STATE_SHIFT_0;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b010) STATE_Signal = STATE_LEVEL_2;
						else STATE_Signal = STATE_CHECK_0;
		STATE_LEVEL_3: if (SC_STATEMACHINEBACKG_T0_InLow == 1'b0) STATE_Signal = STATE_SHIFT_0;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b011) STATE_Signal = STATE_LEVEL_3;
						else STATE_Signal = STATE_CHECK_0;
		STATE_LEVEL_4: if (SC_STATEMACHINEBACKG_T0_InLow == 1'b0) STATE_Signal = STATE_SHIFT_0;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b100) STATE_Signal = STATE_LEVEL_4;
						else STATE_Signal = STATE_CHECK_0;
		STATE_LEVEL_5: if (SC_STATEMACHINEBACKG_T0_InLow == 1'b0) STATE_Signal = STATE_SHIFT_0;
						else if (SC_STATEMACHINEBACKG_level_InBus == 3'b100) STATE_Signal = STATE_LEVEL_5;
						else STATE_Signal = STATE_CHECK_0;
						
		STATE_SHIFT_0: 	STATE_Signal = STATE_CHECK_0;

		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEBACKG_CLOCK_50 , posedge SC_STATEMACHINEBACKG_RESET_InHigh)
begin
	if (SC_STATEMACHINEBACKG_RESET_InHigh == 1'b1)
		STATE_Register <= STATE_RESET_0;
	else
		STATE_Register <= STATE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
always @ (*)
begin
	case (STATE_Register)
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_0 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b0;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_limit_OutBus = 1'b0;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_limit_OutBus = 1'b0;
		end
//=========================================================
// STATE_LEVEL_1
//=========================================================
	STATE_LEVEL_1 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b0;
			SC_STATEMACHINEBACKG_limit_OutBus = 25'b1111111111111111111111111;
		end
//=========================================================
// STATE_LEVEL_2
//=========================================================
	STATE_LEVEL_2 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b0;
			SC_STATEMACHINEBACKG_limit_OutBus = 25'b1111000000000000000000000;
		end
//=========================================================
// STATE_LEVEL_3
//=========================================================
	STATE_LEVEL_3 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b0;
			SC_STATEMACHINEBACKG_limit_OutBus = 25'b1100000000000000000000000;
		end
//=========================================================
// STATE_LEVEL_4
//=========================================================
	STATE_LEVEL_4 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b0;
			SC_STATEMACHINEBACKG_limit_OutBus = 25'b1000000000000000000000000;
		end
//=========================================================
// STATE_LEVEL_5
//=========================================================
	STATE_LEVEL_5 :	
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b0;
			SC_STATEMACHINEBACKG_limit_OutBus = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_SHIFT
//=========================================================
	STATE_SHIFT_0 :
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b10; 
			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_limit_OutBus = 1'b0;
		end
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEBACKG_clear_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_load_OutLow = 1'b1;
			SC_STATEMACHINEBACKG_shiftselection_Out  = 2'b11;  
			SC_STATEMACHINEBACKG_upcount_out = 1'b1;
			SC_STATEMACHINEBACKG_limit_OutBus = 1'b0;
		end
	endcase
end
endmodule
