    .text
    .global monthlen
    .type   monthlen, %function
monthlen:
    @ １月の場合
    cmp     r1, #1
    moveq   r0, #31

    @ ２月の場合
    cmp     r1, #2
    push    {lr}
    bleq    isleap   @ うるう年判定
    pop     {lr}

    @ ３月の場合
    cmp     r1, #3
    moveq   r0, #31

    @ ４月の場合
    cmp     r1, #4
    moveq   r0, #30

    @ ５月の場合
    cmp     r1, #5
    moveq   r0, #31

    @ ６月の場合
    cmp     r1, #6
    moveq   r0, #30

    @ ７月の場合
    cmp     r1, #7
    moveq   r0, #31

    @ ８月の場合
    cmp     r1, #8
    moveq   r0, #31

    @ ９月の場合
    cmp     r1, #9
    moveq   r0, #30

    @ 10月の場合
    cmp     r1, #10
    moveq   r0, #31

    @ 11月の場合
    cmp     r1, #11
    moveq   r0, #30

    @ 12月の場合
    cmp     r1, #12
    moveq   r0, #31

    bx      lr
