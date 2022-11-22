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
module SC_IMAGECOUNTER (
	//////////// OUTPUTS //////////
	SC_IMAGE_COUNTER_data_OutBUS,
	//////////// INPUTS //////////
	SC_IMAGE_COUNTER_CLOCK_50,
	SC_IMAGE_COUNTER_RESET_InHigh,
	SC_IMAGE_COUNTER_CUENTA_InBus
);
//=======================================================
//  PARAMETER declarations
//=======================================================
parameter DATAWIDTH_3 = 3;
//=======================================================
//  PORT declarations
//=======================================================
output	[DATAWIDTH_3-1:0]	SC_IMAGE_COUNTER_data_OutBUS;
input		SC_IMAGE_COUNTER_CLOCK_50;
input		SC_IMAGE_COUNTER_RESET_InHigh;
input		[DATAWIDTH_3-2:0] SC_IMAGE_COUNTER_CUENTA_InBus;
//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [DATAWIDTH_3-1:0] IMAGECOUNTER_Register;
reg [DATAWIDTH_3-1:0] IMAGECOUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
always @(*)
begin
	if (SC_IMAGE_COUNTER_CUENTA_InBus == 2'b00)
		IMAGECOUNTER_Signal = IMAGECOUNTER_Register + 1'b1;
	else if (SC_IMAGE_COUNTER_CUENTA_InBus == 2'b10)
		IMAGECOUNTER_Signal = 0;
	else
		IMAGECOUNTER_Signal = IMAGECOUNTER_Register;
	end	
//STATE REGISTER: SEQUENTIAL
always @(posedge SC_IMAGE_COUNTER_CLOCK_50, posedge SC_IMAGE_COUNTER_RESET_InHigh)
begin
	if (SC_IMAGE_COUNTER_RESET_InHigh == 1'b1)
		IMAGECOUNTER_Register <= 3'b000;
	else
		IMAGECOUNTER_Register <= IMAGECOUNTER_Signal;
end
//=======================================================
//  Outputs
//=======================================================
//OUTPUT LOGIC: COMBINATIONAL
assign SC_IMAGE_COUNTER_data_OutBUS = IMAGECOUNTER_Register;

endmodule
