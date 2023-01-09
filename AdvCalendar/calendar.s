    .text
    .global calendar
    .type   calendar, %function
calendar:
    /* 使用するレジスタを退避 */
    push    {r4, r5, r6, lr}
    mov     r4, r0  @ month
    mov     r5, r1  @ year
    mov     r6, r2  @ argv

    bl      date    @ 日付を出力
    bl      wday    @ 曜日を出力

    /* 使用したレジスタを復帰 */
    pop     {r4, r5, r6, lr}
    bx      lr
