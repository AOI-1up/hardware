/*------------------------------------------*
* wday : 曜日をコマンドラインへ出力
*-------------------------------------------*/
    .text
    .global wday
    .type   wday, %function
wday:
    /* 使用するレジスタを退避 */ 
    push    {r0, r1, r2, r7, lr}
    mov     r0, #1
    ldr     r1, =msg
    mov     r2, #0

loop:
    /* 文字列の長さをカウント */
    ldrb    r0, [r1, r2]
    cmp     r0, #0
    beq     loopend
    add     r2, r2, #1
    b       loop

loopend:
    /* write(1, msg, $r2) */
    mov     r7, #4
    svc     #0

    /* 使用したレジスタを復帰 */ 
    pop     {r0, r1, r2, r7, lr}
    bx      lr

.section    .data
msg:
    .asciz  "Mo Tu We Th Fr Sa Su\n"
