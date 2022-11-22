/*######################################################################
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
module CC_COMPARATOR_SIDE #(parameter DATAWIDTH_BUS=8)(
//////////// OUTPUTS //////////
	CC_COMPARATOR_SIDE_LOCATION_Out_Bus,
//////////// INPUTS //////////
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_0_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_1_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_2_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_3_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_4_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_5_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_6_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_7_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_8_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_9_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_10_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_11_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_12_In_Bus,
	CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_13_In_Bus
);
//=======================================================
//  PARAMETER declarations
//=======================================================
//=======================================================
//  PORT declarations
//=======================================================

output	reg [1:0] CC_COMPARATOR_SIDE_LOCATION_Out_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_0_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_1_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_2_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_3_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_4_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_5_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_6_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_7_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_8_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_9_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_10_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_11_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_12_In_Bus;
input 	[DATAWIDTH_BUS-1:0] CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_13_In_Bus;


//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
always @(*)
begin
	if ((CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_0_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_1_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_2_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_3_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_4_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_5_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_6_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_7_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_8_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_9_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_10_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_11_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_12_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_13_In_Bus) == 8'b00000001)
		CC_COMPARATOR_SIDE_LOCATION_Out_Bus = 2'b01;
	else if ((CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_0_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_1_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_2_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_3_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_4_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_5_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_6_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_7_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_8_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_9_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_10_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_11_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_12_In_Bus | CC_COMPARATOR_SIDE_ALBERT_FROG_ROW_13_In_Bus) == 8'b10000000)
		CC_COMPARATOR_SIDE_LOCATION_Out_Bus = 2'b10;
	else
		CC_COMPARATOR_SIDE_LOCATION_Out_Bus = 2'b11;
		
end

endmodule


