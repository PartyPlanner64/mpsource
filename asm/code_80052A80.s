# Mario Party (U) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

GetCurrentPlayerIndex:
/* 053680 80052A80 3C02800F */  lui   $v0, 0x800f
/* 053684 80052A84 03E00008 */  jr    $ra
/* 053688 80052A88 8442D5DC */   lh    $v0, -0x2a24($v0)

GetPlayerStruct:
/* 05368C 80052A8C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053690 80052A90 04810005 */  bgez  $a0, .L80052AA8
/* 053694 80052A94 AFBF0010 */   sw    $ra, 0x10($sp)
/* 053698 80052A98 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 05369C 80052A9C 00000000 */   nop   
/* 0536A0 80052AA0 00021400 */  sll   $v0, $v0, 0x10
/* 0536A4 80052AA4 00022403 */  sra   $a0, $v0, 0x10
.L80052AA8:
/* 0536A8 80052AA8 00041040 */  sll   $v0, $a0, 1
/* 0536AC 80052AAC 00441021 */  addu  $v0, $v0, $a0
/* 0536B0 80052AB0 00021100 */  sll   $v0, $v0, 4
/* 0536B4 80052AB4 3C03800F */  lui   $v1, %hi(D_800F32B0) # $v1, 0x800f
/* 0536B8 80052AB8 246332B0 */  addiu $v1, %lo(D_800F32B0) # addiu $v1, $v1, 0x32b0
/* 0536BC 80052ABC 8FBF0010 */  lw    $ra, 0x10($sp)
/* 0536C0 80052AC0 00431021 */  addu  $v0, $v0, $v1
/* 0536C4 80052AC4 03E00008 */  jr    $ra
/* 0536C8 80052AC8 27BD0018 */   addiu $sp, $sp, 0x18

PlayerIsCurrent:
/* 0536CC 80052ACC 00041400 */  sll   $v0, $a0, 0x10
/* 0536D0 80052AD0 00021403 */  sra   $v0, $v0, 0x10
/* 0536D4 80052AD4 3C03800F */  lui   $v1, %hi(D_800ED5DC) # $v1, 0x800f
/* 0536D8 80052AD8 8463D5DC */  lh    $v1, %lo(D_800ED5DC)($v1)
/* 0536DC 80052ADC 00431026 */  xor   $v0, $v0, $v1
/* 0536E0 80052AE0 03E00008 */  jr    $ra
/* 0536E4 80052AE4 2C420001 */   sltiu $v0, $v0, 1

glabel func_80052AE8
/* 0536E8 80052AE8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0536EC 80052AEC AFBF0014 */  sw    $ra, 0x14($sp)
/* 0536F0 80052AF0 AFB00010 */  sw    $s0, 0x10($sp)
/* 0536F4 80052AF4 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 0536F8 80052AF8 00808021 */   addu  $s0, $a0, $zero
/* 0536FC 80052AFC 92030018 */  lbu   $v1, 0x18($s0)
/* 053700 80052B00 00021400 */  sll   $v0, $v0, 0x10
/* 053704 80052B04 00021403 */  sra   $v0, $v0, 0x10
/* 053708 80052B08 00621826 */  xor   $v1, $v1, $v0
/* 05370C 80052B0C 2C620001 */  sltiu $v0, $v1, 1
/* 053710 80052B10 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053714 80052B14 8FB00010 */  lw    $s0, 0x10($sp)
/* 053718 80052B18 03E00008 */  jr    $ra
/* 05371C 80052B1C 27BD0018 */   addiu $sp, $sp, 0x18

PlayerIsCPU:
/* 053720 80052B20 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053724 80052B24 AFBF0010 */  sw    $ra, 0x10($sp)
/* 053728 80052B28 00042400 */  sll   $a0, $a0, 0x10
/* 05372C 80052B2C 0C014AA3 */  jal   GetPlayerStruct
/* 053730 80052B30 00042403 */   sra   $a0, $a0, 0x10
/* 053734 80052B34 94420006 */  lhu   $v0, 6($v0)
/* 053738 80052B38 8FBF0010 */  lw    $ra, 0x10($sp)
/* 05373C 80052B3C 30420001 */  andi  $v0, $v0, 1
/* 053740 80052B40 03E00008 */  jr    $ra
/* 053744 80052B44 27BD0018 */   addiu $sp, $sp, 0x18

