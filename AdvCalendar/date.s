    .text
    .global date
    .type   date, %function
date:
    push    {r0, r1, r2, lr}
    ldr     r1, =msg
    mov     r2, #10
    mul     r2, r0, r2
    add     r1, r1, r2
    sub     r1, r1, #10
    bl      print

    pop     {r0, r1, r2, lr}
    bx      lr

.section    .data
msg:
    .asciz  "  January"
    .asciz  " February"
    .asciz  "    March"
    .asciz  "    April"
    .asciz  "      May"
    .asciz  "     June"
    .asciz  "     July"
    .asciz  "   August"
    .asciz  "September"
    .asciz  "  October"
    .asciz  " November"
    .asciz  " December"
