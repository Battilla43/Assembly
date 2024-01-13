BITS 32

GLOBAL addstr
GLOBAL is_palindrome
GLOBAL factstr
GLOBAL palindrome_check

extern atoi, printf, scanf, fact
extern palindrome_is

SECTION .data
message1 DB "This is a palindrome", 0xa
length1 equ $ -message1

message2 DB "This is not a palindrome", 0xa
length2 equ $ -message2

message3 DB "Please enter a string.", 0xa
length3 equ $ - message3

SECTION .bss
string1 resb 1024

SECTION .text

addstr:

    push ebp
    mov ebp, esp

    push ebx

    mov eax, [ebp+8]
    mov ebx, [ebp+12]

    push eax
    call atoi
    add esp, 4

    push eax
                    
    push ebx
    call atoi
    add esp, 4  
     
    pop ebx

    add eax, ebx
    pop ebx
    pop ebp
    ret

is_palindrome:
    push ebp
    mov ebp, esp
    pusha
    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    mov ecx, eax
    add ecx, ebx
loop1:
    cmp eax, ecx
    jge palindrome
    mov dl, [eax]
    mov dh, [ecx]
    cmp dl, dh
    jne not_palindrome
    inc eax
    dec ecx
    jmp loop1
palindrome:
    popa
    pop ebp
    mov eax, 1
    ret

not_palindrome:
    popa
    pop ebp
    mov eax, 0
    ret

factstr:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]

    push eax
    call atoi
    add esp, 4

    push eax
    call fact
    add esp, 4

    pop ebp

    ret

palindrome_check:

    mov edx, length3
    mov ecx, message3
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ecx, string1
    mov edx, 1024
    mov ebx, 0
    mov eax, 3
    int 0x80

    push string1
    call palindrome_is
    add esp, 4