AdjustPlayerCoins:
/* 053748 80052B48 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 05374C 80052B4C AFBF001C */  sw    $ra, 0x1c($sp)
/* 053750 80052B50 AFB00018 */  sw    $s0, 0x18($sp)
/* 053754 80052B54 0C014AA3 */  jal   GetPlayerStruct
/* 053758 80052B58 00A08021 */   addu  $s0, $a1, $zero
/* 05375C 80052B5C 00402021 */  addu  $a0, $v0, $zero
/* 053760 80052B60 94820008 */  lhu   $v0, 8($a0)
/* 053764 80052B64 00501021 */  addu  $v0, $v0, $s0
/* 053768 80052B68 A4820008 */  sh    $v0, 8($a0)
/* 05376C 80052B6C 00021400 */  sll   $v0, $v0, 0x10
/* 053770 80052B70 00021403 */  sra   $v0, $v0, 0x10
/* 053774 80052B74 284203E8 */  slti  $v0, $v0, 0x3e8
/* 053778 80052B78 14400002 */  bnez  $v0, .L80052B84
/* 05377C 80052B7C 240203E7 */   li    $v0, 999
/* 053780 80052B80 A4820008 */  sh    $v0, 8($a0)
.L80052B84:
/* 053784 80052B84 84820008 */  lh    $v0, 8($a0)
/* 053788 80052B88 04420001 */  bltzl $v0, .L80052B90
/* 05378C 80052B8C A4800008 */   sh    $zero, 8($a0)
.L80052B90:
/* 053790 80052B90 84830026 */  lh    $v1, 0x26($a0)
/* 053794 80052B94 84820008 */  lh    $v0, 8($a0)
/* 053798 80052B98 00402821 */  addu  $a1, $v0, $zero
/* 05379C 80052B9C 0043102A */  slt   $v0, $v0, $v1
/* 0537A0 80052BA0 50400001 */  beql  $v0, $zero, .L80052BA8
/* 0537A4 80052BA4 A4850026 */   sh    $a1, 0x26($a0)
.L80052BA8:
/* 0537A8 80052BA8 8FBF001C */  lw    $ra, 0x1c($sp)
/* 0537AC 80052BAC 8FB00018 */  lw    $s0, 0x18($sp)
/* 0537B0 80052BB0 03E00008 */  jr    $ra
/* 0537B4 80052BB4 27BD0020 */   addiu $sp, $sp, 0x20

