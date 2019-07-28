# DK's Jungle Adventure board
# Overlay 54

.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

.section .text, "ax"

# 800F65E0
ov54_main:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $a0, %hi(ov54_overlaycalls)
  addiu $a0, $a0, %lo(ov54_overlaycalls)
  lui   $a1, %hi(D_800C597A)
  jal   ExecBoardScene
   lh    $a1, %lo(D_800C597A)($a1)
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18
  NOP
  NOP

ov54_get_next_toad_index:
  lui   $v0, %hi(D_800ED5CA)
  addiu $v0, $v0, %lo(D_800ED5CA)
  lh    $v1, 0($v0)
  sll   $v1, $v1, 1
  addu  $v0, $v0, $v1
  lh    $v0, 2($v0) # get next toad index?
  sll   $v0, $v0, 1
  lui   $at, %hi(ov54_toad_space_indices)
  addu  $at, $at, $v0
  jr $ra
   lh    $v0, %lo(ov54_toad_space_indices)($at)

ov54_func_800F663C:
  addiu $sp, $sp, -0x30
  sw    $ra, 0x28($sp)
  sw    $s5, 0x24($sp)
  sw    $s4, 0x20($sp)
  sw    $s3, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $s5, %hi(D_800ED5C0)
  addiu $s5, $s5, %lo(D_800ED5C0)
  addu  $s1, $zero, $zero
  lui $s4, 0x2492
  ori $s4, $s4, 0x4925
  lui   $s3, %hi(ov54_func_800F663C_data1)
  addiu $s3, $s3, %lo(ov54_func_800F663C_data1)
  lui   $s2, %hi(ov54_func_800F663C_data0)
  addiu $s2, $s2, %lo(ov54_func_800F663C_data0)
.ov54_L800F6680:
  jal   GetRandomByte
  NOP
  andi  $v0, $v0, 0xFF
  multu $v0, $s4
  mfhi  $a0
  subu  $v1, $v0, $a0
  srl   $v1, $v1, 1
  addu  $a0, $a0, $v1
  srl   $a0, $a0, 2
  sll   $v1, $a0, 3
  subu  $v1, $v1, $a0
  subu  $v0, $v0, $v1
  jal   GetRandomByte
   andi  $s0, $v0, 0xFF
  andi  $v0, $v0, 0xFF
  multu $v0, $s4
  mfhi  $a0
  subu  $v1, $v0, $a0
  srl   $v1, $v1, 1
  addu  $a0, $a0, $v1
  srl   $a0, $a0, 2
  sll   $v1, $a0, 3
  subu  $v1, $v1, $a0
  subu  $v0, $v0, $v1
  andi  $a0, $v0, 0xff
  beq   $s0, $a0, .ov54_L800F6740
   sll   $v1, $a0, 1
  addu  $a3, $v1, $s3
  lh    $v0, 0($a3)
  slt   $v0, $s0, $v0
  bnel $v0, $zero, .ov54_L800F6744
   addiu $s1, $s1, 1
  sll   $a1, $s0, 1
  addu  $a2, $a1, $s3
  lh    $v0, 0($a2)
  slt   $v0, $a0, $v0
  bnel $v0, $zero, .ov54_L800F6744
   addiu $s1, $s1, 1
  addu  $a0, $a1, $s2
  lh    $a1, 0($a0)
  addu  $v1, $v1, $s2
  lhu   $v0, 0($v1)
  sh    $v0, 0($a0)
  sh    $a1, 0($v1)
  lh    $a1, 0($a2)
  lhu   $v0, 0($a3)
  sh    $v0, 0($a2)
  sh    $a1, 0($a3)
.ov54_L800F6740:
  addiu $s1, $s1, 1
.ov54_L800F6744:
  slti  $v0, $s1, 0x1e
  bne  $v0, $zero, .ov54_L800F6680
   NOP
  addu  $s1, $zero, $zero
  lui   $a0, %hi(ov54_func_800F663C_data0)
  addiu $a0, $a0, %lo(ov54_func_800F663C_data0)
  sll   $v0, $s1, 1
.ov54_L800F6760:
  addu  $v1, $v0, $s5
  addu  $v0, $v0, $a0
  lhu   $v0, 0($v0)
  sh    $v0, 0xc($v1)
  addiu $s1, $s1, 1
  slti  $v0, $s1, 7
  bne  $v0, $zero, .ov54_L800F6760
   sll   $v0, $s1, 1
  lw    $ra, 0x28($sp)
  lw    $s5, 0x24($sp)
  lw    $s4, 0x20($sp)
  lw    $s3, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x30

ov54_func_800F67A4:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $v0, %hi(D_800ED5CA)
  lhu   $v0, %lo(D_800ED5CA)($v0)
  addiu $v0, $v0, 1
  lui   $at, %hi(D_800ED5CA)
  sh    $v0, %lo(D_800ED5CA)($at)
  sll   $v0, $v0, 0x10
  sra   $v0, $v0, 0x10
  slti  $v0, $v0, 7
  bne  $v0, $zero, .ov54_L800F6820
   NOP
  lui   $s0, %hi(D_800ED5D8)
  lh    $s0, %lo(D_800ED5D8)($s0)
  lui   $at, %hi(D_800ED5CA)
  sh    $zero, %lo(D_800ED5CA)($at)
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 68
  jal   ov54_func_800F663C
   NOP
  lui   $v1, %hi(D_800ED5CC)
  lh    $v1, %lo(D_800ED5CC)($v1)
  bne   $s0, $v1, .ov54_L800F6820
   NOP
  lui   $v0, %hi(D_800ED5D8)
  lhu   $v0, %lo(D_800ED5D8)($v0)
  lui   $at, %hi(D_800ED5CC)
  sh    $v0, %lo(D_800ED5CC)($at)
  lui   $at, %hi(D_800ED5D8)
  sh    $v1, %lo(D_800ED5D8)($at)
.ov54_L800F6820:
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

# Ensures star space shows a star, past stars are chance time
ov54_draw_star_space_state:
  addiu $sp, $sp, -0x30
  sw    $ra, 0x2c($sp)
  sw    $s4, 0x28($sp)
  sw    $s3, 0x24($sp)
  sw    $s2, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  lui   $s2, %hi(D_800ED5C0)
  addiu $s2, $s2, %lo(D_800ED5C0)
  addu  $s1, $zero, $zero
  lui   $s4, %hi(ov54_star_space_indices)
  addiu $s4, $s4, %lo(ov54_star_space_indices)
  lui   $s3, %hi(ov54_data_mystery_40s_list)
  addiu $s3, $s3, %lo(ov54_data_mystery_40s_list)
  sll   $s0, $s1, 1
.ov54_L800F686C:
  addu  $v0, $s0, $s4
  lh    $a0, 0($v0)
  jal   SetSpaceType
   addiu    $a1, $zero, 1
  addu  $s0, $s0, $s3
  lh    $a0, 0($s0)
  jal   SetBoardFeatureEnabled
   addiu $s1, $s1, 1
  slti  $v0, $s1, 7
  bnel $v0, $zero, .ov54_L800F686C
   sll   $s0, $s1, 1
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 68
  bne  $v0, $zero, .ov54_L800F68AC
   addiu    $s0, $zero, 7
  lh    $s0, 0xa($s2)
.ov54_L800F68AC:
  blez  $s0, .ov54_L800F68EC
   addu  $s1, $zero, $zero
  lui   $s3, %hi(ov54_star_space_indices)
  addiu $s3, $s3, %lo(ov54_star_space_indices)
  sll   $v0, $s1, 1
.ov54_L800F68C0:
  addu  $v0, $v0, $s2
  lh    $v0, 0xc($v0)
  sll   $v0, $v0, 1
  addu  $v0, $v0, $s3
  lh    $a0, 0($v0)
  jal   SetSpaceType
   addiu    $a1, $zero, 6 # Chance
  addiu $s1, $s1, 1
  slt   $v0, $s1, $s0
  bne  $v0, $zero, .ov54_L800F68C0
   sll   $v0, $s1, 1
.ov54_L800F68EC:
  lh    $v0, 0xa($s2)
  sll   $v0, $v0, 1
  addu  $v0, $v0, $s2
  lh    $v0, 0xc($v0)
  sll   $v0, $v0, 1
  lui   $a0, %hi(ov54_star_space_indices)
  addu  $a0, $a0, $v0
  lh    $a0, %lo(ov54_star_space_indices)($a0)
  jal   SetSpaceType
   addiu    $a1, $zero, 5 # Star
  lh    $v0, 0xa($s2)
  sll   $v0, $v0, 1
  addu  $v0, $v0, $s2
  lh    $v0, 0xc($v0)
  sll   $v0, $v0, 1
  lui   $a0, %hi(ov54_data_mystery_40s_list)
  addu  $a0, $a0, $v0
  jal   SetBoardFeatureDisabled
   lh    $a0, %lo(ov54_data_mystery_40s_list)($a0)
  lw    $ra, 0x2c($sp)
  lw    $s4, 0x28($sp)
  lw    $s3, 0x24($sp)
  lw    $s2, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x30

# $a0: current player space
ov54_star_space_event_inner:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  lui   $s1, %hi(D_800ED5C0)
  addiu $s1, $s1, %lo(D_800ED5C0)
  addu  $s0, $zero, $zero
  lui   $a1, %hi(ov54_star_space_indices)
  addiu $a1, $a1, %lo(ov54_star_space_indices)
  sll   $a0, $a0, 0x10
  sra   $a0, $a0, 0x10
  lui   $a2, %hi(ov54_data_mystery_40s_list)
  addiu $a2, $a2, %lo(ov54_data_mystery_40s_list)
  sll   $v1, $s0, 1
.ov54_L800F6990:
  addu  $v0, $v1, $a1
  lh    $v0, 0($v0)
  bnel  $a0, $v0, .ov54_L800F6A14
   addiu $s0, $s0, 1
  lh    $v0, 0xa($s1)
  sll   $v0, $v0, 1
  addu  $v0, $v0, $s1
  lh    $v0, 0xc($v0)
  bne   $s0, $v0, .ov54_L800F69C8
   addu  $v0, $v1, $a2
  lhu   $v0, 0($v0)
  sh    $v0, 0x1a($s1)
  j     .ov54_L800F6$a24
   addiu    $v0, $zero, 1
.ov54_L800F69C8:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 68
  bne  $v0, $zero, .ov54_L800F69DC
   addiu    $a0, $zero, 7
  lh    $a0, 0xa($s1)
.ov54_L800F69DC:
  blez  $a0, .ov54_L800F6$a20
   addu  $v1, $zero, $zero
  sll   $v0, $v1, 1
.ov54_L800F69E8:
  addu  $v0, $v0, $s1
  lh    $v0, 0xc($v0)
  bne   $s0, $v0, .ov54_L800F6$a00
   addiu $v1, $v1, 1
  j     .ov54_L800F6$a24
   addiu    $v0, $zero, 2
.ov54_L800F6$a00:
  slt   $v0, $v1, $a0
  bne  $v0, $zero, .ov54_L800F69E8
   sll   $v0, $v1, 1
  j     .ov54_L800F6$a24
   addu  $v0, $zero, $zero
.ov54_L800F6A14:
  slti  $v0, $s0, 7
  bne  $v0, $zero, .ov54_L800F6990
   sll   $v1, $s0, 1
.ov54_L800F6$a20:
  addu  $v0, $zero, $zero
.ov54_L800F6$a24:
  lw    $ra, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_show_next_star_spot_process:
  addiu $sp, $sp, -0x50
  sw    $ra, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  sdc1  $f30, 0x48($sp)
  sdc1  $f28, 0x40($sp)
  sdc1  $f26, 0x38($sp)
  sdc1  $f24, 0x30($sp)
  sdc1  $f22, 0x28($sp)
  jal   0x800633A8
   sdc1  $f20, 0x20($sp)
  lw    $s0, 0x8c($v0)
  jal   PlaySound
   addiu    $a0, $zero, 109
  addiu    $a0, $zero, 64
  jal   0x8003DBE0
   addu  $a1, $zero, $zero
  addu  $s1, $v0, $zero
  lhu   $v0, 0xa($s1)
  ori   $v0, $v0, 4
  sh    $v0, 0xa($s1)
  jal   0x8004CDCC
   addu  $a0, $s1, $zero
  addiu $a0, $s1, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $s0, 4
  lui    $at, 0x43FA # 500.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x30($s1)
  addu  $a0, $s1, $zero
  jal   0x80042728
   addu  $a1, $zero, $zero
  addu  $s2, $v0, $zero
  mtc1  $zero, $f20
  addu  $s0, $zero, $zero
  lui   $at, 0x3ECC
  ori   $at, $at, 0xCCCD
  mtc1  $at, $f22
.ov54_L800F6AD8:
  mfc1  $a1, $f20
  mfc1  $a2, $f20
  mfc1  $a3, $f20
  NOP
  jal   0x800A0D00
   addiu $a0, $s1, 0x24
  jal   SleepVProcess
   ADD.S $f20, $f20, $f22
  addiu $s0, $s0, 1
  slti  $v0, $s0, 6
  bne  $v0, $zero, .ov54_L800F6AD8
   NOP
  addu  $s0, $zero, $zero
  lui   $at, 0x3ECC
  ori   $at, $at, 0xCCCD
  mtc1  $at, $f22
.ov54_L800F6B18:
  mfc1  $a1, $f20
  mfc1  $a2, $f20
  mfc1  $a3, $f20
  NOP
  jal   0x800A0D00
   addiu $a0, $s1, 0x24
  jal   SleepVProcess
   SUB.S $f20, $f20, $f22
  addiu $s0, $s0, 1
  slti  $v0, $s0, 3
  bne  $v0, $zero, .ov54_L800F6B18
   NOP
  jal   SleepProcess
   addiu    $a0, $zero, 30
  jal   PlaySound
   addiu    $a0, $zero, 68
  mtc1  $zero, $f22
  lui   $at, 0x41A0 # 20.000000
  mtc1  $at, $f30
  lui   $at, 0x3CA3
  ori $at, $at, 0xd70a
  mtc1  $at, $f28
  mtc1  $zero, $f26
  lui   $at, 0x40C0 # 6.000000
  mtc1  $at, $f24
.ov54_L800F6B7C:
  lw    $v0, 0x3c($s1)
  lw    $v0, 0x40($v0)
  lh    $v0, 0($v0)
  sll   $a0, $v0, 1
  addu  $a0, $a0, $v0
  sll   $a0, $a0, 6
  lui   $v0, %hi(D_800F2B7C)
  lw    $v0, %lo(D_800F2B7C)($v0)  # gets a pointer
  addu  $a0, $a0, $v0
  mfc1  $a1, $f22
  NOP
  jal   0x800A40D0
   addiu $a0, $a0, 0x7c
  SUB.S $f20, $f20, $f28
  C.LT.S $f20, $f26
  NOP
  NOP
  bc1t  .ov54_L800F6BF8
   ADD.S $f22, $f22, $f30
  mfc1  $a1, $f20
  mfc1  $a2, $f20
  mfc1  $a3, $f20
  NOP
  jal   0x800A0D00
   addiu $a0, $s1, 0x24
  lwc1  $f0, 0x30($s1)
  SUB.S $f0, $f0, $f24
  jal   SleepVProcess
   swc1  $f0, 0x30($s1)
  j     .ov54_L800F6B7C
   NOP
.ov54_L800F6BF8:
  jal   0x800427D4
   addu  $a0, $s2, $zero
  jal   SleepProcess
   addiu    $a0, $zero, 30
  jal   0x8003E694
   addu  $a0, $s1, $zero
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  ldc1  $f30, 0x48($sp)
  ldc1  $f28, 0x40($sp)
  ldc1  $f26, 0x38($sp)
  ldc1  $f24, 0x30($sp)
  ldc1  $f22, 0x28($sp)
  ldc1  $f20, 0x20($sp)
  jr $ra
   addiu $sp, $sp, 0x50

ov54_show_next_star_spot_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s0, $a0, $zero
  lw    $v0, 0($s0)
  lui   $at, 0x41A0 # 20.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x34($v0)
  lui   $at, 0xC040 # -3.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x38($v0)
  lw    $a0, 0($s0)
  addu  $a1, $zero, $zero
  jal   0x8003E81C
   addu  $a2, $zero, $zero
  jal   SleepProcess
   addiu    $a0, $zero, 3
