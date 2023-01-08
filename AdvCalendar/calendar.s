    .text
    .global calendar
    .type   calendar, %function
calendar:
    push    {lr}    @ リンクレジスタの退避

    mov     r7, #13
    svc     #0
    bl      print

    bl      date
    bl      wday


    pop     {lr}    @ リンクレジスタの復帰
    bx      lr
