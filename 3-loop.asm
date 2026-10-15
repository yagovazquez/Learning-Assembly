section .data
  msg1 db "Hello!", 10
  len1 equ $ - msg1
  msg2 db "bye", 10
  len2 equ $ - msg2

section .text
  global _start

_start:
  mov rbx, 4    ; rbx is just a register we use as a counter (not special)

  mov rdi, 1
  lea rsi, [rel msg1]
  mov rdx, len1

print_loop:     ; label as _start that we can anem as we want
  mov rax, 1
  syscall

  dec rbx       ; dec -> decremetn (substracts one from our counter)
  jnz print_loop  ; jnz -> jump if not zero, checks the ZF, if last result wasn't zero it "jumps" to print_loop

  mov rbx, 2

;rdi still being 1 from first loop
  lea rsi, [rel msg2]
  mov rdx, len2

say_bye:
  mov rax, 1
  syscall

  dec rbx
  jnz say_bye

  mov rax, 60
  mov rdi, 0
  syscall

  ; rflags -> special register the cpu uses, each of its bits records a fact about the result of the last calculation
  ; the important one here is the ZeroFlag(ZF), cpu turns it on when a result its zero, so when dec turns rbx to zero zf its turned on
