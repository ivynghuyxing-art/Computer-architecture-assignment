title	Check balance system

.model	small
.stack	64
.data
	msg1	db	10,13,"------------------------- $"
	msg2	db	10,13,"       CHECK BALANCE       $"
	msg3	db	10,13,"------------------------- $"
	msg4	db	10,13,"Enter account number: $"
	msg5	db	10,13,"Account found. $"
	msg6	db	10,13,"Current Balance: RM$"
	msg7	db	10,13,10,13,"Invalid input! Please enter numeric number. $"
	msg8	db	10,13,"Account not found! $"

	acc_num	dw	?
	balance	dw	?
	vinput	db	4 dup(?)

	filename	db	"account.txt",0
	filehandle	dw	?

	acc_buffer	db	512 dup(?)
	acc_size	dw	?

;***********************************************************************************************
.code
	main	proc	far

	mov	ax, @data
	mov	ds, ax

	mov	ah, 09h				; display check balance title
	lea	dx, msg1
	int	21h

	mov	ah, 09h
	lea	dx, msg2
	int	21h

	mov	ah, 09h
	lea	dx, msg3
	int	21h

	lea	dx, msg4			; enter account number
	mov	ah, 09h
	int	21h

	mov	cx, 4
	mov	si, 0

input_acc:
	mov	ah, 01h
	int	21h

	cmp	al, '0'
	call	invalid

	cmp	al, '9'
	call	invalid

	mov	vinput[si], al
	inc	si
	loop	input_acc

    	mov 	al, vinput[0]
    	sub 	al, 30h
	mov	ah, 0

	mov	bx, 1000
	mul	bx
	mov	acc_num, ax

    	mov 	al, vinput[1]
    	sub 	al, 30h
	mov	ah, 0

	mov	bx, 100
	mul	bx
	mov	acc_num, ax

    	mov 	al, vinput[2]
    	sub 	al, 30h
	mov	ah, 0

	mov	bx, 10
	mul	bx
	mov	acc_num, ax

    	mov 	al, vinput[3]
    	sub 	al, 30h
	mov	ah, 0

	add	acc_num, ax

	mov	ah, 3Dh				; open account.txt
	mov	al, 0
	
	lea	dx, filename
	int	21h

	call	file_error
	mov	filehandle, ax
	
	mov	bx, filehandle			; read account.txt
	mov	ah, 3Fh

	mov	cx, 512
	lea	dx, acc_buffer
	int	21h
	
	call	file_error
	mov	acc_size, ax

	mov	ah, 3Eh				; close account.txt
	mov	bx, filehandle
	int	21h

	mov	si, 0
	mov	cx, acc_size

search_acc:
	cmp	cx, 0
	je	not_found
	
	mov	al, acc_buffer[si]
	cmp	al, vinput[0]
	jne	next_char

	mov	al, acc_buffer[si+1]
	cmp	al, vinput[1]
	jne	next_char

	mov	al, acc_buffer[si+1]
	cmp	al, vinput[2]
	jne	next_char

	mov	al, acc_buffer[si+1]
	cmp	al, vinput[3]
	jne	next_char

	mov	ah, 09h					; account found
	lea	dx, msg5
	int	21h

	jmp	get_balance

next_char:
	inc	si
	dec	cx
	jmp	search_acc

get_balance:
	add	si, 5
	
find_balance:
	cmp	acc_buffer[si], ','
	je	balance_start
	
	inc	si
	jmp	find_balance

balance_start:
	inc	si
	mov	balance, 0

read_balance:
	mov	al, acc_buffer[si]
	
	cmp	al, 13
	je	display_balance

	cmp	al, 10
	je	display_balance

	sub	al, 30h
	mov	ah, 0
	
	mov	bx, ax
	mov	ax, balance

	mov	dx, 10
	mul	dx

	add	ax, bx
	mov	balance, ax

	inc	si
	jmp	read_balance

display_balance:
	mov	ah, 09h
	lea	dx, msg6
	int	21h

	mov	ax, balance
	call	display_num

	jmp	exit

not_found:
	mov	ah, 09h				; account not found
	lea	dx, msg7
	int	21h

	jmp	exit

invalid:
	mov	ah, 09h				; invalid input
	lea	dx, msg8
	int	21h

	jmp	exit

file_error:
	mov	ah, 09h
	lea	dx, msg8
	int	21h

	jmp	exit

display_num proc			; display number
	mov	bx, 10
	mov	cx, 0

convert_num:
	mov	dx, 0
	div	bx

	push	dx
	inc	cx

	cmp	ax, 0
	jne	convert_num

print_num:	
	pop	dx
	add	dl, "0"

	mov	ah, 02h
	int	21h

	loop	print_num
	ret

display_num endp

exit:	
	mov	ax, 4c00h
	int	21h

	main	endp
end	main