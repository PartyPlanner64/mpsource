# assembler directives
.set noat      # allow manual use of $1
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

glabel func_8005021C
/* 050E1C 8005021C 27BDFFE0 */  addiu $29, $29, -0x20
/* 050E20 80050220 AFBF0014 */  sw    $31, 0x14($29)
/* 050E24 80050224 AFB00010 */  sw    $16, 0x10($29)
/* 050E28 80050228 F7B40018 */  sdc1  $f20, 0x18($29)
/* 050E2C 8005022C 0C005D63 */  jal   GetRandomByte
/* 050E30 80050230 46006506 */   mov.s $f20, $f12
/* 050E34 80050234 0C005D63 */  jal   GetRandomByte
/* 050E38 80050238 00408021 */   addu  $16, $2, $0
/* 050E3C 8005023C 321000FF */  andi  $16, $16, 0xff
/* 050E40 80050240 00108200 */  sll   $16, $16, 8
/* 050E44 80050244 304200FF */  andi  $2, $2, 0xff
/* 050E48 80050248 00501025 */  or    $2, $2, $16
/* 050E4C 8005024C 44820000 */  mtc1  $2, $f0
/* 050E50 80050250 00000000 */  nop
/* 050E54 80050254 46800020 */  cvt.s.w $f0, $f0
/* 050E58 80050258 3C014780 */  li    $1, 0x47800000 # 65536.000000
/* 050E5C 8005025C 44811000 */  mtc1  $1, $f2
/* 050E60 80050260 00000000 */  nop
/* 050E64 80050264 46020003 */  div.s $f0, $f0, $f2
/* 050E68 80050268 46140002 */  mul.s $f0, $f0, $f20
/* 050E6C 8005026C 4600008D */  trunc.w.s $f2, $f0
/* 050E70 80050270 44021000 */  mfc1  $2, $f2
/* 050E74 80050274 8FBF0014 */  lw    $31, 0x14($29)
/* 050E78 80050278 8FB00010 */  lw    $16, 0x10($29)
/* 050E7C 8005027C D7B40018 */  ldc1  $f20, 0x18($29)
/* 050E80 80050280 03E00008 */  jr    $31
/* 050E84 80050284 27BD0020 */   addiu $29, $29, 0x20

.set at
.set reorder