.ov54_L800F6C94:
  lw    $a0, 0($s0)
  jal   0x8003E940
   NOP
  andi  $v0, $v0, 0xffff
  bne  $v0, $zero, .ov54_L800F6CBC
   addiu    $a1, $zero, -1
  jal   SleepVProcess
   NOP
  j     .ov54_L800F6C94
   NOP
.ov54_L800F6CBC:
  lw    $a0, 0($s0)
  jal   0x8003E81C
   addiu    $a2, $zero, 2
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_show_next_star_spot:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $s2, %hi(D_800ED5C0)
  addiu $s2, $s2, %lo(D_800ED5C0)
  jal   0x80060128
   addiu    $a0, $zero, 43
  lui   $a0, %hi(ov54_data_star_related_800F9920)
  jal   0x80048224
   addiu $a0, $a0, %lo(ov54_data_star_related_800F9920)
  addu  $s0, $v0, $zero
  addiu    $a0, $zero, 2
  jal   0x80072644
   addiu    $a1, $zero, 16
.ov54_L800F6D18:
  jal   0x80072718
   NOP
  beq  $v0, $zero, .ov54_L800F6D38
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F6D18
   NOP
.ov54_L800F6D38:
  jal   0x8004A520
   NOP
  lui   $at, 0x4040  # 3.000000
  mtc1  $at, $f12
  jal   0x8004B5C4
   NOP
  jal   ov54_show_next_star_spot_inner
   addu  $a0, $s0, $zero
  lh    $v0, 0xa($s2)
  bne  $v0, $zero, .ov54_L800F6D78
   addiu    $a1, $zero, 1258
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 68
  bnel $v0, $zero, .ov54_L800F6D78
   addiu    $a1, $zero, 1258 # "Let me show you where to find the next Star."
  addiu    $a1, $zero, 1256 # "Let me show you where to find the first Star."
.ov54_L800F6D78:
  lh    $a0, 8($s0)
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  lh    $a0, 8($s0)
  jal   0x80071C8C
   addiu    $a1, $zero, 1
  jal   PlaySound
   addiu    $a0, $zero, 1125
  lh    $a0, 8($s0)
  jal   WaitForTextConfirmation
   NOP
  lh    $a0, 8($s0)
  jal   0x80071E80
   addiu    $a1, $zero, 1
  lh    $a0, 8($s0)
  jal   0x8006EB40
   NOP
  lh    $v0, 0xa($s2)
  sll   $v0, $v0, 1
  addu  $v0, $v0, $s2
  lh    $v0, 0xc($v0)
  sll   $v0, $v0, 1
  lui   $a0, %hi(ov54_toad_space_indices)
  addu  $a0, $a0, $v0
  jal   GetSpaceData
   lh    $a0, %lo(ov54_toad_space_indices)($a0)
  addu  $s1, $v0, $zero
  jal   0x8004B5DC
   addiu $a0, $s1, 4
  lui    $at, 0x40A0 # 5.000000
  mtc1  $at, $f12
  jal   0x8004B838
   NOP
  jal   SleepProcess
   addiu    $a0, $zero, 5
.ov54_L800F6E08:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F6E28
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F6E08
   NOP
.ov54_L800F6E28:
  jal   SleepProcess
   addiu    $a0, $zero, 5
  lui   $a0, %hi(ov54_show_next_star_spot_process)
  addiu $a0, $a0, %lo(ov54_show_next_star_spot_process)
  addiu    $a1, $zero, 18432
  addu  $a2, $zero, $zero
  jal   InitProcess
   addu  $a3, $zero, $zero
  sw    $s1, 0x8c($v0)
  jal   SleepProcess
   addiu    $a0, $zero, 30
  lh    $v0, 0xa($s2)
  bne  $v0, $zero, .ov54_L800F6E74
   addiu    $a1, $zero, 1259
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 68
  bnel $v0, $zero, .ov54_L800F6E74
   addiu    $a1, $zero, 1259 # "This is the star spot. Get the star by giving Toad 20 coins"
  addiu    $a1, $zero, 1257 # same?: "This is the star spot. Get the star by giving Toad 20 coins"
.ov54_L800F6E74:
  lh    $a0, 8($s0)
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  lh    $a0, 8($s0)
  jal   0x80071C8C
   addiu    $a1, $zero, 1
  lh    $a0, 8($s0)
  jal   WaitForTextConfirmation
   NOP
  lh    $a0, 8($s0)
  jal   0x80071E80
   addiu    $a1, $zero, 1
  jal   0x800601D4
   addiu    $a0, $zero, 90
  jal   SleepProcess
   addiu    $a0, $zero, 30
  addiu    $a0, $zero, 2
  jal   0x800726AC
   addiu    $a1, $zero, 16
  jal   SleepProcess
   addiu    $a0, $zero, 17
  jal   0x8004847C
   addu  $a0, $s0, $zero
  jal   0x80056AF4
   NOP
  jal   0x8005DFB8
   addiu    $a0, $zero, 1
  jal   0x8005E3A8
   NOP
  jal   SleepVProcess
   NOP
  lw    $ra, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_overlaycall0:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $at, %hi(D_800ED5C2)
  sh    $zero, %lo(D_800ED5C2)($at)
  addiu    $a0, $zero, 10 # max_objects
  jal   func_8005CF30
   addu  $a1, $zero, $zero # max_processes
  addiu    $a0, $zero, 53
  addu  $a1, $zero, $zero
  jal   0x8005E044
   addiu    $a2, $zero, 146
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_overlaycall1:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, 10
  jal   func_8005CF30
   addu  $a1, $zero, $zero
# Set players at starting chain
  addu  $a0, $zero, $zero
  addu  $a1, $zero, $zero
  jal   SetPlayerOntoChain
   addu  $a2, $zero, $zero
  addiu    $a0, $zero, 1
  addu  $a1, $zero, $zero
  jal   SetPlayerOntoChain
   addu  $a2, $zero, $zero
  addiu    $a0, $zero, 2
  addu  $a1, $zero, $zero
  jal   SetPlayerOntoChain
   addu  $a2, $zero, $zero
  addiu    $a0, $zero, 3
  addu  $a1, $zero, $zero
  jal   SetPlayerOntoChain
   addu  $a2, $zero, $zero
  lui   $v1, %hi(D_800ED5C0)
  lh    $v1, %lo(D_800ED5C0)($v1)
  beq  $v1, $zero, .ov54_L800F6FB8
   addiu    $v0, $zero, 1
  beq   $v1, $v0, .ov54_L800F6FD8
   NOP
  j     .ov54_L800F6FEC
   NOP
.ov54_L800F6FB8:
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 70
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 71
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 73
  j     .ov54_L800F6FE4
   addiu    $a0, $zero, 75
.ov54_L800F6FD8:
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 71
  addiu    $a0, $zero, 73
.ov54_L800F6FE4:
  jal   SetBoardFeatureEnabled
   NOP
.ov54_L800F6FEC:
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 67
  jal   ov54_func_800F663C
   NOP
  lui   $v0, %hi(D_800ED154)
  addiu $v0, $v0, %lo(D_800ED154)
  sh    $zero, 0($v0)
  sh    $zero, 2($v0)
  sh    $zero, 4($v0)
  jal   0x8005DFB8
   addiu    $a0, $zero, 1
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

# called from multiple places
ov54_setup_routine:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  addiu    $a0, $zero, 80
  jal   func_8005CF30
   addiu    $a1, $zero, 40
  jal   0x80060088
   addu  $s1, $zero, $zero
  jal   0x80023448
   addiu    $a0, $zero, 1
  addu  $a0, $zero, $zero
  addiu    $a1, $zero, 120
  addiu    $a2, $zero, 120
  jal   0x800234B8
   addiu    $a3, $zero, 120
  addiu    $a0, $zero, 1
  addiu    $a1, $zero, 64
  addiu    $a2, $zero, 64
  jal   0x800234B8
   addiu    $a3, $zero, 96
  lui   $a1, 0xc2c8
  lui   $a2, 0x42c8
  lui   $a3, 0x4396
  jal   0x80023504
   addiu    $a0, $zero, 1
  addu  $a0, $zero, $zero
  addiu    $a1, $zero, 69 # DK board file index
  addiu    $a2, $zero, 4
  jal   0x80056A08 # setup board?
   addu  $a3, $zero, $zero
  jal   0x80052E84 # reset animations for characters?
   addu  $a0, $zero, $zero
  jal   0x80052E84
   addiu    $a0, $zero, 1
  jal   0x80052E84
   addiu    $a0, $zero, 2
  jal   0x80052E84
   addiu    $a0, $zero, 3
.ov54_L800F70C0:
  jal   GetPlayerStruct
   addu  $a0, $s1, $zero
  addu  $s0, $v0, $zero
  lw    $a0, 0x20($s0)
  jal   0x8003E174
   addiu $s1, $s1, 1
  lw    $v1, 0x20($s0)
  lhu   $v0, 0xa($v1)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($v1)
  slti  $v0, $s1, 4
  bne  $v0, $zero, .ov54_L800F70C0
   NOP
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 78
  beq  $v0, $zero, .ov54_L800F7114
   NOP
  jal   SetBoardFeatureDisabled
   addiu    $a0, $zero, 78
  jal   ov54_func_800F67A4
   NOP
.ov54_L800F7114:
  jal   ov54_draw_star_space_state
   NOP
  jal   ov54_draw_toads_outer
   NOP
  jal   ov54_draw_thwomps_outer
   NOP
  jal   ov54_draw_20_coin_gate_outer
   NOP
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 14
  bne  $v0, $zero, .ov54_L800F714C
   NOP
  jal   ov54_koopa_draw_outer
   NOP
.ov54_L800F714C:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 15
  bne  $v0, $zero, .ov54_L800F7164
   NOP
  jal   ov54_boo_draw_outer
   NOP
.ov54_L800F7164:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 13
  bne  $v0, $zero, .ov54_L800F717C
   NOP
  jal   ov54_bowser_draw_outer
   NOP
.ov54_L800F717C:
  lw    $ra, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_overlaycall2:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   0x80060128
   addiu $a0, $zero, 8
  jal   func_8001D240
   addiu $a0, $zero, 2
  jal   ov54_setup_routine
   NOP
  lui   $a0, %hi(ov54_main_event_table)
  jal   EventTableHydrate
   addiu $a0, $a0, %lo(ov54_main_event_table)
  jal   IsBoardFeatureDisabled
   addiu $a0, $zero, 14
  bne  $v0, $zero, .ov54_L800F71D8
   NOP
  lui   $a0, %hi(ov54_koopa_event_table)
  jal   EventTableHydrate
   addiu $a0, $a0, %lo(ov54_koopa_event_table)
.ov54_L800F71D8:
  jal   IsBoardFeatureDisabled
   addiu $a0, $zero, 15
  bne  $v0, $zero, .ov54_L800F71F4
   NOP
  lui   $a0, %hi(ov54_boo_event_table)
  jal   EventTableHydrate
   addiu $a0, $a0, %lo(ov54_boo_event_table)
.ov54_L800F71F4:
  jal   IsBoardFeatureDisabled
   addiu $a0, $zero, 13
  bne  $v0, $zero, .ov54_L800F7210
   NOP
  lui   $a0, %hi(ov54_bowser_event_table)
  jal   EventTableHydrate
   addiu $a0, $a0, %lo(ov54_bowser_event_table)
.ov54_L800F7210:
  jal   0x800584F0
   addu  $a0, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_overlaycall3:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   func_8001D240
   addiu $a0, $zero, 1
  jal   ov54_setup_routine
   NOP
  jal   0x800584F0
   addiu $a0, $zero, 1
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_bowser_draw_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $v0, %hi(ov54_bss_bowser_model)
  lw    $v0, %lo(ov54_bss_bowser_model)($v0)
  bne  $v0, $zero, .ov54_L800F72BC
   addiu $a0, $zero, 59 # bowser model model_info index
  jal   0x8003DBE0
   addu  $a1, $zero, $zero
  addu  $s0, $v0, $zero
  jal   0x8003E174
   addu  $a0, $s0, $zero
  lui   $at, %hi(ov54_bss_bowser_model)
  sw    $s0, %lo(ov54_bss_bowser_model)($at)
  lhu   $v0, 0xa($s0)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($s0)
  jal   GetSpaceData
   addiu $a0, $zero, 112 # space 0x70
  addiu $a0, $s0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  addiu    $a0, $zero, 7
  addu  $a1, $s0, $zero
  addiu    $a2, $zero, -2
  jal   0x8003C314
   addu  $a3, $zero, $zero
.ov54_L800F72BC:
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_bowser_draw_outer:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $at, %hi(ov54_bss_bowser_model)
  jal   ov54_bowser_draw_inner
   sw    $zero, %lo(ov54_bss_bowser_model)($at)
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_koopa_draw_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $v0, %hi(ov54_bss_koopa_model)
  lw    $v0, %lo(ov54_bss_koopa_model)($v0)
  bne  $v0, $zero, .ov54_L800F7358
   addiu    $a0, $zero, 57 # koopa model model_info index
  jal   0x8003DBE0 # loads model
   addu  $a1, $zero, $zero
  addu  $s0, $v0, $zero
  jal   0x8003E174
   addu  $a0, $s0, $zero
  lui   $at, %hi(ov54_bss_koopa_model)
  sw    $s0, %lo(ov54_bss_koopa_model)($at)
  lhu   $v0, 0xa($s0)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($s0)
  jal   GetSpaceData
   addiu    $a0, $zero, 93 # koopa standing space index
  addiu $a0, $s0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  addiu    $a0, $zero, 9
  addu  $a1, $s0, $zero
  addiu    $a2, $zero, -1
  jal   0x8003C314
   addiu    $a3, $zero, -3
.ov54_L800F7358:
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_koopa_draw_outer:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $at, %hi(ov54_bss_koopa_model)
  jal   ov54_koopa_draw_inner
   sw    $zero, %lo(ov54_bss_koopa_model)($at)
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_draw_toads_inner:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s0, $a0, $zero
  sll   $a0, $a0, 0x10
  sra   $a0, $a0, 0xe
  lui   $v0, %hi(ov54_bss_toad_2)
  addu  $v0, $v0, $a0
  lw    $v0, %lo(ov54_bss_toad_2)($v0)
  bne  $v0, $zero, .ov54_L800F7474
   NOP
  lui   $v0, %hi(ov54_bss_toad_model)
  lw    $v0, %lo(ov54_bss_toad_model)($v0)
  bne  $v0, $zero, .ov54_L800F73F4
   NOP
  addiu    $a0, $zero, 58
  jal   0x8003DBE0
   addu  $a1, $zero, $zero
  addu  $s2, $v0, $zero
  jal   0x8003E174
   addu  $a0, $s2, $zero
  lui   $at, %hi(ov54_bss_toad_model)
  sw    $s2, %lo(ov54_bss_toad_model)($at)
  j     .ov54_L800F7408
   sll   $s0, $s0, 0x10
.ov54_L800F73F4:
  lui   $a0, %hi(ov54_bss_toad_model)
  lw    $a0, %lo(ov54_bss_toad_model)($a0)
  jal   0x8003E320
   sll   $s0, $s0, 0x10
  addu  $s2, $v0, $zero
.ov54_L800F7408:
  sra   $s0, $s0, 0x10
  sll   $s1, $s0, 2
  lui   $at, %hi(ov54_bss_toad_2)
  addu  $at, $at, $s1
  sw    $s2, %lo(ov54_bss_toad_2)($at)
  lhu   $v0, 0xa($s2)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($s2)
  jal   0x8004CDCC
   addu  $a0, $s2, $zero
  sll   $s0, $s0, 1
  lui   $a0, %hi(ov54_toad_space_indices_repeat)
  addu  $a0, $a0, $s0
  jal   GetSpaceData
   lh    $a0, %lo(ov54_toad_space_indices_repeat)($a0)
  addiu $a0, $s2, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  addiu    $a0, $zero, 6
  lui   $a2, %hi(ov54_RO_800F9948)
  addu  $a2, $a2, $s1
  lh    $a2, %lo(ov54_RO_800F9948)($a2)
  lui   $a3, %hi(ov54_RO_800F994A)
  addu  $a3, $a3, $s1
  lh    $a3, %lo(ov54_RO_800F994A)($a3)
  jal   0x8003C314
   addu  $a1, $s2, $zero
.ov54_L800F7474:
  lw    $ra, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_draw_toads_outer:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $at, %hi(ov54_bss_toad_model)
  sw    $zero, %lo(ov54_bss_toad_model)($at)
  addu  $s0, $zero, $zero
  lui   $s2, %hi(ov54_bss_toad_2)
  addiu $s2, $s2, %lo(ov54_bss_toad_2)
  lui   $s1, %hi(ov54_data_mystery_40s_list_2)
  addiu $s1, $s1, %lo(ov54_data_mystery_40s_list_2)
  sll   $v0, $s0, 2
.ov54_L800F74C0:
  addu  $v0, $v0, $s2
  sw    $zero, 0($v0)
  sll   $v0, $s0, 1
  addu  $v0, $v0, $s1
  jal   IsBoardFeatureDisabled
   lh    $a0, 0($v0)
  bnel $v0, $zero, .ov54_L800F74F0
   addiu $s0, $s0, 1
  sll   $a0, $s0, 0x10
  jal   ov54_draw_toads_inner
   sra   $a0, $a0, 0x10
  addiu $s0, $s0, 1
.ov54_L800F74F0:
  slti  $v0, $s0, 7
  bne  $v0, $zero, .ov54_L800F74C0
   sll   $v0, $s0, 2
  lw    $ra, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_draw_thwomps_inner:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s2, $a0, $zero
  sll   $a0, $a0, 0x10
  sra   $a0, $a0, 0xe
  lui   $v0, %hi(ov54_bss_thwomp_2)
  addu  $v0, $v0, $a0
  lw    $v0, %lo(ov54_bss_thwomp_2)($v0)
  bne  $v0, $zero, .ov54_L800F7654
   NOP
  lui   $v0, %hi(ov54_bss_thwomp)
  lw    $v0, %lo(ov54_bss_thwomp)($v0)
  bne  $v0, $zero, .ov54_L800F7584
   NOP
  lui   $a1, %hi(ov54_thwomp_DO_800F9984)
  addiu $a1, $a1, %lo(ov54_thwomp_DO_800F9984)
  jal   0x8003DBE0
   addiu    $a0, $zero, 10
  addu  $s1, $v0, $zero
  jal   0x8003E174
   addu  $a0, $s1, $zero
  lui   $at, %hi(ov54_bss_thwomp)
  sw    $s1, %lo(ov54_bss_thwomp)($at)
  j     .ov54_L800F7598
   sll   $s0, $s2, 0x10
.ov54_L800F7584:
  lui   $a0, %hi(ov54_bss_thwomp)
  lw    $a0, %lo(ov54_bss_thwomp)($a0)
  jal   0x8003E320
   sll   $s0, $s2, 0x10
  addu  $s1, $v0, $zero
.ov54_L800F7598:
  sra   $s0, $s0, 0x10
  sll   $v0, $s0, 2
  lui   $at, %hi(ov54_bss_thwomp_2)
  addu  $at, $at, $v0
  sw    $s1, %lo(ov54_bss_thwomp_2)($at)
  addiu $a0, $s1, 0x24
  lui   $a1, 0x3f4c
  ori   $a1, $a1, 0xcccd
  addu  $a2, $a1, $zero
  jal   0x800A0D00
   addu  $a3, $a1, $zero
  lhu   $v0, 0xa($s1)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($s1)
  sll   $s0, $s0, 1
  lui   $v0, %hi(ov54_RO_800F9964)
  addu  $v0, $v0, $s0
  lh    $v0, %lo(ov54_RO_800F9964)($v0)
  sll   $v0, $v0, 1
  lui   $at, %hi(D_800ED154)
  addu  $at, $at, $v0
  lh    $v0, %lo(D_800ED154)($at)
  bne  $v0, $zero, .ov54_L800F7608
   sll   $v0, $s2, 0x10
  lui   $a0, %hi(ov54_thwomp_spaces_left)
  addu  $a0, $a0, $s0
  j     .ov54_L800F7618
   lh    $a0, %lo(ov54_thwomp_spaces_left)($a0)
.ov54_L800F7608:
  sra   $v0, $v0, 0xf
  lui   $a0, %hi(ov54_thwomp_spaces_right)
  addu  $a0, $a0, $v0
  lh    $a0, %lo(ov54_thwomp_spaces_right)($a0)
.ov54_L800F7618:
  jal   GetSpaceData
   addiu $s0, $s1, 0xc
  addu  $a0, $s0, $zero
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  sll   $v0, $s2, 0x10
  sra   $v0, $v0, 0xf
  lui   $a0, %hi(ov54_thwomp_event_space_indices)
  addu  $a0, $a0, $v0
  jal   GetSpaceData
   lh    $a0, %lo(ov54_thwomp_event_space_indices)($a0)
  addiu $a0, $s1, 0x18
  addiu $a1, $v0, 4
  jal   0x800A0E80
   addu  $a2, $s0, $zero
.ov54_L800F7654:
  lw    $ra, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_draw_thwomps_outer:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $at, %hi(ov54_bss_thwomp)
  sw    $zero, %lo(ov54_bss_thwomp)($at)
  addu  $s0, $zero, $zero
  sll   $a0, $s0, 0x10
ov54_draw_thwomps_outer_loop:
  jal   ov54_draw_thwomps_inner
   sra   $a0, $a0, 0x10
  addiu $s0, $s0, 1
  slti  $v0, $s0, 3
  bne  $v0, $zero, ov54_draw_thwomps_outer_loop
   sll   $a0, $s0, 0x10
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_boo_draw_inner:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s0, $a0, $zero
  sll   $a0, $a0, 0x10
  sra   $a0, $a0, 0xe
  lui   $v0, %hi(ov54_bss_boo_2)
  addu  $v0, $v0, $a0
  lw    $v0, %lo(ov54_bss_boo_2)($v0)
  bne  $v0, $zero, .ov54_L800F77A4
   NOP
  lui   $v0, %hi(ov54_bss_boo)
  lw    $v0, %lo(ov54_bss_boo)($v0)
  bne  $v0, $zero, .ov54_L800F7714
   addiu    $a0, $zero, 106
  jal   0x8003DBE0
   addu  $a1, $zero, $zero
  addu  $s1, $v0, $zero
  jal   0x8003E174
   addu  $a0, $s1, $zero
  lui   $at, %hi(ov54_bss_boo)
  sw    $s1, %lo(ov54_bss_boo)($at)
  j     .ov54_L800F7728
   sll   $s0, $s0, 0x10
.ov54_L800F7714:
  lui   $a0, %hi(ov54_bss_boo)
  lw    $a0, %lo(ov54_bss_boo)($a0)
  jal   0x8003E320
   sll   $s0, $s0, 0x10
  addu  $s1, $v0, $zero
.ov54_L800F7728:
  sra   $s0, $s0, 0x10
  sll   $v0, $s0, 2
  lui   $at, %hi(ov54_bss_boo_2)
  addu  $at, $at, $v0
  sw    $s1, %lo(ov54_bss_boo_2)($at)
  lhu   $v0, 0xa($s1)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($s1)
  addiu $a0, $s1, 0x24
  lui $a1, 0x3f19
  ori $a1, $a1, 0x999a
  addu  $a2, $a1, $zero
  jal   0x800A0D00
   addu  $a3, $a1, $zero
  lui   $at, 0x42C8 # 100.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x30($s1)
  sll   $s0, $s0, 1
  lui   $a0, %hi(ov54_boo_space_indices)
  addu  $a0, $a0, $s0
  jal   GetSpaceData
   lh    $a0, %lo(ov54_boo_space_indices)($a0)
  addiu $a0, $s1, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  addiu    $a0, $zero, 8
  addu  $a1, $s1, $zero
  addu  $a2, $zero, $zero
  jal   0x8003C314
   addu  $a3, $zero, $zero
.ov54_L800F77A4:
  lw    $ra, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_boo_draw_outer:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $at, %hi(ov54_bss_boo)
  sw    $zero, %lo(ov54_bss_boo)($at)
  addu  $s0, $zero, $zero
  sll   $a0, $s0, 0x10
ov54_boo_draw_outer_loop:
  jal   ov54_boo_draw_inner
   sra   $a0, $a0, 0x10
  addiu $s0, $s0, 1
  slti  $v0, $s0, 2
  bne  $v0, $zero, ov54_boo_draw_outer_loop
   sll   $a0, $s0, 0x10
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_draw_20_coin_gate_inner:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s0, $a0, $zero
  sll   $a0, $a0, 0x10
  sra   $a0, $a0, 0xe
  lui   $v0, %hi(ov54_bss_20_coin_gate_2)
  addu  $v0, $v0, $a0
  lw    $v0, %lo(ov54_bss_20_coin_gate_2)($v0)
  bne  $v0, $zero, .ov54_L800F78C8
   NOP
  lui   $v0, %hi(ov54_bss_20_coin_gate)
  lw    $v0, %lo(ov54_bss_20_coin_gate)($v0)
  bne  $v0, $zero, .ov54_L800F7860
   NOP
  addiu    $a0, $zero, 41
  jal   0x8003DBE0
   addu  $a1, $zero, $zero
  addu  $s1, $v0, $zero
  jal   0x8003E174
   addu  $a0, $s1, $zero
  lui   $at, %hi(ov54_bss_20_coin_gate)
  j     .ov54_L800F7870
   sw    $s1, %lo(ov54_bss_20_coin_gate)($at)
.ov54_L800F7860:
  lui   $a0, %hi(ov54_bss_20_coin_gate)
  jal   0x8003E320
   lw    $a0, %lo(ov54_bss_20_coin_gate)($a0)
  addu  $s1, $v0, $zero
.ov54_L800F7870:
  lhu   $v0, 0xa($s1)
  ori   $v0, $v0, 2
  sh    $v0, 0xa($s1)
  sll   $s0, $s0, 0x10
  sra   $s0, $s0, 0x10
  sll   $v0, $s0, 2
  lui   $at, %hi(ov54_bss_20_coin_gate_2)
  addu  $at, $at, $v0
  sw    $s1, %lo(ov54_bss_20_coin_gate_2)($at)
  sll   $s0, $s0, 1
  lui   $a0, %hi(ov54_gate_20_coins_space_indices)
  addu  $a0, $a0, $s0
  jal   GetSpaceData
   lh    $a0, %lo(ov54_gate_20_coins_space_indices)($a0)
  addiu $a0, $s1, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  lui   $a1, %hi(ov54_gate_20_coins_player_space_indices)
  addu  $a1, $a1, $s0
  lh    $a1, %lo(ov54_gate_20_coins_player_space_indices)($a1)
  jal   0x8004CD48
   addu  $a0, $s1, $zero
.ov54_L800F78C8:
  lw    $ra, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_draw_20_coin_gate_outer:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $at, %hi(ov54_bss_20_coin_gate)
  sw    $zero, %lo(ov54_bss_20_coin_gate)($at)
  addu  $s0, $zero, $zero
  sll   $a0, $s0, 0x10
ov54_draw_20_coin_gate_outer_loop:
  jal   ov54_draw_20_coin_gate_inner
   sra   $a0, $a0, 0x10
  addiu $s0, $s0, 1
  slti  $v0, $s0, 2
  bne  $v0, $zero, ov54_draw_20_coin_gate_outer_loop
   sll   $a0, $s0, 0x10
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_func_all_gates_800F7920:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
.ov54_L800F7928:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F7948
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F7928
   NOP
.ov54_L800F7948:
  jal   SleepVProcess
   NOP
  addu  $a0, $zero, $zero
  addiu    $a1, $zero, 146
  jal   0x80045D84
   addiu    $a2, $zero, 1
  lui   $at, %hi(ov54_bss_800FA354)
  sw    $v0, %lo(ov54_bss_800FA354)($at)
  addiu    $a0, $zero, 1
  addiu    $a1, $zero, 160
  jal   0x80045D84
   addiu    $a2, $zero, 1
  lui   $at, %hi(ov54_bss_800FA358)
  sw    $v0, %lo(ov54_bss_800FA358)($at)
  addiu    $a0, $zero, 3
  addiu    $a1, $zero, 174
  jal   0x80045D84
   addiu    $a2, $zero, 1
  lui   $at, %hi(ov54_bss_800FA35C)
  sw    $v0, %lo(ov54_bss_800FA35C)($at)
  addiu    $a0, $zero, 11
  addiu    $a1, $zero, 188
  jal   0x80045D84
   addiu    $a2, $zero, 1
  lui   $at, %hi(ov54_bss_800FA360)
  sw    $v0, %lo(ov54_bss_800FA360)($at)
  jal   SleepProcess
   addiu    $a0, $zero, 3
  addiu    $v0, $zero, 1
  lui   $at, %hi(D_800EE320)
  sh    $v0, %lo(D_800EE320)($at)
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_func_all_gates_800F79D0:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $at, %hi(D_800EE320)
  sh    $zero, %lo(D_800EE320)($at)
  lui   $a0, %hi(ov54_bss_800FA354)
  jal   0x80045E6C
   lw    $a0, %lo(ov54_bss_800FA354)($a0)
  lui   $a0, %hi(ov54_bss_800FA358)
  jal   0x80045E6C
   lw    $a0, %lo(ov54_bss_800FA358)($a0)
  lui   $a0, %hi(ov54_bss_800FA35C)
  jal   0x80045E6C
   lw    $a0, %lo(ov54_bss_800FA35C)($a0)
  lui   $a0, %hi(ov54_bss_800FA360)
  jal   0x80045E6C
   lw    $a0, %lo(ov54_bss_800FA360)($a0)
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_thwomp_split_74_passing_event:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x24($sp)
  sw    $s2, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, -1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, -1
  jal   PlayerHasCoins
   addiu    $a1, $zero, 10
  beq  $v0, $zero, .ov54_L800F7B5C
   NOP
  jal   ov54_func_all_gates_800F7920
   NOP
  lui   $a1, %hi(ov54_thwomp_split_74_space_indices)
  addiu $a1, $a1, %lo(ov54_thwomp_split_74_space_indices)
  jal   0x8003C218
   addiu    $a0, $zero, -1
  addu  $s2, $v0, $zero
  addu  $a0, $s2, $zero
  addiu    $a1, $zero, -1
  jal   0x8003C060
   addu  $a2, $zero, $zero
  jal   PlayerIsCPU
   addiu    $a0, $zero, -1 # Current player
  beq  $v0, $zero, .ov54_L800F7AD8
   NOP
  lui   $a0, %hi(ov54_ai_entry_thwomp74)
  addiu $a0, $a0, %lo(ov54_ai_entry_thwomp74)
  jal   0x8003E9B0 # Determine AI choice
   addu  $s0, $zero, $zero
  sll   $v0, $v0, 0x10
  sra   $s1, $v0, 0x10
  blez  $s1, .ov54_L800F7AD0
   addu  $a0, $s2, $zero
.ov54_L800F7AB8:
  jal   0x8003BE84
   addiu    $a1, $zero, -2
  addiu $s0, $s0, 1
  slt   $v0, $s0, $s1
  bne  $v0, $zero, .ov54_L800F7AB8
   addu  $a0, $s2, $zero
.ov54_L800F7AD0:
  jal   0x8003BE84
   addiu    $a1, $zero, -4
.ov54_L800F7AD8:
  jal   DirectionPrompt
   addu  $a0, $s2, $zero
  addu  $s0, $v0, $zero
  jal   0x8003B908
   addu  $a0, $s2, $zero
  jal   ov54_func_all_gates_800F79D0
   NOP
  lui   $v0, %hi(D_800ED154)
  lh    $v0, %lo(D_800ED154)($v0)
  sltiu $v0, $v0, 1
  sltu  $v1, $zero, $s0
  and   $v0, $v0, $v1
  beq  $v0, $zero, .ov54_L800F7B18
   addiu    $a0, $zero, -1
  j     .ov54_L800F7C0C
   addiu    $a1, $zero, 3
