
.globl __check_pad3
__check_pad3: # 0x800051ec
    mflr    r0
    lis     r3, 0x8000
    stw     r0, 0x4(sp)
    stwu    sp, -0x8(sp)
    lhz     r0, 0x30e4(r3)
    andi.   r0, r0, 0xeef
    cmpwi   r0, 0xeef
    bne-    branch_0x8000521c
    li      r3, 0x0
    li      r4, 0x0
    li      r5, 0x0
    bl      Function_0x8034844c
branch_0x8000521c:
    lwz     r0, 0xc(sp)
    addi    sp, sp, 0x8
    mtlr    r0
    blr


.globl __start
__start: # 0x8000522c
    bl      Function_0x80005340
    bl      Function_0x8000541c
    li      r0, -0x1
    stwu    sp, -0x8(sp)
    stw     r0, 0x4(sp)
    stw     r0, 0x0(sp)
    bl      Function_0x8000535c
    li      r0, 0x0
    lis     r6, unk_80000044@h
    addi    r6, r6, unk_80000044@l
    stw     r0, 0x0(r6)
    lis     r6, unk_800000f4@h
    addi    r6, r6, unk_800000f4@l
    lwz     r6, 0x0(r6)
    cmplwi  r6, 0x0
    beq-    branch_0x80005298
    lwz     r7, 0xc(r6)
    li      r5, 0x0
    cmplwi  r7, 0x2
    beq-    branch_0x80005288
    cmplwi  r7, 0x3
    bne-    branch_0x80005298
    li      r5, 0x1
branch_0x80005288:
    lis     r6, Function_0x8032a628@ha
    addi    r6, r6, Function_0x8032a628@l
    mtlr    r6
    blrl
branch_0x80005298:
    lis     r6, unk_800000f4@h
    addi    r6, r6, unk_800000f4@l
    lwz     r5, 0x0(r6)
    cmplwi  r5, 0x0
    beq+    branch_0x800052f8
    lwz     r6, 0x8(r5)
    cmplwi  r6, 0x0
    beq+    branch_0x800052f8
    add     r6, r5, r6
    lwz     r14, 0x0(r6)
    cmplwi  r14, 0x0
    beq-    branch_0x800052f8
    addi    r15, r6, 0x4
    mtctr   r14
branch_0x800052d0:
    addi    r6, r6, 0x4
    lwz     r7, 0x0(r6)
    add     r7, r7, r5
    stw     r7, 0x0(r6)
    bdnz+      branch_0x800052d0
    lis     r5, unk_80000034@h
    addi    r5, r5, unk_80000034@l
    clrrwi  r7, r15, 5
    stw     r7, 0x0(r5)
    b       branch_0x80005300

branch_0x800052f8:
    li      r14, 0x0
    li      r15, 0x0
branch_0x80005300:
    bl      Function_0x80335ec0
    bl      Function_0x80342fc8
    lis     r4, unk_800030e6@h
    addi    r4, r4, unk_800030e6@l
    lhz     r3, 0x0(r4)
    andi.   r5, r3, 0x8000
    beq-    branch_0x80005328
    andi.   r3, r3, 0x7fff
    cmplwi  r3, 0x1
    bne-    branch_0x8000532c
branch_0x80005328:
    bl      __check_pad3
branch_0x8000532c:
    bl      Function_0x8034cabc
    mr      r3, r14
    mr      r4, r15
    bl      Function_0x8015feb4
    b       Function_0x80322f9c

