section .text
global ft_strlen

; int ft_strlen(const char *str)

ft_strlen:
; Parameter : rdi = pointer to str
; Return value : rax = length of str

	xor rax, rax			; Set rax to 0 (length counter)

.loop:
	cmp byte [rdi + rax], 0	; compare byte at str[rax] with 0 to detect \0
	je .done				; If str[rax] is 0, jump to done
	inc rax					; else, increment the length counter
	jmp .loop				; then repeat the loop

.done:
	ret ; Return length contained in rax
