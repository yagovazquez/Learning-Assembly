section .text     ; section that contains instructions that CPU will run
  global _start   ; _start is a label/name for the place for the code   global makes that name visible outside this file

_start:         ; the : shows where does that label refer to
  mov rax, 60    ; rax is a register (tiny storage slots built into the cpu), mov copies a value into a destination
  mov rdi, 42    ; another register
  syscall       ; this is the way the program has to ask the kernel (linux), it will look in rax what you want and in rdi, rsi... details
