
.globl Function_0x80005340
Function_0x80005340: # 0x80005340
    lis     sp, unk_804eec00@h
    ori     sp, sp, unk_804eec00@l
    lis     r2, unk_804df9e0@h
    ori     r2, r2, unk_804df9e0@l
    lis     r13, unk_804db6a0@h
    ori     r13, r13, unk_804db6a0@l
    blr


.globl Function_0x8000535c
Function_0x8000535c: # 0x8000535c
    mflr    r0
    stw     r0, 0x4(sp)
    stwu    sp, -0x18(sp)
    stw     r31, 0x14(sp)
    stw     r30, 0x10(sp)
    stw     r29, 0xc(sp)
    lis     r3, unk_80005470@h
    addi    r0, r3, unk_80005470@l
    mr      r29, r0
    b       branch_0x80005384

branch_0x80005384:
    b       branch_0x80005388

branch_0x80005388:
    lwz     r30, 0x8(r29)
    cmplwi  r30, 0x0
    beq-    branch_0x800053c8
    lwz     r4, 0x0(r29)
    lwz     r31, 0x4(r29)
    beq-    branch_0x800053c0
    cmplw   r31, r4
    beq-    branch_0x800053c0
    mr      r3, r31
    mr      r5, r30
    bl      memcpy
    mr      r3, r31
    mr      r4, r30
    bl      Function_0x8000543c
branch_0x800053c0:
    addi    r29, r29, 0xc
    b       branch_0x80005388

branch_0x800053c8:
    lis     r3, unk_800054f4@h
    addi    r0, r3, unk_800054f4@l
    mr      r29, r0
    b       branch_0x800053d8

branch_0x800053d8:
    b       branch_0x800053dc

branch_0x800053dc:
    lwz     r5, 0x4(r29)
    cmplwi  r5, 0x0
    beq-    branch_0x80005400
    lwz     r3, 0x0(r29)
    beq-    branch_0x800053f8
    li      r4, 0x0
    bl      memset
branch_0x800053f8:
    addi    r29, r29, 0x8
    b       branch_0x800053dc

branch_0x80005400:
    lwz     r0, 0x1c(sp)
    lwz     r31, 0x14(sp)
    lwz     r30, 0x10(sp)
    mtlr    r0
    lwz     r29, 0xc(sp)
    addi    sp, sp, 0x18
    blr


.globl Function_0x8000541c
Function_0x8000541c: # 0x8000541c
    mfmsr   r0
    ori     r0, r0, 0x2000
    mtmsr   r0
    mflr    r31
    bl      Function_0x803436d4
    bl      0x80344d3c
    mtlr    r31
    blr


.globl Function_0x8000543c
Function_0x8000543c: # 0x8000543c
    lis     r5, unk_fffffff1@h
    ori     r5, r5, unk_fffffff1@l
    and     r5, r5, r3
    subf    r3, r5, r3
    add     r4, r4, r3
branch_0x80005450:
    dcbst   r0, r5
    sync
    icbi    r0, r5
    addic   r5, r5, 0x8
    subic.  r4, r4, 0x8
    bge+    branch_0x80005450
    isync
    blr


.incbin "./baserom/code/Text_0x80003100.bin", 0x2370, 0x80005520 - 0x80005470
