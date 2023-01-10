/*------------------------------------------*
* print : 文字列をコマンドラインへ出力
*   アドレスを $r1 に格納する必要あり。
*-------------------------------------------*/
    .text
    .global print
    .type   print, %function
print:
    /* 使用するレジスタを退避 */ 
    push    {r0, r2, r7, lr}
    mov     r0, #1
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
    mov     r7, #4
    svc     #0

    /* 使用したレジスタを復帰 */ 
    pop     {r0, r2, r7, lr}
    bx      lr
