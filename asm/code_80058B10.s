# Mario Party (U) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_80058B10
/* 059710 80058B10 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 059714 80058B14 AFBF0024 */  sw    $ra, 0x24($sp)
/* 059718 80058B18 AFB40020 */  sw    $s4, 0x20($sp)
/* 05971C 80058B1C AFB3001C */  sw    $s3, 0x1c($sp)
/* 059720 80058B20 AFB20018 */  sw    $s2, 0x18($sp)
/* 059724 80058B24 AFB10014 */  sw    $s1, 0x14($sp)
/* 059728 80058B28 AFB00010 */  sw    $s0, 0x10($sp)
/* 05972C 80058B2C 24040004 */  li    $a0, 4
/* 059730 80058B30 0C014CFE */  jal   func_800533F8
/* 059734 80058B34 00002821 */   addu  $a1, $zero, $zero
/* 059738 80058B38 00409021 */  addu  $s2, $v0, $zero
/* 05973C 80058B3C 3C04000A */  lui   $a0, (0x000A010A >> 16) # lui $a0, 0xa
/* 059740 80058B40 0C00516C */  jal   ReadMainFS
/* 059744 80058B44 3484010A */   ori   $a0, (0x000A010A & 0xFFFF) # ori $a0, $a0, 0x10a
/* 059748 80058B48 0040A021 */  addu  $s4, $v0, $zero
/* 05974C 80058B4C 00009821 */  addu  $s3, $zero, $zero
.L80058B50:
/* 059750 80058B50 0C019E29 */  jal   func_800678A4
/* 059754 80058B54 02802021 */   addu  $a0, $s4, $zero
/* 059758 80058B58 8E43000C */  lw    $v1, 0xc($s2)
/* 05975C 80058B5C 00133040 */  sll   $a2, $s3, 1
/* 059760 80058B60 00C31821 */  addu  $v1, $a2, $v1
/* 059764 80058B64 A4620000 */  sh    $v0, ($v1)
/* 059768 80058B68 00138C00 */  sll   $s1, $s3, 0x10
/* 05976C 80058B6C 00118C03 */  sra   $s1, $s1, 0x10
/* 059770 80058B70 8E42000C */  lw    $v0, 0xc($s2)
/* 059774 80058B74 00C23021 */  addu  $a2, $a2, $v0
/* 059778 80058B78 8644000A */  lh    $a0, 0xa($s2)
/* 05977C 80058B7C 02202821 */  addu  $a1, $s1, $zero
/* 059780 80058B80 84C60000 */  lh    $a2, ($a2)
/* 059784 80058B84 0C019C82 */  jal   func_80067208
/* 059788 80058B88 00003821 */   addu  $a3, $zero, $zero
/* 05978C 80058B8C 8644000A */  lh    $a0, 0xa($s2)
/* 059790 80058B90 02202821 */  addu  $a1, $s1, $zero
/* 059794 80058B94 0C019CE1 */  jal   func_80067384
/* 059798 80058B98 00003021 */   addu  $a2, $zero, $zero
/* 05979C 80058B9C 8644000A */  lh    $a0, 0xa($s2)
/* 0597A0 80058BA0 02202821 */  addu  $a1, $s1, $zero
/* 0597A4 80058BA4 0C019D2F */  jal   func_800674BC
/* 0597A8 80058BA8 34069800 */   li    $a2, 38912
/* 0597AC 80058BAC 00138080 */  sll   $s0, $s3, 2
/* 0597B0 80058BB0 8644000A */  lh    $a0, 0xa($s2)
/* 0597B4 80058BB4 3C06800C */  lui   $a2, 0x800c
/* 0597B8 80058BB8 00D03021 */  addu  $a2, $a2, $s0
/* 0597BC 80058BBC 84C65700 */  lh    $a2, 0x5700($a2)
/* 0597C0 80058BC0 3C07800C */  lui   $a3, 0x800c
/* 0597C4 80058BC4 00F03821 */  addu  $a3, $a3, $s0
/* 0597C8 80058BC8 84E75702 */  lh    $a3, 0x5702($a3)
/* 0597CC 80058BCC 0C019B71 */  jal   func_80066DC4
/* 0597D0 80058BD0 02202821 */   addu  $a1, $s1, $zero
/* 0597D4 80058BD4 8644000A */  lh    $a0, 0xa($s2)
/* 0597D8 80058BD8 3C06800C */  lui   $a2, 0x800c
/* 0597DC 80058BDC 00D03021 */  addu  $a2, $a2, $s0
/* 0597E0 80058BE0 8CC65710 */  lw    $a2, 0x5710($a2)
/* 0597E4 80058BE4 0C019CEC */  jal   func_800673B0
/* 0597E8 80058BE8 02202821 */   addu  $a1, $s1, $zero
/* 0597EC 80058BEC 26730001 */  addiu $s3, $s3, 1
/* 0597F0 80058BF0 2A620004 */  slti  $v0, $s3, 4
/* 0597F4 80058BF4 1440FFD6 */  bnez  $v0, .L80058B50
/* 0597F8 80058BF8 00000000 */   nop   
/* 0597FC 80058BFC 0C0051CC */  jal   FreeMainFS
/* 059800 80058C00 02802021 */   addu  $a0, $s4, $zero
/* 059804 80058C04 02401021 */  addu  $v0, $s2, $zero
/* 059808 80058C08 8FBF0024 */  lw    $ra, 0x24($sp)
/* 05980C 80058C0C 8FB40020 */  lw    $s4, 0x20($sp)
/* 059810 80058C10 8FB3001C */  lw    $s3, 0x1c($sp)
/* 059814 80058C14 8FB20018 */  lw    $s2, 0x18($sp)
/* 059818 80058C18 8FB10014 */  lw    $s1, 0x14($sp)
/* 05981C 80058C1C 8FB00010 */  lw    $s0, 0x10($sp)
/* 059820 80058C20 03E00008 */  jr    $ra
/* 059824 80058C24 27BD0028 */   addiu $sp, $sp, 0x28

