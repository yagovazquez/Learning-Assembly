bits 64

section .data
  msg1 db "Hello!", 10
  len1 equ $ - msg1
  msg2 db "bye", 10
  len2 equ $ - msg2

section .text
  global _start

_start:

  lea rsi, [rel msg1]
  mov rdx, len1
  call print

  lea rsi, [rel msg2]
  mov rdx, len2
  mov rbx, 3
  call print_times

  mov rax, 60
  mov rdi, 0
  syscall

; print: writes rdx bytes, starting at address rsi, to stdout
;   in:       rsi = address of the text, rdx = length
;   destroys: rax, rdi, rcx, r11
print:
  mov rax, 1	;write mode
  mov rdi, 1  ;write in screen
  syscall
  ret

; print_times:
;   in:         rsi = address of text, rdx = length, rbx = counter
;   destroys:   rbx, rax, rdi, rcx, r11
print_times:
  call print

  dec rbx
  jnz print_times
  ret

; the register rsp (stack pointer) always holds the address of the top of the pile (it grows downwards so adding something makes rsp smaller)
;call -> puts the address of the next instruction on top of the stack (rsp goes down by 8 cause an address is 8 bytes) and jumps to print
;ret -> does the opposite, takes the address off the top of the stack, rsp goes up 8 bytes and jumps there
;so call leaves a note "come back here" and ret reads the note
