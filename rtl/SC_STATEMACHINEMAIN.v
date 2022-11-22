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
module SC_STATEMACHINEMAIN (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEMAIN_dataI_OutBus,
	SC_STATEMACHINEMAIN_changeP_OutBus,
	SC_STATEMACHINEMAIN_data14_OutBus,
	SC_STATEMACHINEMAIN_lifeC_OutBus,
	SC_STATEMACHINEMAIN_levelC_OutBus,
	SC_STATEMACHINEMAIN_reset_OutBit,
	//////////// INPUTS //////////
	SC_STATEMACHINEMAIN_CLOCK_50,
	SC_STATEMACHINEMAIN_RESET_InHigh,
	SC_STATEMACHINEMAIN_startButton_InLow,
	SC_STATEMACHINEMAIN_upButton_InLow,
	SC_STATEMACHINEMAIN_downButton_InLow,
	SC_STATEMACHINEMAIN_leftButton_InLow,
	SC_STATEMACHINEMAIN_rightButton_InLow,
	SC_STATEMACHINEMAIN_crash_InBus,
	SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus,
	SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus,
	SC_STATEMACHINEMAIN_lifeC_InBus,
	SC_STATEMACHINEMAIN_levelC_InBus,
	SC_STATEMACHINEMAIN_finishI_InLow
);	
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_BUS = 8;
parameter DATAWIDTH_4 = 4;
parameter DATAWIDTH_3 = 3;
parameter DATAWIDTH_2 = 2;
// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_RESET_1									= 1;
localparam STATE_RESET_2									= 2;
localparam STATE_SELECT_1									= 3;
localparam STATE_SELECT_1_0								= 4;
localparam STATE_SELECT_2									= 5;
localparam STATE_SELECT_2_0								= 6;
localparam STATE_SELECT_3									= 7;
localparam STATE_SELECT_3_0								= 8;
localparam STATE_SELECT_4									= 9;
localparam STATE_SELECT_4_0								= 10;
localparam STATE_START_0									= 11;
localparam STATE_START_1									= 12;
localparam STATE_START_2									= 13;
localparam STATE_CHECK_0									= 14;
localparam STATE_CRASH_3_0									= 15;
localparam STATE_CRASH_3_1									= 16;
localparam STATE_CRASH_2_0									= 17;
localparam STATE_CRASH_2_1									= 18;
localparam STATE_CRASH_1_0									= 19;
localparam STATE_CRASH_1_1									= 20;
localparam STATE_WINLIFE_0								   = 21;
localparam STATE_WINLIFE_1									= 22;
localparam STATE_TOP_0										= 23;
localparam STATE_TOP_1										= 24;
localparam STATE_TOP_1_0									= 25;
localparam STATE_TOP_1_1									= 26;
localparam STATE_TOP_2_0									= 27;
localparam STATE_TOP_2_1									= 28;
localparam STATE_TOP_3_0									= 29;
localparam STATE_TOP_3_1									= 30;
localparam STATE_TOP_F_0									= 31;
localparam STATE_TOP_F_1									= 32;
localparam STATE_SELECT_1_p								= 33;
localparam STATE_SELECT_2_p								= 34;
localparam STATE_SELECT_3_p								= 35;
localparam STATE_SELECT_4_p								= 36;

