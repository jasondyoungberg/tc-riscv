use core::ptr;

pub fn level_out(value: u32) {
    let ptr = ptr::with_exposed_provenance_mut::<u32>(0xFFFFF800);
    unsafe { ptr.write_volatile(value) };
}

pub fn level_in() -> u32 {
    let ptr = ptr::with_exposed_provenance::<u32>(0xFFFFF804);
    unsafe { ptr.read_volatile() }
}
