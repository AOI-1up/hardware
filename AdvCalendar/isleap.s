    .text
    .global isleap
    .type   isleap, %function
isleap:
    /* 使用するレジスタを退避 */ 
    push    {r4}

    @ うるう年を計算する (平年: 0, うるう年: 1)
    @ y % 4 を求める
    mov     r4, #4
    sdiv    r1, r0, r4
    mul     r1, r1, r4
    sub     r1, r0, r1

    @ y % 4 == 0 の時 1, その他は 0 を代入
    cmp     r1, #0
    moveq   r1, #1
    movne   r1, #0

    @ y % 100 を求める
    mov     r4, #100
    sdiv    r2, r0, r4
    mul     r2, r2, r4
    sub     r2, r0, r2

    @ y % 100 == 0 の時 1, その他は 0 を代入
    cmp     r2, #0
    moveq   r2, #1
    movne   r2, #0

    @ y % 400 を求める
    mov     r4, #400
    sdiv    r3, r0, r4
    mul     r3, r3, r4
    sub     r3, r0, r3

    @ y % 400 == 0 の時 1, その他は 0 を代入
    cmp     r3, #0
    moveq   r3, #1
    movne   r3, #0

    @ r1 - r2 + r3 を求める
    sub     r0, r1, r2
    add     r0, r0, r3

    @ r0 + 28 を求める
    add     r0, r0, #28

    /* 使用したレジスタを復帰 */ 
    pop     {r4}
    bx      lr
