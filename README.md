# tc-riscv

## Usage
- Install rust from (rustup.rs)[https://rustup.rs]
- Install riscv toolchain and binutils
    ```bash
    rustup target add riscv32i-unknown-none-elf
    cargo install cargo-binutils
    rustup component add llvm-tools
    ```
- Build with `cargo objcopy -- -O binary app.bin`
- Load `app.bin` into the game
