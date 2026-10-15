bits 64

section .data
    small_msg db "small", 10
    small_len equ $ - small_msg
    big_msg   db "big", 10
    big_len   equ $ - big_msg

section .text
    global _start

_start:
    mov rbx, 11

    cmp rbx, 10     ;compare rbx with 10, computes rbx-10 throws the result away and keeps only the flags
    jl is_small     ;jump if less

    lea rsi, [rel big_msg]
    mov rdx, big_len
    call print
    jmp done

is_small:
    lea rsi, [rel small_msg]
    mov rdx, small_len
    call print

done:
    mov rax, 60
    mov rdi, 0
    syscall

; in: rsi = address of the text, rdx = length
print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret



