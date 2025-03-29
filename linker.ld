stack_size = 64K;
heap_size = 64K;

/* configure this acording to your system */
MEMORY {
    ram (rwx)    : ORIGIN = 0x00000000, LENGTH = 1M
}

SECTIONS {
    .text : ALIGN(4) {
        _stext = .;
        KEEP(*(.text.entry))
        *(.text .text.*);
        _etext = .;
    } > ram

    .rodata : ALIGN(4) {
        _srodata = .;
        *(.rodata .rodata.*);
        _erodata = .;
    } > ram

    .data : ALIGN(4) {
        _sdata = .;
        PROVIDE(__global_pointer$ = . + 0x800);
        *(.data .data.*);
        _edata = .;
    } > ram

    .bss (NOLOAD) : ALIGN(16) {
        _sbss = .;
        *(.bss .bss.*);
        _ebss = .;
    } > ram

    .heap (NOLOAD) : ALIGN(16) {
        _sheap = .;
        . += heap_size;
        _eheap = .;
    } > ram

    /* we put the stack at the end of ram to reduce issues caused by stack overflow */
    . = ORIGIN(ram) + LENGTH(ram) - stack_size;

    .stack (NOLOAD) : ALIGN(16) {
        _sstack = .;
        . += stack_size;
        _estack = .;
    } > ram
}

ASSERT(entry == 0, "entry isn't loaded at zero");
