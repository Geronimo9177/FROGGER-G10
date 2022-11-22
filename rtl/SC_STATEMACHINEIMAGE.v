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
module SC_STATEMACHINEIMAGE (
	//////////// OUTPUTS //////////
	SC_STATEMACHINEIMAGE_timer_OutBus,
	SC_STATEMACHINEIMAGE_finish_OutLow,
	SC_STATEMACHINEIMAGE_limit_OutBus,
	SC_STATEMACHINEIMAGE_data0_OutBus,
	SC_STATEMACHINEIMAGE_data1_OutBus,
	SC_STATEMACHINEIMAGE_data2_OutBus,
	SC_STATEMACHINEIMAGE_data3_OutBus,
	SC_STATEMACHINEIMAGE_data4_OutBus,
	SC_STATEMACHINEIMAGE_data5_OutBus,
	SC_STATEMACHINEIMAGE_data6_OutBus,
	SC_STATEMACHINEIMAGE_data7_OutBus,
	SC_STATEMACHINEIMAGE_counter_OutBus,
	//////////// INPUTS //////////
	SC_STATEMACHINEIMAGE_CLOCK_50,
	SC_STATEMACHINEIMAGE_RESET_InHigh,
	SC_STATEMACHINEIMAGE_timer_InLow,
	SC_STATEMACHINEIMAGE_dataI_InBus,
	SC_STATEMACHINEIMAGE_counter_InBus
);	
//=======================================================
//  PARAMETER declarations
//=======================================================

//=========================================================
// FROGGER LETTER
//=========================================================
parameter   SPEEDCOMPARATOR_DATAWIDTH = 26;
parameter	SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus   = 44'b0000000000000000000000000000000001111110000;
parameter   SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus   = 44'b1110111011100110001100111011100011111111000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus   = 44'b1000101010101001010010100010100001001100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus   = 44'b1110101010101000010000111010100001101100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus   = 44'b1000110010101011010110100011000011111110000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus   = 44'b1000101010101001010010100011100000000110000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus   = 44'b1000101011100110001100111010100011111110000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus   = 44'b0000000000000000000000000000000000000000000;
//=========================================================
// NIVEL 1
//=========================================================
parameter	SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus   = 36'b010001011111010001011110100000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus   = 36'b011001000100010001010000100001100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus   = 36'b010101000100001010011110100010100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus   = 36'b010011000100001010010000100000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus   = 36'b010001011111000100011110111000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus   = 36'b111111111111111111111111111111111111;
//=========================================================
// NIVEL 2
//=========================================================
parameter	SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus   = 36'b010001011111010001011110100001000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus   = 36'b011001000100010001010000100010100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus   = 36'b010101000100001010011110100000100000;
parameter   SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus   = 36'b010011000100001010010000100001000000;
parameter   SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus   = 36'b010001011111000100011110111011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus   = 36'b111111111111111111111111111111111111;
//=========================================================
// NIVEL 3
//=========================================================
parameter	SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus   = 36'b010001011111010001011110100011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus   = 36'b011001000100010001010000100000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus   = 36'b010101000100001010011110100011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus   = 36'b010011000100001010010000100000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus   = 36'b010001011111000100011110111011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus   = 36'b111111111111111111111111111111111111;
//=========================================================
// NIVEL 4
//=========================================================
parameter	SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus   = 36'b010001011111010001011110100010100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus   = 36'b011001000100010001010000100010100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus   = 36'b010101000100001010011110100011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus   = 36'b010011000100001010010000100000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus   = 36'b010001011111000100011110111000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus   = 36'b111111111111111111111111111111111111;
//=========================================================
// NIVEL 5
//=========================================================
parameter	SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus   = 36'b010001011111010001011110100011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus   = 36'b011001000100010001010000100010000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus   = 36'b010101000100001010011110100011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus   = 36'b010011000100001010010000100000100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus   = 36'b010001011111000100011110111011100000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus   = 36'b000000000000000000000000000000000000;
parameter	SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus   = 36'b111111111111111111111111111111111111;

// states declaration
localparam STATE_RESET_0									= 0;
localparam STATE_CHECK_0									= 1;
localparam STATE_CORAZON_3_0								= 2;
localparam STATE_CORAZON_3_1_0							= 3;
localparam STATE_CORAZON_3_1								= 4;
localparam STATE_CORAZON_3_2								= 5;
localparam STATE_CORAZON_3_3								= 6;
localparam STATE_CORAZON_2_0								= 7;
localparam STATE_CORAZON_2_1_0							= 8;
localparam STATE_CORAZON_2_1								= 9;
localparam STATE_CORAZON_2_2								= 10;
localparam STATE_CORAZON_2_3								= 11;
localparam STATE_CORAZON_1_0								= 12;
localparam STATE_CORAZON_1_1_0							= 13;
localparam STATE_CORAZON_1_1								= 14;
localparam STATE_CORAZON_1_2								= 15;
localparam STATE_CORAZON_1_3								= 16;
localparam STATE_CORAZON_1_4_0							= 17;
localparam STATE_CORAZON_1_4								= 18;
localparam STATE_CORAZON_1_5_0							= 19;
localparam STATE_CORAZON_1_5								= 20;
localparam STATE_CORAZON_1_6_0							= 21;
localparam STATE_CORAZON_1_6								= 22;
localparam STATE_CORAZON_1_7								= 23;
localparam STATE_CORAZON_1_8								= 24;
localparam STATE_WINCORAZON_0								= 25;
localparam STATE_WINCORAZON_1								= 26;
localparam STATE_WINCORAZON_2								= 27;
localparam STATE_WINCORAZON_3								= 28;
localparam STATE_WIN_0										= 29;
localparam STATE_WIN_1										= 30;
localparam STATE_WIN_2										= 31;
localparam STATE_WIN_3										= 32;
localparam STATE_SELECT_LEVEL_1							= 33;
localparam STATE_SELECT_LEVEL_2							= 34;
localparam STATE_SELECT_LEVEL_3							= 35;
localparam STATE_SELECT_LEVEL_4							= 36;

localparam STATE_FROGGER_0									= 37;
localparam STATE_FROGGER_0_1								= 38;
localparam STATE_FROGGER_1									= 39;
localparam STATE_FROGGER_1_1								= 40;
localparam STATE_FROGGER_2									= 41;
localparam STATE_FROGGER_2_1								= 42;
localparam STATE_FROGGER_3									= 43;
localparam STATE_FROGGER_3_1								= 44;
localparam STATE_FROGGER_4									= 45;
localparam STATE_FROGGER_4_1								= 46;
localparam STATE_FROGGER_5									= 47;
localparam STATE_FROGGER_5_1								= 48;
localparam STATE_FROGGER_6									= 49;
localparam STATE_FROGGER_6_1								= 50;
localparam STATE_FROGGER_7									= 51;
localparam STATE_FROGGER_7_1								= 52;
localparam STATE_FROGGER_8									= 53;
localparam STATE_FROGGER_8_1								= 54;
localparam STATE_FROGGER_9									= 55;
localparam STATE_FROGGER_9_1								= 56;
localparam STATE_FROGGER_10								= 57;
localparam STATE_FROGGER_10_1								= 58;
localparam STATE_FROGGER_11								= 59;
localparam STATE_FROGGER_11_1								= 60;
localparam STATE_FROGGER_12								= 61;
localparam STATE_FROGGER_12_1								= 62;
localparam STATE_FROGGER_13								= 63;
localparam STATE_FROGGER_13_1								= 64;
localparam STATE_FROGGER_14								= 65;
localparam STATE_FROGGER_14_1								= 66;
localparam STATE_FROGGER_15								= 67;
localparam STATE_FROGGER_15_1								= 68;
localparam STATE_FROGGER_16								= 69;
localparam STATE_FROGGER_16_1								= 70;
localparam STATE_FROGGER_17								= 71;
localparam STATE_FROGGER_17_1								= 72;
localparam STATE_FROGGER_18								= 73;
localparam STATE_FROGGER_18_1								= 74;
localparam STATE_FROGGER_19								= 75;
localparam STATE_FROGGER_19_1								= 77;
localparam STATE_FROGGER_20								= 78;
localparam STATE_FROGGER_20_1								= 79;
localparam STATE_FROGGER_21								= 80;
localparam STATE_FROGGER_21_1								= 81;
localparam STATE_FROGGER_22								= 82;
localparam STATE_FROGGER_22_1								= 83;
localparam STATE_FROGGER_23								= 84;
localparam STATE_FROGGER_23_1								= 85;
localparam STATE_FROGGER_24								= 86;
localparam STATE_FROGGER_24_1								= 87;
localparam STATE_FROGGER_25								= 88;
localparam STATE_FROGGER_25_1								= 89;
localparam STATE_FROGGER_26								= 90;
localparam STATE_FROGGER_26_1								= 91;
localparam STATE_FROGGER_27								= 92;
localparam STATE_FROGGER_27_1								= 93;
localparam STATE_FROGGER_28								= 94;
localparam STATE_FROGGER_28_1								= 95;
localparam STATE_FROGGER_29								= 96;
localparam STATE_FROGGER_29_1								= 97;
localparam STATE_FROGGER_30								= 98;
localparam STATE_FROGGER_30_1								= 99;
localparam STATE_FROGGER_31								= 100;
localparam STATE_FROGGER_31_1								= 101;
localparam STATE_FROGGER_32								= 102;
localparam STATE_FROGGER_32_1								= 103;
localparam STATE_FROGGER_33								= 104;
localparam STATE_FROGGER_33_1								= 105;
localparam STATE_FROGGER_34								= 106;
localparam STATE_FROGGER_34_1								= 107;
localparam STATE_FROGGER_35								= 108;
localparam STATE_FROGGER_35_1								= 109;
localparam STATE_FROGGER_36								= 110;
localparam STATE_FROGGER_36_1								= 111;
localparam STATE_FROGGER_37								= 112;
localparam STATE_FROGGER_37_1								= 113;


localparam STATE_LEVEL1_0									= 114;
localparam STATE_LEVEL1_0_1								= 115;
localparam STATE_LEVEL1_1									= 116;
localparam STATE_LEVEL1_1_1								= 117;
localparam STATE_LEVEL1_2									= 118;
localparam STATE_LEVEL1_2_1								= 119;
localparam STATE_LEVEL1_3									= 120;
localparam STATE_LEVEL1_3_1								= 121;
localparam STATE_LEVEL1_4									= 122;
localparam STATE_LEVEL1_4_1								= 123;
localparam STATE_LEVEL1_5									= 124;
localparam STATE_LEVEL1_5_1								= 125;
localparam STATE_LEVEL1_6									= 126;
localparam STATE_LEVEL1_6_1								= 127;
localparam STATE_LEVEL1_7									= 128;
localparam STATE_LEVEL1_7_1								= 129;
localparam STATE_LEVEL1_8									= 130;
localparam STATE_LEVEL1_8_1								= 131;
localparam STATE_LEVEL1_9									= 132;
localparam STATE_LEVEL1_9_1								= 133;
localparam STATE_LEVEL1_10								   = 134;
localparam STATE_LEVEL1_10_1								= 135;
localparam STATE_LEVEL1_11								   = 136;
localparam STATE_LEVEL1_11_1								= 137;
localparam STATE_LEVEL1_12								   = 138;
localparam STATE_LEVEL1_12_1								= 139;
localparam STATE_LEVEL1_13								   = 140;
localparam STATE_LEVEL1_13_1								= 141;
localparam STATE_LEVEL1_14								   = 142;
localparam STATE_LEVEL1_14_1								= 143;
localparam STATE_LEVEL1_15								   = 144;
localparam STATE_LEVEL1_15_1								= 145;
localparam STATE_LEVEL1_16								   = 146;
localparam STATE_LEVEL1_16_1								= 147;
localparam STATE_LEVEL1_17								   = 148;
localparam STATE_LEVEL1_17_1								= 149;
localparam STATE_LEVEL1_18								   = 150;
localparam STATE_LEVEL1_18_1								= 151;
localparam STATE_LEVEL1_19								   = 152;
localparam STATE_LEVEL1_19_1								= 153;
localparam STATE_LEVEL1_20								   = 154;
localparam STATE_LEVEL1_20_1								= 155;
localparam STATE_LEVEL1_21								   = 156;
localparam STATE_LEVEL1_21_1								= 157;
localparam STATE_LEVEL1_22								   = 158;
localparam STATE_LEVEL1_22_1								= 159;
localparam STATE_LEVEL1_23								   = 160;
localparam STATE_LEVEL1_23_1								= 161;
localparam STATE_LEVEL1_24								   = 162;
localparam STATE_LEVEL1_24_1								= 163;
localparam STATE_LEVEL1_25								   = 164;
localparam STATE_LEVEL1_25_1								= 165;
localparam STATE_LEVEL1_26								   = 166;
localparam STATE_LEVEL1_26_1								= 167;
localparam STATE_LEVEL1_27								   = 168;
localparam STATE_LEVEL1_27_1								= 169;
localparam STATE_LEVEL1_28								   = 170;
localparam STATE_LEVEL1_28_1								= 171;
localparam STATE_LEVEL1_29								   = 172;
localparam STATE_LEVEL1_29_1								= 173;


localparam STATE_LEVEL2_0									= 174;
localparam STATE_LEVEL2_0_1								= 175;
localparam STATE_LEVEL2_1									= 176;
localparam STATE_LEVEL2_1_1								= 177;
localparam STATE_LEVEL2_2									= 178;
localparam STATE_LEVEL2_2_1								= 179;
localparam STATE_LEVEL2_3									= 180;
localparam STATE_LEVEL2_3_1								= 181;
localparam STATE_LEVEL2_4									= 182;
localparam STATE_LEVEL2_4_1								= 183;
localparam STATE_LEVEL2_5									= 184;
localparam STATE_LEVEL2_5_1								= 185;
localparam STATE_LEVEL2_6									= 186;
localparam STATE_LEVEL2_6_1								= 187;
localparam STATE_LEVEL2_7									= 188;
localparam STATE_LEVEL2_7_1								= 189;
localparam STATE_LEVEL2_8									= 190;
localparam STATE_LEVEL2_8_1								= 191;
localparam STATE_LEVEL2_9									= 192;
localparam STATE_LEVEL2_9_1								= 193;
localparam STATE_LEVEL2_10								   = 194;
localparam STATE_LEVEL2_10_1								= 195;
localparam STATE_LEVEL2_11								   = 196;
localparam STATE_LEVEL2_11_1								= 197;
localparam STATE_LEVEL2_12								   = 198;
localparam STATE_LEVEL2_12_1								= 199;
localparam STATE_LEVEL2_13								   = 200;
localparam STATE_LEVEL2_13_1								= 201;
localparam STATE_LEVEL2_14								   = 202;
localparam STATE_LEVEL2_14_1								= 203;
localparam STATE_LEVEL2_15								   = 204;
localparam STATE_LEVEL2_15_1								= 205;
localparam STATE_LEVEL2_16								   = 206;
localparam STATE_LEVEL2_16_1								= 207;
localparam STATE_LEVEL2_17								   = 208;
localparam STATE_LEVEL2_17_1								= 209;
localparam STATE_LEVEL2_18								   = 210;
localparam STATE_LEVEL2_18_1								= 211;
localparam STATE_LEVEL2_19								   = 212;
localparam STATE_LEVEL2_19_1								= 213;
localparam STATE_LEVEL2_20								   = 214;
localparam STATE_LEVEL2_20_1								= 215;
localparam STATE_LEVEL2_21								   = 216;
localparam STATE_LEVEL2_21_1								= 217;
localparam STATE_LEVEL2_22								   = 218;
localparam STATE_LEVEL2_22_1								= 219;
localparam STATE_LEVEL2_23								   = 220;
localparam STATE_LEVEL2_23_1								= 221;
localparam STATE_LEVEL2_24								   = 222;
localparam STATE_LEVEL2_24_1								= 223;
localparam STATE_LEVEL2_25								   = 224;
localparam STATE_LEVEL2_25_1								= 225;
localparam STATE_LEVEL2_26								   = 226;
localparam STATE_LEVEL2_26_1								= 227;
localparam STATE_LEVEL2_27								   = 228;
localparam STATE_LEVEL2_27_1								= 229;
localparam STATE_LEVEL2_28								   = 230;
localparam STATE_LEVEL2_28_1								= 231;
localparam STATE_LEVEL2_29								   = 232;
localparam STATE_LEVEL2_29_1								= 233;



localparam STATE_LEVEL3_0									= 234;
localparam STATE_LEVEL3_0_1								= 235;
localparam STATE_LEVEL3_1									= 236;
localparam STATE_LEVEL3_1_1								= 237;
localparam STATE_LEVEL3_2									= 238;
localparam STATE_LEVEL3_2_1								= 239;
localparam STATE_LEVEL3_3									= 240;
localparam STATE_LEVEL3_3_1								= 241;
localparam STATE_LEVEL3_4									= 242;
localparam STATE_LEVEL3_4_1								= 243;
localparam STATE_LEVEL3_5									= 244;
localparam STATE_LEVEL3_5_1								= 245;
localparam STATE_LEVEL3_6									= 246;
localparam STATE_LEVEL3_6_1								= 247;
localparam STATE_LEVEL3_7									= 248;
localparam STATE_LEVEL3_7_1								= 249;
localparam STATE_LEVEL3_8									= 250;
localparam STATE_LEVEL3_8_1								= 251;
localparam STATE_LEVEL3_9									= 252;
localparam STATE_LEVEL3_9_1								= 253;
localparam STATE_LEVEL3_10								   = 254;
localparam STATE_LEVEL3_10_1								= 255;
localparam STATE_LEVEL3_11								   = 256;
localparam STATE_LEVEL3_11_1								= 257;
localparam STATE_LEVEL3_12								   = 258;
localparam STATE_LEVEL3_12_1								= 259;
localparam STATE_LEVEL3_13									= 260;
localparam STATE_LEVEL3_13_1								= 261;
localparam STATE_LEVEL3_14									= 262;
localparam STATE_LEVEL3_14_1								= 263;
localparam STATE_LEVEL3_15								   = 264;
localparam STATE_LEVEL3_15_1								= 265;
localparam STATE_LEVEL3_16									= 266;
localparam STATE_LEVEL3_16_1								= 267;
localparam STATE_LEVEL3_17								   = 268;
localparam STATE_LEVEL3_17_1								= 269;
localparam STATE_LEVEL3_18								   = 270;
localparam STATE_LEVEL3_18_1								= 271;
localparam STATE_LEVEL3_19								   = 272;
localparam STATE_LEVEL3_19_1								= 273;
localparam STATE_LEVEL3_20								   = 274;
localparam STATE_LEVEL3_20_1								= 275;
localparam STATE_LEVEL3_21								   = 276;
localparam STATE_LEVEL3_21_1								= 277;
localparam STATE_LEVEL3_22								   = 278;
localparam STATE_LEVEL3_22_1								= 279;
localparam STATE_LEVEL3_23								   = 280;
localparam STATE_LEVEL3_23_1								= 281;
localparam STATE_LEVEL3_24								   = 282;
localparam STATE_LEVEL3_24_1								= 283;
localparam STATE_LEVEL3_25								   = 284;
localparam STATE_LEVEL3_25_1								= 285;
localparam STATE_LEVEL3_26								   = 286;
localparam STATE_LEVEL3_26_1								= 287;
localparam STATE_LEVEL3_27								   = 288;
localparam STATE_LEVEL3_27_1								= 289;
localparam STATE_LEVEL3_28								   = 290;
localparam STATE_LEVEL3_28_1								= 291;
localparam STATE_LEVEL3_29								   = 292;
localparam STATE_LEVEL3_29_1								= 293;


localparam STATE_LEVEL4_0									= 294;
localparam STATE_LEVEL4_0_1								= 295;
localparam STATE_LEVEL4_1									= 296;
localparam STATE_LEVEL4_1_1								= 297;
localparam STATE_LEVEL4_2									= 298;
localparam STATE_LEVEL4_2_1								= 299;
localparam STATE_LEVEL4_3									= 300;
localparam STATE_LEVEL4_3_1								= 301;
localparam STATE_LEVEL4_4									= 302;
localparam STATE_LEVEL4_4_1								= 303;
localparam STATE_LEVEL4_5									= 304;
localparam STATE_LEVEL4_5_1								= 305;
localparam STATE_LEVEL4_6									= 306;
localparam STATE_LEVEL4_6_1								= 307;
localparam STATE_LEVEL4_7									= 308;
localparam STATE_LEVEL4_7_1								= 309;
localparam STATE_LEVEL4_8									= 310;
localparam STATE_LEVEL4_8_1								= 311;
localparam STATE_LEVEL4_9									= 312;
localparam STATE_LEVEL4_9_1								= 314;
localparam STATE_LEVEL4_10								   = 315;
localparam STATE_LEVEL4_10_1								= 316;
localparam STATE_LEVEL4_11								   = 317;
localparam STATE_LEVEL4_11_1								= 318;
localparam STATE_LEVEL4_12								   = 319;
localparam STATE_LEVEL4_12_1								= 320;
localparam STATE_LEVEL4_13								   = 321;
localparam STATE_LEVEL4_13_1								= 322;
localparam STATE_LEVEL4_14								   = 323;
localparam STATE_LEVEL4_14_1								= 324;
localparam STATE_LEVEL4_15								   = 325;
localparam STATE_LEVEL4_15_1								= 326;
localparam STATE_LEVEL4_16								   = 327;
localparam STATE_LEVEL4_16_1								= 328;
localparam STATE_LEVEL4_17								   = 329;
localparam STATE_LEVEL4_17_1								= 330;
localparam STATE_LEVEL4_18								   = 331;
localparam STATE_LEVEL4_18_1								= 332;
localparam STATE_LEVEL4_19								   = 333;
localparam STATE_LEVEL4_19_1								= 334;
localparam STATE_LEVEL4_20								   = 335;
localparam STATE_LEVEL4_20_1								= 336;
localparam STATE_LEVEL4_21								   = 337;
localparam STATE_LEVEL4_21_1								= 338;
localparam STATE_LEVEL4_22								   = 339;
localparam STATE_LEVEL4_22_1								= 340;
localparam STATE_LEVEL4_23								   = 341;
localparam STATE_LEVEL4_23_1								= 342;
localparam STATE_LEVEL4_24								   = 343;
localparam STATE_LEVEL4_24_1								= 344;
localparam STATE_LEVEL4_25								   = 345;
localparam STATE_LEVEL4_25_1								= 346;
localparam STATE_LEVEL4_26								   = 347;
localparam STATE_LEVEL4_26_1								= 348;
localparam STATE_LEVEL4_27								   = 349;
localparam STATE_LEVEL4_27_1								= 350;
localparam STATE_LEVEL4_28								   = 351;
localparam STATE_LEVEL4_28_1								= 352;
localparam STATE_LEVEL4_29								   = 353;
localparam STATE_LEVEL4_29_1								= 354;



localparam STATE_LEVEL5_0									= 355;
localparam STATE_LEVEL5_0_1								= 356;
localparam STATE_LEVEL5_1									= 357;
localparam STATE_LEVEL5_1_1								= 358;
localparam STATE_LEVEL5_2									= 359;
localparam STATE_LEVEL5_2_1								= 360;
localparam STATE_LEVEL5_3									= 361;
localparam STATE_LEVEL5_3_1								= 362;
localparam STATE_LEVEL5_4									= 363;
localparam STATE_LEVEL5_4_1								= 364;
localparam STATE_LEVEL5_5									= 365;
localparam STATE_LEVEL5_5_1								= 366;
localparam STATE_LEVEL5_6									= 367;
localparam STATE_LEVEL5_6_1								= 368;
localparam STATE_LEVEL5_7									= 369;
localparam STATE_LEVEL5_7_1								= 370;
localparam STATE_LEVEL5_8									= 371;
localparam STATE_LEVEL5_8_1								= 372;
localparam STATE_LEVEL5_9									= 373;
localparam STATE_LEVEL5_9_1								= 374;
localparam STATE_LEVEL5_10								   = 375;
localparam STATE_LEVEL5_10_1								= 376;
localparam STATE_LEVEL5_11								   = 377;
localparam STATE_LEVEL5_11_1								= 378;
localparam STATE_LEVEL5_12								   = 379;
localparam STATE_LEVEL5_12_1								= 380;
localparam STATE_LEVEL5_13								   = 381;
localparam STATE_LEVEL5_13_1								= 382;
localparam STATE_LEVEL5_14								   = 383;
localparam STATE_LEVEL5_14_1								= 384;
localparam STATE_LEVEL5_15								   = 385;
localparam STATE_LEVEL5_15_1								= 386;
localparam STATE_LEVEL5_16								   = 387;
localparam STATE_LEVEL5_16_1								= 388;
localparam STATE_LEVEL5_17								   = 389;
localparam STATE_LEVEL5_17_1								= 390;
localparam STATE_LEVEL5_18								   = 391;
localparam STATE_LEVEL5_18_1								= 392;
localparam STATE_LEVEL5_19								   = 393;
localparam STATE_LEVEL5_19_1								= 394;
localparam STATE_LEVEL5_20								   = 395;
localparam STATE_LEVEL5_20_1								= 396;
localparam STATE_LEVEL5_21								   = 397;
localparam STATE_LEVEL5_21_1								= 398;
localparam STATE_LEVEL5_22								   = 399;
localparam STATE_LEVEL5_22_1								= 400;
localparam STATE_LEVEL5_23								   = 401;
localparam STATE_LEVEL5_23_1								= 402;
localparam STATE_LEVEL5_24								   = 403;
localparam STATE_LEVEL5_24_1								= 404;
localparam STATE_LEVEL5_25								   = 405;
localparam STATE_LEVEL5_25_1								= 406;
localparam STATE_LEVEL5_26								   = 407;
localparam STATE_LEVEL5_26_1								= 408;
localparam STATE_LEVEL5_27								   = 409;
localparam STATE_LEVEL5_27_1								= 410;
localparam STATE_LEVEL5_28								   = 411;
localparam STATE_LEVEL5_28_1								= 412;
localparam STATE_LEVEL5_29								   = 413;
localparam STATE_LEVEL5_29_1								= 414;

localparam STATE_WIN_1_1									= 415;
localparam STATE_WIN_2_1									= 416;

//=======================================================
//  PORT declarations
//=======================================================
output reg		SC_STATEMACHINEIMAGE_timer_OutBus;
output reg		SC_STATEMACHINEIMAGE_finish_OutLow;
output reg		[SPEEDCOMPARATOR_DATAWIDTH-1:0] SC_STATEMACHINEIMAGE_limit_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data0_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data1_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data2_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data3_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data4_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data5_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data6_OutBus;
output reg     [7:0] SC_STATEMACHINEIMAGE_data7_OutBus;
output reg		[1:0] SC_STATEMACHINEIMAGE_counter_OutBus;
input			SC_STATEMACHINEIMAGE_CLOCK_50;
input 		SC_STATEMACHINEIMAGE_RESET_InHigh;
input			SC_STATEMACHINEIMAGE_timer_InLow;
input			[3:0] SC_STATEMACHINEIMAGE_dataI_InBus;
input			[2:0] SC_STATEMACHINEIMAGE_counter_InBus;

