BITS 32

SECTION .data
	;printing messages;
	message1 DB "The multiplying program", 0xa
	length1 EQU $ - message1
	
	message2 DB "Please enter a single digit number: "
	length2 EQU $ - message2
	
	message3 DB "Please enter a single digit number: "
	length3 EQU $ - message3
	
	message4 DB "The answer is: "
	length4 EQU $ - message4

SECTION .bss
;creating variables;
number1 RESB 2
number2 RESB 2
res RESB 1

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
	;number1;
	mov edx, 2
	mov ecx, number1
	mov ebx, 0
	mov eax, 3
	int 0x80
	sub BYTE [number1], '0'
	;message3;
	mov edx, length3
	mov ecx, message3
	mov ebx, 1
	mov eax, 4
	int 0x80
	;number2;
	mov edx, 2
	mov ecx, number2
	mov ebx, 0
	mov eax, 3
	int 0x80
	sub BYTE [number2], '0'
	;conversion;
	mov eax, [number1]
	mov ebx, [number2]
	imul eax, ebx
	add eax, '0'
	mov [res], eax
	;message4;
	mov edx, length4
	mov ecx, message4
	mov ebx, 1
	mov eax, 4
	int  0x80
	;product;
	mov edx, 1
	mov ecx, res
	mov ebx, 1
	mov eax, 4
	int 0x80


	
	;close;
	mov ebx, [res]
	mov ebx, 0
	mov eax, 1
	int 0x80
