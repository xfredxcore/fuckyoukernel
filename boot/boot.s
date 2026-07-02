.code32
.global start
.extern kmain

.section .multiboot_header
multiboot_header_start:
    .long 0xe85250d6
    .long 0
    .long multiboot_header_end - multiboot_header_start
    .long -(0xe85250d6 + 0 + (multiboot_header_end - multiboot_header_start))
    .short 0
    .short 0
    .long 8
multiboot_header_end:

.section .text
start:
    movl $stack_top, %esp
    pushl %ebx
    call kmain
    cli
    hlt

.section .bss
.align 16
stack_bottom: .skip 16384
stack_top: