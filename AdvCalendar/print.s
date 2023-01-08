/*------------------------------------------*
* print : 文字列をコマンドラインへ出力
*   文字列のアドレスを $r1 へロードする必要あり
*-------------------------------------------*/
    .text
    .global print
    .type   print, %function
print:
    push    {r0, r2, r7}
    mov     r2, #0

loop:
    /* 文字列の長さをカウント */
    ldrb    r0, [r1, r2]
    cmp     r0, #0
    beq     loopend
    add     r2, r2, #1
    b       loop

loopend:
    /* write(1, $r1, $r2) */
    mov     r0, #1
    mov     r7, #4
    svc     #0

    pop     {r0, r2, r7}
    bx      lr