.ov54_L800F7B18:
  lui   $v0, %hi(D_800ED154)
  lh    $v0, %lo(D_800ED154)($v0)
  sltu  $v0, $zero, $v0
  sltiu $v1, $s0, 1
  and   $v0, $v0, $v1
  bne  $v0, $zero, .ov54_L800F7C0C
   addiu    $a1, $zero, 1
  lui   $at, %hi(D_800ED172)
  sh    $zero, %lo(D_800ED172)($at)
  addiu    $a0, $zero, 71
  addu  $a1, $zero, $zero
  jal   0x800587EC
   addiu    $a2, $zero, 1
  jal   0x8004CB20
   addiu    $a0, $zero, 1
  j     .ov54_L800F7C14
   NOP
.ov54_L800F7B5C:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F7B7C
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F7B5C
   NOP
.ov54_L800F7B7C:
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, 50
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 12
  jal   CreateTextWindow
   addiu    $a3, $zero, 2
  sll   $s0, $v0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  addiu    $a1, $zero, 395 # Can't pass if you don't have 10 coins
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  jal   PlaySound
   addiu    $a0, $zero, 143
  jal   GetCurrentPlayerIndex
   NOP
  sll   $v0, $v0, 0x10
  addu  $a0, $s0, $zero
  jal   0x8004DBD4
   sra   $a1, $v0, 0x10
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  lui   $v0, %hi(D_800ED154)
  lh    $v0, %lo(D_800ED154)($v0)
  bne  $v0, $zero, .ov54_L800F7C08
   addiu    $a0, $zero, -1
  j     .ov54_L800F7C0C
   addiu    $a1, $zero, 3
.ov54_L800F7C08:
  addiu    $a1, $zero, 1
.ov54_L800F7C0C:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
.ov54_L800F7C14:
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x24($sp)
  lw    $s2, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_thwomp_split_74_2_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $v0, %hi(D_800ED154)
  lh    $v0, %lo(D_800ED154)($v0)
  beq  $v0, $zero, .ov54_L800F7C54
   addiu    $a0, $zero, -1
  j     .ov54_L800F7C58
   addiu    $a1, $zero, 1
.ov54_L800F7C54:
  addiu    $a1, $zero, 3
.ov54_L800F7C58:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_thwomp_split_7E_passing_event:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x24($sp)
  sw    $s2, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, -1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, -1 # current player
  jal   PlayerHasCoins
   addiu    $a1, $zero, 10 # 10 coins
  beq  $v0, $zero, .ov54_L800F7DB0
   NOP
  jal   ov54_func_all_gates_800F7920
   NOP
  lui   $a1, %hi(ov54_thwomp_split_7E_space_indices)
  addiu $a1, $a1, %lo(ov54_thwomp_split_7E_space_indices)
  jal   0x8003C218
   addiu    $a0, $zero, -1
  addu  $s2, $v0, $zero
  addu  $a0, $s2, $zero
  addiu    $a1, $zero, -1
  jal   0x8003C060
   addu  $a2, $zero, $zero
  jal   PlayerIsCPU
   addiu    $a0, $zero, -1
  beq  $v0, $zero, .ov54_L800F7D28
   NOP
  lui   $a0, %hi(ov54_ai_entry_thwomp7E)
  addiu $a0, $a0, %lo(ov54_ai_entry_thwomp7E)
  jal   0x8003E9B0 # Determine AI choice
   addu  $s0, $zero, $zero
  sll   $v0, $v0, 0x10
  sra   $s1, $v0, 0x10
  blez  $s1, .ov54_L800F7D20
   addu  $a0, $s2, $zero
.ov54_L800F7D08:
  jal   0x8003BE84
   addiu    $a1, $zero, -2
  addiu $s0, $s0, 1
  slt   $v0, $s0, $s1
  bne  $v0, $zero, .ov54_L800F7D08
   addu  $a0, $s2, $zero
.ov54_L800F7D20:
  jal   0x8003BE84
   addiu    $a1, $zero, -4
.ov54_L800F7D28:
  jal   DirectionPrompt
   addu  $a0, $s2, $zero
  addu  $s0, $v0, $zero
  jal   0x8003B908
   addu  $a0, $s2, $zero
  jal   ov54_func_all_gates_800F79D0
   NOP
  lui   $v0, %hi(D_800ED156)
  lh    $v0, %lo(D_800ED156)($v0)
  sltiu $v0, $v0, 1
  sltu  $v1, $zero, $s0
  and   $v0, $v0, $v1
  beq  $v0, $zero, .ov54_L800F7D68
   addiu    $a0, $zero, -1
  j     .ov54_L800F7E60
   addiu    $a1, $zero, 15
.ov54_L800F7D68:
  lui   $v0, %hi(D_800ED156)
  lh    $v0, %lo(D_800ED156)($v0)
  sltu  $v0, $zero, $v0
  sltiu $v1, $s0, 1
  and   $v0, $v0, $v1
  bne  $v0, $zero, .ov54_L800F7E60
   addiu    $a1, $zero, 14
  addiu    $v0, $zero, 1
  lui   $at, %hi(D_800ED172)
  sh    $v0, %lo(D_800ED172)($at)
  addiu    $a0, $zero, 71
  addu  $a1, $zero, $zero
  jal   0x800587EC
   addiu    $a2, $zero, 1
  jal   0x8004CB20
   addiu    $a0, $zero, 1
  j     .ov54_L800F7E68
   NOP
.ov54_L800F7DB0:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F7DD0
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F7DB0
   NOP
.ov54_L800F7DD0:
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, 50
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 12
  jal   CreateTextWindow
   addiu    $a3, $zero, 2
  sll   $s0, $v0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  addiu    $a1, $zero, 395 # "Can't pass if you don't have 10 coins"
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  jal   PlaySound
   addiu    $a0, $zero, 143
  jal   GetCurrentPlayerIndex
   NOP
  sll   $v0, $v0, 0x10
  addu  $a0, $s0, $zero
  jal   0x8004DBD4
   sra   $a1, $v0, 0x10
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  lui   $v0, %hi(D_800ED156)
  lh    $v0, %lo(D_800ED156)($v0)
  bne  $v0, $zero, .ov54_L800F7E5C
   addiu    $a0, $zero, -1
  j     .ov54_L800F7E60
   addiu    $a1, $zero, 15
.ov54_L800F7E5C:
  addiu    $a1, $zero, 14
.ov54_L800F7E60:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
.ov54_L800F7E68:
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x24($sp)
  lw    $s2, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_thwomp_split_7E_2_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $v0, %hi(D_800ED156)
  lh    $v0, %lo(D_800ED156)($v0)
  beq  $v0, $zero, .ov54_L800F7EA8
   addiu    $a0, $zero, -1
  j     .ov54_L800F7EAC
   addiu    $a1, $zero, 14
.ov54_L800F7EA8:
  addiu    $a1, $zero, 15
.ov54_L800F7EAC:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_thwomp_split_85_passing_event:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x24($sp)
  sw    $s2, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, -1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, -1 # current player
  jal   PlayerHasCoins
   addiu    $a1, $zero, 10
  beq  $v0, $zero, .ov54_L800F8004
   NOP
  jal   ov54_func_all_gates_800F7920
   NOP
  lui   $a1, %hi(ov54_thwomp_split_85_space_indices)
  addiu $a1, $a1, %lo(ov54_thwomp_split_85_space_indices)
  jal   0x8003C218
   addiu    $a0, $zero, -1
  addu  $s2, $v0, $zero
  addu  $a0, $s2, $zero
  addiu    $a1, $zero, -1
  jal   0x8003C060
   addu  $a2, $zero, $zero
  jal   PlayerIsCPU
   addiu    $a0, $zero, -1
  beq  $v0, $zero, .ov54_L800F7F7C
   NOP
  lui   $a0, %hi(ov54_ai_entry_thwomp85)
  addiu $a0, $a0, %lo(ov54_ai_entry_thwomp85)
  jal   0x8003E9B0 # Determine AI choice
   addu  $s0, $zero, $zero
  sll   $v0, $v0, 0x10
  sra   $s1, $v0, 0x10
  blez  $s1, .ov54_L800F7F74
   addu  $a0, $s2, $zero
.ov54_L800F7F5C:
  jal   0x8003BE84
   addiu    $a1, $zero, -2
  addiu $s0, $s0, 1
  slt   $v0, $s0, $s1
  bne  $v0, $zero, .ov54_L800F7F5C
   addu  $a0, $s2, $zero
.ov54_L800F7F74:
  jal   0x8003BE84
   addiu    $a1, $zero, -4
.ov54_L800F7F7C:
  jal   DirectionPrompt
   addu  $a0, $s2, $zero
  addu  $s0, $v0, $zero
  jal   0x8003B908
   addu  $a0, $s2, $zero
  jal   ov54_func_all_gates_800F79D0
   NOP
  lui   $v0, %hi(D_800ED158)
  lh    $v0, %lo(D_800ED158)($v0)
  sltiu $v0, $v0, 1
  sltiu $v1, $s0, 1
  and   $v0, $v0, $v1
  beq  $v0, $zero, .ov54_L800F7FBC
   addiu    $a0, $zero, -1
  j     .ov54_L800F80B4
   addiu    $a1, $zero, 6
.ov54_L800F7FBC:
  lui   $v0, %hi(D_800ED158)
  lh    $v0, %lo(D_800ED158)($v0)
  sltu  $v0, $zero, $v0
  sltu  $v1, $zero, $s0
  and   $v0, $v0, $v1
  bne  $v0, $zero, .ov54_L800F80B4
   addiu    $a1, $zero, 5
  addiu    $v0, $zero, 2
  lui   $at, %hi(D_800ED172)
  sh    $v0, %lo(D_800ED172)($at)
  addiu    $a0, $zero, 71
  addu  $a1, $zero, $zero
  jal   0x800587EC
   addiu    $a2, $zero, 1
  jal   0x8004CB20
   addiu    $a0, $zero, 1
  j     .ov54_L800F80BC
   NOP
.ov54_L800F8004:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F8024
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F8004
   NOP
.ov54_L800F8024:
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, 50
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 12
  jal   CreateTextWindow
   addiu    $a3, $zero, 2
  sll   $s0, $v0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  addiu    $a1, $zero, 395 # "Can't pass if you don't have 10 coins"
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  jal   PlaySound
   addiu    $a0, $zero, 143
  jal   GetCurrentPlayerIndex
   NOP
  sll   $v0, $v0, 0x10
  addu  $a0, $s0, $zero
  jal   0x8004DBD4
   sra   $a1, $v0, 0x10
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  lui   $v0, %hi(D_800ED158)
  lh    $v0, %lo(D_800ED158)($v0)
  bne  $v0, $zero, .ov54_L800F80B0
   addiu    $a0, $zero, -1
  j     .ov54_L800F80B4
   addiu    $a1, $zero, 6
.ov54_L800F80B0:
  addiu    $a1, $zero, 5
.ov54_L800F80B4:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
.ov54_L800F80BC:
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x24($sp)
  lw    $s2, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_thwomp_split_85_2_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  lui   $v0, %hi(D_800ED158)
  lh    $v0, %lo(D_800ED158)($v0)
  beq  $v0, $zero, .ov54_L800F80FC
   addiu    $a0, $zero, -1
  j     .ov54_L800F8100
   addiu    $a1, $zero, 5
.ov54_L800F80FC:
  addiu    $a1, $zero, 6
.ov54_L800F8100:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_post_thwomp_intersection_event_process:
  addiu $sp, $sp, -0x40
  sw    $ra, 0x38($sp)
  sw    $s5, 0x34($sp)
  sw    $s4, 0x30($sp)
  sw    $s3, 0x2c($sp)
  sw    $s2, 0x28($sp)
  sw    $s1, 0x24($sp)
  jal   0x800633A8
   sw    $s0, 0x20($sp)
  addu  $s3, $v0, $zero
  lw    $s2, 0x8c($s3)
  lw    $s4, 0($s2)
  lw    $s5, 4($s2)
  addu  $a0, $s4, $zero
  addu  $a1, $zero, $zero
  jal   0x8003E81C
   addiu    $a2, $zero, 2
  addiu $s5, $s5, 4
  addiu $s1, $s4, 0xc
  addiu $a0, $sp, 0x10
  addu  $a1, $s5, $zero
  jal   0x800A0E80
   addu  $a2, $s1, $zero
  addiu $s0, $s4, 0x18
  addu  $a0, $s0, $zero
  addiu $a1, $sp, 0x10
  addu  $a2, $s0, $zero
  jal   0x8004D1EC
   addiu    $a3, $zero, 10
  addu  $a0, $s3, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  addiu $a0, $sp, 0x10
  jal   0x800A0D50 # posmodel
   addu  $a1, $s1, $zero
  addiu $a0, $sp, 0x10
  addu  $a1, $s5, $zero
  addu  $a2, $s1, $zero
  jal   0x8004D3F4
   addiu    $a3, $zero, 25
  addu  $a0, $s3, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  lw    $s5, 8($s2)
  addiu $a0, $sp, 0x10
  addiu $a1, $s5, 4
  jal   0x800A0E80
   addu  $a2, $s1, $zero
  addu  $a0, $s0, $zero
  addiu $a1, $sp, 0x10
  addu  $a2, $s0, $zero
  jal   0x8004D1EC
   addiu    $a3, $zero, 10
  addu  $a0, $s3, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  addu  $a0, $s4, $zero
  addiu    $a1, $zero, -1
  jal   0x8003E81C
   addiu    $a2, $zero, 2
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x38($sp)
  lw    $s5, 0x34($sp)
  lw    $s4, 0x30($sp)
  lw    $s3, 0x2c($sp)
  lw    $s2, 0x28($sp)
  lw    $s1, 0x24($sp)
  lw    $s0, 0x20($sp)
  jr $ra
   addiu $sp, $sp, 0x40

# Adjusts the thwomps after you walk through
ov54_post_thwomp_intersection_event:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x20($sp)
  sw    $s3, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  jal   GetCurrentSpaceIndex
   sw    $s0, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu $v0, $v0, -0x1a
  sll   $v0, $v0, 0x10
  sra   $v1, $v0, 0x10
  sltiu $v0, $v1, 0x2f
  beq  $v0, $zero, .ov54_L800F8314
   addu  $s2, $zero, $zero
  sll   $v0, $v1, 2
  lui   $at, %hi(ov54_D_800FA240_jtable)
  addu  $at, $at, $v0
  lw    $v0, %lo(ov54_D_800FA240_jtable)($at)
  jr    $v0
   NOP
.ov54_L800F8298:
  addiu    $a0, $zero, 101
  addiu    $v0, $zero, 1
  lui   $at, %hi(D_800ED154)
  sh    $v0, %lo(D_800ED154)($at)
  j     .ov54_L800F8314
   addu  $s2, $zero, $zero
.ov54_L800F82B0:
  addiu    $a0, $zero, 104
  lui   $at, %hi(D_800ED154)
  sh    $zero, %lo(D_800ED154)($at)
  j     .ov54_L800F8314
   addu  $s2, $zero, $zero
.ov54_L800F82C4:
  addiu    $s2, $zero, 1
  lui   $at, %hi(D_800ED156)
  sh    $s2, %lo(D_800ED156)($at)
  j     .ov54_L800F8314
   addiu    $a0, $zero, 108
.ov54_L800F82D8:
  addiu    $a0, $zero, 102
  lui   $at, %hi(D_800ED156)
  sh    $zero, %lo(D_800ED156)($at)
  j     .ov54_L800F8314
   addiu    $s2, $zero, 1
.ov54_L800F82something:
  addiu    $a0, $zero, 94
  addiu    $v0, $zero, 1
  lui   $at, %hi(D_800ED158)
  sh    $v0, %lo(D_800ED158)($at)
  j     .ov54_L800F8314
   addiu    $s2, $zero, 2
.ov54_L800F8304:
  addiu    $a0, $zero, 103
  addiu    $s2, $zero, 2
  lui   $at, %hi(D_800ED158)
  sh    $zero, %lo(D_800ED158)($at)
