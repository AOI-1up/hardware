/*------------------------------------------*
* zellar : 計算した曜日番号を返却
*   ツェラーの公式を用いて、
*   指定された「年・月・日」から曜日を計算
* 
* 曜日番号
*   1 : 日曜日
*   2 : 月曜日
*   3 : 火曜日
*   4 : 水曜日
*   5 : 木曜日
*   6 : 金曜日
*   7 : 土曜日
*-------------------------------------------*/
    .text
    .global zellar
    .type   zellar, %function
zellar:
    /* 1月と2月を前年の13月、14月とする */ 
    cmp     r1, #3
    subeq   r0, r0, #1
    addeq   r1, r1, #12

    /* 使用するレジスタを退避 */ 
    push    {r4, r5, r6, r7, r8}

    /* ツェラーの公式 */ 
    mov     r3, #4      @ y / 4 を求める
    sdiv    r4, r0, r3

    mov     r3, #100    @ y / 100 を求める
    sdiv    r5, r0, r3

    mov     r3, #400    @ y / 400 を求める
    sdiv    r6, r0, r3

    mov     r3, #13     @ ((13 * m + 8) / 5) を求める
    mul     r7, r3, r1
    add     r7, r7, #8
    mov     r3, #5
    sdiv    r7, r7, r3

    add     r8, r0, r4  @ s を求める
    sub     r8, r8, r5
    add     r8, r8, r6
    add     r8, r8, r7
    add     r8, r8, r2

    mov     r3, #7      @ s % 7 を求め、$r0 に渡す
    sdiv    r0, r8, r3
    mul     r0, r0, r3
    sub     r0, r8, r0

    /* 使用したレジスタを復帰 */
    pop     {r4, r5, r6, r7, r8}
    bx      lr