PlayerHasCoins:
/* 0537B8 80052BB8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0537BC 80052BBC AFBF0014 */  sw    $ra, 0x14($sp)
/* 0537C0 80052BC0 AFB00010 */  sw    $s0, 0x10($sp)
/* 0537C4 80052BC4 0C014AA3 */  jal   GetPlayerStruct
/* 0537C8 80052BC8 00A08021 */   addu  $s0, $a1, $zero
/* 0537CC 80052BCC 84420008 */  lh    $v0, 8($v0)
/* 0537D0 80052BD0 0050102A */  slt   $v0, $v0, $s0
/* 0537D4 80052BD4 38420001 */  xori  $v0, $v0, 1
/* 0537D8 80052BD8 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0537DC 80052BDC 8FB00010 */  lw    $s0, 0x10($sp)
/* 0537E0 80052BE0 03E00008 */  jr    $ra
/* 0537E4 80052BE4 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80052BE8
/* 0537E8 80052BE8 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0537EC 80052BEC AFBF001C */  sw    $ra, 0x1c($sp)
/* 0537F0 80052BF0 AFB20018 */  sw    $s2, 0x18($sp)
/* 0537F4 80052BF4 AFB10014 */  sw    $s1, 0x14($sp)
/* 0537F8 80052BF8 AFB00010 */  sw    $s0, 0x10($sp)
/* 0537FC 80052BFC 00A08821 */  addu  $s1, $a1, $zero
/* 053800 80052C00 0C014AA3 */  jal   GetPlayerStruct
/* 053804 80052C04 00C09021 */   addu  $s2, $a2, $zero
/* 053808 80052C08 00408021 */  addu  $s0, $v0, $zero
/* 05380C 80052C0C 0C014AA3 */  jal   GetPlayerStruct
/* 053810 80052C10 2404FFFF */   li    $a0, -1
/* 053814 80052C14 16020005 */  bne   $s0, $v0, .L80052C2C
/* 053818 80052C18 00112C00 */   sll   $a1, $s1, 0x10
/* 05381C 80052C1C 8E040020 */  lw    $a0, 0x20($s0)
/* 053820 80052C20 00052C03 */  sra   $a1, $a1, 0x10
/* 053824 80052C24 0C00FA07 */  jal   func_8003E81C
/* 053828 80052C28 3246FFFF */   andi  $a2, $s2, 0xffff
.L80052C2C:
/* 05382C 80052C2C 8FBF001C */  lw    $ra, 0x1c($sp)
/* 053830 80052C30 8FB20018 */  lw    $s2, 0x18($sp)
/* 053834 80052C34 8FB10014 */  lw    $s1, 0x14($sp)
/* 053838 80052C38 8FB00010 */  lw    $s0, 0x10($sp)
/* 05383C 80052C3C 03E00008 */  jr    $ra
/* 053840 80052C40 27BD0020 */   addiu $sp, $sp, 0x20

glabel func_80052C44
/* 053844 80052C44 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 053848 80052C48 AFBF002C */  sw    $ra, 0x2c($sp)
/* 05384C 80052C4C AFB40028 */  sw    $s4, 0x28($sp)
/* 053850 80052C50 AFB30024 */  sw    $s3, 0x24($sp)
/* 053854 80052C54 AFB20020 */  sw    $s2, 0x20($sp)
/* 053858 80052C58 AFB1001C */  sw    $s1, 0x1c($sp)
/* 05385C 80052C5C AFB00018 */  sw    $s0, 0x18($sp)
/* 053860 80052C60 00A08821 */  addu  $s1, $a1, $zero
/* 053864 80052C64 00C09021 */  addu  $s2, $a2, $zero
/* 053868 80052C68 97B40042 */  lhu   $s4, 0x42($sp)
/* 05386C 80052C6C 0C014AA3 */  jal   GetPlayerStruct
/* 053870 80052C70 00E09821 */   addu  $s3, $a3, $zero
/* 053874 80052C74 00408021 */  addu  $s0, $v0, $zero
/* 053878 80052C78 0C014AA3 */  jal   GetPlayerStruct
/* 05387C 80052C7C 2404FFFF */   li    $a0, -1
/* 053880 80052C80 1602000A */  bne   $s0, $v0, .L80052CAC
/* 053884 80052C84 00112C00 */   sll   $a1, $s1, 0x10
/* 053888 80052C88 00123400 */  sll   $a2, $s2, 0x10
/* 05388C 80052C8C 00133C00 */  sll   $a3, $s3, 0x10
/* 053890 80052C90 3282FFFF */  andi  $v0, $s4, 0xffff
/* 053894 80052C94 AFA20010 */  sw    $v0, 0x10($sp)
/* 053898 80052C98 8E040020 */  lw    $a0, 0x20($s0)
/* 05389C 80052C9C 00052C03 */  sra   $a1, $a1, 0x10
/* 0538A0 80052CA0 00063403 */  sra   $a2, $a2, 0x10
/* 0538A4 80052CA4 0C00FA2E */  jal   func_8003E8B8
/* 0538A8 80052CA8 00073C03 */   sra   $a3, $a3, 0x10
.L80052CAC:
/* 0538AC 80052CAC 8FBF002C */  lw    $ra, 0x2c($sp)
/* 0538B0 80052CB0 8FB40028 */  lw    $s4, 0x28($sp)
/* 0538B4 80052CB4 8FB30024 */  lw    $s3, 0x24($sp)
/* 0538B8 80052CB8 8FB20020 */  lw    $s2, 0x20($sp)
/* 0538BC 80052CBC 8FB1001C */  lw    $s1, 0x1c($sp)
/* 0538C0 80052CC0 8FB00018 */  lw    $s0, 0x18($sp)
/* 0538C4 80052CC4 03E00008 */  jr    $ra
/* 0538C8 80052CC8 27BD0030 */   addiu $sp, $sp, 0x30

glabel func_80052CCC
/* 0538CC 80052CCC 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0538D0 80052CD0 AFBF0018 */  sw    $ra, 0x18($sp)
/* 0538D4 80052CD4 AFB10014 */  sw    $s1, 0x14($sp)
/* 0538D8 80052CD8 AFB00010 */  sw    $s0, 0x10($sp)
/* 0538DC 80052CDC 0C014AA3 */  jal   GetPlayerStruct
/* 0538E0 80052CE0 00A08021 */   addu  $s0, $a1, $zero
/* 0538E4 80052CE4 00408821 */  addu  $s1, $v0, $zero
/* 0538E8 80052CE8 A2300002 */  sb    $s0, 2($s1)
/* 0538EC 80052CEC 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 0538F0 80052CF0 2404002C */   li    $a0, 44
/* 0538F4 80052CF4 14400006 */  bnez  $v0, .L80052D10
/* 0538F8 80052CF8 320200FF */   andi  $v0, $s0, 0xff
/* 0538FC 80052CFC 3C01800C */  lui   $at, 0x800c
/* 053900 80052D00 00220821 */  addu  $at, $at, $v0
/* 053904 80052D04 902253E0 */  lbu   $v0, 0x53e0($at)
/* 053908 80052D08 08014B48 */  j     func_80052D20
/* 05390C 80052D0C A2220001 */   sb    $v0, 1($s1)

.L80052D10:
/* 053910 80052D10 3C01800C */  lui   $at, 0x800c
/* 053914 80052D14 00220821 */  addu  $at, $at, $v0
/* 053918 80052D18 902253E4 */  lbu   $v0, 0x53e4($at)
/* 05391C 80052D1C A2220001 */  sb    $v0, 1($s1)
glabel func_80052D20
/* 053920 80052D20 8FBF0018 */  lw    $ra, 0x18($sp)
/* 053924 80052D24 8FB10014 */  lw    $s1, 0x14($sp)
/* 053928 80052D28 8FB00010 */  lw    $s0, 0x10($sp)
/* 05392C 80052D2C 03E00008 */  jr    $ra
/* 053930 80052D30 27BD0020 */   addiu $sp, $sp, 0x20

