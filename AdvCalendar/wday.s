/*------------------------------------------*
* wday : 曜日をコマンドラインへ出力
*-------------------------------------------*/
    .text
    .global wday
    .type   wday, %function
wday:
    /* 使用するレジスタを退避 */ 
    push    {r0, r1, r2, r7, lr}

    ldr     r1, =msg
    bl      print

    /* 使用したレジスタを復帰 */ 
    pop     {r0, r1, r2, r7, lr}
    bx      lr

.section    .data
msg:
    .asciz  "Mo Tu We Th Fr Sa Su\n"
