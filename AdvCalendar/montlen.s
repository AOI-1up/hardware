/*------------------------------------------*
* monthlen : 計算した月の長さを返却
*   以下の値をレジスタに格納する必要あり。
*   - $r0 : 年
*   - $r1 : 月
*   なお、返り値は $r0 に格納される。
*-------------------------------------------*/
    .text
    .global monthlen
    .type   monthlen, %function
monthlen:
    /* 使用するレジスタを退避 */ 
    push    {r1, r2, r3, r4, lr}
    
    /* 1月の場合 */ 
    cmp     r1, #1
    moveq   r0, #32

    /* 2月の場合 */
    cmp     r1, #2
    bleq    isleap  @ うるう年判定

    /* 3月の場合 */
    cmp     r1, #3
    moveq   r0, #32

    /* 4月の場合 */ 
    cmp     r1, #4
    moveq   r0, #31

    /* 5月の場合 */ 
    cmp     r1, #5
    moveq   r0, #32

    /* 6月の場合 */ 
    cmp     r1, #6
    moveq   r0, #31

    /* 7月の場合 */ 
    cmp     r1, #7
    moveq   r0, #32

    /* 8月の場合 */ 
    cmp     r1, #8
    moveq   r0, #32

    /* 9月の場合 */ 
    cmp     r1, #9
    moveq   r0, #31

    /* 10月の場合 */ 
    cmp     r1, #10
    moveq   r0, #32

    /* 11月の場合 */ 
    cmp     r1, #11
    moveq   r0, #31

    /* 12月の場合 */ 
    cmp     r1, #12
    moveq   r0, #32

    /* 使用したレジスタを復帰 */
    pop     {r1, r2, r3, r4, lr}
    bx      lr
