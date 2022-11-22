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
module SC_RegBACKGTYPE_14 #(parameter RegBACKGTYPE_DATAWIDTH=8)(
	//////////// OUTPUTS //////////
	SC_RegBACKGTYPE_14_data_OutBUS,
	//////////// INPUTS //////////
	SC_RegBACKGTYPE_14_CLOCK_50,
	SC_RegBACKGTYPE_14_RESET_InHigh, 
	SC_RegBACKGTYPE_14_data_InBUS
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
output	[RegBACKGTYPE_DATAWIDTH-1:0]	SC_RegBACKGTYPE_14_data_OutBUS;
input		SC_RegBACKGTYPE_14_CLOCK_50;
input		SC_RegBACKGTYPE_14_RESET_InHigh;
input		[RegBACKGTYPE_DATAWIDTH-1:0]	SC_RegBACKGTYPE_14_data_InBUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [RegBACKGTYPE_DATAWIDTH-1:0] RegBACKGTYPE_Register;
reg [RegBACKGTYPE_DATAWIDTH-1:0] RegBACKGTYPE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	RegBACKGTYPE_Signal <= SC_RegBACKGTYPE_14_data_InBUS;
end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_RegBACKGTYPE_14_CLOCK_50, posedge SC_RegBACKGTYPE_14_RESET_InHigh)
begin
	if (SC_RegBACKGTYPE_14_RESET_InHigh == 1'b1)
		RegBACKGTYPE_Register <= 0;
	else
		RegBACKGTYPE_Register <= RegBACKGTYPE_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_RegBACKGTYPE_14_data_OutBUS = RegBACKGTYPE_Register;

endmodule
