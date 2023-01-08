    .text
    .global test
    .type   test, %function
test:
    push    {lr}
    ldr     r1, [r1, #4]
    bl      print

    pop     {lr}
    bx      lr
