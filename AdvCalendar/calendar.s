    .text
    .global calendar
    .type   calendar, %function
calendar:
    /* 使用するレジスタを退避 */
    push    {r4, r5, r6, lr}
    mov     r4, r0  @ year
    mov     r5, r1  @ month
    mov     r6, r2  @ dayArray

    /* 日付と曜日を出力 */
    bl      date
    bl      wday

    /* ツェラー計算 */
    mov     r0, r4  @ year
    mov     r1, r5  @ month
    mov     r2, #1  @ day
    bl      zellar  @ 月初めの曜日を計算
    mov     r7, r0  @ 計算結果を格納

    /* 月の長さ計算 */
    mov     r0, r4      @ year
    bl      monthlen    @ 月の長さを計算
    mov     r8, r0      @ 計算結果を格納

    /* 配列に空白を格納 */
    mov     r0, #0
    mov     r1, #32     @ 空白の ASCII コード
    mov     r2, #3
    mul     r7, r7, r2
loop:
    cmp     r0, r7
    beq     loopend
    strb    r1, [r6, r0]
    add     r0, r0, #1
    b       loop
loopend:



    @ 月の長さの計算結果から日付を格納
    @ r0
        @ 1桁ver.
        @ 2桁ver.

    /* カレンダーを出力 */
    mov     r1, r6
    bl      print
    
    /* 使用したレジスタを復帰 */
    pop     {r4, r5, r6, lr}
    bx      lr
