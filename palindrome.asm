bits 32

global _start

;data section creates the messages needed;

SECTION .data
message1 DB "Please enter a string.", 0xa
length1 equ $ - message1

message2 DB "It is a palindrome", 0xa
length2 equ $ - message2

message3 DB "It is not a palindrome", 0xa
length3 equ $ - message3

SECTION .bss
string1 resb 1024
t resb 1024

SECTION .text
_start:
body:
	;message 1;
	mov edx, length1
	mov ecx, message1
	mov ebx, 1
	mov eax, 4
	int 0x80
	;user string acceptance;
	mov ecx, string1
	mov edx, 1024  
	mov ebx, 0
	mov eax, 3
	int 0x80
	;takes string1 and puts it into esi;
	mov esi, string1
	xor ecx, ecx
	jmp find_end
	
find_end:
	;goes to end of string;
	cmp BYTE [esi], 0
	jz copy_reverse
	inc ecx
	inc esi
	jmp find_end

copy_reverse:
	;copies string from the end to front;
	dec ecx
	mov edx, ecx
	jecxz printit

	mov edi, t
	dec esi
	dec esi

loop_copy:
	;prints string backwards;
	mov al, [esi]
	mov [edi], al
	dec esi
	inc edi
	loop loop_copy

printit:
	mov BYTE [edi], 10
	inc edx
	mov BYTE [edi+1], 0
	mov ecx, t
	mov ebx, 1
	mov eax, 4
	int 0x80

is_palindrome:
	;compares string1 to t to check equivalency and jumps to appropriate function;
	mov eax, [string1]
	mov ebx, [t]
	cmp eax, ebx
	je correct
	jne incorrect
	int 0x80

correct:
	;if strings match jumps to here and prints message2;	
	mov edx,length2
	mov ecx, message2	
	mov ebx, 1
	mov eax, 4
	int 0x80
	jmp end

incorrect:
	;if strings dont match jumps to here and prints message3;
	mov edx, length3
	mov ecx, message3
	mov ebx, 1
	mov eax, 4
	int 0x80
	jmp end

end:
	jmp body
	mov eax, 1
	int 0x80



