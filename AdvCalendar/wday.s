/*------------------------------------------*
* wday : 曜日をコマンドラインへ出力
*-------------------------------------------*/
    .text
    .global wday
    .type   wday, %function
wday:
    push    {r1, lr}
    ldr     r1, =msg
    bl      print
    pop     {r1, lr}
    bx      lr

.section    .data
msg:
    .asciz  "Mo Tu We Th Fr Sa Su\n"