D_80052D34:
/* 053934 80052D34 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 053938 80052D38 AFBF0014 */  sw    $ra, 0x14($sp)
/* 05393C 80052D3C AFB00010 */  sw    $s0, 0x10($sp)
/* 053940 80052D40 0C018CEA */  jal   func_800633A8
/* 053944 80052D44 F7B40018 */   sdc1  $f20, 0x18($sp)
/* 053948 80052D48 8C50008C */  lw    $s0, 0x8c($v0)
glabel func_80052D4C
.L80052D4C:
/* 05394C 80052D4C 0C018D6D */  jal   SleepVProcess
/* 053950 80052D50 00000000 */   nop   
/* 053954 80052D54 96030006 */  lhu   $v1, 6($s0)
/* 053958 80052D58 30620004 */  andi  $v0, $v1, 4
/* 05395C 80052D5C 1440FFFB */  bnez  $v0, .L80052D4C
/* 053960 80052D60 30620002 */   andi  $v0, $v1, 2
/* 053964 80052D64 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 053968 80052D68 4481A000 */  mtc1  $at, $f20
/* 05396C 80052D6C 14400008 */  bnez  $v0, .L80052D90
/* 053970 80052D70 00000000 */   nop   
/* 053974 80052D74 0C014ABA */  jal   func_80052AE8
/* 053978 80052D78 02002021 */   addu  $a0, $s0, $zero
/* 05397C 80052D7C 14400004 */  bnez  $v0, .L80052D90
/* 053980 80052D80 00000000 */   nop   
/* 053984 80052D84 3C013F33 */  li    $at, 0x3F330000 # 0.699219
/* 053988 80052D88 34213333 */  ori   $at, (0x3F333333 & 0xFFFF) # ori $at, $at, 0x3333
/* 05398C 80052D8C 4481A000 */  mtc1  $at, $f20
.L80052D90:
/* 053990 80052D90 8E040020 */  lw    $a0, 0x20($s0)
/* 053994 80052D94 4405A000 */  mfc1  $a1, $f20
/* 053998 80052D98 4406A000 */  mfc1  $a2, $f20
/* 05399C 80052D9C 4407A000 */  mfc1  $a3, $f20
/* 0539A0 80052DA0 00000000 */  nop   
/* 0539A4 80052DA4 0C028340 */  jal   func_800A0D00
/* 0539A8 80052DA8 24840024 */   addiu $a0, $a0, 0x24
/* 0539AC 80052DAC 08014B53 */  j     func_80052D4C
/* 0539B0 80052DB0 00000000 */   nop   

/* 0539B4 80052DB4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0539B8 80052DB8 8FB00010 */  lw    $s0, 0x10($sp)
/* 0539BC 80052DBC D7B40018 */  ldc1  $f20, 0x18($sp)
/* 0539C0 80052DC0 03E00008 */  jr    $ra
/* 0539C4 80052DC4 27BD0020 */   addiu $sp, $sp, 0x20

glabel func_80052DC8
/* 0539C8 80052DC8 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 0539CC 80052DCC AFBF0020 */  sw    $ra, 0x20($sp)
/* 0539D0 80052DD0 AFB3001C */  sw    $s3, 0x1c($sp)
/* 0539D4 80052DD4 AFB20018 */  sw    $s2, 0x18($sp)
/* 0539D8 80052DD8 AFB10014 */  sw    $s1, 0x14($sp)
/* 0539DC 80052DDC AFB00010 */  sw    $s0, 0x10($sp)
/* 0539E0 80052DE0 00A09821 */  addu  $s3, $a1, $zero
/* 0539E4 80052DE4 00809021 */  addu  $s2, $a0, $zero
/* 0539E8 80052DE8 00042400 */  sll   $a0, $a0, 0x10
/* 0539EC 80052DEC 00048C03 */  sra   $s1, $a0, 0x10
/* 0539F0 80052DF0 0C014AA3 */  jal   GetPlayerStruct
/* 0539F4 80052DF4 02202021 */   addu  $a0, $s1, $zero
/* 0539F8 80052DF8 00408021 */  addu  $s0, $v0, $zero
/* 0539FC 80052DFC A2120018 */  sb    $s2, 0x18($s0)
/* 053A00 80052E00 3C02800E */  lui   $v0, %hi(D_800E008C) # $v0, 0x800e
/* 053A04 80052E04 84428380 */  lh    $v0, %lo(D_800D8380)($v0)
/* 053A08 80052E08 1040000A */  beqz  $v0, .L80052E34
/* 053A0C 80052E0C 00000000 */   nop   
/* 053A10 80052E10 0C014AB3 */  jal   PlayerIsCurrent
/* 053A14 80052E14 02202021 */   addu  $a0, $s1, $zero
/* 053A18 80052E18 00021400 */  sll   $v0, $v0, 0x10
/* 053A1C 80052E1C 14400005 */  bnez  $v0, .L80052E34
/* 053A20 80052E20 00122400 */   sll   $a0, $s2, 0x10
/* 053A24 80052E24 0C014BDB */  jal   func_80052F6C
/* 053A28 80052E28 00042403 */   sra   $a0, $a0, 0x10
/* 053A2C 80052E2C 08014B8F */  j     func_80052E3C
/* 053A30 80052E30 304400FF */   andi  $a0, $v0, 0xff