.ov54_L800F8314:
  sll   $v0, $a0, 0x10
  sra   $s3, $v0, 0x10
  beq  $s3, $zero, .ov54_L800F838C
   addiu    $a1, $zero, 18432
  lui   $a0, %hi(ov54_post_thwomp_intersection_event_process)
  addiu $a0, $a0, %lo(ov54_post_thwomp_intersection_event_process)
  addu  $a2, $zero, $zero
  jal   InitProcess
   addiu    $a3, $zero, 64
  addu  $s0, $v0, $zero
  lw    $a0, 0x18($s0)
  jal   Malloc
   addiu    $a1, $zero, 12
  addu  $s1, $v0, $zero
  sw    $s1, 0x8c($s0)
  addu  $s0, $s2, $zero
  sll   $v0, $s0, 2
  lui   $at, %hi(ov54_bss_thwomp_2)
  addu  $at, $at, $v0
  lw    $v0, %lo(ov54_bss_thwomp_2)($at)
  sw    $v0, 0($s1)
  jal   GetSpaceData
   addu  $a0, $s3, $zero
  sw    $v0, 4($s1)
  sll   $s0, $s0, 1
  lui   $a0, %hi(ov54_thwomp_event_space_indices)
  addu  $a0, $a0, $s0
  jal   GetSpaceData
   lh    $a0, %lo(ov54_thwomp_event_space_indices)($a0)
  sw    $v0, 8($s1)
.ov54_L800F838C:
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x20($sp)
  lw    $s3, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_move_models_for_boulder:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 13
  bne  $v0, $zero, .ov54_L800F83E4
   NOP
  jal   GetSpaceData
   addiu    $a0, $zero, 106 # bowser alt location during boulder
  lui   $a0, %hi(ov54_bss_bowser_model)
  lw    $a0, %lo(ov54_bss_bowser_model)($a0)
  addiu $a0, $a0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
.ov54_L800F83E4:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 72
  bne  $v0, $zero, .ov54_L800F8410
   NOP
  jal   GetSpaceData
   addiu    $a0, $zero, 105 # toad alt location during boulder
  lui   $a0, %hi(ov54_bss_toad_boulder)
  lw    $a0, %lo(ov54_bss_toad_boulder)($a0)
  addiu $a0, $a0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
.ov54_L800F8410:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 74
  bne  $v0, $zero, .ov54_L800F843C
   NOP
  jal   GetSpaceData
   addiu    $a0, $zero, 107 # toad alt location during boulder (?)
  lui   $a0, %hi(ov54_bss_toad_boulder_2)
  lw    $a0, %lo(ov54_bss_toad_boulder_2)($a0)
  addiu $a0, $a0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
.ov54_L800F843C:
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_restore_models_after_boulder:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 13
  bne  $v0, $zero, .ov54_L800F847C
   NOP
  jal   GetSpaceData
   addiu    $a0, $zero, 112
  lui   $a0, %hi(ov54_bss_bowser_model)
  lw    $a0, %lo(ov54_bss_bowser_model)($a0)
  addiu $a0, $a0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
.ov54_L800F847C:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 72
  bne  $v0, $zero, .ov54_L800F84A8
   NOP
  jal   GetSpaceData
   addiu    $a0, $zero, 109
  lui   $a0, %hi(ov54_bss_toad_boulder)
  lw    $a0, %lo(ov54_bss_toad_boulder)($a0)
  addiu $a0, $a0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
.ov54_L800F84A8:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 74
  bne  $v0, $zero, .ov54_L800F84D4
   NOP
  jal   GetSpaceData
   addiu    $a0, $zero, 113
  lui   $a0, %hi(ov54_bss_toad_boulder_2)
  lw    $a0, %lo(ov54_bss_toad_boulder_2)($a0)
  addiu $a0, $a0, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
.ov54_L800F84D4:
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_boulder_func_800F84E0:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, 4
  jal   0x800726AC
   addiu    $a1, $zero, 16
  jal   SleepProcess
   addiu    $a0, $zero, 16
  jal   ov54_move_models_for_boulder
   NOP
  jal   0x8004A7DC
   NOP
  jal   0x8004A7A4
   NOP
  jal   0x8004B844
   NOP
  lui   $at, %hi(ov54_bss_boulder_800FA364)
  swc1  $f0, %lo(ov54_bss_boulder_800FA364)($at)
  lui    $at, 0xBF80 # -1.000000
  mtc1  $at, $f12
  jal   0x8004B838
   NOP
  jal   0x8004B5D0
   NOP
  lui   $at, %hi(ov54_bss_boulder_800FA368)
  swc1  $f0, %lo(ov54_bss_boulder_800FA368)($at)
  lui    $at, 0x3F80 # 1.000000
  mtc1  $at, $f12
  jal   0x8004B5C4
   NOP
  jal   0x8004A510
   NOP
  jal   GetSpaceData
   addu  $a0, $zero, $zero # space index 0, start of boulder path
  jal   0x8004B5DC
   addiu $a0, $v0, 4
  jal   SleepVProcess
   NOP
  jal   0x8004A520
   NOP
  lui   $at, %hi(ov54_bss_boulder_800FA368)
  jal   0x8004B5C4
   lwc1  $f12, %lo(ov54_bss_boulder_800FA368)($at)
  lui   $at, %hi(ov54_bss_boulder_800FA364)
  jal   0x8004B838
   lwc1  $f12, %lo(ov54_bss_boulder_800FA364)($at)
  jal   0x800421E0
   NOP
  addiu    $a0, $zero, 4
  jal   0x80072644
   addiu    $a1, $zero, 16
  jal   SleepProcess
   addiu    $a0, $zero, 16
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_boulder_event_process_2_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, 4
  jal   0x800726AC
   addiu    $a1, $zero, 16
  jal   SleepProcess
   addiu    $a0, $zero, 16
  jal   ov54_restore_models_after_boulder
   NOP
  jal   0x8004A7DC
   NOP
  jal   0x8004A7A4
   NOP
  jal   0x8004B844
   NOP
  lui   $at, %hi(ov54_bss_boulder_800FA364)
  swc1  $f0, %lo(ov54_bss_boulder_800FA364)($at)
  lui    $at, 0xBF80 # -1.000000
  mtc1  $at, $f12
  jal   0x8004B838
   NOP
  jal   0x8004B5D0
   NOP
  lui   $at, %hi(ov54_bss_boulder_800FA368)
  swc1  $f0, %lo(ov54_bss_boulder_800FA368)($at)
  lui    $at, 0x3F80 # 1.000000
  mtc1  $at, $f12
  jal   0x8004B5C4
   NOP
  jal   0x8004A510
   NOP
  jal   GetPlayerStruct
   addiu    $a0, $zero, -1
  lw    $a0, 0x20($v0)
  jal   0x8004B5DC
   addiu $a0, $a0, 0xc
  jal   SleepVProcess
   NOP
  jal   0x8004A520
   NOP
  lui   $at, %hi(ov54_bss_boulder_800FA368)
  jal   0x8004B5C4
   lwc1  $f12, %lo(ov54_bss_boulder_800FA368)($at)
  lui   $at, %hi(ov54_bss_boulder_800FA364)
  jal   0x8004B838
   lwc1  $f12, %lo(ov54_bss_boulder_800FA364)($at)
  jal   0x8004220C
   NOP
  addiu    $a0, $zero, 4
  jal   0x80072644
   addiu    $a1, $zero, 16
  jal   SleepProcess
   addiu    $a0, $zero, 16
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_boulder_event_process:
  addiu $sp, $sp, -0x58
  sw    $ra, 0x4c($sp)
  sw    $fp, 0x48($sp)
  sw    $s7, 0x44($sp)
  sw    $s6, 0x40($sp)
  sw    $s5, 0x3c($sp)
  sw    $s4, 0x38($sp)
  sw    $s3, 0x34($sp)
  sw    $s2, 0x30($sp)
  sw    $s1, 0x2c($sp)
  sw    $s0, 0x28($sp)
  sdc1  $f20, 0x50($sp)
  jal   0x800633A8
   addu  $s3, $zero, $zero
  lw    $s1, 0x8c($v0)
  lw    $s2, 0x20($s1)
  lui   $s6, %hi(ov54_bss_boulder_800FA370)
  lw    $s6, %lo(ov54_bss_boulder_800FA370)($s6)
  jal   0x800633A8
   addiu $s0, $s6, 0xc
  addu  $fp, $v0, $zero
  lbu   $a0, 0x18($s1)
  addu  $a1, $zero, $zero
  jal   0x80058A4C
   addiu    $a2, $zero, 10
  sw    $v0, 0x24($sp)
  lui    $at, 0x439B # 310.000000
  mtc1  $at, $f20
.ov54_L800F870C:
  lhu   $a0, 0xe($s1)
  jal   GetAbsSpaceIndexFromChainSpaceIndex
   lhu   $a1, 0x10($s1)
  sll   $v0, $v0, 0x10
  jal   GetSpaceData
   sra   $a0, $v0, 0x10
  addiu $a0, $v0, 4
  jal   0x800A13C0
   addu  $a1, $s0, $zero
  C.LT.S $f0, $f20
  NOP
  NOP
  bc1t  .ov54_L800F8760
   addiu $a0, $s2, 0xc
  addu  $a1, $s0, $zero
  jal   0x8004CCD0
   addiu $a2, $s2, 0x18
  jal   SleepVProcess
   NOP
  j     .ov54_L800F870C
   NOP
.ov54_L800F8760:
  lbu   $a1, 0x18($s1)
  jal   0x80060618
   addiu    $a0, $zero, 1119
  lhu   $a0, 0xe($s1)
  jal   GetChainLength
   NOP
  lhu   $v1, 0x10($s1)
  subu  $s0, $v0, $v1
  addu  $s4, $s0, $zero
  lbu   $a0, 0x18($s1)
  addiu    $a1, $zero, 1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  sll   $s0, $s0, 0x10
  blez  $s0, .ov54_L800F8920
   sll   $v0, $s4, 0x10
  addiu    $s7, $zero, 1
  addiu $s5, $s2, 0x18
  addiu $s0, $s2, 0xc
.ov54_L800F87AC:
  sra   $v0, $v0, 0x10
  bne   $v0, $s7, .ov54_L800F87CC
   sll   $v0, $s3, 0x10
  lbu   $a0, 0x18($s1)
  addiu    $a1, $zero, 9
  jal   SetNextChainAndSpace
   addiu    $a2, $zero, 1
  sll   $v0, $s3, 0x10
.ov54_L800F87CC:
  sra   $v0, $v0, 0x10
  addiu    $v1, $zero, 124
  bne   $v0, $v1, .ov54_L800F8810
   sll   $v0, $s3, 0x10
  lui    $at, 0x4220 # 40.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x34($s2)
  lui    $at, 0xC0A0 # -5.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x38($s2)
  lbu   $a0, 0x18($s1)
  addiu    $a1, $zero, 2
  jal   0x80052BE8
   addu  $a2, $zero, $zero
  sll   $v0, $s3, 0x10
.ov54_L800F8810:
  sra   $v0, $v0, 0x10
  addiu    $v1, $zero, 36
  bne   $v0, $v1, .ov54_L800F8868
   addiu    $a1, $zero, -1
  lbu   $a0, 0x18($s1)
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  addiu $a0, $sp, 0x10
  addiu $a1, $s6, 0xc
  jal   0x800A0E80
   addiu $a2, $s2, 0xc
  addu  $a0, $s5, $zero
  addiu $a1, $sp, 0x10
  addu  $a2, $s5, $zero
  jal   0x8004D1EC
   addiu    $a3, $zero, 8
  jal   SleepProcess
   addiu    $a0, $zero, 30
  lbu   $a0, 0x18($s1)
  addiu    $a1, $zero, 1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
.ov54_L800F8868:
  lw    $v0, 0x20($s1)
  mtc1  $zero, $f2
  lwc1  $f0, 0x38($v0)
  C.EQ.S $f0, $f2
  NOP
  bc1f  .ov54_L800F88$a0
   NOP
  lh    $v0, 0x46($v0)
  beq   $v0, $s7, .ov54_L800F88$a0
   NOP
  lbu   $a0, 0x18($s1)
  addiu    $a1, $zero, 1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
.ov54_L800F88$a0:
  lhu   $a0, 0x12($s1)
  jal   GetAbsSpaceIndexFromChainSpaceIndex
   lhu   $a1, 0x14($s1)
  addu  $s3, $v0, $zero
  sll   $a1, $s3, 0x10
  lbu   $a0, 0x18($s1)
  sra   $a1, $a1, 0x10
  jal   0x8004CB70
   addiu $a2, $sp, 0x10
  addu  $a0, $s0, $zero
  addiu $a1, $sp, 0x10
  jal   0x8004CCD0
   addiu $a2, $s2, 0x18
  addu  $a0, $s0, $zero
  addiu $a1, $sp, 0x10
  lui   $a3, 0x41a0
  jal   0x8004D648
   addu  $a2, $s0, $zero
  addu  $a0, $fp, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  lbu   $a0, 0x18($s1)
  lh    $a1, 0x12($s1)
  jal   SetPlayerOntoChain
   lh    $a2, 0x14($s1)
  addiu $v0, $s4, -1
  addu  $s4, $v0, $zero
  sll   $v0, $v0, 0x10
  bgtz  $v0, .ov54_L800F87AC
   sll   $v0, $s4, 0x10
.ov54_L800F8920:
  lbu   $a0, 0x18($s1)
  addiu    $a1, $zero, -1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  lw    $a0, 0x24($sp)
  jal   0x80058AD0
   NOP
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x4c($sp)
  lw    $fp, 0x48($sp)
  lw    $s7, 0x44($sp)
  lw    $s6, 0x40($sp)
  lw    $s5, 0x3c($sp)
  lw    $s4, 0x38($sp)
  lw    $s3, 0x34($sp)
  lw    $s2, 0x30($sp)
  lw    $s1, 0x2c($sp)
  lw    $s0, 0x28($sp)
  ldc1  $f20, 0x50($sp)
  jr $ra
   addiu $sp, $sp, 0x58

ov54_boulder_event_process_2:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  jal   0x80056E3C
   sw    $s0, 0x10($sp)
  addu  $s0, $v0, $zero
  jal   0x80056E30
   addu  $a0, $zero, $zero
  jal   ov54_boulder_func_800F84E0
   NOP
  lui   $v0, %hi(ov54_bss_boulder_800FA370)
  lw    $v0, %lo(ov54_bss_boulder_800FA370)($v0)
  beq  $v0, $zero, .ov54_L800F89D4
   NOP
.ov54_L800F89AC:
  lui   $a0, %hi(ov54_bss_boulder_800FA370)
  lw    $a0, %lo(ov54_bss_boulder_800FA370)($a0)
  jal   0x8004B5DC
   addiu $a0, $a0, 0xc
  jal   SleepVProcess
   NOP
  lui   $v0, %hi(ov54_bss_boulder_800FA370)
  lw    $v0, %lo(ov54_bss_boulder_800FA370)($v0)
  bne  $v0, $zero, .ov54_L800F89AC
   NOP
.ov54_L800F89D4:
  jal   ov54_boulder_event_process_2_inner
   NOP
  sll   $a0, $s0, 0x10
  jal   0x80056E30
   sra   $a0, $a0, 0x10
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_boulder_event:
  addiu $sp, $sp, -0x50
  sw    $ra, 0x44($sp)
  sw    $fp, 0x40($sp)
  sw    $s7, 0x3c($sp)
  sw    $s6, 0x38($sp)
  sw    $s5, 0x34($sp)
  sw    $s4, 0x30($sp)
  sw    $s3, 0x2c($sp)
  sw    $s2, 0x28($sp)
  sw    $s1, 0x24($sp)
  sw    $s0, 0x20($sp)
  sdc1  $f20, 0x48($sp)
  jal   0x800633A8 # reads 0x800E23D0
   addu  $s3, $zero, $zero
  addu  $fp, $v0, $zero
  addu  $s1, $zero, $zero
  addiu    $s2, $zero, 17
.ov54_L800F8A44:
  jal   GetPlayerStruct
   addu  $a0, $s3, $zero
  addu  $s0, $v0, $zero
  lhu   $a0, 0xe($s0) # get chain index from player struct
  jal   GetAbsSpaceIndexFromChainSpaceIndex
   lhu   $a1, 0x10($s0) # get space index from player struct
  sll   $v0, $v0, 0x10
  sra   $a0, $v0, 0x10
  jal   GetChainSpaceIndexFromAbsSpaceIndex
   addiu    $a1, $zero, 17
  addu  $v1, $v0, $zero
  sll   $v0, $v1, 0x10
  bltz  $v0, .ov54_L800F8AAC
   addiu $v0, $v1, 1
  sh    $s2, 0xe($s0)
  sh    $v1, 0x10($s0)
  sh    $s2, 0x12($s0)
  sh    $v0, 0x14($s0)
  lui   $a0, %hi(ov54_boulder_event_process)
  addiu $a0, $a0, %lo(ov54_boulder_event_process)
  addiu    $a1, $zero, 18432
  addu  $a2, $zero, $zero
  jal   InitProcess
   addu  $a3, $zero, $zero
  sw    $s0, 0x8c($v0)
  addiu $s1, $s1, 1
