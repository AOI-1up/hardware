    .text
    .global date
    .type   date, %function
date:
    push    {r1, lr}
    ldr     r1, =msg
    add     r1, r1, #20
    bl      print
    pop     {r1, lr}
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
