org 0x7C00
bits 16

main:
	hlt

.halt:
	jmp .halt

times 510-($-$$) db 0 ; Emit zero bytes
		      ; $ - memory offset of a current line
		      ; $$ - memory offset of a current section
		      ; combined: size of program measured in bytes
dw 0AA55h