.ov54_L800F8AAC:
  addiu $s3, $s3, 1
  slti  $v0, $s3, 4
  bne  $v0, $zero, .ov54_L800F8A44
   NOP
  bne  $s1, $zero, .ov54_L800F8B78
   NOP
  jal   GetPlayerStruct
   addiu    $a0, $zero, -1 # current player
  lw    $s2, 0x20($v0)
  jal   0x8004CD84
   addiu $a0, $sp, 0x10
  addiu $a0, $sp, 0x10
  jal   0x8003D514
   addu  $a1, $zero, $zero
  addiu $a2, $s2, 0x18
  addu  $a0, $a2, $zero
  addiu $a1, $sp, 0x10
  jal   0x8004D1EC
   addiu    $a3, $zero, 6
  addu  $a0, $fp, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  addiu    $a0, $zero, 75
  addiu    $a1, $zero, 64
  addiu    $a2, $zero, 14
  jal   CreateTextWindow
   addiu    $a3, $zero, 1
  sll   $s0, $v0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  addiu    $a1, $zero, 404 # "Huh?  Nothing happened!?!"
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  jal   GetCurrentPlayerIndex
   NOP
  sll   $v0, $v0, 0x10
  addu  $a0, $s0, $zero
  jal   0x8004DBD4
   sra   $a1, $v0, 0x10
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  jal   EndProcess
   addu  $a0, $zero, $zero
.ov54_L800F8B78:
  lui   $at, %hi(ov54_bss_boulder_800FA36C)
  sh    $zero, %lo(ov54_bss_boulder_800FA36C)($at)
  lui   $at, %hi(ov54_bss_boulder_800FA370)
  sw    $zero, %lo(ov54_bss_boulder_800FA370)($at)
  lui   $a0, %hi(ov54_boulder_event_process_2)
  addiu $a0, $a0, %lo(ov54_boulder_event_process_2)
  addiu    $a1, $zero, 4099
  addu  $a2, $zero, $zero
  jal   InitProcess
   addu  $a3, $zero, $zero
  addiu    $a0, $zero, 38
  jal   0x8003DBE0
   addu  $a1, $zero, $zero
  addu  $s2, $v0, $zero
  lui   $at, %hi(ov54_bss_boulder_800FA370)
  sw    $s2, %lo(ov54_bss_boulder_800FA370)($at)
  jal   GetSpaceData
   addu  $a0, $zero, $zero
  addiu $a0, $s2, 0xc
  jal   0x800A0D50 # posmodel
   addiu $a1, $v0, 4
  addiu $a0, $s2, 0x24
  lui $a1, 0x3f4c
  ori $a1, $a1, 0xcccd
  addu  $a2, $a1, $zero
  jal   0x800A0D00
   addu  $a3, $a1, $zero
  jal   SleepProcess
   addiu    $a0, $zero, 30
  jal   PlaySound
   addiu    $a0, $zero, 139
  addu  $s7, $v0, $zero
  lui   $v0, %hi(ov54_boulder_space_indices)
  lh    $v0, %lo(ov54_boulder_space_indices)($v0)
  bltz  $v0, .ov54_L800F8D58
   addu  $s3, $zero, $zero
  addiu $s5, $s2, 0xc
  addiu $s6, $s2, 0x18
  sll   $s4, $s3, 1
.ov54_L800F8C14:
  lui   $t0, %hi(ov54_boulder_space_indices)
  addiu $t0, $t0, %lo(ov54_boulder_space_indices)
  addu  $s1, $s4, $t0
  jal   GetSpaceData
   lh    $a0, 0($s1)
  addiu $s0, $v0, 4
  addu  $a0, $s5, $zero
  addu  $a1, $s0, $zero
  jal   0x8004CCD0
   addu  $a2, $s6, $zero
  addu  $a0, $s5, $zero
  addu  $a1, $s0, $zero
  lui   $a3, 0x41a0
  jal   0x8004D648
   addu  $a2, $s5, $zero
  addu  $a0, $fp, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  lh    $v1, 0($s1)
  addiu    $v0, $zero, 6
  bnel  $v1, $v0, .ov54_L800F8D40
   addiu $s3, $s3, 1
  lui   $t0, %hi(ov54_boulder_space_indices_mid)
  addiu $t0, $t0, %lo(ov54_boulder_space_indices_mid)
  addu  $v0, $s4, $t0
  jal   GetSpaceData
   lh    $a0, 0($v0)
  addiu $a0, $sp, 0x10
  addiu $a1, $v0, 4
  jal   0x800A0E80
   addu  $a2, $s5, $zero
  addu  $a0, $s6, $zero
  addiu $a1, $sp, 0x10
  addu  $a2, $s6, $zero
  jal   0x8004D1EC
   addiu    $a3, $zero, 20
  lui    $at, 0x4218 # 38.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x34($s2)
  lui    $at, 0xC000 # -2.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x38($s2)
  jal   PlaySound
   addiu    $a0, $zero, 141
  jal   0x80060758
   addiu    $a0, $zero, 139
  lwc1  $f0, 0x38($s2)
  CVT.D.S $f0, $f0
  mtc1  $zero, $f2
  mtc1  $zero, $f3
  NOP
  C.EQ.D $f0, $f2
  NOP
  bc1t  .ov54_L800F8D28
   NOP
  mtc1  $zero, $f20
  mtc1  $zero, $f21
.ov54_L800F8D08:
  jal   SleepVProcess
   NOP
  lwc1  $f0, 0x38($s2)
  CVT.D.S $f0, $f0
  C.EQ.D $f0, $f20
  NOP
  bc1f  .ov54_L800F8D08
   NOP
.ov54_L800F8D28:
  jal   PlaySound
   addiu    $a0, $zero, 141
  jal   PlaySound
   addiu    $a0, $zero, 139
  addu  $s7, $v0, $zero
  addiu $s3, $s3, 1
.ov54_L800F8D40:
  sll   $v0, $s3, 1
  lui   $at, %hi(ov54_boulder_space_indices)
  addu  $at, $at, $v0
  lh    $v0, %lo(ov54_boulder_space_indices)($at)
  bgez  $v0, .ov54_L800F8C14
   sll   $s4, $s3, 1
.ov54_L800F8D58:
  sll   $a0, $s7, 0x10
  sra   $a0, $a0, 0x10
  jal   0x80060BC8
   addiu    $a1, $zero, 30
  jal   0x8003E694
   addu  $a0, $s2, $zero
  lui   $at, %hi(ov54_bss_boulder_800FA370)
  sw    $zero, %lo(ov54_bss_boulder_800FA370)($at)
  jal   SleepProcess
   addiu    $a0, $zero, 30
  addiu    $v0, $zero, 1
  lui   $at, %hi(ov54_bss_boulder_800FA36C)
  sh    $v0, %lo(ov54_bss_boulder_800FA36C)($at)
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x44($sp)
  lw    $fp, 0x40($sp)
  lw    $s7, 0x3c($sp)
  lw    $s6, 0x38($sp)
  lw    $s5, 0x34($sp)
  lw    $s4, 0x30($sp)
  lw    $s3, 0x2c($sp)
  lw    $s2, 0x28($sp)
  lw    $s1, 0x24($sp)
  lw    $s0, 0x20($sp)
  ldc1  $f20, 0x48($sp)
  jr $ra
   addiu $sp, $sp, 0x50

ov54_event20coindoor_end_inner_process:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  sdc1  $f22, 0x20($sp)
  jal   0x800633A8
   sdc1  $f20, 0x18($sp)
  lw    $s0, 0x8c($v0)
  jal   SleepProcess
   addiu    $a0, $zero, 5
  jal   PlaySound
   addiu    $a0, $zero, 146
  lui    $at, 0x3F80 # 1.000000
  mtc1  $at, $f2
  lwc1  $f0, 0x28($s0)
  C.LT.S $f0, $f2
  NOP
  bc1f  .ov54_L800F8E48
   NOP
  lui    $at, 0x3D4C
  ori $at, $at, 0xcccd
  mtc1  $at, $f22
  lui    $at, 0x3F80 # 1.000000
  mtc1  $at, $f20
.ov54_L800F8E24:
  jal   SleepVProcess
   NOP
  lwc1  $f0, 0x28($s0)
  ADD.S $f0, $f0, $f22
  C.LT.S $f0, $f20
  NOP
  NOP
  bc1t  .ov54_L800F8E24
   swc1  $f0, 0x28($s0)
.ov54_L800F8E48:
  lui    $at, 0x3F80 # 1.000000
  mtc1  $at, $f0
  NOP
  swc1  $f0, 0x28($s0)
  jal   PlaySound
   addiu    $a0, $zero, 147
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  ldc1  $f22, 0x20($sp)
  ldc1  $f20, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_event20coindoor_end_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s0, $a0, $zero
  lui   $a0, %hi(ov54_event20coindoor_end_inner_process)
  addiu $a0, $a0, %lo(ov54_event20coindoor_end_inner_process)
  addiu    $a1, $zero, 18432
  addu  $a2, $zero, $zero
  jal   InitProcess
   addu  $a3, $zero, $zero
  sw    $s0, 0x8c($v0)
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_event20coindoor_process:
  addiu $sp, $sp, -0x30
  sw    $ra, 0x18($sp)
  sw    $s1, 0x14($sp)
  sw    $s0, 0x10($sp)
  sdc1  $f22, 0x28($sp)
  jal   0x800633A8
   sdc1  $f20, 0x20($sp)
  lw    $s0, 0x8c($v0)
  jal   SleepProcess
   addiu    $a0, $zero, 5
  addiu    $a0, $zero, -1
  addu  $a1, $zero, $zero
  jal   0x80058A4C
   addiu    $a2, $zero, 10
  addu  $s1, $v0, $zero
  jal   PlaySound
   addiu    $a0, $zero, 146
  mtc1  $zero, $f2
  lwc1  $f0, 0x28($s0)
  C.LT.S $f2, $f0
  NOP
  NOP
  bc1fl .ov54_L800F8F54
   sw    $zero, 0x28($s0)
  lui    $at, 0x3D4C
  ori $at, $at, 0xcccd
  mtc1  $at, $f22
  mtc1  $zero, $f20
.ov54_L800F8F2C:
  jal   SleepVProcess
   NOP
  lwc1  $f0, 0x28($s0)
  SUB.S $f0, $f0, $f22
  C.LT.S $f20, $f0
  NOP
  NOP
  bc1t  .ov54_L800F8F2C
   swc1  $f0, 0x28($s0)
  sw    $zero, 0x28($s0)
.ov54_L800F8F54:
  jal   PlaySound
   addiu    $a0, $zero, 147
  jal   0x80058AD0
   addu  $a0, $s1, $zero
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  ldc1  $f22, 0x28($sp)
  ldc1  $f20, 0x20($sp)
  jr $ra
   addiu $sp, $sp, 0x30

ov54_event20coindoor_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  addu  $s0, $a0, $zero
  lui   $a0, %hi(ov54_event20coindoor_process)
  addiu $a0, $a0, %lo(ov54_event20coindoor_process)
  addiu    $a1, $zero, 18432
  addu  $a2, $zero, $zero
  jal   InitProcess
   addu  $a3, $zero, $zero
  sw    $s0, 0x8c($v0)
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_event20coindoor_4D_57:
  addiu $sp, $sp, -0x30
  sw    $ra, 0x28($sp)
  sw    $s3, 0x24($sp)
  sw    $s2, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  jal   GetPlayerStruct
   addiu    $a0, $zero, -1
  addu  $s3, $v0, $zero
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, -1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  lh    $v0, 8($s3)
  slti  $v0, $v0, 0x14
  beq  $v0, $zero, .ov54_L800F90A0
   NOP
.ov54_L800F9008:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F9028
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F9008
   NOP
.ov54_L800F9028:
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, 60
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 17
  jal   CreateTextWindow
   addiu    $a3, $zero, 2
  sll   $s0, $v0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  addiu    $a1, $zero, 390 # "You hear a voice beyond the door: People who don't have 20 coins can't come this way!"
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  lbu   $a1, 0x18($s3)
  jal   0x8004DBD4
   addu  $a0, $s0, $zero
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  lbu   $a0, 0x18($s3)
  addiu    $a1, $zero, 10
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  j     .ov54_L800F9190
   NOP
.ov54_L800F90A0:
  jal   0x800633A8
   NOP
  lui   $a0, %hi(ov54_bss_20_coin_gate_2)
  lw    $a0, %lo(ov54_bss_20_coin_gate_2)($a0)
  jal   ov54_event20coindoor_inner
   addu  $s0, $v0, $zero
  addu  $a0, $s0, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  jal   ov54_func_all_gates_800F7920
   NOP
  lui   $a1, %hi(ov54_event20coindoor_4D_57_spaces)
  addiu $a1, $a1, %lo(ov54_event20coindoor_4D_57_spaces)
  jal   0x8003C218
   addiu    $a0, $zero, -1
  addu  $s2, $v0, $zero
  addu  $a0, $s2, $zero
  addiu    $a1, $zero, -1
  jal   0x8003C060
   addu  $a2, $zero, $zero
  jal   PlayerIsCPU
   addiu    $a0, $zero, -1
  beq  $v0, $zero, .ov54_L800F9148
   NOP
  lui   $a0, %hi(ov54_ai_entry_door7A)
  addiu $a0, $a0, %lo(ov54_ai_entry_door7A)
  jal   0x8003E9B0 # Determine AI choice
   addu  $s0, $zero, $zero
  sll   $v0, $v0, 0x10
  sra   $s1, $v0, 0x10
  blez  $s1, .ov54_L800F9140
   addu  $a0, $s2, $zero
.ov54_L800F9128:
  jal   0x8003BE84
   addiu    $a1, $zero, -2
  addiu $s0, $s0, 1
  slt   $v0, $s0, $s1
  bne  $v0, $zero, .ov54_L800F9128
   addu  $a0, $s2, $zero
.ov54_L800F9140:
  jal   0x8003BE84
   addiu    $a1, $zero, -4
.ov54_L800F9148:
  jal   DirectionPrompt
   addu  $a0, $s2, $zero
  addu  $s0, $v0, $zero
  jal   0x8003B908
   addu  $a0, $s2, $zero
  jal   ov54_func_all_gates_800F79D0
   NOP
  bne  $s0, $zero, .ov54_L800F9178
   addiu    $a1, $zero, 10
  lbu   $a0, 0x18($s3)
  j     .ov54_L800F917C
   addiu    $a1, $zero, 11
.ov54_L800F9178:
  lbu   $a0, 0x18($s3)
.ov54_L800F917C:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lui   $a0, %hi(ov54_bss_20_coin_gate_2)
  jal   ov54_event20coindoor_end_inner
   lw    $a0, %lo(ov54_bss_20_coin_gate_2)($a0)
.ov54_L800F9190:
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x28($sp)
  lw    $s3, 0x24($sp)
  lw    $s2, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x30

ov54_event20coindoor_2A_2E:
  addiu $sp, $sp, -0x28
  sw    $ra, 0x24($sp)
  sw    $s2, 0x20($sp)
  sw    $s1, 0x1c($sp)
  sw    $s0, 0x18($sp)
  jal   GetPlayerStruct
   addiu    $a0, $zero, -1
  addu  $s1, $v0, $zero
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, -1 # stand
  jal   0x80052BE8 # change player animation
   addiu    $a2, $zero, 2
  lh    $v0, 8($s1)
  slti  $v0, $v0, 0x14
  beq  $v0, $zero, .ov54_L800F928C
   NOP
.ov54_L800F91F4:
  jal   0x8004B850
   NOP
  beq  $v0, $zero, .ov54_L800F9214
   NOP
  jal   SleepVProcess
   NOP
  j     .ov54_L800F91F4
   NOP
.ov54_L800F9214:
  jal   SleepVProcess
   NOP
  addiu    $a0, $zero, 60
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 17
  jal   CreateTextWindow
   addiu    $a3, $zero, 2
  sll   $s0, $v0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  addiu    $a1, $zero, 390 # You hear a voice behind the door: "People who don't have 20 coins can't come this way"
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  lbu   $a1, 0x18($s1)
  jal   0x8004DBD4
   addu  $a0, $s0, $zero
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 16
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  j     .ov54_L800F9378
   NOP
.ov54_L800F928C:
  jal   0x800633A8
   NOP
  lui   $a0, %hi(ov54_bss_20_coin_gate_3)
  lw    $a0, %lo(ov54_bss_20_coin_gate_3)($a0)
  jal   ov54_event20coindoor_inner
   addu  $s0, $v0, $zero
  addu  $a0, $s0, $zero
  jal   0x80063270
   addu  $a1, $v0, $zero
  jal   0x80063358
   NOP
  jal   ov54_func_all_gates_800F7920
   NOP
  lui   $a1, %hi(ov54_event20coindoor_2A_2E_spaces)
  addiu $a1, $a1, %lo(ov54_event20coindoor_2A_2E_spaces)
  jal   0x8003C218
   addiu    $a0, $zero, -1
  addu  $s2, $v0, $zero
  addu  $a0, $s2, $zero
  addiu    $a1, $zero, -1
  jal   0x8003C060
   addu  $a2, $zero, $zero
  jal   PlayerIsCPU
   addiu    $a0, $zero, -1 # current player
  beq  $v0, $zero, .ov54_L800F9334
   NOP
  lui   $a0, %hi(ov54_ai_entry_door7B)
  addiu $a0, $a0, %lo(ov54_ai_entry_door7B)
  jal   0x8003E9B0 # Determine AI choice
   addu  $s0, $zero, $zero
  sll   $v0, $v0, 0x10
  sra   $s1, $v0, 0x10
  blez  $s1, .ov54_L800F932C
   addu  $a0, $s2, $zero
.ov54_L800F9314:
  jal   0x8003BE84
   addiu    $a1, $zero, -2
  addiu $s0, $s0, 1
  slt   $v0, $s0, $s1
  bne  $v0, $zero, .ov54_L800F9314
   addu  $a0, $s2, $zero
.ov54_L800F932C:
  jal   0x8003BE84
   addiu    $a1, $zero, -4
.ov54_L800F9334:
  jal   DirectionPrompt
   addu  $a0, $s2, $zero
  addu  $s0, $v0, $zero
  jal   0x8003B908
   addu  $a0, $s2, $zero
  jal   ov54_func_all_gates_800F79D0
   NOP
  bne  $s0, $zero, .ov54_L800F9360
   addiu    $a0, $zero, -1
  j     .ov54_L800F9364
   addiu    $a1, $zero, 8
.ov54_L800F9360:
  addiu    $a1, $zero, 16
.ov54_L800F9364:
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lui   $a0, %hi(ov54_bss_20_coin_gate_3)
  jal   ov54_event20coindoor_end_inner
   lw    $a0, %lo(ov54_bss_20_coin_gate_3)($a0)
.ov54_L800F9378:
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x24($sp)
  lw    $s2, 0x20($sp)
  lw    $s1, 0x1c($sp)
  lw    $s0, 0x18($sp)
  jr $ra
   addiu $sp, $sp, 0x28

ov54_chain_event_5B:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 9
  jal   SetNextChainAndSpace
   addiu    $a2, $zero, 1
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_chain_event_56_34:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 2
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_chain_event_3A_30:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 4
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_chain_event_54_1C:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 9
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_chain_event_9_15:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 7
  jal   SetNextChainAndSpace
   addu  $a2, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_koopa_start_space_chain_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addu  $a1, $zero, $zero
  jal   SetNextChainAndSpace
   addiu    $a2, $zero, 1
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_receive_koopa_bonus:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x1c($sp)
  sw    $s2, 0x18($sp)
  sw    $s1, 0x14($sp)
  jal   GetCurrentPlayerIndex
   sw    $s0, 0x10($sp)
  addu  $s1, $v0, $zero
  sll   $a0, $s1, 0x10
  jal   0x800405DC
   sra   $a0, $a0, 0x10
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, -1
  jal   0x80052BE8
   addiu    $a2, $zero, 2
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 66
  bnel $v0, $zero, .ov54_L800F94F0
   addiu    $a0, $zero, 65
  addiu    $a0, $zero, 72
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 16
  jal   CreateTextWindow
   addiu    $a3, $zero, 3
  addu  $s0, $v0, $zero
  sll   $v0, $v0, 0x10
  sra   $a0, $v0, 0x10
  addiu    $a1, $zero, 569 # "Nice work! Take this 10 Coin Bonus! Use it wisely"
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  j     .ov54_L800F9520
   addiu    $s2, $zero, 10
.ov54_L800F94F0:
  addiu    $a1, $zero, 60
  addiu    $a2, $zero, 17
  jal   CreateTextWindow
   addiu    $a3, $zero, 3
  addu  $s0, $v0, $zero
  sll   $v0, $v0, 0x10
  sra   $a0, $v0, 0x10
  addiu    $a1, $zero, 570 # "Nice work! Take this 20 Coin Bonus! Just a little bit longer..."
  addiu    $a2, $zero, -1
  jal   LoadStringIntoWindow
   addiu    $a3, $zero, -1
  addiu    $s2, $zero, 20
.ov54_L800F9520:
  sll   $s0, $s0, 0x10
  sra   $s0, $s0, 0x10
  addu  $a0, $s0, $zero
  jal   SetTextCharsPerFrame
   addu  $a1, $zero, $zero
  jal   ShowTextWindow
   addu  $a0, $s0, $zero
  jal   PlaySound
   addiu $a0, $zero, 1074
  sll   $s1, $s1, 0x10
  sra   $s1, $s1, 0x10
  addu  $a0, $s0, $zero
  jal   0x8004DBD4
   addu  $a1, $s1, $zero
  jal   HideTextWindow
   addu  $a0, $s0, $zero
  addu  $s0, $s2, $zero
  addu  $a0, $s1, $zero
  jal   func_80055960
   addu  $a1, $s0, $zero
  addu  $a0, $s1, $zero
  jal   func_80045778
   addu  $a1, $s0, $zero
  jal   SleepProcess
   addiu    $a0, $zero, 30 # 30 frames
  jal   0x8003FEFC
   addu  $a0, $s1, $zero
  lw    $ra, 0x1c($sp)
  lw    $s2, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_koopa_start_space_event_inner:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x14($sp)
  sw    $s0, 0x10($sp)
  lui   $s0, %hi(D_800ED192)
  addiu $s0, $s0, %lo(D_800ED192)
  lhu   $v0, 0($s0)
  addiu $v0, $v0, 1
  sh    $v0, 0($s0)
  jal   IsBoardFeatureDisabled
   addiu $a0, $zero, 66
  bne  $v0, $zero, .ov54_L800F965C
   lui $v1, 0x6666
  lhu   $v0, 0($s0)
  sll   $v0, $v0, 0x10
  sra   $a0, $v0, 0x10
  ori $v1, $v1, 0x6667
  mult  $a0, $v1
  mfhi  $a3
  sra   $v1, $a3, 2
  sra   $v0, $v0, 0x1f
  subu  $v1, $v1, $v0
  sll   $v0, $v1, 2
  addu  $v0, $v0, $v1
  sll   $v0, $v0, 1
  subu  $a0, $a0, $v0
  sll   $a0, $a0, 0x10
  beq  $a0, $zero, .ov54_L800F9624
   NOP
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 77
  bne  $v0, $zero, .ov54_L800F965C
   NOP
.ov54_L800F9624:
  jal   IsBoardFeatureDisabled
   addiu    $a0, $zero, 77
  beq  $v0, $zero, .ov54_L800F963C
   addiu    $a0, $zero, -1
  jal   0x80058910
   addiu    $a1, $zero, 1
.ov54_L800F963C:
  jal   SetBoardFeatureEnabled
   addiu    $a0, $zero, 77
  addiu    $a0, $zero, 95
  addu  $a1, $zero, $zero
  jal   0x800587EC
   addiu    $a2, $zero, 1
  j     .ov54_L800F9664
   NOP
.ov54_L800F965C:
  jal   ov54_receive_koopa_bonus
   NOP
.ov54_L800F9664:
  lw    $ra, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_koopa_start_space_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 8
  jal   0x8004D2A4
   addiu    $a2, $zero, 93
  jal   ov54_koopa_start_space_event_inner
   NOP
  jal   EndProcess
   addu  $a0, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_star_space_passing_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   GetCurrentSpaceIndex
   NOP
  sll   $v0, $v0, 0x10
  jal   ov54_star_space_event_inner
   sra   $a0, $v0, 0x10
  sll   $v0, $v0, 0x10
  sra   $v0, $v0, 0x10
  addiu    $v1, $zero, 1
  bne   $v0, $v1, .ov54_L800F9700 # test if player bought star?
   addiu    $a0, $zero, 68
  addu  $a1, $zero, $zero
  jal   0x800587EC
   addiu    $a2, $zero, 2
  jal   ov54_get_next_toad_index
   NOP
  sll   $v0, $v0, 0x10
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 8
  jal   0x8004D2A4
   sra   $a2, $v0, 0x10
.ov54_L800F9700:
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_star_space_chance_landon_event:
  addiu $sp, $sp, -0x20
  sw    $ra, 0x18($sp)
  sw    $s1, 0x14($sp)
  jal   GetCurrentSpaceIndex
   sw    $s0, 0x10($sp)
  sll   $v0, $v0, 0x10
  jal   ov54_star_space_event_inner
   sra   $a0, $v0, 0x10
  sll   $v0, $v0, 0x10
  sra   $v0, $v0, 0x10
  addiu  $v1, $zero, 2
  bne   $v0, $v1, .ov54_L800F9784
   addu  $s1, $zero, $zero
.ov54_L800F9740:
  jal   GetPlayerStruct
   addu  $a0, $s1, $zero
  jal   GetCurrentPlayerIndex
   addu  $s0, $v0, $zero
  sll   $v0, $v0, 0x10
  sra   $v0, $v0, 0x10
  xor   $v0, $s1, $v0
  sltu  $v0, $zero, $v0
  sb    $v0, 0($s0)
  addiu $s1, $s1, 1
  slti  $v0, $s1, 4
  bne  $v0, $zero, .ov54_L800F9740
   addiu    $a0, $zero, 1
  addu  $a1, $zero, $zero
  addiu    $a2, $zero, 5
  jal   0x800587BC
   addiu    $a3, $zero, 1
.ov54_L800F9784:
  lw    $ra, 0x18($sp)
  lw    $s1, 0x14($sp)
  lw    $s0, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x20

ov54_boo_space_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   GetCurrentSpaceIndex
   NOP
  sll   $v0, $v0, 0x10
  sra   $v1, $v0, 0x10
  addiu    $v0, $zero, 10 # bottom left boo invisible space index
  beq   $v1, $v0, ov54_boo_space_event_passing_bottom_boo
   addiu    $v0, $zero, 129 # upper middle boo invisible space index
  bne   $v1, $v0, ov54_boo_space_event_goto_boo_scene
   addiu    $a0, $zero, 101 # Boo overlay index
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 8
  j     .ov54_L800F97E0
   addiu    $a2, $zero, 111 # upper middle boo standing space index
ov54_boo_space_event_passing_bottom_boo:
  addiu    $a0, $zero, -1
  addiu    $a1, $zero, 8
  addiu    $a2, $zero, 98 # bottom left boo standing space index
.ov54_L800F97E0:
  jal   0x8004D2A4
   NOP
  addiu    $a0, $zero, 101 # Boo overlay index
ov54_boo_space_event_goto_boo_scene:
  addu  $a1, $zero, $zero
  jal   0x800587EC  # 0x800587BC wrapper, $a3 = 0 default
   addiu    $a2, $zero, 1
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_bowser_space_event:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  addiu    $a0, $zero, -1 # current player
  addiu    $a1, $zero, 8
  jal   0x8004D2A4
   addiu    $a2, $zero, 112 # abs space index of bowser standing
  addiu $a0, $zero, 72 # overlay number
  addu  $a1, $zero, $zero
  addiu $a2, $zero, 3
  jal   0x800587BC
   addiu $a3, $zero, 1
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

ov54_overlaycall4:
  addiu $sp, $sp, -0x18
  sw    $ra, 0x10($sp)
  jal   func_8001D240
   addiu    $a0, $zero, 2 # camera count
  lui   $a1, %hi(ov54_data_screen_dimensions)
  addiu $a1, $a1, %lo(ov54_data_screen_dimensions)
  jal   0x8001D4D4
   addiu    $a0, $zero, 1
  jal   ov54_setup_routine
   NOP
  jal   0x800584F0
   addiu    $a0, $zero, 2
  lui   $a0, %hi(ov54_show_next_star_spot)
  addiu $a0, $a0, %lo(ov54_show_next_star_spot)
  addiu    $a1, $zero, 4101
  addu  $a2, $zero, $zero
  jal   InitProcess
   addu  $a3, $zero, $zero
  lw    $ra, 0x10($sp)
  jr $ra
   addiu $sp, $sp, 0x18

.align 16


.section .rodata, "a"

# 800F9890
ov54_overlaycalls:
.word 0x00000000, ov54_overlaycall0
.word 0x00010000, ov54_overlaycall1
.word 0x00020000, ov54_overlaycall2
.word 0x00030000, ov54_overlaycall3
.word 0x00040000, ov54_overlaycall4
.word 0xFFFF0000, 0x00000000

ov54_data_screen_dimensions:
.word 0x00000000
.word 0x00000000
.word 0x43A00000 # 320
.word 0x43700000 # 240

ov54_func_800F663C_data0:
.word 0x00030005, 0x00060000, 0x00010002, 0x00040000

# 0x800F98E0
ov54_func_800F663C_data1:
.word 0x00000000, 0x00000001, 0x00010001, 0x00030000

ov54_data_mystery_40s_list:
.word 0x00460047, 0x00480049, 0x004A004B, 0x004C0000

# 0x800F9900
ov54_star_space_indices:
.word 0x00770080, 0x007F0084, 0x00830075, 0x00760000

# 0x800F9910:
ov54_toad_space_indices:
.word 0x0061006E, 0x006D0072, 0x0071005F, 0x00600000

# 0x800F9920
ov54_data_star_related_800F9920:
.word 0x00000001, 0x00070003

# 0x800F9928
ov54_toad_space_indices_repeat:
.word 0x0061006E, 0x006D0072, 0x0071005F, 0x00600000

ov54_data_mystery_40s_list_2:
.word 0x00460047, 0x00480049, 0x004A004B, 0x004C0000

ov54_RO_800F9948:
.hword 6
ov54_RO_800F994A:
.hword 0
.word 0x0000FFFD, 0x0000FFF8, 0xFFFD0000, 0xFFFE0000, 0xFFFE0000, 0xFFFD0000

# thwomp-related
ov54_RO_800F9964:
.hword 0, 1, 2, 0

ov54_thwomp_spaces_left:
.hword 0x68, 0x66, 0x67, 0

ov54_thwomp_spaces_right:
.hword 0x65, 0x6C, 0x5E, 0

ov54_thwomp_event_space_indices:
.hword 0x74, 0x7E, 0x85, 0

ov54_thwomp_DO_800F9984:
.word 0x00000001, 0x00000068 # second word unused?

ov54_boo_space_indices:
.hword 0x6F, 0x62

ov54_gate_20_coins_space_indices:
.hword 0x64, 0x63

ov54_gate_20_coins_player_space_indices:
.hword 0x7A, 0x7B