.L80052E34:
/* 053A34 80052E34 92020004 */  lbu   $v0, 4($s0)
/* 053A38 80052E38 304400FF */  andi  $a0, $v0, 0xff
glabel func_80052E3C
/* 053A3C 80052E3C 0C00F6F8 */  jal   func_8003DBE0
/* 053A40 80052E40 02602821 */   addu  $a1, $s3, $zero
/* 053A44 80052E44 AE020020 */  sw    $v0, 0x20($s0)
/* 053A48 80052E48 3C048005 */  lui   $a0, %hi(D_80052D34) # $a0, 0x8005
/* 053A4C 80052E4C 24842D34 */  addiu $a0, %lo(D_80052D34) # addiu $a0, $a0, 0x2d34
/* 053A50 80052E50 24055000 */  li    $a1, 20480
/* 053A54 80052E54 00003021 */  addu  $a2, $zero, $zero
/* 053A58 80052E58 0C01770A */  jal   InitProcess
/* 053A5C 80052E5C 00003821 */   addu  $a3, $zero, $zero
/* 053A60 80052E60 AE02001C */  sw    $v0, 0x1c($s0)
/* 053A64 80052E64 AC50008C */  sw    $s0, %lo(D_800E008C)($v0)
/* 053A68 80052E68 8FBF0020 */  lw    $ra, 0x20($sp)
/* 053A6C 80052E6C 8FB3001C */  lw    $s3, 0x1c($sp)
/* 053A70 80052E70 8FB20018 */  lw    $s2, 0x18($sp)
/* 053A74 80052E74 8FB10014 */  lw    $s1, 0x14($sp)
/* 053A78 80052E78 8FB00010 */  lw    $s0, 0x10($sp)
/* 053A7C 80052E7C 03E00008 */  jr    $ra
/* 053A80 80052E80 27BD0028 */   addiu $sp, $sp, 0x28

glabel func_80052E84
/* 053A84 80052E84 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053A88 80052E88 AFBF0014 */  sw    $ra, 0x14($sp)
/* 053A8C 80052E8C AFB00010 */  sw    $s0, 0x10($sp)
/* 053A90 80052E90 00048400 */  sll   $s0, $a0, 0x10
/* 053A94 80052E94 00108403 */  sra   $s0, $s0, 0x10
/* 053A98 80052E98 0C014AA3 */  jal   GetPlayerStruct
/* 053A9C 80052E9C 02002021 */   addu  $a0, $s0, $zero
/* 053AA0 80052EA0 90420004 */  lbu   $v0, 4($v0)
/* 053AA4 80052EA4 00021080 */  sll   $v0, $v0, 2
/* 053AA8 80052EA8 3C05800C */  lui   $a1, 0x800c
/* 053AAC 80052EAC 00A22821 */  addu  $a1, $a1, $v0
/* 053AB0 80052EB0 8CA55490 */  lw    $a1, 0x5490($a1)
/* 053AB4 80052EB4 0C014B72 */  jal   func_80052DC8
/* 053AB8 80052EB8 02002021 */   addu  $a0, $s0, $zero
/* 053ABC 80052EBC 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053AC0 80052EC0 8FB00010 */  lw    $s0, 0x10($sp)
/* 053AC4 80052EC4 03E00008 */  jr    $ra
/* 053AC8 80052EC8 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80052ECC
/* 053ACC 80052ECC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053AD0 80052ED0 AFBF0014 */  sw    $ra, 0x14($sp)
/* 053AD4 80052ED4 AFB00010 */  sw    $s0, 0x10($sp)
/* 053AD8 80052ED8 00A08021 */  addu  $s0, $a1, $zero
/* 053ADC 80052EDC 00042400 */  sll   $a0, $a0, 0x10
/* 053AE0 80052EE0 0C014AA3 */  jal   GetPlayerStruct
/* 053AE4 80052EE4 00042403 */   sra   $a0, $a0, 0x10
/* 053AE8 80052EE8 8C440020 */  lw    $a0, 0x20($v0)
/* 053AEC 80052EEC 0C00F86F */  jal   func_8003E1BC
/* 053AF0 80052EF0 320500FF */   andi  $a1, $s0, 0xff
/* 053AF4 80052EF4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053AF8 80052EF8 8FB00010 */  lw    $s0, 0x10($sp)
/* 053AFC 80052EFC 03E00008 */  jr    $ra
/* 053B00 80052F00 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80052F04
/* 053B04 80052F04 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053B08 80052F08 AFBF0010 */  sw    $ra, 0x10($sp)
/* 053B0C 80052F0C 00042400 */  sll   $a0, $a0, 0x10
/* 053B10 80052F10 0C014AA3 */  jal   GetPlayerStruct
/* 053B14 80052F14 00042403 */   sra   $a0, $a0, 0x10
/* 053B18 80052F18 90420004 */  lbu   $v0, 4($v0)
/* 053B1C 80052F1C 3C01800C */  lui   $at, 0x800c
/* 053B20 80052F20 00220821 */  addu  $at, $at, $v0
/* 053B24 80052F24 902254A8 */  lbu   $v0, 0x54a8($at)
/* 053B28 80052F28 8FBF0010 */  lw    $ra, 0x10($sp)
/* 053B2C 80052F2C 03E00008 */  jr    $ra
/* 053B30 80052F30 27BD0018 */   addiu $sp, $sp, 0x18

