/*------------------------------------------*
* calendar : カレンダーをコマンドラインへ出力
*   以下の値をレジスタに格納する必要あり。
*   - $r0 : 年
*   - $r1 : 月
*-------------------------------------------*/
    .text
    .global calendar
    .type   calendar, %function
calendar:
    /* 使用するレジスタを退避 */
    push    {r4, r5, r6, r7, r8, r9, r10, lr}
    mov     r4, r0      @ year
    mov     r5, r1      @ month
    ldr     r6, =array  @ array

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

    /* 配列に空白コードを格納 */
    mov     r0, #0      @ アドレス用カウンタ
    mov     r1, #0      @ 行判定用カウンタ
    mov     r2, #1      @ 日にち用カウンタ
    mov     r3, #3
    mul     r7, r7, r3
    mov     r3, #32     @ 空白の ASCII コード
    mov     r4, #48     @ 0 の ASCII コード
    mov     r5, #10     @ 改行の ASCII コード
loop1:
    cmp     r0, r7          @ ループ終了判定
    beq     loop2
    strb    r3, [r6, r0]    @ 空白コードを格納
    add     r0, r0, #1
    add     r1, r1, #1
    b       loop1

    /* 配列にカレンダーを格納 (一桁 Ver.) */
loop2:
    cmp     r2, #10         @ ループ終了判定
    beq     loop3
    strb    r3, [r6, r0]    @ 空白コードを格納
    add     r0, r0, #1
    add     r9, r2, r4      @ 日にちを格納
    strb    r9, [r6, r0]
    add     r0, r0, #1
    add     r1, r1, #2
    add     r2, r2, #1
    cmp     r1, #20         @ 改行判定
    beq     l1
    strb    r3, [r6, r0]    @ 空白コードを格納
    add     r0, r0, #1
    add     r1, r1, #1
    b       loop2
l1:
    strb    r5, [r6, r0]    @ 改行コードを格納
    add     r0, r0, #1
    mov     r1, #0
    b       loop2

    /* 配列にカレンダーを格納 (二桁 Ver.) */
loop3:
    cmp     r2, r8         @ ループ終了判定
    beq     loopend

    /* 日にち (二桁目) を算出 & 格納 */
    sdiv    r9, r2, r5      @ 二桁目を算出
    add     r10, r9, r4
    strb    r10, [r6, r0]
    add     r0, r0, #1

    /* 日にち (一桁目) を算出 & 格納 */
    mul     r9, r9, r5      @ 一桁目を算出
    sub     r9, r2, r9
    add     r9, r9, r4
    strb    r9, [r6, r0]
    add     r0, r0, #1
    add     r1, r1, #2
    add     r2, r2, #1
    cmp     r1, #20         @ 改行判定
    beq     l2
    strb    r3, [r6, r0]
    add     r0, r0, #1      @ 空白コードを格納
    add     r1, r1, #1
    b       loop3
l2:
    strb    r5, [r6, r0]    @ 改行コードを格納
    add     r0, r0, #1
    mov     r1, #0
    b       loop3

loopend:
    /* カレンダーを出力 */
    strb    r5, [r6, r0]    @ 改行コードを格納
    mov     r1, r6
    bl      print
    
    /* 使用したレジスタを復帰 */
    pop     {r4, r5, r6, r7, r8, r9, r10, lr}
    bx      lr

.section    .data
array:
  .space 200