ov54_ai_entry_thwomp74_1_1_1:
.word 0x03000000, 0x0000003F, 0x0001503C
.word 0x00000000, 0x00000000, 0x00011E32
ov54_ai_entry_thwomp74_1_1:
.word 0x01000000, 0x00000028, 0x00016450
.word 0x01000000, 0x0000001E, 0x00015F46
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp74_1_1_1
.word 0x03000000, 0x0000003F, 0x00014632
.word 0x00000000, 0x00000000, 0x00011E28
ov54_ai_entry_thwomp74_1_2_1:
.word 0x03000000, 0x0000001F, 0x0001503C
.word 0x00000000, 0x00000000, 0x00012832
ov54_ai_entry_thwomp74_1_2:
.word 0x01000000, 0x00000028, 0x0001645A
.word 0x01000000, 0x0000001E, 0x00015F50
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp74_1_2_1
.word 0x03000000, 0x0000001F, 0x00014632
.word 0x00000000, 0x00000000, 0x00011E32
ov54_ai_entry_thwomp74_1:
.word 0x02000000, 0x00000001, 0x00006450
.word 0x02000000, 0x00000002, ov54_ai_entry_thwomp74_1_1
.word 0x02000000, 0x00000004, ov54_ai_entry_thwomp74_1_2
.word 0x01000000, 0x00000014, 0x00015F46
.word 0x00000000, 0x00000000, 0x0001503C
ov54_ai_entry_thwomp74_2_1:
.word 0x03000000, 0x0000000F, 0x00005F50
.word 0x00000000, 0x00000000, 0x00003C3C
ov54_ai_entry_thwomp74_2_2:
.word 0x03000000, 0x0000000F, 0x00004646
.word 0x00000000, 0x00000000, 0x00001428
ov54_ai_entry_thwomp74_2:
.word 0x02000000, 0x0000007E, 0x0001645A
.word 0x01000000, 0x0000001E, 0x00005F50
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp74_2_1
.word 0x00000000, 0x00000000, ov54_ai_entry_thwomp74_2_2
ov54_ai_entry_thwomp74:
.word 0x04000000, 0x00010000, ov54_ai_entry_thwomp74_1
.word 0x00000000, 0x00000000, ov54_ai_entry_thwomp74_2

ov54_ai_entry_thwomp7E_1_1_1:
.word 0x03000000, 0x00000018, 0x0001141E
.word 0x00000000, 0x00000000, 0x00016450
ov54_ai_entry_thwomp7E_1_1:
.word 0x01000000, 0x0000001E, ov54_ai_entry_thwomp7E_1_1_1
.word 0x03000000, 0x00000007, 0x00015F50
.word 0x00000000, 0x00000000, 0x00011E28
ov54_ai_entry_thwomp7E_1_2:
.word 0x03000000, 0x00000118, 0x00013232
.word 0x00000000, 0x00000000, 0x00010028
ov54_ai_entry_thwomp7E_1:
.word 0x02000000, 0x00000004, ov54_ai_entry_thwomp7E_1_1
.word 0x02000000, 0x00000002, 0x00006450
.word 0x02000000, 0x00000001, ov54_ai_entry_thwomp7E_1_2
.word 0x03000000, 0x00000200, 0x0001463C
.word 0x00000000, 0x00000000, 0x00010028
ov54_ai_entry_thwomp7E_2_1_1:
.word 0x03000000, 0x00000007, 0x00016450
.word 0x03000000, 0x00000007, 0x00011432
.word 0x00000000, 0x00000000, 0x00016450
ov54_ai_entry_thwomp7E_2_1:
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp7E_2_1_1
.word 0x03000000, 0x00000007, 0x00016450
.word 0x03000000, 0x00000007, 0x00011432
.word 0x00000000, 0x00000000, 0x00012846
ov54_ai_entry_thwomp7E_2_2_1:
.word 0x03000000, 0x0000000F, 0x00006446
.word 0x00000000, 0x00000000, 0x0000283C
ov54_ai_entry_thwomp7E_2_2:
.word 0x01000000, 0x0000001E, 0x00006450
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp7E_2_2_1
.word 0x03000000, 0x0000000F, 0x00005A46
.word 0x00000000, 0x00000000, 0x00001E32
ov54_ai_entry_thwomp7E_2_3:
.word 0x03000000, 0x000001FF, 0x00000514
.word 0x00000000, 0x00000000, 0x00003232
ov54_ai_entry_thwomp7E_2:
.word 0x02000000, 0x00000004, ov54_ai_entry_thwomp7E_2_1
.word 0x02000000, 0x00000002, ov54_ai_entry_thwomp7E_2_2
.word 0x02000000, 0x00000001, ov54_ai_entry_thwomp7E_2_3
.word 0x03000000, 0x00000118, 0x00005046
.word 0x00000000, 0x00000000, 0x00000514
ov54_ai_entry_thwomp7E:
.word 0x04000000, 0x00110000, ov54_ai_entry_thwomp7E_1
.word 0x00000000, 0x00000000, ov54_ai_entry_thwomp7E_2

ov54_ai_entry_thwomp85_1_1_1:
.word 0x03000000, 0x0000007F, 0x00016450
.word 0x00000000, 0x00000000, 0x00011E32
ov54_ai_entry_thwomp85_1_1:
.word 0x01000000, 0x0000001E, 0x00016450
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp85_1_1_1
.word 0x03000000, 0x0000007F, 0x00016450
.word 0x00000000, 0x00000000, 0x00011428
ov54_ai_entry_thwomp85_1:
.word 0x02000000, 0x00000020, 0x00005F50
.word 0x02000000, 0x00000040, ov54_ai_entry_thwomp85_1_1
.word 0x01000000, 0x00000037, 0x0001463C
.word 0x01000000, 0x0000001E, 0x00013228
.word 0x00000000, 0x00000000, 0x0001141E
ov54_ai_entry_thwomp85_2_1_1:
.word 0x03000000, 0x00000003, 0x00006450
.word 0x00000000, 0x00000000, 0x00001428
ov54_ai_entry_thwomp85_2_1:
.word 0x01000000, 0x0000001E, 0x00006450
.word 0x01000000, 0x00000014, ov54_ai_entry_thwomp85_2_1_1
.word 0x03000000, 0x00000003, 0x00005F50
.word 0x00000000, 0x00000000, 0x00000A1E
ov54_ai_entry_thwomp85_2:
.word 0x02000000, 0x00000020, ov54_ai_entry_thwomp85_2_1
.word 0x02000000, 0x00000040, 0x00015F50
.word 0x00000000, 0x00000000, 0x00001428
ov54_ai_entry_thwomp85:
.word 0x04000000, 0x00200000, ov54_ai_entry_thwomp85_1
.word 0x00000000, 0x00000000, ov54_ai_entry_thwomp85_2

ov54_ai_entry_door7A_1:
.word 0x03000000, 0x00000004, 0x00002832
.word 0x00000000, 0x00000000, 0x00005A46
ov54_ai_entry_door7A_2_1:
.word 0x05000000, 0x00000001, 0x00005032
.word 0x05000000, 0x00000006, 0x00003232
.word 0x00000000, 0x00000000, 0x00001E28
ov54_ai_entry_door7A_2_2:
.word 0x05000000, 0x00000001, 0x00001E28
.word 0x05000000, 0x00000006, 0x0000463C
.word 0x00000000, 0x00000000, 0x00005046
ov54_ai_entry_door7A_2:
.word 0x03000000, 0x00000010, ov54_ai_entry_door7A_2_1
.word 0x03000000, 0x00000080, ov54_ai_entry_door7A_2_2
.word 0x05000000, 0x00000001, 0x00001E28
.word 0x05000000, 0x00000006, 0x00003C32
.word 0x00000000, 0x00000000, 0x00005A46
ov54_ai_entry_door7A:
.word 0x02000000, 0x00000016, ov54_ai_entry_door7A_1
.word 0x02000000, 0x00000068, ov54_ai_entry_door7A_2
.word 0x00000000, 0x00000000, 0x00006450

ov54_ai_entry_door7B_1_1_1:
.word 0x05000000, 0x00000001, 0x00003C32
.word 0x05000000, 0x00000006, 0x00001428
.word 0x00000000, 0x00000000, 0x00000514
ov54_ai_entry_door7B_1_1:
.word 0x03000000, 0x00000030, ov54_ai_entry_door7B_1_1_1
.word 0x00000000, 0x00000000, 0x00006450
ov54_ai_entry_door7B_1_2:
.word 0x05000000, 0x00000001, 0x00002832
.word 0x05000000, 0x00000006, 0x00001428
.word 0x00000000, 0x00000000, 0x00000514
ov54_ai_entry_door7B_1:
.word 0x01000000, 0x0000001E, ov54_ai_entry_door7B_1_1
.word 0x03000000, 0x0000004F, 0x00005A46
.word 0x03000000, 0x00000030, ov54_ai_entry_door7B_1_2
.word 0x05000000, 0x00000001, 0x00001E32
.word 0x05000000, 0x00000006, 0x00000A1E
.word 0x00000000, 0x00000000, 0x00000014
ov54_ai_entry_door7B_2_1:
.word 0x03000000, 0x000003F0, 0x00001E32
.word 0x00000000, 0x00000000, 0x00001428
ov54_ai_entry_door7B_2:
.word 0x01000000, 0x0000001E, ov54_ai_entry_door7B_2_1
.word 0x03000000, 0x000003F0, 0x00001428
.word 0x00000000, 0x00000000, 0x00000A1E
ov54_ai_entry_door7B:
.word 0x02000000, 0x00000010, ov54_ai_entry_door7B_1
.word 0x02000000, 0x00000007, ov54_ai_entry_door7B_2
.word 0x00000000, 0x00000000, 0x00000014

ov54_thwomp_split_74_space_indices:
.hword 0x48, 0x45, 0xFFFF, 0

ov54_thwomp_split_74_list_entry:
.word 0x00010002, ov54_thwomp_split_74_passing_event
.word 0x00020001, ov54_thwomp_split_74_2_event
.word 0, 0

ov54_thwomp_split_7E_space_indices:
.hword 0x42, 0x38, 0xFFFF, 0

ov54_thwomp_split_7E_list_entry:
.word 0x00010002, ov54_thwomp_split_7E_passing_event
.word 0x00020001, ov54_thwomp_split_7E_2_event
.word 0, 0

ov54_thwomp_split_85_space_indices:
.hword 0x1A, 0x25, 0xFFFF, 0

ov54_thwomp_split_85_list_entry:
.word 0x00010002, ov54_thwomp_split_85_passing_event
.word 0x00020001, ov54_thwomp_split_85_2_event
.word 0, 0

ov54_post_thwomp_list_entry:
.word 0x00010002, ov54_post_thwomp_intersection_event
.word 0, 0

ov54_boulder_space_indices:
.hword 0x1
ov54_boulder_space_indices_mid:
.hword 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0xFFFF

ov54_boulder_event_list_entry:
.word 0x00030002, ov54_boulder_event
.word 0, 0

ov54_event20coindoor_4D_57_spaces:
.hword 0x4D, 0x57, 0xFFFF, 0

ov54_event20coindoor_4D_57_list_entry:
.word 0x00010002, ov54_event20coindoor_4D_57
.word 0, 0

ov54_event20coindoor_2A_2E_spaces:
.hword 0x2A, 0x2E, 0xFFFF, 0

ov54_event20coindoor_2A_2E_list_entry:
.word 0x00010002, ov54_event20coindoor_2A_2E
.word 0, 0

ov54_chain_event_5B_list_entry:
.word 0x00010001, ov54_chain_event_5B
.word 0, 0

ov54_chain_event_56_34_list_entry:
.word 0x00010001, ov54_chain_event_56_34
.word 0, 0

ov54_chain_event_3A_30_list_entry:
.word 0x00010001, ov54_chain_event_3A_30
.word 0, 0

ov54_chain_event_54_1C_list_entry:
.word 0x00010001, ov54_chain_event_54_1C
.word 0, 0

ov54_chain_event_9_15_list_entry:
.word 0x00010001, ov54_chain_event_9_15
.word 0, 0

ov54_koopa_space_event_list_entry_main:
.word 0x00010001, ov54_koopa_start_space_chain_event
.word 0, 0

ov54_koopa_space_event_list_entry:
.word 0x00010001, ov54_koopa_start_space_chain_event
.word 0x00010002, ov54_koopa_start_space_event
.word 0, 0

ov54_star_space_event_list_entry:
.word 0x00010001, ov54_star_space_passing_event
.word 0x00030001, ov54_star_space_chance_landon_event
.word 0, 0

ov54_boo_space_event_list_entry:
.word 0x00010001, ov54_boo_space_event
.word 0, 0

ov54_bowser_space_event_list_entry:
.word 0x00010001, ov54_bowser_space_event
.word 0, 0

ov54_main_event_table:
.word 0x00770000, ov54_star_space_event_list_entry
.word 0x00800000, ov54_star_space_event_list_entry
.word 0x007F0000, ov54_star_space_event_list_entry
.word 0x00840000, ov54_star_space_event_list_entry
.word 0x00830000, ov54_star_space_event_list_entry
.word 0x00750000, ov54_star_space_event_list_entry
.word 0x00760000, ov54_star_space_event_list_entry
.word 0x00740000, ov54_thwomp_split_74_list_entry
.word 0x00450000, ov54_post_thwomp_list_entry
.word 0x00480000, ov54_post_thwomp_list_entry
.word 0x00380000, ov54_post_thwomp_list_entry
.word 0x00420000, ov54_post_thwomp_list_entry
.word 0x001A0000, ov54_post_thwomp_list_entry
.word 0x00250000, ov54_post_thwomp_list_entry
.word 0x007E0000, ov54_thwomp_split_7E_list_entry
.word 0x00850000, ov54_thwomp_split_85_list_entry
.word 0x007A0000, ov54_event20coindoor_4D_57_list_entry
.word 0x007B0000, ov54_event20coindoor_2A_2E_list_entry
.word 0x002F0000, ov54_boulder_event_list_entry
.word 0x00330000, ov54_boulder_event_list_entry
.word 0x00350000, ov54_boulder_event_list_entry
.word 0x00220000, ov54_boulder_event_list_entry
.word 0x00210000, ov54_boulder_event_list_entry
.word 0x00590000, ov54_boulder_event_list_entry
.word 0x00160000, ov54_boulder_event_list_entry
.word 0x000D0000, ov54_boulder_event_list_entry
.word 0x000C0000, ov54_boulder_event_list_entry
.word 0x00790000, ov54_koopa_space_event_list_entry_main
.word 0x00560000, ov54_chain_event_56_34_list_entry
.word 0x005B0000, ov54_chain_event_5B_list_entry
.word 0x00340000, ov54_chain_event_56_34_list_entry
.word 0x003A0000, ov54_chain_event_3A_30_list_entry
.word 0x00300000, ov54_chain_event_3A_30_list_entry
.word 0x00090000, ov54_chain_event_9_15_list_entry
.word 0x00150000, ov54_chain_event_9_15_list_entry
.word 0x00540000, ov54_chain_event_54_1C_list_entry
.word 0x001C0000, ov54_chain_event_54_1C_list_entry
.word 0xFFFF0000, 0

ov54_koopa_event_table:
.word 0x00790000, ov54_koopa_space_event_list_entry
.word 0xFFFF0000, 0

ov54_boo_event_table:
.word 0x00810000, ov54_boo_space_event_list_entry
.word 0x000A0000, ov54_boo_space_event_list_entry
.word 0xFFFF0000, 0

ov54_bowser_event_table:
.word 0x00820000, ov54_bowser_space_event_list_entry
.word 0xFFFF0000, 0

.align 16

ov54_D_800FA240_jtable:
.word .ov54_L800F82something, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8304
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F82C4, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8314
.word .ov54_L800F82D8, .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F8298
.word .ov54_L800F8314, .ov54_L800F8314, .ov54_L800F82B0, 0

.align 16

# 800FA300
.section .bss, "aw", @nobits

ov54_bss_bowser_model: .word 0
ov54_bss_koopa_model: .word 0
ov54_bss_toad_model: .word 0
.word 0
ov54_bss_toad_2: .word 0, 0
ov54_bss_toad_boulder: .word 0, 0
ov54_bss_toad_boulder_2: .word 0, 0, 0
ov54_bss_thwomp: .word 0
ov54_bss_thwomp_2: .word 0, 0, 0
ov54_bss_boo: .word 0
ov54_bss_boo_2: .word 0, 0
ov54_bss_20_coin_gate: .word 0
ov54_bss_20_coin_gate_2: .word 0
ov54_bss_20_coin_gate_3: .word 0
ov54_bss_800FA354: .word 0
ov54_bss_800FA358: .word 0
ov54_bss_800FA35C: .word 0
ov54_bss_800FA360: .word 0
ov54_bss_boulder_800FA364: .word 0
ov54_bss_boulder_800FA368: .word 0
ov54_bss_boulder_800FA36C: .word 0
ov54_bss_boulder_800FA370:
.word 0, 0, 0, 0
.word 0, 0, 0, 0