//=======================================================
//  PORT declarations
//=======================================================
output reg		[DATAWIDTH_4-1:0] SC_STATEMACHINEMAIN_dataI_OutBus;
output reg		[DATAWIDTH_2-1:0] SC_STATEMACHINEMAIN_changeP_OutBus;
output reg		[DATAWIDTH_BUS-1:0] SC_STATEMACHINEMAIN_data14_OutBus;
output reg		SC_STATEMACHINEMAIN_lifeC_OutBus;
output reg		[DATAWIDTH_3-1:0] SC_STATEMACHINEMAIN_levelC_OutBus;
output reg		SC_STATEMACHINEMAIN_reset_OutBit;
input			SC_STATEMACHINEMAIN_CLOCK_50;
input			SC_STATEMACHINEMAIN_RESET_InHigh;
input			SC_STATEMACHINEMAIN_startButton_InLow;
input			SC_STATEMACHINEMAIN_upButton_InLow;
input			SC_STATEMACHINEMAIN_downButton_InLow;
input			SC_STATEMACHINEMAIN_leftButton_InLow;
input			SC_STATEMACHINEMAIN_rightButton_InLow;
input			[DATAWIDTH_2-1:0]SC_STATEMACHINEMAIN_crash_InBus;
input			[DATAWIDTH_BUS-1:0] SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus;
input			[DATAWIDTH_BUS-1:0] SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
input			[DATAWIDTH_2-1:0] SC_STATEMACHINEMAIN_lifeC_InBus;
input			[DATAWIDTH_3-1:0] SC_STATEMACHINEMAIN_levelC_InBus;
input			SC_STATEMACHINEMAIN_finishI_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [5:0] STATE_Register;
reg [5:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_RESET_1;
		STATE_RESET_1: STATE_Signal = STATE_RESET_2;
		STATE_RESET_2: if (SC_STATEMACHINEMAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_p;
						else if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_RESET_2;
							else STATE_Signal = STATE_START_0;
							
		STATE_SELECT_1: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_2_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_4_p;
							else if (SC_STATEMACHINEMAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_0;
							else STATE_Signal = STATE_SELECT_1;
		
		STATE_SELECT_1_p: if (SC_STATEMACHINEMAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_p;
							else if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_p;
								else STATE_Signal = STATE_SELECT_1;
		
		STATE_SELECT_2_p: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_2_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_2_p;
								else STATE_Signal = STATE_SELECT_2;
		
		STATE_SELECT_3_p: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_3_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_3_p;
								else STATE_Signal = STATE_SELECT_3;
		
		STATE_SELECT_4_p: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_4_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_4_p;
								else STATE_Signal = STATE_SELECT_4;
		
		STATE_SELECT_1_0: STATE_Signal = STATE_CHECK_0;
		
		STATE_SELECT_2: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_3_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_p;
							else if (SC_STATEMACHINEMAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_2_0;
							else STATE_Signal = STATE_SELECT_2;
		
		STATE_SELECT_2_0: STATE_Signal = STATE_CHECK_0;
		
		STATE_SELECT_3: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_4_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_2_p;
							else if (SC_STATEMACHINEMAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_3_0;
							else STATE_Signal = STATE_SELECT_3;
		
		STATE_SELECT_3_0: STATE_Signal = STATE_CHECK_0;
		
		STATE_SELECT_4: if (SC_STATEMACHINEMAIN_rightButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_1_p;
							else if (SC_STATEMACHINEMAIN_leftButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_3_p;
							else if (SC_STATEMACHINEMAIN_startButton_InLow == 1'b0) STATE_Signal = STATE_SELECT_4_0;
							else STATE_Signal = STATE_SELECT_4;
		
		STATE_SELECT_4_0: STATE_Signal = STATE_CHECK_0;
		
		STATE_START_0: STATE_Signal = STATE_START_1;
		STATE_START_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_START_1;
							else STATE_Signal = STATE_START_2;
		STATE_START_2: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINEMAIN_crash_InBus == 2'b01 & SC_STATEMACHINEMAIN_lifeC_InBus == 2'b11) STATE_Signal = STATE_CRASH_3_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b01 & SC_STATEMACHINEMAIN_lifeC_InBus == 2'b10) STATE_Signal = STATE_CRASH_2_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b01 & SC_STATEMACHINEMAIN_lifeC_InBus == 2'b01) STATE_Signal = STATE_CRASH_1_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b11 & SC_STATEMACHINEMAIN_lifeC_InBus == 2'b01) STATE_Signal = STATE_WINLIFE_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b10 & ((SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus | SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus) != 8'b11111111)) STATE_Signal = STATE_TOP_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b10 & ((SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus | SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus) == 8'b11111111) & SC_STATEMACHINEMAIN_levelC_InBus == 3'b001) STATE_Signal = STATE_TOP_1_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b10 & ((SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus | SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus) == 8'b11111111) & SC_STATEMACHINEMAIN_levelC_InBus == 3'b010) STATE_Signal = STATE_TOP_2_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b10 & ((SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus | SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus) == 8'b11111111) & SC_STATEMACHINEMAIN_levelC_InBus == 3'b011) STATE_Signal = STATE_TOP_3_0;
						else if (SC_STATEMACHINEMAIN_crash_InBus == 2'b10 & ((SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus | SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus) == 8'b11111111) & SC_STATEMACHINEMAIN_levelC_InBus == 3'b100) STATE_Signal = STATE_TOP_F_0;
							else STATE_Signal = STATE_CHECK_0;
						
		STATE_CRASH_3_0: STATE_Signal = STATE_CRASH_3_1;
		STATE_CRASH_3_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_CRASH_3_1;
							else STATE_Signal = STATE_CHECK_0;
		STATE_CRASH_2_0: STATE_Signal = STATE_CRASH_2_1;
		STATE_CRASH_2_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_CRASH_2_1;
							else STATE_Signal = STATE_CHECK_0;
		STATE_CRASH_1_0: STATE_Signal = STATE_CRASH_1_1;
		STATE_CRASH_1_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_CRASH_1_1;
							else STATE_Signal = STATE_RESET_0;
		STATE_WINLIFE_0: STATE_Signal = STATE_WINLIFE_1;
		STATE_WINLIFE_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_WINLIFE_1;
							else STATE_Signal = STATE_CHECK_0;
							
		STATE_TOP_0: STATE_Signal = STATE_TOP_1;
		STATE_TOP_1: STATE_Signal = STATE_CHECK_0;
		STATE_TOP_1_0: STATE_Signal = STATE_TOP_1_1;
		STATE_TOP_1_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_TOP_1_1;
							else STATE_Signal = STATE_CHECK_0;
		STATE_TOP_2_0: STATE_Signal = STATE_TOP_2_1;
		STATE_TOP_2_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_TOP_2_1;
							else STATE_Signal = STATE_CHECK_0;
		STATE_TOP_3_0: STATE_Signal = STATE_TOP_3_1;
		STATE_TOP_3_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_TOP_3_1;
							else STATE_Signal = STATE_CHECK_0;
		STATE_TOP_F_0: STATE_Signal = STATE_TOP_F_1;
		STATE_TOP_F_1: if (SC_STATEMACHINEMAIN_finishI_InLow == 1'b0) STATE_Signal = STATE_TOP_F_1;
							else STATE_Signal = STATE_RESET_0;
							
		default : 		STATE_Signal = STATE_CHECK_0;
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEMAIN_CLOCK_50 , posedge SC_STATEMACHINEMAIN_RESET_InHigh)
begin
	if (SC_STATEMACHINEMAIN_RESET_InHigh == 1'b1)
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
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0110;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b1;
		end
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0110;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b1;
		end
//=========================================================
// STATE_RESET
//=========================================================
	STATE_RESET_2 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b1;
		end
//=========================================================
// STATE_SELECT_1_p
//=========================================================
	STATE_SELECT_1_p :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1100;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_1
//=========================================================
	STATE_SELECT_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1100;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_1_0
//=========================================================
	STATE_SELECT_1_0 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b01;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b11101111;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b001;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_2_p
//=========================================================
	STATE_SELECT_2_p :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1101;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_2
//=========================================================
	STATE_SELECT_2 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1101;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_2
//=========================================================
	STATE_SELECT_2_0 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b01;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b11100111;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b010;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_3_p
//=========================================================
	STATE_SELECT_3_p :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1110;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_3
//=========================================================
	STATE_SELECT_3 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1110;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_3_0
//=========================================================
	STATE_SELECT_3_0 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b01;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b10101101;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b011;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_4_p
//=========================================================
	STATE_SELECT_4_p :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1111;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_4
//=========================================================
	STATE_SELECT_4 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1111;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_SELECT_4_0
//=========================================================
	STATE_SELECT_4_0 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b01;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b10100101;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b100;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_START_0
//=========================================================
	STATE_START_0 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0001;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b00000000;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_START_1
//=========================================================
	STATE_START_1 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b11101111;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_START_2
//=========================================================
	STATE_START_2 :	
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b01;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b11101111;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CHECK_0
//=========================================================
	STATE_CHECK_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b00;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CRASH_3_0
//=========================================================
	STATE_CRASH_3_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b0;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CRASH_3_1
//=========================================================
	STATE_CRASH_3_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CRASH_2_0
//=========================================================
	STATE_CRASH_2_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1001;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b0;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CRASH_2_1
//=========================================================
	STATE_CRASH_2_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CRASH_1_0
//=========================================================
	STATE_CRASH_1_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1010;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b0;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_CRASH_1_1
//=========================================================
	STATE_CRASH_1_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_WINLIFE_0
//=========================================================
	STATE_WINLIFE_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b1011;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b0;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_WINLIFE_1
//=========================================================
	STATE_WINLIFE_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_0
//=========================================================
	STATE_TOP_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b01;
			SC_STATEMACHINEMAIN_data14_OutBus  = (SC_STATEMACHINEMAIN_POINTMATRIX_data14_InBus | SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus);
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_1
//=========================================================
	STATE_TOP_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b00;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_1_0
//=========================================================
	STATE_TOP_1_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0010;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b11100111;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b000;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_1_1
//=========================================================
	STATE_TOP_1_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_2_0
//=========================================================
	STATE_TOP_2_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0011;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b10101101;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b000;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_2_1
//=========================================================
	STATE_TOP_2_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_3_0
//=========================================================
	STATE_TOP_3_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0100;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = 8'b10100101;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b000;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_3_1
//=========================================================
	STATE_TOP_3_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_F_0
//=========================================================
	STATE_TOP_F_0 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0111;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b000;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// STATE_TOP_F_1
//=========================================================
	STATE_TOP_F_1 :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b10;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
//=========================================================
// DEFAULT
//=========================================================
	default :
		begin
			SC_STATEMACHINEMAIN_dataI_OutBus   = 4'b0000;
			SC_STATEMACHINEMAIN_changeP_OutBus = 2'b00;
			SC_STATEMACHINEMAIN_data14_OutBus  = SC_STATEMACHINEMAIN_BACKGMATRIX_data14_InBus;
			SC_STATEMACHINEMAIN_lifeC_OutBus   = 1'b1;
			SC_STATEMACHINEMAIN_levelC_OutBus  = 3'b111;
			SC_STATEMACHINEMAIN_reset_OutBit   = 1'b0;
		end
	endcase
end
endmodule
