    .text
    .global test
    .type   test, %function
test:
    mov     r1, #49
    strb    r1, [r0, #0]
    mov     r1, #50
    strb    r1, [r0, #1]
    mov     r1, r0
    push    {lr}

    bl      print

    pop     {lr}
    bx      lr
