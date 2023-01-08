    .text
    .global calendar
    .type   calendar, %function
calendar:
    push    {lr}    @ リンクレジスタの退避

    bl      date
    bl      wday


    pop     {lr}    @ リンクレジスタの復帰
    bx      lr
