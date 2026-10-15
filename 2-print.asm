section .data
  msg db "Hello!", 10   ; db -> define bytes (put them in memory one after another), 10 is the newline value
                        ; msg is a label that means "the address where the bytes start", same as _start but pointing at data instead of code
  len equ $ - msg       ; equ defines a constant (name for a number that takes no memory), $ means the current address (just after writting the text inside msg and msg is where the text starts so the result is the length)

section .text
  global _start

_start:
  mov rax, 1          ; syscall number 1 is write
  mov rdi, 1          ; where to write
  lea rsi, [rel msg]  ; what to write   lea -> load efective address (puts an address into a register)
                      ; brackets mean memory location and rel means to calculate it relative to where this instruction is
                      ; so rsi holds where the text is, not the text itself
  mov rdx, len        ; how many bytes to write
  syscall

  mov rax, 1		  ; after the first syscall rax is set to 7 (waiting on input) so we need to set it on write again
  syscall
  mov rax, 1
  syscall

  mov rax, 60
  mov rdi, 0
  syscall