//=======================================================
//  REG/WIRE declarations
//=======================================================
reg [31:0] STATE_Register;
reg [31:0] STATE_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
// NEXT STATE LOGIC : COMBINATIONAL
always @(*)
begin
	case (STATE_Register)
		STATE_RESET_0: STATE_Signal = STATE_CHECK_0;
		STATE_CHECK_0: if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1000) STATE_Signal = STATE_CORAZON_3_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1001) STATE_Signal = STATE_CORAZON_2_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1010) STATE_Signal = STATE_CORAZON_1_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1011) STATE_Signal = STATE_WINCORAZON_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0111) STATE_Signal = STATE_WIN_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1101) STATE_Signal = STATE_SELECT_LEVEL_2;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1110) STATE_Signal = STATE_SELECT_LEVEL_3;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1111) STATE_Signal = STATE_SELECT_LEVEL_4;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0110) STATE_Signal = STATE_FROGGER_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0001) STATE_Signal = STATE_LEVEL1_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0010) STATE_Signal = STATE_LEVEL2_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0011) STATE_Signal = STATE_LEVEL3_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0100) STATE_Signal = STATE_LEVEL4_0;
						else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b0101) STATE_Signal = STATE_LEVEL5_0;
						else STATE_Signal = STATE_CHECK_0;
		
		STATE_CORAZON_3_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_3_0;
						else STATE_Signal = STATE_CORAZON_3_1_0;
		STATE_CORAZON_3_1_0: STATE_Signal = STATE_CORAZON_3_1;
		STATE_CORAZON_3_1: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_3_1;
						else STATE_Signal = STATE_CORAZON_3_2;
		STATE_CORAZON_3_2: if (SC_STATEMACHINEIMAGE_counter_InBus == 3'b011) STATE_Signal = STATE_CORAZON_3_3;
						else STATE_Signal = STATE_CORAZON_3_0;
		STATE_CORAZON_3_3: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_3_3;
						else STATE_Signal = STATE_CHECK_0;
						
						
		STATE_CORAZON_2_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_2_0;
						else STATE_Signal = STATE_CORAZON_2_1_0;
		STATE_CORAZON_2_1_0: STATE_Signal = STATE_CORAZON_2_1;
		STATE_CORAZON_2_1: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_2_1;
						else STATE_Signal = STATE_CORAZON_2_2;
		STATE_CORAZON_2_2: if (SC_STATEMACHINEIMAGE_counter_InBus == 3'b011) STATE_Signal = STATE_CORAZON_2_3;
						else STATE_Signal = STATE_CORAZON_2_0;
		STATE_CORAZON_2_3: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_2_3;
						else STATE_Signal = STATE_CHECK_0;
						
						
		STATE_CORAZON_1_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_0;
						else STATE_Signal = STATE_CORAZON_1_1_0;
		STATE_CORAZON_1_1_0: STATE_Signal = STATE_CORAZON_1_1;		
		STATE_CORAZON_1_1: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_1;
						else STATE_Signal = STATE_CORAZON_1_2;
		STATE_CORAZON_1_2: if (SC_STATEMACHINEIMAGE_counter_InBus == 3'b011) STATE_Signal = STATE_CORAZON_1_3;
						else STATE_Signal = STATE_CORAZON_1_0;
		STATE_CORAZON_1_3: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_3;
						else STATE_Signal = STATE_CORAZON_1_4_0;
						
		STATE_CORAZON_1_4_0: STATE_Signal = STATE_CORAZON_1_4;
		STATE_CORAZON_1_4: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_4;
						else STATE_Signal = STATE_CORAZON_1_5_0;
		STATE_CORAZON_1_5_0: STATE_Signal = STATE_CORAZON_1_5;
		STATE_CORAZON_1_5: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_5;
						else STATE_Signal = STATE_CORAZON_1_6_0;
		STATE_CORAZON_1_6_0: STATE_Signal = STATE_CORAZON_1_6;
		STATE_CORAZON_1_6: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_6;
						else STATE_Signal = STATE_CORAZON_1_7;
		STATE_CORAZON_1_7: if (SC_STATEMACHINEIMAGE_counter_InBus == 3'b011) STATE_Signal = STATE_CORAZON_1_8;
						else STATE_Signal = STATE_CORAZON_1_4;
		STATE_CORAZON_1_8: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_CORAZON_1_8;
						else STATE_Signal = STATE_RESET_0;
						
						
		STATE_WINCORAZON_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_WINCORAZON_0;
						else STATE_Signal = STATE_WINCORAZON_1;	
		STATE_WINCORAZON_1: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_WINCORAZON_1;
						else STATE_Signal = STATE_WINCORAZON_2;
		STATE_WINCORAZON_2: if (SC_STATEMACHINEIMAGE_counter_InBus == 3'b011) STATE_Signal = STATE_WINCORAZON_3;
						else STATE_Signal = STATE_WINCORAZON_0;
		STATE_WINCORAZON_3: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_WINCORAZON_3;
						else STATE_Signal = STATE_CHECK_0;	
						
						
		STATE_WIN_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_WIN_0;
						else STATE_Signal = STATE_WIN_1_1;
		STATE_WIN_1_1: STATE_Signal = STATE_WIN_1;
		STATE_WIN_1: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_WIN_1;
						else STATE_Signal = STATE_WIN_2_1;
		STATE_WIN_2_1: STATE_Signal = STATE_WIN_2;
		STATE_WIN_2: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_WIN_2;
						else STATE_Signal = STATE_WIN_3;
		STATE_WIN_3: if (SC_STATEMACHINEIMAGE_counter_InBus == 3'b011) STATE_Signal = STATE_CHECK_0;
						else STATE_Signal = STATE_WIN_0;
		
		STATE_SELECT_LEVEL_1: if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
									else STATE_Signal = STATE_CHECK_0;
		STATE_SELECT_LEVEL_2: if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1101) STATE_Signal = STATE_SELECT_LEVEL_2;
									else STATE_Signal = STATE_CHECK_0;
		STATE_SELECT_LEVEL_3: if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1110) STATE_Signal = STATE_SELECT_LEVEL_3;
									else STATE_Signal = STATE_CHECK_0;	
		STATE_SELECT_LEVEL_4: if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1111) STATE_Signal = STATE_SELECT_LEVEL_4;
									else STATE_Signal = STATE_CHECK_0;
									
		STATE_FROGGER_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_FROGGER_0;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_0_1;
		STATE_FROGGER_0_1: STATE_Signal = STATE_FROGGER_1;
		
		STATE_FROGGER_1: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_FROGGER_1;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_1_1;
		STATE_FROGGER_1_1: STATE_Signal = STATE_FROGGER_2;						
								
		STATE_FROGGER_2: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_FROGGER_2;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_2_1;
		STATE_FROGGER_2_1: STATE_Signal = STATE_FROGGER_3;
								
		STATE_FROGGER_3: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_FROGGER_3;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_3_1;
		STATE_FROGGER_3_1: STATE_Signal = STATE_FROGGER_4;
								
		STATE_FROGGER_4: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_4;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_4_1;
		STATE_FROGGER_4_1: STATE_Signal = STATE_FROGGER_5;						
								
		STATE_FROGGER_5: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_5;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_5_1;
		STATE_FROGGER_5_1: STATE_Signal = STATE_FROGGER_6;
		
		STATE_FROGGER_6: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_6;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_6_1;
		STATE_FROGGER_6_1: STATE_Signal = STATE_FROGGER_7;
		
		STATE_FROGGER_7: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_7;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_7_1;
		STATE_FROGGER_7_1: STATE_Signal = STATE_FROGGER_8;
		
		STATE_FROGGER_8: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_8;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_8_1;
		STATE_FROGGER_8_1: STATE_Signal = STATE_FROGGER_9;
		
		STATE_FROGGER_9: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_9;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_9_1;
		STATE_FROGGER_9_1: STATE_Signal = STATE_FROGGER_10;
		
		STATE_FROGGER_10: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_10;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_10_1;
		STATE_FROGGER_10_1: STATE_Signal = STATE_FROGGER_11;
								
		STATE_FROGGER_11: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_11;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_11_1;
		STATE_FROGGER_11_1: STATE_Signal = STATE_FROGGER_12;
								
		STATE_FROGGER_12: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_12;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_12_1;
		STATE_FROGGER_12_1: STATE_Signal = STATE_FROGGER_13;
								
		STATE_FROGGER_13: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_13;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_13_1;
		STATE_FROGGER_13_1: STATE_Signal = STATE_FROGGER_14;
		
		STATE_FROGGER_14: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_14;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_14_1;
		STATE_FROGGER_14_1: STATE_Signal = STATE_FROGGER_15;						
								
		STATE_FROGGER_15: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_15;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_15_1;
		STATE_FROGGER_15_1: STATE_Signal = STATE_FROGGER_16;
		
		STATE_FROGGER_16: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_16;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_16_1;
		STATE_FROGGER_16_1: STATE_Signal = STATE_FROGGER_17;
		
		STATE_FROGGER_17: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_17;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_17_1;
		STATE_FROGGER_17_1: STATE_Signal = STATE_FROGGER_18;						
								
		STATE_FROGGER_18: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_18;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_18_1;
		STATE_FROGGER_18_1: STATE_Signal = STATE_FROGGER_19;						
								
		STATE_FROGGER_19: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_19;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_19_1;
		STATE_FROGGER_19_1: STATE_Signal = STATE_FROGGER_20;
		
		STATE_FROGGER_20: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_20;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_20_1;
		STATE_FROGGER_20_1: STATE_Signal = STATE_FROGGER_21;						
								
		STATE_FROGGER_21: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_21;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_21_1;
		STATE_FROGGER_21_1: STATE_Signal = STATE_FROGGER_22;						
								
		STATE_FROGGER_22: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_22;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_22_1;
		STATE_FROGGER_22_1: STATE_Signal = STATE_FROGGER_23;
								
		STATE_FROGGER_23: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_23;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_23_1;
		STATE_FROGGER_23_1: STATE_Signal = STATE_FROGGER_24;
		
		STATE_FROGGER_24: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_24;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_24_1;
		STATE_FROGGER_24_1: STATE_Signal = STATE_FROGGER_25;
								
		STATE_FROGGER_25: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_25;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_25_1;
		STATE_FROGGER_25_1: STATE_Signal = STATE_FROGGER_26;
		
		STATE_FROGGER_26: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_26;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_26_1;
		STATE_FROGGER_26_1: STATE_Signal = STATE_FROGGER_27;
								
		STATE_FROGGER_27: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_27;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_27_1;
		STATE_FROGGER_27_1: STATE_Signal = STATE_FROGGER_28;
								
		STATE_FROGGER_28: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_28;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_28_1;
		STATE_FROGGER_28_1: STATE_Signal = STATE_FROGGER_29;						
								
		STATE_FROGGER_29: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_29;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_29_1;
		STATE_FROGGER_29_1: STATE_Signal = STATE_FROGGER_30;						
								
		STATE_FROGGER_30: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_30;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_30_1;
		STATE_FROGGER_30_1: STATE_Signal = STATE_FROGGER_31;						
								
		STATE_FROGGER_31: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_31;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_31_1;
		STATE_FROGGER_31_1: STATE_Signal = STATE_FROGGER_32;						
								
		STATE_FROGGER_32: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_32;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_32_1;
		STATE_FROGGER_32_1: STATE_Signal = STATE_FROGGER_33;						
								
		STATE_FROGGER_33: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_33;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_33_1;
		STATE_FROGGER_33_1: STATE_Signal = STATE_FROGGER_34;						
								
		STATE_FROGGER_34: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_34;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_34_1;
		STATE_FROGGER_34_1: STATE_Signal = STATE_FROGGER_35;
								
		STATE_FROGGER_35: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_35;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_35_1;
		STATE_FROGGER_35_1: STATE_Signal = STATE_FROGGER_36;						
								
		STATE_FROGGER_36: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_36;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_36_1;
		STATE_FROGGER_36_1: STATE_Signal = STATE_FROGGER_37;
		
		STATE_FROGGER_37: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_FROGGER_37;
							else if (SC_STATEMACHINEIMAGE_dataI_InBus == 4'b1100) STATE_Signal = STATE_SELECT_LEVEL_1;
								else STATE_Signal = STATE_FROGGER_37_1;
		STATE_FROGGER_37_1: STATE_Signal = STATE_CHECK_0;
		
		////////////////////////////////////////////////////////////////////////////
		//Nivel 1
		///////////////////////////////////////////////////////////////////////////
		
		
		STATE_LEVEL1_0: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_0;
								else STATE_Signal = STATE_LEVEL1_0_1;
		STATE_LEVEL1_0_1: STATE_Signal = STATE_LEVEL1_1;
		
		STATE_LEVEL1_1: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_1;
								else STATE_Signal = STATE_LEVEL1_1_1;
		STATE_LEVEL1_1_1: STATE_Signal = STATE_LEVEL1_2;						
								
		STATE_LEVEL1_2: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_2;
								else STATE_Signal = STATE_LEVEL1_2_1;
		STATE_LEVEL1_2_1: STATE_Signal = STATE_LEVEL1_3;
								
		STATE_LEVEL1_3: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_3;
								else STATE_Signal = STATE_LEVEL1_3_1;
		STATE_LEVEL1_3_1: STATE_Signal = STATE_LEVEL1_4;
								
		STATE_LEVEL1_4: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_4;
								else STATE_Signal = STATE_LEVEL1_4_1;
		STATE_LEVEL1_4_1: STATE_Signal = STATE_LEVEL1_5;						
								
		STATE_LEVEL1_5: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_5;
								else STATE_Signal = STATE_LEVEL1_5_1;
		STATE_LEVEL1_5_1: STATE_Signal = STATE_LEVEL1_6;
		
		STATE_LEVEL1_6: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_6;
								else STATE_Signal = STATE_LEVEL1_6_1;
		STATE_LEVEL1_6_1: STATE_Signal = STATE_LEVEL1_7;
		
		STATE_LEVEL1_7: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_7;
								else STATE_Signal = STATE_LEVEL1_7_1;
		STATE_LEVEL1_7_1: STATE_Signal = STATE_LEVEL1_8;
		
		STATE_LEVEL1_8: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_8;
								else STATE_Signal = STATE_LEVEL1_8_1;
		STATE_LEVEL1_8_1: STATE_Signal = STATE_LEVEL1_9;
		
		STATE_LEVEL1_9: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_9;
								else STATE_Signal = STATE_LEVEL1_9_1;
		STATE_LEVEL1_9_1: STATE_Signal = STATE_LEVEL1_10;
		
		STATE_LEVEL1_10: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_10;
								else STATE_Signal = STATE_LEVEL1_10_1;
		STATE_LEVEL1_10_1: STATE_Signal = STATE_LEVEL1_11;
								
		STATE_LEVEL1_11: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_11;
								else STATE_Signal = STATE_LEVEL1_11_1;
		STATE_LEVEL1_11_1: STATE_Signal = STATE_LEVEL1_12;
								
		STATE_LEVEL1_12: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_12;
								else STATE_Signal = STATE_LEVEL1_12_1;
		STATE_LEVEL1_12_1: STATE_Signal = STATE_LEVEL1_13;
								
		STATE_LEVEL1_13: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_13;
								else STATE_Signal = STATE_LEVEL1_13_1;
		STATE_LEVEL1_13_1: STATE_Signal = STATE_LEVEL1_14;
		
		STATE_LEVEL1_14: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_14;
								else STATE_Signal = STATE_LEVEL1_14_1;
		STATE_LEVEL1_14_1: STATE_Signal = STATE_LEVEL1_15;						
								
		STATE_LEVEL1_15: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_15;
								else STATE_Signal = STATE_LEVEL1_15_1;
		STATE_LEVEL1_15_1: STATE_Signal = STATE_LEVEL1_16;
		
		STATE_LEVEL1_16: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_16;
								else STATE_Signal = STATE_LEVEL1_16_1;
		STATE_LEVEL1_16_1: STATE_Signal = STATE_LEVEL1_17;
		
		STATE_LEVEL1_17: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_17;
								else STATE_Signal = STATE_LEVEL1_17_1;
		STATE_LEVEL1_17_1: STATE_Signal = STATE_LEVEL1_18;						
								
		STATE_LEVEL1_18: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_18;
								else STATE_Signal = STATE_LEVEL1_18_1;
		STATE_LEVEL1_18_1: STATE_Signal = STATE_LEVEL1_19;						
								
		STATE_LEVEL1_19: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_19;
								else STATE_Signal = STATE_LEVEL1_19_1;
		STATE_LEVEL1_19_1: STATE_Signal = STATE_LEVEL1_20;
		
		STATE_LEVEL1_20: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_20;
								else STATE_Signal = STATE_LEVEL1_20_1;
		STATE_LEVEL1_20_1: STATE_Signal = STATE_LEVEL1_21;						
								
		STATE_LEVEL1_21: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_21;
								else STATE_Signal = STATE_LEVEL1_21_1;
		STATE_LEVEL1_21_1: STATE_Signal = STATE_LEVEL1_22;						
								
		STATE_LEVEL1_22: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_22;
								else STATE_Signal = STATE_LEVEL1_22_1;
		STATE_LEVEL1_22_1: STATE_Signal = STATE_LEVEL1_23;
								
		STATE_LEVEL1_23: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_23;
								else STATE_Signal = STATE_LEVEL1_23_1;
		STATE_LEVEL1_23_1: STATE_Signal = STATE_LEVEL1_24;
		
		STATE_LEVEL1_24: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_24;
								else STATE_Signal = STATE_LEVEL1_24_1;
		STATE_LEVEL1_24_1: STATE_Signal = STATE_LEVEL1_25;
								
		STATE_LEVEL1_25: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_25;
								else STATE_Signal = STATE_LEVEL1_25_1;
		STATE_LEVEL1_25_1: STATE_Signal = STATE_LEVEL1_26;
		
		STATE_LEVEL1_26: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_26;
								else STATE_Signal = STATE_LEVEL1_26_1;
		STATE_LEVEL1_26_1: STATE_Signal = STATE_LEVEL1_27;
								
		STATE_LEVEL1_27: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_27;
								else STATE_Signal = STATE_LEVEL1_27_1;
		STATE_LEVEL1_27_1: STATE_Signal = STATE_LEVEL1_28;
								
		STATE_LEVEL1_28: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_28;
								else STATE_Signal = STATE_LEVEL1_28_1;
		STATE_LEVEL1_28_1: STATE_Signal = STATE_LEVEL1_29;						
								
		STATE_LEVEL1_29: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL1_29;
								else STATE_Signal = STATE_LEVEL1_29_1;
		STATE_LEVEL1_29_1: STATE_Signal =  STATE_CHECK_0;
		
		
		
////////////////////////////////////////////////////////////////////////////
//Nivel 2
///////////////////////////////////////////////////////////////////////////
		
		
		STATE_LEVEL2_0: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_0;
								else STATE_Signal = STATE_LEVEL2_0_1;
		STATE_LEVEL2_0_1: STATE_Signal = STATE_LEVEL2_1;
		
		STATE_LEVEL2_1: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_1;
								else STATE_Signal = STATE_LEVEL2_1_1;
		STATE_LEVEL2_1_1: STATE_Signal = STATE_LEVEL2_2;						
								
		STATE_LEVEL2_2: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_2;
								else STATE_Signal = STATE_LEVEL2_2_1;
		STATE_LEVEL2_2_1: STATE_Signal = STATE_LEVEL2_3;
								
		STATE_LEVEL2_3: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_3;
								else STATE_Signal = STATE_LEVEL2_3_1;
		STATE_LEVEL2_3_1: STATE_Signal = STATE_LEVEL2_4;
								
		STATE_LEVEL2_4: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_4;
								else STATE_Signal = STATE_LEVEL2_4_1;
		STATE_LEVEL2_4_1: STATE_Signal = STATE_LEVEL2_5;						
								
		STATE_LEVEL2_5: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_5;
								else STATE_Signal = STATE_LEVEL2_5_1;
		STATE_LEVEL2_5_1: STATE_Signal = STATE_LEVEL2_6;
		
		STATE_LEVEL2_6: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_6;
								else STATE_Signal = STATE_LEVEL2_6_1;
		STATE_LEVEL2_6_1: STATE_Signal = STATE_LEVEL2_7;
		
		STATE_LEVEL2_7: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_7;
								else STATE_Signal = STATE_LEVEL2_7_1;
		STATE_LEVEL2_7_1: STATE_Signal = STATE_LEVEL2_8;
		
		STATE_LEVEL2_8: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_8;
								else STATE_Signal = STATE_LEVEL2_8_1;
		STATE_LEVEL2_8_1: STATE_Signal = STATE_LEVEL2_9;
		
		STATE_LEVEL2_9: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_9;
								else STATE_Signal = STATE_LEVEL2_9_1;
		STATE_LEVEL2_9_1: STATE_Signal = STATE_LEVEL2_10;
		
		STATE_LEVEL2_10: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_10;
								else STATE_Signal = STATE_LEVEL2_10_1;
		STATE_LEVEL2_10_1: STATE_Signal = STATE_LEVEL2_11;
								
		STATE_LEVEL2_11: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_11;
								else STATE_Signal = STATE_LEVEL2_11_1;
		STATE_LEVEL2_11_1: STATE_Signal = STATE_LEVEL2_12;
								
		STATE_LEVEL2_12: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_12;
								else STATE_Signal = STATE_LEVEL2_12_1;
		STATE_LEVEL2_12_1: STATE_Signal = STATE_LEVEL2_13;
								
		STATE_LEVEL2_13: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_13;
								else STATE_Signal = STATE_LEVEL2_13_1;
		STATE_LEVEL2_13_1: STATE_Signal = STATE_LEVEL2_14;
		
		STATE_LEVEL2_14: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_14;
								else STATE_Signal = STATE_LEVEL2_14_1;
		STATE_LEVEL2_14_1: STATE_Signal = STATE_LEVEL2_15;						
								
		STATE_LEVEL2_15: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_15;
								else STATE_Signal = STATE_LEVEL2_15_1;
		STATE_LEVEL2_15_1: STATE_Signal = STATE_LEVEL2_16;
		
		STATE_LEVEL2_16: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_16;
								else STATE_Signal = STATE_LEVEL2_16_1;
		STATE_LEVEL2_16_1: STATE_Signal = STATE_LEVEL2_17;
		
		STATE_LEVEL2_17: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_17;
								else STATE_Signal = STATE_LEVEL2_17_1;
		STATE_LEVEL2_17_1: STATE_Signal = STATE_LEVEL2_18;						
								
		STATE_LEVEL2_18: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_18;
								else STATE_Signal = STATE_LEVEL2_18_1;
		STATE_LEVEL2_18_1: STATE_Signal = STATE_LEVEL2_19;						
								
		STATE_LEVEL2_19: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_19;
								else STATE_Signal = STATE_LEVEL2_19_1;
		STATE_LEVEL2_19_1: STATE_Signal = STATE_LEVEL2_20;
		
		STATE_LEVEL2_20: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_20;
								else STATE_Signal = STATE_LEVEL2_20_1;
		STATE_LEVEL2_20_1: STATE_Signal = STATE_LEVEL2_21;						
								
		STATE_LEVEL2_21: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_21;
								else STATE_Signal = STATE_LEVEL2_21_1;
		STATE_LEVEL2_21_1: STATE_Signal = STATE_LEVEL2_22;						
								
		STATE_LEVEL2_22: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_22;
								else STATE_Signal = STATE_LEVEL2_22_1;
		STATE_LEVEL2_22_1: STATE_Signal = STATE_LEVEL2_23;
								
		STATE_LEVEL2_23: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_23;
								else STATE_Signal = STATE_LEVEL2_23_1;
		STATE_LEVEL2_23_1: STATE_Signal = STATE_LEVEL2_24;
		
		STATE_LEVEL2_24: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_24;
								else STATE_Signal = STATE_LEVEL2_24_1;
		STATE_LEVEL2_24_1: STATE_Signal = STATE_LEVEL2_25;
								
		STATE_LEVEL2_25: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_25;
								else STATE_Signal = STATE_LEVEL2_25_1;
		STATE_LEVEL2_25_1: STATE_Signal = STATE_LEVEL2_26;
		
		STATE_LEVEL2_26: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_26;
								else STATE_Signal = STATE_LEVEL2_26_1;
		STATE_LEVEL2_26_1: STATE_Signal = STATE_LEVEL2_27;
								
		STATE_LEVEL2_27: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_27;
								else STATE_Signal = STATE_LEVEL2_27_1;
		STATE_LEVEL2_27_1: STATE_Signal = STATE_LEVEL2_28;
								
		STATE_LEVEL2_28: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_28;
								else STATE_Signal = STATE_LEVEL2_28_1;
		STATE_LEVEL2_28_1: STATE_Signal = STATE_LEVEL2_29;						
								
		STATE_LEVEL2_29: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL2_29;
								else STATE_Signal = STATE_LEVEL2_29_1;
		STATE_LEVEL2_29_1: STATE_Signal =  STATE_CHECK_0;
		
///////////////////////////////////
////  NIVEL 3
///////////////////////		
		
		
		STATE_LEVEL3_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_LEVEL3_0;
								else STATE_Signal = STATE_LEVEL3_0_1;
		STATE_LEVEL3_0_1: STATE_Signal = STATE_LEVEL3_1;
		
		STATE_LEVEL3_1: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_1;
								else STATE_Signal = STATE_LEVEL3_1_1;
		STATE_LEVEL3_1_1: STATE_Signal = STATE_LEVEL3_2;						
								
		STATE_LEVEL3_2: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_2;
								else STATE_Signal = STATE_LEVEL3_2_1;
		STATE_LEVEL3_2_1: STATE_Signal = STATE_LEVEL3_3;
								
		STATE_LEVEL3_3: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_3;
								else STATE_Signal = STATE_LEVEL3_3_1;
		STATE_LEVEL3_3_1: STATE_Signal = STATE_LEVEL3_4;
								
		STATE_LEVEL3_4: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_4;
								else STATE_Signal = STATE_LEVEL3_4_1;
		STATE_LEVEL3_4_1: STATE_Signal = STATE_LEVEL3_5;						
								
		STATE_LEVEL3_5: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_5;
								else STATE_Signal = STATE_LEVEL3_5_1;
		STATE_LEVEL3_5_1: STATE_Signal = STATE_LEVEL3_6;
		
		STATE_LEVEL3_6: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_6;
								else STATE_Signal = STATE_LEVEL3_6_1;
		STATE_LEVEL3_6_1: STATE_Signal = STATE_LEVEL3_7;
		
		STATE_LEVEL3_7: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_7;
								else STATE_Signal = STATE_LEVEL3_7_1;
		STATE_LEVEL3_7_1: STATE_Signal = STATE_LEVEL3_8;
		
		STATE_LEVEL3_8: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_8;
								else STATE_Signal = STATE_LEVEL3_8_1;
		STATE_LEVEL3_8_1: STATE_Signal = STATE_LEVEL3_9;
		
		STATE_LEVEL3_9: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_9;
								else STATE_Signal = STATE_LEVEL3_9_1;
		STATE_LEVEL3_9_1: STATE_Signal = STATE_LEVEL3_10;
		
		STATE_LEVEL3_10: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_10;
								else STATE_Signal = STATE_LEVEL3_10_1;
		STATE_LEVEL3_10_1: STATE_Signal = STATE_LEVEL3_11;
								
		STATE_LEVEL3_11: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_11;
								else STATE_Signal = STATE_LEVEL3_11_1;
		STATE_LEVEL3_11_1: STATE_Signal = STATE_LEVEL3_12;
								
		STATE_LEVEL3_12: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_12;
								else STATE_Signal = STATE_LEVEL3_12_1;
		STATE_LEVEL3_12_1: STATE_Signal = STATE_LEVEL3_13;
								
		STATE_LEVEL3_13: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_13;
								else STATE_Signal = STATE_LEVEL3_13_1;
		STATE_LEVEL3_13_1: STATE_Signal = STATE_LEVEL3_14;
		
		STATE_LEVEL3_14: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_14;
								else STATE_Signal = STATE_LEVEL3_14_1;
		STATE_LEVEL3_14_1: STATE_Signal = STATE_LEVEL3_15;						
								
		STATE_LEVEL3_15: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_15;
								else STATE_Signal = STATE_LEVEL3_15_1;
		STATE_LEVEL3_15_1: STATE_Signal = STATE_LEVEL3_16;
		
		STATE_LEVEL3_16: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_16;
								else STATE_Signal = STATE_LEVEL3_16_1;
		STATE_LEVEL3_16_1: STATE_Signal = STATE_LEVEL3_17;
		
		STATE_LEVEL3_17: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_17;
								else STATE_Signal = STATE_LEVEL3_17_1;
		STATE_LEVEL3_17_1: STATE_Signal = STATE_LEVEL3_18;						
								
		STATE_LEVEL3_18: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_18;
								else STATE_Signal = STATE_LEVEL3_18_1;
		STATE_LEVEL3_18_1: STATE_Signal = STATE_LEVEL3_19;						
								
		STATE_LEVEL3_19: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_19;
								else STATE_Signal = STATE_LEVEL3_19_1;
		STATE_LEVEL3_19_1: STATE_Signal = STATE_LEVEL3_20;
		
		STATE_LEVEL3_20: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_20;
								else STATE_Signal = STATE_LEVEL3_20_1;
		STATE_LEVEL3_20_1: STATE_Signal = STATE_LEVEL3_21;						
								
		STATE_LEVEL3_21: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_21;
								else STATE_Signal = STATE_LEVEL3_21_1;
		STATE_LEVEL3_21_1: STATE_Signal = STATE_LEVEL3_22;						
								
		STATE_LEVEL3_22: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_22;
								else STATE_Signal = STATE_LEVEL3_22_1;
		STATE_LEVEL3_22_1: STATE_Signal = STATE_LEVEL3_23;
								
		STATE_LEVEL3_23: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_23;
								else STATE_Signal = STATE_LEVEL3_23_1;
		STATE_LEVEL3_23_1: STATE_Signal = STATE_LEVEL3_24;
		
		STATE_LEVEL3_24: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_24;
								else STATE_Signal = STATE_LEVEL3_24_1;
		STATE_LEVEL3_24_1: STATE_Signal = STATE_LEVEL3_25;
								
		STATE_LEVEL3_25: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_25;
								else STATE_Signal = STATE_LEVEL3_25_1;
		STATE_LEVEL3_25_1: STATE_Signal = STATE_LEVEL3_26;
		
		STATE_LEVEL3_26: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_26;
								else STATE_Signal = STATE_LEVEL3_26_1;
		STATE_LEVEL3_26_1: STATE_Signal = STATE_LEVEL3_27;
								
		STATE_LEVEL3_27: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_27;
								else STATE_Signal = STATE_LEVEL3_27_1;
		STATE_LEVEL3_27_1: STATE_Signal = STATE_LEVEL3_28;
								
		STATE_LEVEL3_28: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_28;
								else STATE_Signal = STATE_LEVEL3_28_1;
		STATE_LEVEL3_28_1: STATE_Signal = STATE_LEVEL3_29;						
								
		STATE_LEVEL3_29: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL3_29;
								else STATE_Signal = STATE_LEVEL3_29_1;
		STATE_LEVEL3_29_1: STATE_Signal =  STATE_CHECK_0;
		
		
///////////////////////////////////
////  NIVEL 4
///////////////////////		
		
		
		STATE_LEVEL4_0: if (SC_STATEMACHINEIMAGE_timer_InLow == 1'b1) STATE_Signal = STATE_LEVEL4_0;
								else STATE_Signal = STATE_LEVEL4_0_1;
		STATE_LEVEL4_0_1: STATE_Signal = STATE_LEVEL4_1;
		
		STATE_LEVEL4_1: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_1;
								else STATE_Signal = STATE_LEVEL4_1_1;
		STATE_LEVEL4_1_1: STATE_Signal = STATE_LEVEL4_2;						
								
		STATE_LEVEL4_2: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_2;
								else STATE_Signal = STATE_LEVEL4_2_1;
		STATE_LEVEL4_2_1: STATE_Signal = STATE_LEVEL4_3;
								
		STATE_LEVEL4_3: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_3;
								else STATE_Signal = STATE_LEVEL4_3_1;
		STATE_LEVEL4_3_1: STATE_Signal = STATE_LEVEL4_4;
								
		STATE_LEVEL4_4: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_4;
								else STATE_Signal = STATE_LEVEL4_4_1;
		STATE_LEVEL4_4_1: STATE_Signal = STATE_LEVEL4_5;						
								
		STATE_LEVEL4_5: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_5;
								else STATE_Signal = STATE_LEVEL4_5_1;
		STATE_LEVEL4_5_1: STATE_Signal = STATE_LEVEL4_6;
		
		STATE_LEVEL4_6: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_6;
								else STATE_Signal = STATE_LEVEL4_6_1;
		STATE_LEVEL4_6_1: STATE_Signal = STATE_LEVEL4_7;
		
		STATE_LEVEL4_7: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_7;
								else STATE_Signal = STATE_LEVEL4_7_1;
		STATE_LEVEL4_7_1: STATE_Signal = STATE_LEVEL4_8;
		
		STATE_LEVEL4_8: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_8;
								else STATE_Signal = STATE_LEVEL4_8_1;
		STATE_LEVEL4_8_1: STATE_Signal = STATE_LEVEL4_9;
		
		STATE_LEVEL4_9: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_9;
								else STATE_Signal = STATE_LEVEL4_9_1;
		STATE_LEVEL4_9_1: STATE_Signal = STATE_LEVEL4_10;
		
		STATE_LEVEL4_10: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_10;
								else STATE_Signal = STATE_LEVEL4_10_1;
		STATE_LEVEL4_10_1: STATE_Signal = STATE_LEVEL4_11;
								
		STATE_LEVEL4_11: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_11;
								else STATE_Signal = STATE_LEVEL4_11_1;
		STATE_LEVEL4_11_1: STATE_Signal = STATE_LEVEL4_12;
								
		STATE_LEVEL4_12: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_12;
								else STATE_Signal = STATE_LEVEL4_12_1;
		STATE_LEVEL4_12_1: STATE_Signal = STATE_LEVEL4_13;
								
		STATE_LEVEL4_13: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_13;
								else STATE_Signal = STATE_LEVEL4_13_1;
		STATE_LEVEL4_13_1: STATE_Signal = STATE_LEVEL4_14;
		
		STATE_LEVEL4_14: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_14;
								else STATE_Signal = STATE_LEVEL4_14_1;
		STATE_LEVEL4_14_1: STATE_Signal = STATE_LEVEL4_15;						
								
		STATE_LEVEL4_15: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_15;
								else STATE_Signal = STATE_LEVEL4_15_1;
		STATE_LEVEL4_15_1: STATE_Signal = STATE_LEVEL4_16;
		
		STATE_LEVEL4_16: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_16;
								else STATE_Signal = STATE_LEVEL4_16_1;
		STATE_LEVEL4_16_1: STATE_Signal = STATE_LEVEL4_17;
		
		STATE_LEVEL4_17: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_17;
								else STATE_Signal = STATE_LEVEL4_17_1;
		STATE_LEVEL4_17_1: STATE_Signal = STATE_LEVEL4_18;						
								
		STATE_LEVEL4_18: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_18;
								else STATE_Signal = STATE_LEVEL4_18_1;
		STATE_LEVEL4_18_1: STATE_Signal = STATE_LEVEL4_19;						
								
		STATE_LEVEL4_19: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_19;
								else STATE_Signal = STATE_LEVEL4_19_1;
		STATE_LEVEL4_19_1: STATE_Signal = STATE_LEVEL4_20;
		
		STATE_LEVEL4_20: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_20;
								else STATE_Signal = STATE_LEVEL4_20_1;
		STATE_LEVEL4_20_1: STATE_Signal = STATE_LEVEL4_21;						
								
		STATE_LEVEL4_21: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_21;
								else STATE_Signal = STATE_LEVEL4_21_1;
		STATE_LEVEL4_21_1: STATE_Signal = STATE_LEVEL4_22;						
								
		STATE_LEVEL4_22: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_22;
								else STATE_Signal = STATE_LEVEL4_22_1;
		STATE_LEVEL4_22_1: STATE_Signal = STATE_LEVEL4_23;
								
		STATE_LEVEL4_23: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_23;
								else STATE_Signal = STATE_LEVEL4_23_1;
		STATE_LEVEL4_23_1: STATE_Signal = STATE_LEVEL4_24;
		
		STATE_LEVEL4_24: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_24;
								else STATE_Signal = STATE_LEVEL4_24_1;
		STATE_LEVEL4_24_1: STATE_Signal = STATE_LEVEL4_25;
								
		STATE_LEVEL4_25: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_25;
								else STATE_Signal = STATE_LEVEL4_25_1;
		STATE_LEVEL4_25_1: STATE_Signal = STATE_LEVEL4_26;
		
		STATE_LEVEL4_26: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_26;
								else STATE_Signal = STATE_LEVEL4_26_1;
		STATE_LEVEL4_26_1: STATE_Signal = STATE_LEVEL4_27;
								
		STATE_LEVEL4_27: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_27;
								else STATE_Signal = STATE_LEVEL4_27_1;
		STATE_LEVEL4_27_1: STATE_Signal = STATE_LEVEL4_28;
								
		STATE_LEVEL4_28: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_28;
								else STATE_Signal = STATE_LEVEL4_28_1;
		STATE_LEVEL4_28_1: STATE_Signal = STATE_LEVEL4_29;						
								
		STATE_LEVEL4_29: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL4_29;
								else STATE_Signal = STATE_LEVEL4_29_1;
		STATE_LEVEL4_29_1: STATE_Signal =  STATE_CHECK_0;		
		
///////////////////////////////////
////  NIVEL 5
///////////////////////		
		
		
		STATE_LEVEL5_0: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_0;
								else STATE_Signal = STATE_LEVEL5_0_1;
		STATE_LEVEL5_0_1: STATE_Signal = STATE_LEVEL5_1;
		
		STATE_LEVEL5_1: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_1;
								else STATE_Signal = STATE_LEVEL5_1_1;
		STATE_LEVEL5_1_1: STATE_Signal = STATE_LEVEL5_2;						
								
		STATE_LEVEL5_2: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_2;
								else STATE_Signal = STATE_LEVEL5_2_1;
		STATE_LEVEL5_2_1: STATE_Signal = STATE_LEVEL5_3;
								
		STATE_LEVEL5_3: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_3;
								else STATE_Signal = STATE_LEVEL5_3_1;
		STATE_LEVEL5_3_1: STATE_Signal = STATE_LEVEL5_4;
								
		STATE_LEVEL5_4: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_4;
								else STATE_Signal = STATE_LEVEL5_4_1;
		STATE_LEVEL5_4_1: STATE_Signal = STATE_LEVEL5_5;						
								
		STATE_LEVEL5_5: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_5;
								else STATE_Signal = STATE_LEVEL5_5_1;
		STATE_LEVEL5_5_1: STATE_Signal = STATE_LEVEL5_6;
		
		STATE_LEVEL5_6: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_6;
								else STATE_Signal = STATE_LEVEL5_6_1;
		STATE_LEVEL5_6_1: STATE_Signal = STATE_LEVEL5_7;
		
		STATE_LEVEL5_7: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_7;
								else STATE_Signal = STATE_LEVEL5_7_1;
		STATE_LEVEL5_7_1: STATE_Signal = STATE_LEVEL5_8;
		
		STATE_LEVEL5_8: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_8;
								else STATE_Signal = STATE_LEVEL5_8_1;
		STATE_LEVEL5_8_1: STATE_Signal = STATE_LEVEL5_9;
		
		STATE_LEVEL5_9: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_9;
								else STATE_Signal = STATE_LEVEL5_9_1;
		STATE_LEVEL5_9_1: STATE_Signal = STATE_LEVEL5_10;
		
		STATE_LEVEL5_10: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_10;
								else STATE_Signal = STATE_LEVEL5_10_1;
		STATE_LEVEL5_10_1: STATE_Signal = STATE_LEVEL5_11;
								
		STATE_LEVEL5_11: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_11;
								else STATE_Signal = STATE_LEVEL5_11_1;
		STATE_LEVEL5_11_1: STATE_Signal = STATE_LEVEL5_12;
								
		STATE_LEVEL5_12: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_12;
								else STATE_Signal = STATE_LEVEL5_12_1;
		STATE_LEVEL5_12_1: STATE_Signal = STATE_LEVEL5_13;
								
		STATE_LEVEL5_13: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_13;
								else STATE_Signal = STATE_LEVEL5_13_1;
		STATE_LEVEL5_13_1: STATE_Signal = STATE_LEVEL5_14;
		
		STATE_LEVEL5_14: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_14;
								else STATE_Signal = STATE_LEVEL5_14_1;
		STATE_LEVEL5_14_1: STATE_Signal = STATE_LEVEL5_15;						
								
		STATE_LEVEL5_15: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_15;
								else STATE_Signal = STATE_LEVEL5_15_1;
		STATE_LEVEL5_15_1: STATE_Signal = STATE_LEVEL5_16;
		
		STATE_LEVEL5_16: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_16;
								else STATE_Signal = STATE_LEVEL5_16_1;
		STATE_LEVEL5_16_1: STATE_Signal = STATE_LEVEL5_17;
		
		STATE_LEVEL5_17: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_17;
								else STATE_Signal = STATE_LEVEL5_17_1;
		STATE_LEVEL5_17_1: STATE_Signal = STATE_LEVEL5_18;						
								
		STATE_LEVEL5_18: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_18;
								else STATE_Signal = STATE_LEVEL5_18_1;
		STATE_LEVEL5_18_1: STATE_Signal = STATE_LEVEL5_19;						
								
		STATE_LEVEL5_19: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_19;
								else STATE_Signal = STATE_LEVEL5_19_1;
		STATE_LEVEL5_19_1: STATE_Signal = STATE_LEVEL5_20;
		
		STATE_LEVEL5_20: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_20;
								else STATE_Signal = STATE_LEVEL5_20_1;
		STATE_LEVEL5_20_1: STATE_Signal = STATE_LEVEL5_21;						
								
		STATE_LEVEL5_21: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_21;
								else STATE_Signal = STATE_LEVEL5_21_1;
		STATE_LEVEL5_21_1: STATE_Signal = STATE_LEVEL5_22;						
								
		STATE_LEVEL5_22: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_22;
								else STATE_Signal = STATE_LEVEL5_22_1;
		STATE_LEVEL5_22_1: STATE_Signal = STATE_LEVEL5_23;
								
		STATE_LEVEL5_23: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_23;
								else STATE_Signal = STATE_LEVEL5_23_1;
		STATE_LEVEL5_23_1: STATE_Signal = STATE_LEVEL5_24;
		
		STATE_LEVEL5_24: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_24;
								else STATE_Signal = STATE_LEVEL5_24_1;
		STATE_LEVEL5_24_1: STATE_Signal = STATE_LEVEL5_25;
								
		STATE_LEVEL5_25: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_25;
								else STATE_Signal = STATE_LEVEL5_25_1;
		STATE_LEVEL5_25_1: STATE_Signal = STATE_LEVEL5_26;
		
		STATE_LEVEL5_26: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_26;
								else STATE_Signal = STATE_LEVEL5_26_1;
		STATE_LEVEL5_26_1: STATE_Signal = STATE_LEVEL5_27;
								
		STATE_LEVEL5_27: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_27;
								else STATE_Signal = STATE_LEVEL5_27_1;
		STATE_LEVEL5_27_1: STATE_Signal = STATE_LEVEL5_28;
								
		STATE_LEVEL5_28: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_28;
								else STATE_Signal = STATE_LEVEL5_28_1;
		STATE_LEVEL5_28_1: STATE_Signal = STATE_LEVEL5_29;						
								
		STATE_LEVEL5_29: if ( SC_STATEMACHINEIMAGE_timer_InLow == 1'b1 ) STATE_Signal = STATE_LEVEL5_29;
								else STATE_Signal = STATE_LEVEL5_29_1;
		STATE_LEVEL5_29_1: STATE_Signal =  STATE_CHECK_0;	
		
		
		default : 		STATE_Signal = STATE_CHECK_0;
		
	endcase
end
// STATE REGISTER : SEQUENTIAL
always @ ( posedge SC_STATEMACHINEIMAGE_CLOCK_50 , posedge SC_STATEMACHINEIMAGE_RESET_InHigh)
begin
	if (SC_STATEMACHINEIMAGE_RESET_InHigh == 1'b1)
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
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b10;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CHECK
//=========================================================
	STATE_CHECK_0 :
		begin 
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b10;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_3_0
//=========================================================
	STATE_CORAZON_3_0 :	
		begin			      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_3_1_0
//=========================================================
	STATE_CORAZON_3_1_0 :	
		begin		      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_3_1
//=========================================================
	STATE_CORAZON_3_1 :	
		begin		      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_3_2
//=========================================================
	STATE_CORAZON_3_2 :	
		begin		      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b00;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_3_3
//=========================================================
	STATE_CORAZON_3_3 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 25'b1111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_2_0
//=========================================================
	STATE_CORAZON_2_0 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_2_1_0
//=========================================================
	STATE_CORAZON_2_1_0 :	
		begin		      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_2_1
//=========================================================
	STATE_CORAZON_2_1 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_2_2
//=========================================================
	STATE_CORAZON_2_2 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b00;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_2_3
//=========================================================
	STATE_CORAZON_2_3 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 25'b1111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_0
//=========================================================
	STATE_CORAZON_1_0 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_1_0
//=========================================================
	STATE_CORAZON_1_1_0 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_1_1
//=========================================================
	STATE_CORAZON_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_2
//=========================================================
	STATE_CORAZON_1_2 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b00;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_1_3
//=========================================================
	STATE_CORAZON_1_3 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01000010;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00100100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b10;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 25'b1111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_4_0
//=========================================================
	STATE_CORAZON_1_4_0 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_1_4
//=========================================================
	STATE_CORAZON_1_4 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_5_0
//=========================================================
	STATE_CORAZON_1_5_0 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_1_5
//=========================================================
	STATE_CORAZON_1_5 :	
		begin     
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00100100;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00100100;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_6_0
//=========================================================
	STATE_CORAZON_1_6_0 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_1_6
//=========================================================
	STATE_CORAZON_1_6 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b11000011;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b11000011;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_CORAZON_1_7
//=========================================================
	STATE_CORAZON_1_7 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b00;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_CORAZON_1_8
//=========================================================
	STATE_CORAZON_1_8 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 25'b1111111111111111111111111;
		end
//=========================================================
// STATE_WINCORAZON_0
//=========================================================
	STATE_WINCORAZON_0 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_WINCORAZON_1
//=========================================================
	STATE_WINCORAZON_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_WINCORAZON_2
//=========================================================
	STATE_WINCORAZON_2 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b00;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_WINCORAZON_3
//=========================================================
	STATE_WINCORAZON_3 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01100110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10011001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_WIN_0
//=========================================================
	STATE_WIN_0 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01000100;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10000001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b01010100;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b01000010;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00100100;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00001000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00010000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00100100;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_WIN_1_1
//=========================================================
	STATE_WIN_1_1 :	
		begin		      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_WIN_1
//=========================================================
	STATE_WIN_1 :	
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01101100;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b10010111;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b01011110;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11101011;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00110100;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00001000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00010000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00110100;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 24'b111111111111111111111111;
		end
//=========================================================
// STATE_WIN_2_1
//=========================================================
	STATE_WIN_2_1 :	
		begin		      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_WIN_2
//=========================================================
	STATE_WIN_2 :
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b01111110;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b11111111;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00011000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00111100;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 25'b1111111111111111111111111;
		end
//=========================================================
// STATE_WIN_3
//=========================================================
	STATE_WIN_3 :
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b00;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_SELECT_LEVEL_1
//=========================================================
STATE_SELECT_LEVEL_1:
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000011;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10101001;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b11010000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_SELECT_LEVEL_2
//=========================================================
STATE_SELECT_LEVEL_2:
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000011;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000011;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000010;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10101011;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b11010000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_SELECT_LEVEL_3
//=========================================================
STATE_SELECT_LEVEL_3:
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000011;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000011;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10101011;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b11010000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
//=========================================================
// STATE_SELECT_LEVEL_4
//=========================================================
STATE_SELECT_LEVEL_4:
		begin	      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000101;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000111;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000001;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b10101001;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b10101000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b11010000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end

		
//=========================================================
// STATE_FROGGER_0
//=========================================================
	STATE_FROGGER_0 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[43:36]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111; //este es el tiempo que el va a permanecer en la imagen, le recomiendo que lo deje en un mismo numero como 16b en 1
		end
//=========================================================
// STATE_FROGGER_0_1 
//=========================================================
	STATE_FROGGER_0_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; 
		end
		
//=========================================================
// STATE_FROGGER_1
//=========================================================
	STATE_FROGGER_1 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[43:36]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[43:36];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_1_1 
//=========================================================
	STATE_FROGGER_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
//=========================================================
// STATE_FROGGER_2
//=========================================================
	STATE_FROGGER_2 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[42:35]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[42:35];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_2_1 
//=========================================================
	STATE_FROGGER_2_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; 
end
//=========================================================
// STATE_FROGGER_3
//=========================================================
	STATE_FROGGER_3 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[41:34]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[41:34];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_3_1 
//=========================================================
	STATE_FROGGER_3_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_FROGGER_4
//=========================================================
	STATE_FROGGER_4 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[40:33]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[40:33];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_4_1 
//=========================================================
	STATE_FROGGER_4_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_FROGGER_5
//=========================================================
	STATE_FROGGER_5 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[39:32]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[39:32];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_5_1 
//=========================================================
	STATE_FROGGER_5_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_FROGGER_6
//=========================================================
	STATE_FROGGER_6 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[38:31]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[38:31];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_6_1 
//=========================================================
	STATE_FROGGER_6_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_FROGGER_7
//=========================================================
	STATE_FROGGER_7 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[37:30]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[37:30];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_7_1 
//=========================================================
	STATE_FROGGER_7_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo

		end	
//=========================================================
// STATE_FROGGER_8
//=========================================================
	STATE_FROGGER_8 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[36:29]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[36:29];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_8_1 
//=========================================================
	STATE_FROGGER_8_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_FROGGER_9
//=========================================================
	STATE_FROGGER_9 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[35:28]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_9_1 
//=========================================================
	STATE_FROGGER_9_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
//=========================================================
// STATE_FROGGER_10
//=========================================================
	STATE_FROGGER_10 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[34:27]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[34:27];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_10_1 
//=========================================================
	STATE_FROGGER_10_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_FROGGER_11
//=========================================================
	STATE_FROGGER_11 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[33:26]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[33:26];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_11_1 
//=========================================================
	STATE_FROGGER_11_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_FROGGER_12
//=========================================================
	STATE_FROGGER_12 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[32:25]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[32:25];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_12_1 
//=========================================================
	STATE_FROGGER_12_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_FROGGER_13
//=========================================================
	STATE_FROGGER_13 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[31:24]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[31:24];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_13_1 
//=========================================================
	STATE_FROGGER_13_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_FROGGER_14
//=========================================================
	STATE_FROGGER_14 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[30:23]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[30:23];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_14_1 
//=========================================================
	STATE_FROGGER_14_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_FROGGER_15
//=========================================================
	STATE_FROGGER_15 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[29:22]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[29:22];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_15_1 
//=========================================================
	STATE_FROGGER_15_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_FROGGER_16
//=========================================================
	STATE_FROGGER_16 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[28:21]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[28:21];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_16_1 
//=========================================================
	STATE_FROGGER_16_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_FROGGER_17
//=========================================================
	STATE_FROGGER_17 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[27:20]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[27:20];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_17_1 
//=========================================================
	STATE_FROGGER_17_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_FROGGER_18
//=========================================================
	STATE_FROGGER_18 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[26:19]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[26:19];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_18_1 
//=========================================================
	STATE_FROGGER_18_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
			
//=========================================================
// STATE_FROGGER_19
//=========================================================
	STATE_FROGGER_19 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[25:18]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[25:18];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_19_1 
//=========================================================
	STATE_FROGGER_19_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
			
//=========================================================
// STATE_FROGGER_20
//=========================================================
	STATE_FROGGER_20 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[24:17]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[24:17];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_20_1 
//=========================================================
	STATE_FROGGER_20_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
			
//=========================================================
// STATE_FROGGER_21
//=========================================================
	STATE_FROGGER_21 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[23:16]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[23:16];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_21_1 
//=========================================================
	STATE_FROGGER_21_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
//=========================================================
// STATE_FROGGER_22
//=========================================================
	STATE_FROGGER_22 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[22:15]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[22:15];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_22_1 
//=========================================================
	STATE_FROGGER_22_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
			
//=========================================================
// STATE_FROGGER_23
//=========================================================
	STATE_FROGGER_23 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[21:14]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[21:14];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_23_1 
//=========================================================
	STATE_FROGGER_23_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_FROGGER_24
//=========================================================
	STATE_FROGGER_24 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[20:13]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[20:13];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_24_1 
//=========================================================
	STATE_FROGGER_24_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_FROGGER_25
//=========================================================
	STATE_FROGGER_25 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[19:12]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[19:12];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_25_1 
//=========================================================
	STATE_FROGGER_25_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_FROGGER_26
//=========================================================
	STATE_FROGGER_26 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[18:11]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[18:11];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_26_1 
//=========================================================
	STATE_FROGGER_26_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_FROGGER_27
//=========================================================
	STATE_FROGGER_27 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[17:10]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[17:10];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_27_1 
//=========================================================
	STATE_FROGGER_27_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_FROGGER_28
//=========================================================
	STATE_FROGGER_28 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[16:9]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[16:9];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_28_1 
//=========================================================
	STATE_FROGGER_28_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_FROGGER_29
//=========================================================
	STATE_FROGGER_29 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[15:8]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[15:8];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_29_1 
//=========================================================
	STATE_FROGGER_29_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_FROGGER_30
//=========================================================
	STATE_FROGGER_30 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[14:7]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[14:7];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_30_1 
//=========================================================
	STATE_FROGGER_30_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	

//=========================================================
// STATE_FROGGER_31
//=========================================================
	STATE_FROGGER_31 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[13:6]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[13:6];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_31_1 
//=========================================================
	STATE_FROGGER_31_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_FROGGER_32
//=========================================================
	STATE_FROGGER_32 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[12:5]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[12:5];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_32_1 
//=========================================================
	STATE_FROGGER_32_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end

//=========================================================
// STATE_FROGGER_33
//=========================================================
	STATE_FROGGER_33 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[11:4]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[11:4];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_33_1 
//=========================================================
	STATE_FROGGER_33_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end

//=========================================================
// STATE_FROGGER_34
//=========================================================
	STATE_FROGGER_34 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[10:3]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[10:3];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_34_1 
//=========================================================
	STATE_FROGGER_34_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	
end
//=========================================================
// STATE_FROGGER_35
//=========================================================
	STATE_FROGGER_35 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[9:2]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[9:2];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_35_1 
//=========================================================
	STATE_FROGGER_35_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	
end

//=========================================================
// STATE_FROGGER_36
//=========================================================
	STATE_FROGGER_36 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[8:1]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[8:1];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_36_1 
//=========================================================
	STATE_FROGGER_36_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end	
	

//=========================================================
// STATE_FROGGER_37
//=========================================================
	STATE_FROGGER_37 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_FROGGER_OutBus[7:0]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_FROGGER_OutBus[7:0];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_FROGGER_37_1 
//=========================================================
	STATE_FROGGER_37_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
end
/////////////////////////
// Nivel 1
////////////////////////	


		
		
//=========================================================
// STATE_LEVEL1_0
//=========================================================
	STATE_LEVEL1_0 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; //timer se debe encender cada vez que usted va a dejar una imagen cierto tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish debe permanecer en 0 en todos los estados que haga, solo es 1 en check
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[35:28]; // aqui van sus imagenes
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter en su caso no sirve, asi que dejelo en 11
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111; //este es el tiempo que el va a permanecer en la imagen, le recomiendo que lo deje en un mismo numero como 16b en 1
		end
//=========================================================
// STATE_LEVEL1_0_1 
//=========================================================
	STATE_LEVEL1_0_1 :	//Estos son los estados que debe crear entre dos dos estados, siempre van a estar vacios y van a ser iguales
		begin      //La razon si quiere se la explico despues pero mantengalo asi.
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; //timer tiene que estar en 1 porque ahora no va a contar ningun tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish siempre tiene que estar activa
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; //aqui puede colocar lo que sea, no va a tener tiempo de mostrarse
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; // sin embargo le aconsejo dejarlo en 0
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
		
//=========================================================
// STATE_LEVEL1_1
//=========================================================
	STATE_LEVEL1_1 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[35:28]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_1_1 
//=========================================================
	STATE_LEVEL1_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL1_2
//=========================================================
	STATE_LEVEL1_2 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[34:27]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[34:27];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_2_1 
//=========================================================
	STATE_LEVEL1_2_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL1_3
//=========================================================
	STATE_LEVEL1_3 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[33:26]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[33:26];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_3_1 
//=========================================================
	STATE_LEVEL1_3_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL1_4
//=========================================================
	STATE_LEVEL1_4 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[32:25]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[32:25];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_4_1 
//=========================================================
	STATE_LEVEL1_4_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
//=========================================================
// STATE_LEVEL1_5
//=========================================================
	STATE_LEVEL1_5 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[31:24]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[31:24];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_5_1 
//=========================================================
	STATE_LEVEL1_5_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL1_6
//=========================================================
	STATE_LEVEL1_6 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[30:23]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[30:23];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_6_1 
//=========================================================
	STATE_LEVEL1_6_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL1_7
//=========================================================
	STATE_LEVEL1_7 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[29:22]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[29:22];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_7_1 
//=========================================================
	STATE_LEVEL1_7_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo

		end	
//=========================================================
// STATE_LEVEL1_8
//=========================================================
	STATE_LEVEL1_8 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[28:21]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[28:21];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_8_1 
//=========================================================
	STATE_LEVEL1_8_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
			
//=========================================================
// STATE_LEVEL1_9
//=========================================================
	STATE_LEVEL1_9 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[27:20]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[27:20];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_9_1 
//=========================================================
	STATE_LEVEL1_9_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL1_10
//=========================================================
	STATE_LEVEL1_10 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[26:19]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[26:19];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_10_1 
//=========================================================
	STATE_LEVEL1_10_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL1_11
//=========================================================
	STATE_LEVEL1_11 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[25:18]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[25:18];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_11_1 
//=========================================================
	STATE_LEVEL1_11_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
//=========================================================
// STATE_LEVEL1_12
//=========================================================
	STATE_LEVEL1_12 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[24:17]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[24:17];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_12_1 
//=========================================================
	STATE_LEVEL1_12_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL1_13
//=========================================================
	STATE_LEVEL1_13 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[23:16]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[23:16];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_13_1 
//=========================================================
	STATE_LEVEL1_13_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
			
//=========================================================
// STATE_LEVEL1_14
//=========================================================
	STATE_LEVEL1_14 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[22:15]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[22:15];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_14_1 
//=========================================================
	STATE_LEVEL1_14_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL1_15
//=========================================================
	STATE_LEVEL1_15 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[21:14]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[21:14];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_15_1 
//=========================================================
	STATE_LEVEL1_15_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
			
//=========================================================
// STATE_LEVEL1_16
//=========================================================
	STATE_LEVEL1_16 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[20:13]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[20:13];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_16_1 
//=========================================================
	STATE_LEVEL1_16_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL1_17
//=========================================================
	STATE_LEVEL1_17 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[19:12]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[19:12];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_17_1 
//=========================================================
	STATE_LEVEL1_17_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL1_18
//=========================================================
	STATE_LEVEL1_18 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[18:11]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[18:11];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_18_1 
//=========================================================
	STATE_LEVEL1_18_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
			
//=========================================================
// STATE_LEVEL1_19
//=========================================================
	STATE_LEVEL1_19 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[17:10]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[17:10];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_19_1 
//=========================================================
	STATE_LEVEL1_19_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL1_20
//=========================================================
	STATE_LEVEL1_20 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[16:9]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[16:9];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_20_1 
//=========================================================
	STATE_LEVEL1_20_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL1_21
//=========================================================
	STATE_LEVEL1_21 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[15:8]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[15:8];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_21_1 
//=========================================================
	STATE_LEVEL1_21_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL1_22
//=========================================================
	STATE_LEVEL1_22 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[14:7]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[14:7];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_22_1 
//=========================================================
	STATE_LEVEL1_22_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL1_23
//=========================================================
	STATE_LEVEL1_23 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[13:6]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[13:6];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_23_1 
//=========================================================
	STATE_LEVEL1_23_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
	end		
			
//=========================================================
// STATE_LEVEL1_24
//=========================================================
	STATE_LEVEL1_24 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[12:5]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[12:5];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_24_1 
//=========================================================
	STATE_LEVEL1_24_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL1_25
//=========================================================
	STATE_LEVEL1_25 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[11:4]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[11:4];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_25_1 
//=========================================================
	STATE_LEVEL1_25_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL1_26
//=========================================================
	STATE_LEVEL1_26 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[10:3]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[10:3];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_26_1 
//=========================================================
	STATE_LEVEL1_26_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_LEVEL1_27
//=========================================================
	STATE_LEVEL1_27 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[9:2]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[9:2];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_27_1 
//=========================================================
	STATE_LEVEL1_27_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_LEVEL1_28
//=========================================================
	STATE_LEVEL1_28 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[8:1]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[8:1];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL1_28_1 
//=========================================================
	STATE_LEVEL1_28_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL1_29
//=========================================================
	STATE_LEVEL1_29 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL1_OutBus[7:0]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL1_OutBus[7:0];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end

//=========================================================
// STATE_LEVEL1_29_1 
//=========================================================
	STATE_LEVEL1_29_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo	
		
	end	
		
		
////////////////////////////////////
// nIVEL 2
///////////////////////////////////	


		
		
		
//=========================================================
// STATE_LEVEL2_0
//=========================================================
	STATE_LEVEL2_0 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; //timer se debe encender cada vez que usted va a dejar una imagen cierto tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish debe permanecer en 0 en todos los estados que haga, solo es 1 en check
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[35:28]; // aqui van sus imagenes
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter en su caso no sirve, asi que dejelo en 11
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111; //este es el tiempo que el va a permanecer en la imagen, le recomiendo que lo deje en un mismo numero como 16b en 1
		end
//=========================================================
// STATE_LEVEL2_0_1 
//=========================================================
	STATE_LEVEL2_0_1 :	//Estos son los estados que debe crear entre dos dos estados, siempre van a estar vacios y van a ser iguales
		begin      //La razon si quiere se la explico despues pero mantengalo asi.
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; //timer tiene que estar en 1 porque ahora no va a contar ningun tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish siempre tiene que estar activa
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; //aqui puede colocar lo que sea, no va a tener tiempo de mostrarse
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; // sin embargo le aconsejo dejarlo en 0
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
		
//=========================================================
// STATE_LEVEL2_1
//=========================================================
	STATE_LEVEL2_1 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[35:28]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_1_1 
//=========================================================
	STATE_LEVEL2_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end		
//=========================================================
// STATE_LEVEL2_2
//=========================================================
	STATE_LEVEL2_2 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[34:27]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[34:27];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_2_1 
//=========================================================
	STATE_LEVEL2_2_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL2_3
//=========================================================
	STATE_LEVEL2_3 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[33:26]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[33:26];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_3_1 
//=========================================================
	STATE_LEVEL2_3_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL2_4
//=========================================================
	STATE_LEVEL2_4 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[32:25]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[32:25];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_4_1 
//=========================================================
	STATE_LEVEL2_4_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL2_5
//=========================================================
	STATE_LEVEL2_5 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[31:24]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[31:24];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_5_1 
//=========================================================
	STATE_LEVEL2_5_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL2_6
//=========================================================
	STATE_LEVEL2_6 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[30:23]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[30:23];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_6_1 
//=========================================================
	STATE_LEVEL2_6_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL2_7
//=========================================================
	STATE_LEVEL2_7 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[29:22]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[29:22];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_7_1 
//=========================================================
	STATE_LEVEL2_7_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo

		end	
//=========================================================
// STATE_LEVEL2_8
//=========================================================
	STATE_LEVEL2_8 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[28:21]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[28:21];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_8_1 
//=========================================================
	STATE_LEVEL2_8_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL2_9
//=========================================================
	STATE_LEVEL2_9 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[27:20]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[27:20];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_9_1 
//=========================================================
	STATE_LEVEL2_9_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL2_10
//=========================================================
	STATE_LEVEL2_10 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[26:19]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[26:19];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_10_1 
//=========================================================
	STATE_LEVEL2_10_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL2_11
//=========================================================
	STATE_LEVEL2_11 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[25:18]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[25:18];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_11_1 
//=========================================================
	STATE_LEVEL2_11_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL2_12
//=========================================================
	STATE_LEVEL2_12 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[24:17]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[24:17];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_12_1 
//=========================================================
	STATE_LEVEL2_12_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL2_13
//=========================================================
	STATE_LEVEL2_13 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[23:16]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[23:16];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_13_1 
//=========================================================
	STATE_LEVEL2_13_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL2_14
//=========================================================
	STATE_LEVEL2_14 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[22:15]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[22:15];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_14_1 
//=========================================================
	STATE_LEVEL2_14_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL2_15
//=========================================================
	STATE_LEVEL2_15 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[21:14]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[21:14];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_15_1 
//=========================================================
	STATE_LEVEL2_15_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL2_16
//=========================================================
	STATE_LEVEL2_16 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[20:13]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[20:13];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_16_1 
//=========================================================
	STATE_LEVEL2_16_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL2_17
//=========================================================
	STATE_LEVEL2_17 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[19:12]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[19:12];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_17_1 
//=========================================================
	STATE_LEVEL2_17_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL2_18
//=========================================================
	STATE_LEVEL2_18 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[18:11]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[18:11];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_18_1 
//=========================================================
	STATE_LEVEL2_18_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL2_19
//=========================================================
	STATE_LEVEL2_19 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[17:10]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[17:10];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_19_1 
//=========================================================
	STATE_LEVEL2_19_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL2_20
//=========================================================
	STATE_LEVEL2_20 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[16:9]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[16:9];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_20_1 
//=========================================================
	STATE_LEVEL2_20_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL2_21
//=========================================================
	STATE_LEVEL2_21 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[15:8]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[15:8];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_21_1 
//=========================================================
	STATE_LEVEL2_21_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL2_22
//=========================================================
	STATE_LEVEL2_22 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[14:7]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[14:7];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_22_1 
//=========================================================
	STATE_LEVEL2_22_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL2_23
//=========================================================
	STATE_LEVEL2_23 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[13:6]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[13:6];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_23_1 
//=========================================================
	STATE_LEVEL2_23_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
	end		
			
//=========================================================
// STATE_LEVEL2_24
//=========================================================
	STATE_LEVEL2_24 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[12:5]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[12:5];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_24_1 
//=========================================================
	STATE_LEVEL2_24_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end		
			
//=========================================================
// STATE_LEVEL2_25
//=========================================================
	STATE_LEVEL2_25 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[11:4]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[11:4];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_25_1 
//=========================================================
	STATE_LEVEL2_25_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL2_26
//=========================================================
	STATE_LEVEL2_26 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[10:3]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[10:3];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_26_1 
//=========================================================
	STATE_LEVEL2_26_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL2_27
//=========================================================
	STATE_LEVEL2_27 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[9:2]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[9:2];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_27_1 
//=========================================================
	STATE_LEVEL2_27_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_LEVEL2_28
//=========================================================
	STATE_LEVEL2_28 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[8:1]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[8:1];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL2_28_1 
//=========================================================
	STATE_LEVEL2_28_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_LEVEL2_29
//=========================================================
	STATE_LEVEL2_29 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL2_OutBus[7:0]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL2_OutBus[7:0];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end

//=========================================================
// STATE_LEVEL2_29_1 
//=========================================================
	STATE_LEVEL2_29_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo	
				
		end
		
////////////////////////////////
// NIVEL 3
///////////////////////////



//=========================================================
// STATE_LEVEL3_0
//=========================================================
	STATE_LEVEL3_0 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; //timer se debe encender cada vez que usted va a dejar una imagen cierto tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish debe permanecer en 0 en todos los estados que haga, solo es 1 en check
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[35:28]; // aqui van sus imagenes
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter en su caso no sirve, asi que dejelo en 11
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111; //este es el tiempo que el va a permanecer en la imagen, le recomiendo que lo deje en un mismo numero como 16b en 1
		end
//=========================================================
// STATE_LEVEL3_0_1 
//=========================================================
	STATE_LEVEL3_0_1 :	//Estos son los estados que debe crear entre dos dos estados, siempre van a estar vacios y van a ser iguales
		begin      //La razon si quiere se la explico despues pero mantengalo asi.
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; //timer tiene que estar en 1 porque ahora no va a contar ningun tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish siempre tiene que estar activa
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; //aqui puede colocar lo que sea, no va a tener tiempo de mostrarse
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; // sin embargo le aconsejo dejarlo en 0
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
		
//=========================================================
// STATE_LEVEL3_1
//=========================================================
	STATE_LEVEL3_1 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[35:28]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_1_1 
//=========================================================
	STATE_LEVEL3_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL3_2
//=========================================================
	STATE_LEVEL3_2 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[34:27]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[34:27];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_2_1 
//=========================================================
	STATE_LEVEL3_2_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL3_3
//=========================================================
	STATE_LEVEL3_3 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[33:26]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[33:26];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_3_1 
//=========================================================
	STATE_LEVEL3_3_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL3_4
//=========================================================
	STATE_LEVEL3_4 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[32:25]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[32:25];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_4_1 
//=========================================================
	STATE_LEVEL3_4_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL3_5
//=========================================================
	STATE_LEVEL3_5 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[31:24]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[31:24];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_5_1 
//=========================================================
	STATE_LEVEL3_5_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL3_6
//=========================================================
	STATE_LEVEL3_6 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[30:23]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[30:23];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_6_1 
//=========================================================
	STATE_LEVEL3_6_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL3_7
//=========================================================
	STATE_LEVEL3_7 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[29:22]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[29:22];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_7_1 
//=========================================================
	STATE_LEVEL3_7_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo

		end	
//=========================================================
// STATE_LEVEL3_8
//=========================================================
	STATE_LEVEL3_8 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[28:21]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[28:21];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_8_1 
//=========================================================
	STATE_LEVEL3_8_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL3_9
//=========================================================
	STATE_LEVEL3_9 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[27:20]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[27:20];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_9_1 
//=========================================================
	STATE_LEVEL3_9_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end		
			
//=========================================================
// STATE_LEVEL3_10
//=========================================================
	STATE_LEVEL3_10 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[26:19]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[26:19];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_10_1 
//=========================================================
	STATE_LEVEL3_10_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end		
			
//=========================================================
// STATE_LEVEL3_11
//=========================================================
	STATE_LEVEL3_11 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[25:18]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[25:18];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_11_1 
//=========================================================
	STATE_LEVEL3_11_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL3_12
//=========================================================
	STATE_LEVEL3_12 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[24:17]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[24:17];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_12_1 
//=========================================================
	STATE_LEVEL3_12_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL3_13
//=========================================================
	STATE_LEVEL3_13 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[23:16]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[23:16];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_13_1 
//=========================================================
	STATE_LEVEL3_13_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL3_14
//=========================================================
	STATE_LEVEL3_14 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[22:15]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[22:15];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_14_1 
//=========================================================
	STATE_LEVEL3_14_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL3_15
//=========================================================
	STATE_LEVEL3_15 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[21:14]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[21:14];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_15_1 
//=========================================================
	STATE_LEVEL3_15_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end		
			
			
//=========================================================
// STATE_LEVEL3_16
//=========================================================
	STATE_LEVEL3_16 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[20:13]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[20:13];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_16_1 
//=========================================================
	STATE_LEVEL3_16_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL3_17
//=========================================================
	STATE_LEVEL3_17 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[19:12]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[19:12];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_17_1 
//=========================================================
	STATE_LEVEL3_17_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL3_18
//=========================================================
	STATE_LEVEL3_18 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[18:11]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[18:11];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_18_1 
//=========================================================
	STATE_LEVEL3_18_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end		
			
//=========================================================
// STATE_LEVEL3_19
//=========================================================
	STATE_LEVEL3_19 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[17:10]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[17:10];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_19_1 
//=========================================================
	STATE_LEVEL3_19_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL3_20
//=========================================================
	STATE_LEVEL3_20 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[16:9]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[16:9];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_20_1 
//=========================================================
	STATE_LEVEL3_20_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL3_21
//=========================================================
	STATE_LEVEL3_21 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[15:8]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[15:8];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_21_1 
//=========================================================
	STATE_LEVEL3_21_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL3_22
//=========================================================
	STATE_LEVEL3_22 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[14:7]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[14:7];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_22_1 
//=========================================================
	STATE_LEVEL3_22_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL3_23
//=========================================================
	STATE_LEVEL3_23 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[13:6]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[13:6];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_23_1 
//=========================================================
	STATE_LEVEL3_23_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL3_24
//=========================================================
	STATE_LEVEL3_24 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[12:5]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[12:5];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_24_1 
//=========================================================
	STATE_LEVEL3_24_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL3_25
//=========================================================
	STATE_LEVEL3_25 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[11:4]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[11:4];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_25_1 
//=========================================================
	STATE_LEVEL3_25_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL3_26
//=========================================================
	STATE_LEVEL3_26 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[10:3]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[10:3];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_26_1 
//=========================================================
	STATE_LEVEL3_26_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_LEVEL3_27
//=========================================================
	STATE_LEVEL3_27 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[9:2]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[9:2];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_27_1 
//=========================================================
	STATE_LEVEL3_27_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL3_28
//=========================================================
	STATE_LEVEL3_28 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[8:1]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[8:1];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL3_28_1 
//=========================================================
	STATE_LEVEL3_28_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL3_29
//=========================================================
	STATE_LEVEL3_29 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL3_OutBus[7:0]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL3_OutBus[7:0];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end

//=========================================================
// STATE_LEVEL3_29_1 
//=========================================================
	STATE_LEVEL3_29_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo	
				
		end
		
//////////////////////////
//  NIVEL 4
////////////////



//=========================================================
// STATE_LEVEL4_0
//=========================================================
	STATE_LEVEL4_0 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; //timer se debe encender cada vez que usted va a dejar una imagen cierto tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish debe permanecer en 0 en todos los estados que haga, solo es 1 en check
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[35:28]; // aqui van sus imagenes
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter en su caso no sirve, asi que dejelo en 11
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111; //este es el tiempo que el va a permanecer en la imagen, le recomiendo que lo deje en un mismo numero como 16b en 1
		end
//=========================================================
// STATE_LEVEL4_0_1 
//=========================================================
	STATE_LEVEL4_0_1 :	//Estos son los estados que debe crear entre dos dos estados, siempre van a estar vacios y van a ser iguales
		begin      //La razon si quiere se la explico despues pero mantengalo asi.
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; //timer tiene que estar en 1 porque ahora no va a contar ningun tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish siempre tiene que estar activa
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; //aqui puede colocar lo que sea, no va a tener tiempo de mostrarse
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; // sin embargo le aconsejo dejarlo en 0
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
		
//=========================================================
// STATE_LEVEL4_1
//=========================================================
	STATE_LEVEL4_1 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[35:28]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_1_1 
//=========================================================
	STATE_LEVEL4_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL4_2
//=========================================================
	STATE_LEVEL4_2 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[34:27]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[34:27];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_2_1 
//=========================================================
	STATE_LEVEL4_2_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end
//=========================================================
// STATE_LEVEL4_3
//=========================================================
	STATE_LEVEL4_3 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[33:26]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[33:26];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_3_1 
//=========================================================
	STATE_LEVEL4_3_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
//=========================================================
// STATE_LEVEL4_4
//=========================================================
	STATE_LEVEL4_4 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[32:25]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[32:25];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_4_1 
//=========================================================
	STATE_LEVEL4_4_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL4_5
//=========================================================
	STATE_LEVEL4_5 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[31:24]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[31:24];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_5_1 
//=========================================================
	STATE_LEVEL4_5_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL4_6
//=========================================================
	STATE_LEVEL4_6 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[30:23]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[30:23];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_6_1 
//=========================================================
	STATE_LEVEL4_6_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL4_7
//=========================================================
	STATE_LEVEL4_7 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[29:22]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[29:22];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_7_1 
//=========================================================
	STATE_LEVEL4_7_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
end
			
//=========================================================
// STATE_LEVEL4_8
//=========================================================
	STATE_LEVEL4_8 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[28:21]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[28:21];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_8_1 
//=========================================================
	STATE_LEVEL4_8_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_9
//=========================================================
	STATE_LEVEL4_9 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[27:20]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[27:20];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_9_1 
//=========================================================
	STATE_LEVEL4_9_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_10
//=========================================================
	STATE_LEVEL4_10 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[26:19]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[26:19];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_10_1 
//=========================================================
	STATE_LEVEL4_10_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_11
//=========================================================
	STATE_LEVEL4_11 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[25:18]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[25:18];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_11_1 
//=========================================================
	STATE_LEVEL4_11_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_12
//=========================================================
	STATE_LEVEL4_12 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[24:17]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[24:17];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_12_1 
//=========================================================
	STATE_LEVEL4_12_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL4_13
//=========================================================
	STATE_LEVEL4_13 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[23:16]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[23:16];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_13_1 
//=========================================================
	STATE_LEVEL4_13_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL4_14
//=========================================================
	STATE_LEVEL4_14 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[22:15]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[22:15];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_14_1 
//=========================================================
	STATE_LEVEL4_14_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL4_15
//=========================================================
	STATE_LEVEL4_15 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[21:14]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[21:14];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_15_1 
//=========================================================
	STATE_LEVEL4_15_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL4_16
//=========================================================
	STATE_LEVEL4_16 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[20:13]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[20:13];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_16_1 
//=========================================================
	STATE_LEVEL4_16_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
			
//=========================================================
// STATE_LEVEL4_17
//=========================================================
	STATE_LEVEL4_17 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[19:12]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[19:12];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_17_1 
//=========================================================
	STATE_LEVEL4_17_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_18
//=========================================================
	STATE_LEVEL4_18 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[18:11]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[18:11];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_18_1 
//=========================================================
	STATE_LEVEL4_18_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_19
//=========================================================
	STATE_LEVEL4_19 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[17:10]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[17:10];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_19_1 
//=========================================================
	STATE_LEVEL4_19_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_20
//=========================================================
	STATE_LEVEL4_20 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[16:9]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[16:9];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_20_1 
//=========================================================
	STATE_LEVEL4_20_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL4_21
//=========================================================
	STATE_LEVEL4_21 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[15:8]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[15:8];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_21_1 
//=========================================================
	STATE_LEVEL4_21_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL4_22
//=========================================================
	STATE_LEVEL4_22 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[14:7]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[14:7];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_22_1 
//=========================================================
	STATE_LEVEL4_22_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL4_23
//=========================================================
	STATE_LEVEL4_23 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[13:6]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[13:6];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_23_1 
//=========================================================
	STATE_LEVEL4_23_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL4_24
//=========================================================
	STATE_LEVEL4_24 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[12:5]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[12:5];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_24_1 
//=========================================================
	STATE_LEVEL4_24_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL4_25
//=========================================================
	STATE_LEVEL4_25 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[11:4]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[11:4];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_25_1 
//=========================================================
	STATE_LEVEL4_25_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL4_26
//=========================================================
	STATE_LEVEL4_26 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[10:3]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[10:3];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_26_1 
//=========================================================
	STATE_LEVEL4_26_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL4_27
//=========================================================
	STATE_LEVEL4_27 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[9:2]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[9:2];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_27_1 
//=========================================================
	STATE_LEVEL4_27_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL4_28
//=========================================================
	STATE_LEVEL4_28 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[8:1]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[8:1];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL4_28_1 
//=========================================================
	STATE_LEVEL4_28_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
	
//=========================================================
// STATE_LEVEL4_29
//=========================================================
	STATE_LEVEL4_29 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL4_OutBus[7:0]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL4_OutBus[7:0];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end

//=========================================================
// STATE_LEVEL4_29_1 
//=========================================================
	STATE_LEVEL4_29_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo	
				
		end
		
///////////////////////////////////
//			nIVEL 5
//////////////////////////////


		
//=========================================================
// STATE_LEVEL5_0
//=========================================================
	STATE_LEVEL5_0 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; //timer se debe encender cada vez que usted va a dejar una imagen cierto tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish debe permanecer en 0 en todos los estados que haga, solo es 1 en check
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[35:28]; // aqui van sus imagenes
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter en su caso no sirve, asi que dejelo en 11
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111; //este es el tiempo que el va a permanecer en la imagen, le recomiendo que lo deje en un mismo numero como 16b en 1
		end
//=========================================================
// STATE_LEVEL5_0_1 
//=========================================================
	STATE_LEVEL5_0_1 :	//Estos son los estados que debe crear entre dos dos estados, siempre van a estar vacios y van a ser iguales
		begin      //La razon si quiere se la explico despues pero mantengalo asi.
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; //timer tiene que estar en 1 porque ahora no va a contar ningun tiempo
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; // finish siempre tiene que estar activa
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; //aqui puede colocar lo que sea, no va a tener tiempo de mostrarse
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; // sin embargo le aconsejo dejarlo en 0
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
		
//=========================================================
// STATE_LEVEL5_1
//=========================================================
	STATE_LEVEL5_1 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[35:28]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[35:28];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_1_1 
//=========================================================
	STATE_LEVEL5_1_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end	
//=========================================================
// STATE_LEVEL5_2
//=========================================================
	STATE_LEVEL5_2 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[34:27]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[34:27];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_2_1 
//=========================================================
	STATE_LEVEL5_2_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
	end
//=========================================================
// STATE_LEVEL5_3
//=========================================================
	STATE_LEVEL5_3 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[33:26]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[33:26];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_3_1 
//=========================================================
	STATE_LEVEL5_3_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL5_4
//=========================================================
	STATE_LEVEL5_4 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[32:25]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[32:25];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_4_1 
//=========================================================
	STATE_LEVEL5_4_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			end
//=========================================================
// STATE_LEVEL5_5
//=========================================================
	STATE_LEVEL5_5 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[31:24]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[31:24];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_5_1 
//=========================================================
	STATE_LEVEL5_5_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
//=========================================================
// STATE_LEVEL5_6
//=========================================================
	STATE_LEVEL5_6 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[30:23]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[30:23];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_6_1 
//=========================================================
	STATE_LEVEL5_6_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL5_7
//=========================================================
	STATE_LEVEL5_7 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[29:22]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[29:22];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_7_1 
//=========================================================
	STATE_LEVEL5_7_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo

		end	
//=========================================================
// STATE_LEVEL5_8
//=========================================================
	STATE_LEVEL5_8 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[28:21]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[28:21];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_8_1 
//=========================================================
	STATE_LEVEL5_8_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL5_9
//=========================================================
	STATE_LEVEL5_9 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[27:20]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[27:20];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_9_1 
//=========================================================
	STATE_LEVEL5_9_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL5_10
//=========================================================
	STATE_LEVEL5_10 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[26:19]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[26:19];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_10_1 
//=========================================================
	STATE_LEVEL5_10_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL5_11
//=========================================================
	STATE_LEVEL5_11 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[25:18]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[25:18];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_11_1 
//=========================================================
	STATE_LEVEL5_11_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL5_12
//=========================================================
	STATE_LEVEL5_12 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[24:17]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[24:17];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_12_1 
//=========================================================
	STATE_LEVEL5_12_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL5_13
//=========================================================
	STATE_LEVEL5_13 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[23:16]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[23:16];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_13_1 
//=========================================================
	STATE_LEVEL5_13_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end
			
//=========================================================
// STATE_LEVEL5_14
//=========================================================
	STATE_LEVEL5_14 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[22:15]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[22:15];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_14_1 
//=========================================================
	STATE_LEVEL5_14_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL5_15
//=========================================================
	STATE_LEVEL5_15 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[21:14]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[21:14];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_15_1 
//=========================================================
	STATE_LEVEL5_15_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL5_16
//=========================================================
	STATE_LEVEL5_16 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[20:13]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[20:13];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_16_1 
//=========================================================
	STATE_LEVEL5_16_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			
		end	
//=========================================================
// STATE_LEVEL5_17
//=========================================================
	STATE_LEVEL5_17 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[19:12]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[19:12];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_17_1 
//=========================================================
	STATE_LEVEL5_17_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL5_18
//=========================================================
	STATE_LEVEL5_18 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[18:11]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[18:11];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_18_1 
//=========================================================
	STATE_LEVEL5_18_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL5_19
//=========================================================
	STATE_LEVEL5_19 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[17:10]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[17:10];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_19_1 
//=========================================================
	STATE_LEVEL5_19_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL5_20
//=========================================================
	STATE_LEVEL5_20 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[16:9]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[16:9];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_20_1 
//=========================================================
	STATE_LEVEL5_20_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL5_21
//=========================================================
	STATE_LEVEL5_21 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[15:8]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[15:8];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_21_1 
//=========================================================
	STATE_LEVEL5_21_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
//=========================================================
// STATE_LEVEL5_22
//=========================================================
	STATE_LEVEL5_22 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[14:7]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[14:7];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_22_1 
//=========================================================
	STATE_LEVEL5_22_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
		end	
			
//=========================================================
// STATE_LEVEL5_23
//=========================================================
	STATE_LEVEL5_23 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[13:6]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[13:6];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_23_1 
//=========================================================
	STATE_LEVEL5_23_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
			
			end
			
//=========================================================
// STATE_LEVEL5_24
//=========================================================
	STATE_LEVEL5_24 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[12:5]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[12:5];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_24_1 
//=========================================================
	STATE_LEVEL5_24_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end	
			
//=========================================================
// STATE_LEVEL5_25
//=========================================================
	STATE_LEVEL5_25 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[11:4]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[11:4];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_25_1 
//=========================================================
	STATE_LEVEL5_25_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		end
//=========================================================
// STATE_LEVEL5_26
//=========================================================
	STATE_LEVEL5_26 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[10:3]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[10:3];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_26_1 
//=========================================================
	STATE_LEVEL5_26_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL5_27
//=========================================================
	STATE_LEVEL5_27 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[9:2]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[9:2];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_27_1 
//=========================================================
	STATE_LEVEL5_27_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL5_28
//=========================================================
	STATE_LEVEL5_28 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[8:1]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[8:1];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end
//=========================================================
// STATE_LEVEL5_28_1 
//=========================================================
	STATE_LEVEL5_28_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo
		
	end
//=========================================================
// STATE_LEVEL5_29
//=========================================================
	STATE_LEVEL5_29 :
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b0; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0;
			SC_STATEMACHINEIMAGE_data7_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data7_LEVEL5_OutBus[7:0]; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data6_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data5_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data5_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data4_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data4_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data3_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data3_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data2_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data2_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data1_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data1_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_data0_OutBus   = SC_STATEMACHINEIMAGE_LETTER_data0_LEVEL5_OutBus[7:0];
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 23'b11111111111111111111111;  
		end

//=========================================================
// STATE_LEVEL5_29_1 
//=========================================================
	STATE_LEVEL5_29_1 :	
		begin      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1; 
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b0; 
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000; 
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b11; //counter al igual que en el anterior debe ser 11 
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0; // aqui no debe colocar nada, porque no va a contar ningun tiempo	
						
		end

		
//=========================================================
// DEFAULT
//=========================================================
	default  :
		begin
			      
			SC_STATEMACHINEIMAGE_timer_OutBus   = 1'b1;
			SC_STATEMACHINEIMAGE_finish_OutLow  = 1'b1;
			SC_STATEMACHINEIMAGE_data7_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data6_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data5_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data4_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data3_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data2_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data1_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_data0_OutBus   = 8'b00000000;
			SC_STATEMACHINEIMAGE_counter_OutBus = 2'b10;
			SC_STATEMACHINEIMAGE_limit_OutBus   = 1'b0;
		end
	endcase
end
endmodule
