#![no_std]
#![no_main]

mod mmio;

#[unsafe(no_mangle)]
pub extern "C" fn main() {
    let x = mmio::level_in();
    let y = mmio::level_in();
    mmio::level_out(x / y);
    mmio::level_out(x % y);
}

const _: &[u8] = include_bytes!("../linker.ld"); // force recompile on change
core::arch::global_asm!(include_str!("init.s")); // entry point

#[panic_handler]
fn handle_panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
