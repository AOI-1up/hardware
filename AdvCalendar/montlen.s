    .text
    .global monthlen
    .type   monthlen, %function
monthlen:
    push    {lr}    @ リンクレジスタの退避
    
    /* 1月の場合 */ 
    cmp     r1, #1
    moveq   r0, #31

    /* 2月の場合 */
    cmp     r1, #2
    bleq    isleap  @ うるう年判定

    /* 3月の場合 */
    cmp     r1, #3
    moveq   r0, #31

    /* 4月の場合 */ 
    cmp     r1, #4
    moveq   r0, #30

    /* 5月の場合 */ 
    cmp     r1, #5
    moveq   r0, #31

    /* 6月の場合 */ 
    cmp     r1, #6
    moveq   r0, #30

    /* 7月の場合 */ 
    cmp     r1, #7
    moveq   r0, #31

    /* 8月の場合 */ 
    cmp     r1, #8
    moveq   r0, #31

    /* 9月の場合 */ 
    cmp     r1, #9
    moveq   r0, #30

    /* 10月の場合 */ 
    cmp     r1, #10
    moveq   r0, #31

    /* 11月の場合 */ 
    cmp     r1, #11
    moveq   r0, #30

    /* 12月の場合 */ 
    cmp     r1, #12
    moveq   r0, #31

    pop     {lr}    @ リンクレジスタの復帰
    bx      lr