/* 053B34 80052F34 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053B38 80052F38 AFBF0014 */  sw    $ra, 0x14($sp)
/* 053B3C 80052F3C AFB00010 */  sw    $s0, 0x10($sp)
/* 053B40 80052F40 00048400 */  sll   $s0, $a0, 0x10
/* 053B44 80052F44 00108403 */  sra   $s0, $s0, 0x10
/* 053B48 80052F48 0C014BC1 */  jal   func_80052F04
/* 053B4C 80052F4C 02002021 */   addu  $a0, $s0, $zero
/* 053B50 80052F50 02002021 */  addu  $a0, $s0, $zero
/* 053B54 80052F54 0C014BB3 */  jal   func_80052ECC
/* 053B58 80052F58 304500FF */   andi  $a1, $v0, 0xff
/* 053B5C 80052F5C 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053B60 80052F60 8FB00010 */  lw    $s0, 0x10($sp)
/* 053B64 80052F64 03E00008 */  jr    $ra
/* 053B68 80052F68 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80052F6C
/* 053B6C 80052F6C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053B70 80052F70 AFBF0010 */  sw    $ra, 0x10($sp)
/* 053B74 80052F74 00042400 */  sll   $a0, $a0, 0x10
/* 053B78 80052F78 0C014AA3 */  jal   GetPlayerStruct
/* 053B7C 80052F7C 00042403 */   sra   $a0, $a0, 0x10
/* 053B80 80052F80 90420004 */  lbu   $v0, 4($v0)
/* 053B84 80052F84 3C01800C */  lui   $at, 0x800c
/* 053B88 80052F88 00220821 */  addu  $at, $at, $v0
/* 053B8C 80052F8C 902254B0 */  lbu   $v0, 0x54b0($at)
/* 053B90 80052F90 8FBF0010 */  lw    $ra, 0x10($sp)
/* 053B94 80052F94 03E00008 */  jr    $ra
/* 053B98 80052F98 27BD0018 */   addiu $sp, $sp, 0x18

/* 053B9C 80052F9C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053BA0 80052FA0 AFBF0014 */  sw    $ra, 0x14($sp)
/* 053BA4 80052FA4 AFB00010 */  sw    $s0, 0x10($sp)
/* 053BA8 80052FA8 00048400 */  sll   $s0, $a0, 0x10
/* 053BAC 80052FAC 00108403 */  sra   $s0, $s0, 0x10
/* 053BB0 80052FB0 0C014BDB */  jal   func_80052F6C
/* 053BB4 80052FB4 02002021 */   addu  $a0, $s0, $zero
/* 053BB8 80052FB8 02002021 */  addu  $a0, $s0, $zero
/* 053BBC 80052FBC 0C014BB3 */  jal   func_80052ECC
/* 053BC0 80052FC0 304500FF */   andi  $a1, $v0, 0xff
/* 053BC4 80052FC4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053BC8 80052FC8 8FB00010 */  lw    $s0, 0x10($sp)
/* 053BCC 80052FCC 03E00008 */  jr    $ra
/* 053BD0 80052FD0 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80052FD4
/* 053BD4 80052FD4 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053BD8 80052FD8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 053BDC 80052FDC AFB00010 */  sw    $s0, 0x10($sp)
/* 053BE0 80052FE0 00042400 */  sll   $a0, $a0, 0x10
/* 053BE4 80052FE4 0C014AA3 */  jal   GetPlayerStruct
/* 053BE8 80052FE8 00042403 */   sra   $a0, $a0, 0x10
/* 053BEC 80052FEC 00408021 */  addu  $s0, $v0, $zero
/* 053BF0 80052FF0 8E020020 */  lw    $v0, 0x20($s0)
/* 053BF4 80052FF4 10400006 */  beqz  $v0, .L80053010
/* 053BF8 80052FF8 00000000 */   nop   
/* 053BFC 80052FFC 0C017764 */  jal   EndProcess
/* 053C00 80053000 8E04001C */   lw    $a0, 0x1c($s0)
/* 053C04 80053004 0C00F9A5 */  jal   func_8003E694
/* 053C08 80053008 8E040020 */   lw    $a0, 0x20($s0)
/* 053C0C 8005300C AE000020 */  sw    $zero, 0x20($s0)
.L80053010:
/* 053C10 80053010 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053C14 80053014 8FB00010 */  lw    $s0, 0x10($sp)
/* 053C18 80053018 03E00008 */  jr    $ra
/* 053C1C 8005301C 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80053020
/* 053C20 80053020 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 053C24 80053024 AFBF0014 */  sw    $ra, 0x14($sp)
/* 053C28 80053028 AFB00010 */  sw    $s0, 0x10($sp)
/* 053C2C 8005302C 00008021 */  addu  $s0, $zero, $zero
.L80053030:
/* 053C30 80053030 0C014AA3 */  jal   GetPlayerStruct
/* 053C34 80053034 02002021 */   addu  $a0, $s0, $zero
/* 053C38 80053038 AC400020 */  sw    $zero, 0x20($v0)
/* 053C3C 8005303C 26100001 */  addiu $s0, $s0, 1
/* 053C40 80053040 2A020004 */  slti  $v0, $s0, 4
/* 053C44 80053044 1440FFFA */  bnez  $v0, .L80053030
/* 053C48 80053048 00000000 */   nop   
/* 053C4C 8005304C 3C01800E */  lui   $at, %hi(D_800D8380) # $at, 0x800e
/* 053C50 80053050 A4208380 */  sh    $zero, %lo(D_800D8380)($at)
/* 053C54 80053054 8FBF0014 */  lw    $ra, 0x14($sp)
/* 053C58 80053058 8FB00010 */  lw    $s0, 0x10($sp)
/* 053C5C 8005305C 03E00008 */  jr    $ra
/* 053C60 80053060 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80053064
/* 053C64 80053064 24020001 */  li    $v0, 1
/* 053C68 80053068 3C01800E */  lui   $at, 0x800e
/* 053C6C 8005306C 03E00008 */  jr    $ra
/* 053C70 80053070 A4228380 */   sh    $v0, -0x7c80($at)

glabel func_80053074
/* 053C74 80053074 03E00008 */  jr    $ra
/* 053C78 80053078 00000000 */   nop   

/* 053C7C 8005307C 00000000 */  nop   
