section .bss    ; -> holds empty space you'll fill in while the program runs
    buffer resb 2   ; means "reserve 2 bytes", they start as zeros (one for the digit and one for the new line)

section .text
    global _start

_start:
    mov rbx, 7
    add rbx, '0'    ; adds to a register. In NASM '0' is like writting 48
    mov [rel buffer], bl    ;go to address in brackets and store value there
    mov byte [rel buffer + 1], 10

    lea rsi, [rel buffer]
    mov rdx, 2
    call print

    mov rax, 60
    mov rdi, 0
    syscall

print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

;lea rsi, [rel buffer] → put the address of buffer into rsi.
;mov [rel buffer], bl → put the value of bl into memory at buffer.
