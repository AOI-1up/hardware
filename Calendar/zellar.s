    .text
    .global zellar
    .type   zellar, %function
zellar:
    @ リンクレジスタの退避
    push    {lr}

    @ r1 < 3の時 year へジャンプ 
    cmp     r1, #3
    bleq    year
    pop     {lr}

    @ 使用するレジスタの退避
    push    {r4, r5, r6, r7, r8}

    @ ツェラーの公式
    @ y / 4
    mov     r3, #4
    sdiv    r4, r0, r3

    @ y / 100 を求める
    mov     r3, #100
    sdiv    r5, r0, r3

    @ y / 400 を求める
    mov     r3, #400
    sdiv    r6, r0, r3

    @ ((13 * m + 8) / 5) を求める
    mov     r3, #13
    mul     r7, r3, r1
    add     r7, r7, #8
    mov     r3, #5
    sdiv    r7, r7, r3

    @ s を求める
    add     r8, r0, r4
    sub     r8, r8, r5
    add     r8, r8, r6
    add     r8, r8, r7
    add     r8, r8, r2

    @ s % 7 を求め、r0 に渡す
    mov     r3, #7
    sdiv    r0, r8, r3
    mul     r0, r0, r3
    sub     r0, r8, r0

    @ 使用したレジスタの復帰
    pop     {r4, r5, r6, r7, r8}
    bx      lr

year:
    sub     r0, r0, #1
    add     r1, r1, #12
    bx      lr
