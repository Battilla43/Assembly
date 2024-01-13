BITS 32

SECTION .data
	message4 DB "The Adding program", 0xa
	length4 equ $ - message4
	
	message1 DB "Please enter the a single digit number: "
	length1 equ $ - message1
	
	message2 DB "Please enter a single digit number: "
	length2 equ $ - message2
	
	message3 DB "The answer is: "
	length3 equ $ - message3

SECTION .bss
	number1 resb 2
	number2 resb 2	
	res resb 1

global _start

SECTION .text

_start:
	;MESSAGE4 (adding program);
	mov edx, length4
	mov ecx, message4
	mov ebx, 1
	mov eax, 4
 	int 0x80
	;first message length;
	mov edx, length1
	mov ecx, message1
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	;first user response;
	mov edx, 2
	mov ecx, number1
	mov ebx, 0
	mov eax, 3
	int 0x80
	
	;second message length;
	mov edx, length2
	mov ecx, message2
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	;second user response;
	mov edx, 2
	mov ecx, number2
	mov ebx, 0
	mov eax, 3
	int 0x80
	
	;converting number;
	mov eax, [number1]
	sub eax, '0'
	mov ebx, [number2]
	sub ebx, '0'

	add eax, ebx
	add eax, '0'
	
	mov [res], eax

	;final message;
	mov edx, length3
	mov ecx, message3
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	mov edx, 1
	mov ecx, res
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80
