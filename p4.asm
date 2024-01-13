BITS 33

SECTION .data
	;messages;
	message1 DB "The Swapping Program", 0xa
	length1 equ $ - message1
	
	message2 DB "Please enter a two character string: ", 0xa
	length2 equ $ - message2
	
	message3 DB "The answer is: ", 0xa
	length3 equ $ - message3

SECTION .bss
string resb 2

SECTION .text
global _start
	_start:
	;message1;
	mov edx, length1
	mov ecx, message1
	mov ebx, 1
	mov eax, 4
	int 0x80
	;message2;
	mov edx, length2
	mov ecx, message2
	mov ebx, 1
	mov eax, 4
	int 0x80
	;string entry
	mov edx, 2
	mov ecx, string
	mov ebx, 0
	mov eax, 3
	int 0x80
	;message3;	
	mov edx, length3
	mov ecx, message3
	mov ebx, 1
	mov eax, 4
	int 0x80
	;swapping
	mov esi, string
	mov edi, string+1
	mov eax, [esi]
	mov ebx, [edi]
	mov [esi], ebx
	mov [edi], eax
	;print
	mov edx, 2
	mov ecx, string
	mov ebx, 1
	mov eax, 4
	int 0x80	
	;exit
	mov ebx, 0
	mov eax, 1
	int 0x80
