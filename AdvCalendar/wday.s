    .text
    .global wday
    .type   wday, %function
wday:
    mov     r0, #1
    ldr     r1, =msg
    mov     r2, #22
    mov     r7, #4
    svc     #0
    bx      lr

.section    .data
msg:
    .asciz  "Mo Tu We Th Fr Sa Su\n"
