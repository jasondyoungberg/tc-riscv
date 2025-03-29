.section .text.entry

.global entry
entry: // execution starts here
    .option push
    .option norelax
    la gp, __global_pointer$
    .option pop
    la sp, _estack
    mv fp, sp
    call main
entry_halt:
    j entry_halt