glabel func_80058C28
/* 059828 80058C28 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 05982C 80058C2C AFBF0010 */  sw    $ra, 0x10($sp)
/* 059830 80058C30 0C014D15 */  jal   func_80053454
/* 059834 80058C34 00000000 */   nop   
/* 059838 80058C38 8FBF0010 */  lw    $ra, 0x10($sp)
/* 05983C 80058C3C 03E00008 */  jr    $ra
/* 059840 80058C40 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80058C44
/* 059844 80058C44 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 059848 80058C48 AFBF001C */  sw    $ra, 0x1c($sp)
/* 05984C 80058C4C AFB20018 */  sw    $s2, 0x18($sp)
/* 059850 80058C50 AFB10014 */  sw    $s1, 0x14($sp)
/* 059854 80058C54 AFB00010 */  sw    $s0, 0x10($sp)
/* 059858 80058C58 00808821 */  addu  $s1, $a0, $zero
/* 05985C 80058C5C 00008021 */  addu  $s0, $zero, $zero
/* 059860 80058C60 30B2FFFF */  andi  $s2, $a1, 0xffff
/* 059864 80058C64 02121007 */  srav  $v0, $s2, $s0
.L80058C68:
/* 059868 80058C68 30420001 */  andi  $v0, $v0, 1
/* 05986C 80058C6C 10400007 */  beqz  $v0, .L80058C8C
/* 059870 80058C70 00102C00 */   sll   $a1, $s0, 0x10
/* 059874 80058C74 8624000A */  lh    $a0, 0xa($s1)
/* 059878 80058C78 00052C03 */  sra   $a1, $a1, 0x10
/* 05987C 80058C7C 0C019D2F */  jal   func_800674BC
/* 059880 80058C80 34068000 */   li    $a2, 32768
/* 059884 80058C84 08016328 */  j     func_80058CA0
/* 059888 80058C88 26100001 */   addiu $s0, $s0, 1

.L80058C8C:
/* 05988C 80058C8C 8624000A */  lh    $a0, 0xa($s1)
/* 059890 80058C90 00052C03 */  sra   $a1, $a1, 0x10
/* 059894 80058C94 0C019D20 */  jal   func_80067480
/* 059898 80058C98 34068000 */   li    $a2, 32768
/* 05989C 80058C9C 26100001 */  addiu $s0, $s0, 1
glabel func_80058CA0
/* 0598A0 80058CA0 2A020004 */  slti  $v0, $s0, 4
/* 0598A4 80058CA4 1440FFF0 */  bnez  $v0, .L80058C68
/* 0598A8 80058CA8 02121007 */   srav  $v0, $s2, $s0
/* 0598AC 80058CAC 8FBF001C */  lw    $ra, 0x1c($sp)
/* 0598B0 80058CB0 8FB20018 */  lw    $s2, 0x18($sp)
/* 0598B4 80058CB4 8FB10014 */  lw    $s1, 0x14($sp)
/* 0598B8 80058CB8 8FB00010 */  lw    $s0, 0x10($sp)
/* 0598BC 80058CBC 03E00008 */  jr    $ra
/* 0598C0 80058CC0 27BD0020 */   addiu $sp, $sp, 0x20

glabel func_80058CC4
/* 0598C4 80058CC4 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 0598C8 80058CC8 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0598CC 80058CCC AFB40020 */  sw    $s4, 0x20($sp)
/* 0598D0 80058CD0 AFB3001C */  sw    $s3, 0x1c($sp)
/* 0598D4 80058CD4 AFB20018 */  sw    $s2, 0x18($sp)
/* 0598D8 80058CD8 AFB10014 */  sw    $s1, 0x14($sp)
/* 0598DC 80058CDC AFB00010 */  sw    $s0, 0x10($sp)
/* 0598E0 80058CE0 F7B40028 */  sdc1  $f20, 0x28($sp)
/* 0598E4 80058CE4 00009821 */  addu  $s3, $zero, $zero
/* 0598E8 80058CE8 3C14800E */  lui   $s4, %hi(D_800D8710) # $s4, 0x800e
/* 0598EC 80058CEC 26948710 */  addiu $s4, %lo(D_800D8710) # addiu $s4, $s4, -0x78f0
/* 0598F0 80058CF0 3C013F99 */  li    $at, 0x3F990000 # 1.195312
/* 0598F4 80058CF4 3421999A */  ori   $at, (0x3F99999A & 0xFFFF) # ori $at, $at, 0x999a
/* 0598F8 80058CF8 4481A000 */  mtc1  $at, $f20
/* 0598FC 80058CFC 00000000 */  nop   
.L80058D00:
/* 059900 80058D00 0C014AA3 */  jal   GetPlayerStruct
/* 059904 80058D04 02602021 */   addu  $a0, $s3, $zero
/* 059908 80058D08 00409021 */  addu  $s2, $v0, $zero
/* 05990C 80058D0C 8E440020 */  lw    $a0, 0x20($s2)
/* 059910 80058D10 0C00F999 */  jal   func_8003E664
/* 059914 80058D14 00138C00 */   sll   $s1, $s3, 0x10
/* 059918 80058D18 00118C03 */  sra   $s1, $s1, 0x10
/* 05991C 80058D1C 0C014BDB */  jal   func_80052F6C
/* 059920 80058D20 02202021 */   addu  $a0, $s1, $zero
/* 059924 80058D24 304400FF */  andi  $a0, $v0, 0xff
/* 059928 80058D28 0C00F6F8 */  jal   func_8003DBE0
/* 05992C 80058D2C 00002821 */   addu  $a1, $zero, $zero
/* 059930 80058D30 00138080 */  sll   $s0, $s3, 2
/* 059934 80058D34 02148021 */  addu  $s0, $s0, $s4
/* 059938 80058D38 AE020000 */  sw    $v0, ($s0)
/* 05993C 80058D3C 9644000E */  lhu   $a0, 0xe($s2)
/* 059940 80058D40 96450010 */  lhu   $a1, 0x10($s2)
/* 059944 80058D44 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 059948 80058D48 26730001 */   addiu $s3, $s3, 1
/* 05994C 80058D4C 00021400 */  sll   $v0, $v0, 0x10
/* 059950 80058D50 8E060000 */  lw    $a2, ($s0)
/* 059954 80058D54 02202021 */  addu  $a0, $s1, $zero
/* 059958 80058D58 00022C03 */  sra   $a1, $v0, 0x10
/* 05995C 80058D5C 0C013305 */  jal   func_8004CC14
/* 059960 80058D60 24C6000C */   addiu $a2, $a2, 0xc
/* 059964 80058D64 8E040000 */  lw    $a0, ($s0)
/* 059968 80058D68 4405A000 */  mfc1  $a1, $f20
/* 05996C 80058D6C 4406A000 */  mfc1  $a2, $f20
/* 059970 80058D70 4407A000 */  mfc1  $a3, $f20
/* 059974 80058D74 00000000 */  nop   
/* 059978 80058D78 0C028340 */  jal   func_800A0D00
/* 05997C 80058D7C 24840024 */   addiu $a0, $a0, 0x24
/* 059980 80058D80 2A620004 */  slti  $v0, $s3, 4
/* 059984 80058D84 1440FFDE */  bnez  $v0, .L80058D00
/* 059988 80058D88 00000000 */   nop   
/* 05998C 80058D8C 8FBF0024 */  lw    $ra, 0x24($sp)
/* 059990 80058D90 8FB40020 */  lw    $s4, 0x20($sp)
/* 059994 80058D94 8FB3001C */  lw    $s3, 0x1c($sp)
/* 059998 80058D98 8FB20018 */  lw    $s2, 0x18($sp)
/* 05999C 80058D9C 8FB10014 */  lw    $s1, 0x14($sp)
/* 0599A0 80058DA0 8FB00010 */  lw    $s0, 0x10($sp)
/* 0599A4 80058DA4 D7B40028 */  ldc1  $f20, 0x28($sp)
/* 0599A8 80058DA8 03E00008 */  jr    $ra
/* 0599AC 80058DAC 27BD0030 */   addiu $sp, $sp, 0x30

glabel func_80058DB0
/* 0599B0 80058DB0 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0599B4 80058DB4 AFBF0018 */  sw    $ra, 0x18($sp)
/* 0599B8 80058DB8 AFB10014 */  sw    $s1, 0x14($sp)
/* 0599BC 80058DBC AFB00010 */  sw    $s0, 0x10($sp)
/* 0599C0 80058DC0 00008021 */  addu  $s0, $zero, $zero
/* 0599C4 80058DC4 3C11800E */  lui   $s1, %hi(D_800D8710) # $s1, 0x800e
/* 0599C8 80058DC8 26318710 */  addiu $s1, %lo(D_800D8710) # addiu $s1, $s1, -0x78f0
.L80058DCC:
/* 0599CC 80058DCC 0C014AA3 */  jal   GetPlayerStruct
/* 0599D0 80058DD0 02002021 */   addu  $a0, $s0, $zero
/* 0599D4 80058DD4 8C440020 */  lw    $a0, 0x20($v0)
/* 0599D8 80058DD8 0C00F978 */  jal   func_8003E5E0
/* 0599DC 80058DDC 00000000 */   nop   
/* 0599E0 80058DE0 00101080 */  sll   $v0, $s0, 2
/* 0599E4 80058DE4 00511021 */  addu  $v0, $v0, $s1
/* 0599E8 80058DE8 8C440000 */  lw    $a0, ($v0)
/* 0599EC 80058DEC 0C00F9A5 */  jal   func_8003E694
/* 0599F0 80058DF0 26100001 */   addiu $s0, $s0, 1
/* 0599F4 80058DF4 2A020004 */  slti  $v0, $s0, 4
/* 0599F8 80058DF8 1440FFF4 */  bnez  $v0, .L80058DCC
/* 0599FC 80058DFC 00000000 */   nop   
/* 059A00 80058E00 8FBF0018 */  lw    $ra, 0x18($sp)
/* 059A04 80058E04 8FB10014 */  lw    $s1, 0x14($sp)
/* 059A08 80058E08 8FB00010 */  lw    $s0, 0x10($sp)
/* 059A0C 80058E0C 03E00008 */  jr    $ra
/* 059A10 80058E10 27BD0020 */   addiu $sp, $sp, 0x20

glabel func_80058E14
/* 059A14 80058E14 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 059A18 80058E18 AFBF0010 */  sw    $ra, 0x10($sp)
/* 059A1C 80058E1C 0C016331 */  jal   func_80058CC4
/* 059A20 80058E20 00000000 */   nop   
/* 059A24 80058E24 0C012DFE */  jal   func_8004B7F8
/* 059A28 80058E28 240400A0 */   li    $a0, 160
/* 059A2C 80058E2C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 059A30 80058E30 03E00008 */  jr    $ra
/* 059A34 80058E34 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80058E38
/* 059A38 80058E38 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 059A3C 80058E3C AFBF0010 */  sw    $ra, 0x10($sp)
/* 059A40 80058E40 0C01636C */  jal   func_80058DB0
/* 059A44 80058E44 00000000 */   nop   
/* 059A48 80058E48 0C012DFE */  jal   func_8004B7F8
/* 059A4C 80058E4C 240400FF */   li    $a0, 255
/* 059A50 80058E50 0C01567E */  jal   func_800559F8
/* 059A54 80058E54 00000000 */   nop   
/* 059A58 80058E58 8FBF0010 */  lw    $ra, 0x10($sp)
/* 059A5C 80058E5C 03E00008 */  jr    $ra
/* 059A60 80058E60 27BD0018 */   addiu $sp, $sp, 0x18

D_80058E64:
/* 059A64 80058E64 27BDFFA8 */  addiu $sp, $sp, -0x58
/* 059A68 80058E68 AFBF0040 */  sw    $ra, 0x40($sp)
/* 059A6C 80058E6C AFB7003C */  sw    $s7, 0x3c($sp)
/* 059A70 80058E70 AFB60038 */  sw    $s6, 0x38($sp)
/* 059A74 80058E74 AFB50034 */  sw    $s5, 0x34($sp)
/* 059A78 80058E78 AFB40030 */  sw    $s4, 0x30($sp)
/* 059A7C 80058E7C AFB3002C */  sw    $s3, 0x2c($sp)
/* 059A80 80058E80 AFB20028 */  sw    $s2, 0x28($sp)
/* 059A84 80058E84 AFB10024 */  sw    $s1, 0x24($sp)
/* 059A88 80058E88 AFB00020 */  sw    $s0, 0x20($sp)
/* 059A8C 80058E8C F7B60050 */  sdc1  $f22, 0x50($sp)
/* 059A90 80058E90 F7B40048 */  sdc1  $f20, 0x48($sp)
/* 059A94 80058E94 0C018CEA */  jal   GetCurrentProcess
/* 059A98 80058E98 0000A821 */   addu  $s5, $zero, $zero
/* 059A9C 80058E9C 8C52008C */  lw    $s2, 0x8c($v0)
/* 059AA0 80058EA0 0C012E11 */  jal   func_8004B844
/* 059AA4 80058EA4 00008821 */   addu  $s1, $zero, $zero
/* 059AA8 80058EA8 0C015A64 */  jal   func_80056990
/* 059AAC 80058EAC 46000586 */   mov.s $f22, $f0
/* 059AB0 80058EB0 00021400 */  sll   $v0, $v0, 0x10
/* 059AB4 80058EB4 1440000E */  bnez  $v0, .L80058EF0
/* 059AB8 80058EB8 00000000 */   nop   
/* 059ABC 80058EBC 24040006 */  li    $a0, 6
/* 059AC0 80058EC0 0C01C9AB */  jal   func_800726AC
/* 059AC4 80058EC4 24050008 */   li    $a1, 8
/* 059AC8 80058EC8 0C018D54 */  jal   SleepProcess
/* 059ACC 80058ECC 24040008 */   li    $a0, 8
/* 059AD0 80058ED0 3C10800F */  lui   $s0, %hi(D_800ED5DC) # $s0, 0x800f
/* 059AD4 80058ED4 2610D5DC */  addiu $s0, %lo(D_800ED5DC) # addiu $s0, $s0, -0x2a24
/* 059AD8 80058ED8 0C010177 */  jal   func_800405DC
/* 059ADC 80058EDC 86040000 */   lh    $a0, ($s0)
/* 059AE0 80058EE0 0C0101B9 */  jal   func_800406E4
/* 059AE4 80058EE4 86040000 */   lh    $a0, ($s0)
/* 059AE8 80058EE8 0C018085 */  jal   func_80060214
/* 059AEC 80058EEC 24040060 */   li    $a0, 96
.L80058EF0:
/* 059AF0 80058EF0 0C016385 */  jal   func_80058E14
/* 059AF4 80058EF4 00000000 */   nop   
/* 059AF8 80058EF8 24040006 */  li    $a0, 6
/* 059AFC 80058EFC 0C01C991 */  jal   func_80072644
/* 059B00 80058F00 24050008 */   li    $a1, 8
/* 059B04 80058F04 0C018D54 */  jal   SleepProcess
/* 059B08 80058F08 24040007 */   li    $a0, 7
/* 059B0C 80058F0C 0C0162C4 */  jal   func_80058B10
/* 059B10 80058F10 00000000 */   nop   
/* 059B14 80058F14 0040A021 */  addu  $s4, $v0, $zero
/* 059B18 80058F18 24040004 */  li    $a0, 4
/* 059B1C 80058F1C 240500A0 */  li    $a1, 160
/* 059B20 80058F20 0C011761 */  jal   func_80045D84
/* 059B24 80058F24 00003021 */   addu  $a2, $zero, $zero
/* 059B28 80058F28 0040B821 */  addu  $s7, $v0, $zero
/* 059B2C 80058F2C 3C02800F */  lui   $v0, %hi(D_800F3FF0) # $v0, 0x800f
/* 059B30 80058F30 8C423FF0 */  lw    $v0, %lo(D_800F3FF0)($v0)
/* 059B34 80058F34 10400005 */  beqz  $v0, .L80058F4C
/* 059B38 80058F38 24040006 */   li    $a0, 6
/* 059B3C 80058F3C 2405003C */  li    $a1, 60
/* 059B40 80058F40 0C011761 */  jal   func_80045D84
/* 059B44 80058F44 00003021 */   addu  $a2, $zero, $zero
/* 059B48 80058F48 0040A821 */  addu  $s5, $v0, $zero
.L80058F4C:
/* 059B4C 80058F4C 0C012DB6 */  jal   func_8004B6D8
/* 059B50 80058F50 27A40010 */   addiu $a0, $sp, 0x10
/* 059B54 80058F54 3C014080 */  li    $at, 0x40800000 # 4.000000
/* 059B58 80058F58 44816000 */  mtc1  $at, $f12
/* 059B5C 80058F5C 0C012E0E */  jal   func_8004B838
/* 059B60 80058F60 00000000 */   nop   
/* 059B64 80058F64 27B30018 */  addiu $s3, $sp, 0x18
/* 059B68 80058F68 3C02800F */  lui   $v0, %hi(D_800F544C) # $v0, 0x800f
/* 059B6C 80058F6C 2442544C */  addiu $v0, %lo(D_800F544C) # addiu $v0, $v0, 0x544c
/* 059B70 80058F70 00121840 */  sll   $v1, $s2, 1
/* 059B74 80058F74 00628021 */  addu  $s0, $v1, $v0
/* 059B78 80058F78 3C014180 */  li    $at, 0x41800000 # 16.000000
/* 059B7C 80058F7C 4481A000 */  mtc1  $at, $f20
/* 059B80 80058F80 24120010 */  li    $s2, 16
/* 059B84 80058F84 3C02800F */  lui   $v0, %hi(D_800EC6EA) # $v0, 0x800f
/* 059B88 80058F88 2442C6EA */  addiu $v0, %lo(D_800EC6EA) # addiu $v0, $v0, -0x3916
/* 059B8C 80058F8C 0062B021 */  addu  $s6, $v1, $v0
.L80058F90:
/* 059B90 80058F90 0C018D6D */  jal   SleepVProcess
/* 059B94 80058F94 00000000 */   nop   
/* 059B98 80058F98 0C012DB6 */  jal   func_8004B6D8
/* 059B9C 80058F9C 02602021 */   addu  $a0, $s3, $zero
/* 059BA0 80058FA0 0C012D87 */  jal   func_8004B61C
/* 059BA4 80058FA4 02602021 */   addu  $a0, $s3, $zero
/* 059BA8 80058FA8 02802021 */  addu  $a0, $s4, $zero
/* 059BAC 80058FAC 0C016311 */  jal   func_80058C44
/* 059BB0 80058FB0 3045FFFF */   andi  $a1, $v0, 0xffff
/* 059BB4 80058FB4 96020000 */  lhu   $v0, ($s0)
/* 059BB8 80058FB8 30420200 */  andi  $v0, $v0, 0x200
/* 059BBC 80058FBC 10400005 */  beqz  $v0, .L80058FD4
/* 059BC0 80058FC0 00000000 */   nop   
/* 059BC4 80058FC4 C7A00018 */  lwc1  $f0, 0x18($sp)
/* 059BC8 80058FC8 46140001 */  sub.s $f0, $f0, $f20
/* 059BCC 80058FCC E7A00018 */  swc1  $f0, 0x18($sp)
/* 059BD0 80058FD0 2411000F */  li    $s1, 15
.L80058FD4:
/* 059BD4 80058FD4 96020000 */  lhu   $v0, ($s0)
/* 059BD8 80058FD8 30420100 */  andi  $v0, $v0, 0x100
/* 059BDC 80058FDC 10400008 */  beqz  $v0, .L80059000
/* 059BE0 80058FE0 00000000 */   nop   
/* 059BE4 80058FE4 44920000 */  mtc1  $s2, $f0
/* 059BE8 80058FE8 00000000 */  nop   
/* 059BEC 80058FEC 46800020 */  cvt.s.w $f0, $f0
/* 059BF0 80058FF0 C7A20018 */  lwc1  $f2, 0x18($sp)
/* 059BF4 80058FF4 46020000 */  add.s $f0, $f0, $f2
/* 059BF8 80058FF8 E7A00018 */  swc1  $f0, 0x18($sp)
/* 059BFC 80058FFC 2411000F */  li    $s1, 15
.L80059000:
/* 059C00 80059000 96020000 */  lhu   $v0, ($s0)
/* 059C04 80059004 30420800 */  andi  $v0, $v0, 0x800
/* 059C08 80059008 10400008 */  beqz  $v0, .L8005902C
/* 059C0C 8005900C 00000000 */   nop   
/* 059C10 80059010 44921000 */  mtc1  $s2, $f2
/* 059C14 80059014 00000000 */  nop   
/* 059C18 80059018 468010A0 */  cvt.s.w $f2, $f2
/* 059C1C 8005901C C7A0001C */  lwc1  $f0, 0x1c($sp)
/* 059C20 80059020 46020001 */  sub.s $f0, $f0, $f2
/* 059C24 80059024 E7A0001C */  swc1  $f0, 0x1c($sp)
/* 059C28 80059028 2411000F */  li    $s1, 15
.L8005902C:
/* 059C2C 8005902C 96020000 */  lhu   $v0, ($s0)
/* 059C30 80059030 30420400 */  andi  $v0, $v0, 0x400
/* 059C34 80059034 10400008 */  beqz  $v0, .L80059058
/* 059C38 80059038 00000000 */   nop   
/* 059C3C 8005903C 44920000 */  mtc1  $s2, $f0
/* 059C40 80059040 00000000 */  nop   
/* 059C44 80059044 46800020 */  cvt.s.w $f0, $f0
/* 059C48 80059048 C7A2001C */  lwc1  $f2, 0x1c($sp)
/* 059C4C 8005904C 46020000 */  add.s $f0, $f0, $f2
/* 059C50 80059050 E7A0001C */  swc1  $f0, 0x1c($sp)
/* 059C54 80059054 2411000F */  li    $s1, 15
.L80059058:
/* 059C58 80059058 0C012D87 */  jal   func_8004B61C
/* 059C5C 8005905C 27A40018 */   addiu $a0, $sp, 0x18
/* 059C60 80059060 00111400 */  sll   $v0, $s1, 0x10
/* 059C64 80059064 10400005 */  beqz  $v0, .L8005907C
/* 059C68 80059068 00000000 */   nop   
/* 059C6C 8005906C 0C01566F */  jal   func_800559BC
/* 059C70 80059070 2631FFFF */   addiu $s1, $s1, -1
/* 059C74 80059074 08016421 */  j     func_80059084
/* 059C78 80059078 00000000 */   nop   

.L8005907C:
/* 059C7C 8005907C 0C01567E */  jal   func_800559F8
/* 059C80 80059080 00000000 */   nop   
glabel func_80059084
/* 059C84 80059084 3C02800F */  lui   $v0, %hi(D_800EE320) # $v0, 0x800f
/* 059C88 80059088 8442E320 */  lh    $v0, %lo(D_800EE320)($v0)
/* 059C8C 8005908C 10400005 */  beqz  $v0, .L800590A4
/* 059C90 80059090 00000000 */   nop   
/* 059C94 80059094 96C20000 */  lhu   $v0, ($s6)
/* 059C98 80059098 3042E010 */  andi  $v0, $v0, 0xe010
/* 059C9C 8005909C 1040FFBC */  beqz  $v0, .L80058F90
/* 059CA0 800590A0 00000000 */   nop   
.L800590A4:
/* 059CA4 800590A4 0C01179B */  jal   func_80045E6C
/* 059CA8 800590A8 02E02021 */   addu  $a0, $s7, $zero
/* 059CAC 800590AC 12A00003 */  beqz  $s5, .L800590BC
/* 059CB0 800590B0 00000000 */   nop   
/* 059CB4 800590B4 0C01179B */  jal   func_80045E6C
/* 059CB8 800590B8 02A02021 */   addu  $a0, $s5, $zero
.L800590BC:
/* 059CBC 800590BC 0C01630A */  jal   func_80058C28
/* 059CC0 800590C0 02802021 */   addu  $a0, $s4, $zero
/* 059CC4 800590C4 24040006 */  li    $a0, 6
/* 059CC8 800590C8 0C01C9AB */  jal   func_800726AC
/* 059CCC 800590CC 24050008 */   li    $a1, 8
/* 059CD0 800590D0 0C018D54 */  jal   SleepProcess
/* 059CD4 800590D4 24040008 */   li    $a0, 8
/* 059CD8 800590D8 0C015A64 */  jal   func_80056990
/* 059CDC 800590DC 00000000 */   nop   
/* 059CE0 800590E0 00021400 */  sll   $v0, $v0, 0x10
/* 059CE4 800590E4 1440002B */  bnez  $v0, .L80059194
/* 059CE8 800590E8 00000000 */   nop   
/* 059CEC 800590EC 0C0129F7 */  jal   func_8004A7DC
/* 059CF0 800590F0 00000000 */   nop   
/* 059CF4 800590F4 0C0129E9 */  jal   func_8004A7A4
/* 059CF8 800590F8 00000000 */   nop   
/* 059CFC 800590FC 3C01BF80 */  li    $at, 0xBF800000 # -1.000000
/* 059D00 80059100 44816000 */  mtc1  $at, $f12
/* 059D04 80059104 0C012E0E */  jal   func_8004B838
/* 059D08 80059108 00000000 */   nop   
/* 059D0C 8005910C 0C012D74 */  jal   func_8004B5D0
/* 059D10 80059110 00000000 */   nop   
/* 059D14 80059114 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 059D18 80059118 44816000 */  mtc1  $at, $f12
/* 059D1C 8005911C 00000000 */  nop   
/* 059D20 80059120 0C012D71 */  jal   func_8004B5C4
/* 059D24 80059124 46000506 */   mov.s $f20, $f0
/* 059D28 80059128 0C012944 */  jal   func_8004A510
/* 059D2C 8005912C 00000000 */   nop   
/* 059D30 80059130 0C012D87 */  jal   func_8004B61C
/* 059D34 80059134 27A40010 */   addiu $a0, $sp, 0x10
/* 059D38 80059138 0C018D6D */  jal   SleepVProcess
/* 059D3C 8005913C 00000000 */   nop   
/* 059D40 80059140 0C012948 */  jal   func_8004A520
/* 059D44 80059144 00000000 */   nop   
/* 059D48 80059148 0C012D71 */  jal   func_8004B5C4
/* 059D4C 8005914C 4600A306 */   mov.s $f12, $f20
/* 059D50 80059150 3C10800F */  lui   $s0, %hi(D_800ED5DC) # $s0, 0x800f
/* 059D54 80059154 2610D5DC */  addiu $s0, %lo(D_800ED5DC) # addiu $s0, $s0, -0x2a24
/* 059D58 80059158 0C00FFBF */  jal   func_8003FEFC
/* 059D5C 8005915C 86040000 */   lh    $a0, ($s0)
/* 059D60 80059160 0C0101C9 */  jal   func_80040724
/* 059D64 80059164 86040000 */   lh    $a0, ($s0)
/* 059D68 80059168 0C01638E */  jal   func_80058E38
/* 059D6C 8005916C 00000000 */   nop   
/* 059D70 80059170 0C018085 */  jal   func_80060214
/* 059D74 80059174 2404007F */   li    $a0, 127
/* 059D78 80059178 24040006 */  li    $a0, 6
/* 059D7C 8005917C 0C01C991 */  jal   func_80072644
/* 059D80 80059180 24050008 */   li    $a1, 8
/* 059D84 80059184 0C018D54 */  jal   SleepProcess
/* 059D88 80059188 24040007 */   li    $a0, 7
/* 059D8C 8005918C 08016467 */  j     func_8005919C
/* 059D90 80059190 00000000 */   nop   

.L80059194:
/* 059D94 80059194 0C01638E */  jal   func_80058E38
/* 059D98 80059198 00000000 */   nop   
glabel func_8005919C
/* 059D9C 8005919C 0C012E0E */  jal   func_8004B838
/* 059DA0 800591A0 4600B306 */   mov.s $f12, $f22
/* 059DA4 800591A4 0C017764 */  jal   EndProcess
/* 059DA8 800591A8 00002021 */   addu  $a0, $zero, $zero
/* 059DAC 800591AC 8FBF0040 */  lw    $ra, 0x40($sp)
/* 059DB0 800591B0 8FB7003C */  lw    $s7, 0x3c($sp)
/* 059DB4 800591B4 8FB60038 */  lw    $s6, 0x38($sp)
/* 059DB8 800591B8 8FB50034 */  lw    $s5, 0x34($sp)
/* 059DBC 800591BC 8FB40030 */  lw    $s4, 0x30($sp)
/* 059DC0 800591C0 8FB3002C */  lw    $s3, 0x2c($sp)
/* 059DC4 800591C4 8FB20028 */  lw    $s2, 0x28($sp)
/* 059DC8 800591C8 8FB10024 */  lw    $s1, 0x24($sp)
/* 059DCC 800591CC 8FB00020 */  lw    $s0, 0x20($sp)
/* 059DD0 800591D0 D7B60050 */  ldc1  $f22, 0x50($sp)
/* 059DD4 800591D4 D7B40048 */  ldc1  $f20, 0x48($sp)
/* 059DD8 800591D8 03E00008 */  jr    $ra
/* 059DDC 800591DC 27BD0058 */   addiu $sp, $sp, 0x58

glabel func_800591E0
/* 059DE0 800591E0 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 059DE4 800591E4 AFBF001C */  sw    $ra, 0x1c($sp)
/* 059DE8 800591E8 AFB20018 */  sw    $s2, 0x18($sp)
/* 059DEC 800591EC AFB10014 */  sw    $s1, 0x14($sp)
/* 059DF0 800591F0 AFB00010 */  sw    $s0, 0x10($sp)
/* 059DF4 800591F4 24020001 */  li    $v0, 1
/* 059DF8 800591F8 3C01800F */  lui   $at, %hi(D_800ECC22) # $at, 0x800f
/* 059DFC 800591FC A022CC22 */  sb    $v0, %lo(D_800ECC22)($at)
/* 059E00 80059200 0C017F5F */  jal   func_8005FD7C
/* 059E04 80059204 00809021 */   addu  $s2, $a0, $zero
/* 059E08 80059208 0C018CEA */  jal   GetCurrentProcess
/* 059E0C 8005920C 00000000 */   nop   
/* 059E10 80059210 00408821 */  addu  $s1, $v0, $zero
/* 059E14 80059214 3C048006 */  lui   $a0, %hi(D_80058E64) # $a0, 0x8006
/* 059E18 80059218 24848E64 */  addiu $a0, %lo(D_80058E64) # addiu $a0, $a0, -0x719c
/* 059E1C 8005921C 24051005 */  li    $a1, 4101
/* 059E20 80059220 00003021 */  addu  $a2, $zero, $zero
/* 059E24 80059224 0C01770A */  jal   InitProcess
/* 059E28 80059228 00003821 */   addu  $a3, $zero, $zero
/* 059E2C 8005922C 00408021 */  addu  $s0, $v0, $zero
/* 059E30 80059230 AE12008C */  sw    $s2, 0x8c($s0)
/* 059E34 80059234 02002021 */  addu  $a0, $s0, $zero
/* 059E38 80059238 0C017640 */  jal   func_8005D900
/* 059E3C 8005923C 24050080 */   li    $a1, 128
/* 059E40 80059240 02202021 */  addu  $a0, $s1, $zero
/* 059E44 80059244 0C018C9C */  jal   LinkChildProcess
/* 059E48 80059248 02002821 */   addu  $a1, $s0, $zero
/* 059E4C 8005924C 0C018CD6 */  jal   WaitForChildProcess
/* 059E50 80059250 00000000 */   nop   
/* 059E54 80059254 0C017FB3 */  jal   func_8005FECC
/* 059E58 80059258 00000000 */   nop   
/* 059E5C 8005925C 3C01800F */  lui   $at, %hi(D_800ECC22) # $at, 0x800f
/* 059E60 80059260 A020CC22 */  sb    $zero, %lo(D_800ECC22)($at)
/* 059E64 80059264 8FBF001C */  lw    $ra, 0x1c($sp)
/* 059E68 80059268 8FB20018 */  lw    $s2, 0x18($sp)
/* 059E6C 8005926C 8FB10014 */  lw    $s1, 0x14($sp)
/* 059E70 80059270 8FB00010 */  lw    $s0, 0x10($sp)
/* 059E74 80059274 03E00008 */  jr    $ra
/* 059E78 80059278 27BD0020 */   addiu $sp, $sp, 0x20

/* 059E7C 8005927C 00000000 */  nop   
