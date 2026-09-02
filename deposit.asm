title	Bank deposit system

.model	small
.stack	64
.data
	msg1	db	10,13,"------------------------- $"
	msg2	db	10,13,"         DEPOSIT          $"
	msg3	db	10,13,"------------------------- $"
	msg4	db	10,13,"Enter account number: $"
	msg5	db	10,13,"Account found. $"
	msg6	db	10,13,"Current Balance: RM$"
	msg7	db	10,13,"Enter deposit amount: RM$"
	msg8	db	10,13,10,13,"Deposit successful! $"
	msg9	db	10,13,10,13,"Current Balance: RM$"
	msg10	db	10,13,"Deposit Amount: RM$"
	msg11	db	10,13,"New Balance: RM$"
	msg12	db	10,13,"Account balance updated successfully! $"
	msg13	db	10,13,10,13,"Invalid input! Please enter numeric number. $"
	msg14	db	10,13,10,13,"Do you want to continue (Y or N): $"
	msg15	db	10,13,"Account not found! $"
	acc_num	dw	?
	balance	dw	?
	deposit	dw	?
	newbalance	dw	?
	vinput	db	4 dup(?)

	filename	db	"account.txt",0
	filehandle	dw	?
	record	db	11 dup(?)

;***********************************************************************************************
.code
	main	proc	far

	mov	ax, @data
	mov	ds, ax

start:					; display deposit title
	mov	ah, 09h
	lea	dx, msg1
	int	21h

	mov	ah, 09h
	lea	dx, msg2
	int	21h

	mov	ah, 09h
	lea	dx, msg3
	int	21h

	mov	ah, 09h			; enter account number
	lea	dx, msg4
	int	21h

	mov	cx, 4
	mov	si, 0

input_acc:	
	mov	ah, 01h			; input account number
	int	21h

	mov	vinput[si], al
	inc si
	loop	input_acc

	mov	cx, 4
	mov	si,0

check_acc:	
	cmp	vinput[si], "0"		; check account number
	jb	error
	
	cmp	vinput[si], "9"
	ja	error

	inc	si
	loop	check_acc

	mov	ax, 0
	mov	si, 0
	mov	cx, 4

convert_acc:
	mov	bl, vinput[si]
	sub	bl, "0"

	mov	bh, 0
	mov	dx, 10
	mul	dx

	add	ax, bx
	inc	si
	loop	convert_acc

	mov	acc_num, ax

	mov	ah, 3Dh			; open account.txt
	mov	al, 2

	lea	dx, filename
	int	21h

	jc	file_error
	mov	filehandle, ax

search_acc:
	mov	ah, 3Fh			; search account number from account.txt
	mov	bx, filehandle
	mov	cx, 11

	lea	dx, record
	int	21h

	jc	file_error
	cmp	ax, 0
	je	acc_not_found

	mov	si, 0
	mov	ax, 0			; compare input acc number with record
	mov	cx, 4

convert_record_acc:
	mov	bl, record[si]
	sub	bl, "0"
	mov	bh, 0

	mov	dx, 10
	mul	dx
	
	add	ax, bx
	inc	si
	loop	convert_record_acc

	cmp	ax, acc_num		; compare account number
	je	acc_found
	jmp	search_acc

acc_found:
	mov	ah, 09h			; account found
	lea	dx, msg5
	int	21h

	mov	ax, 0
	mov	si, 5
	mov	cx, 4

convert_balance:
	mov	bl, record[si]
	sub	bl, "0"

	mov	bh, 0
	mov	dx, 10

	mul	dx
	add	ax, bx

	inc	si
	loop	convert_balance
	mov	balance, ax

	mov	ah, 09h			; display current balance
	lea	dx, msg6
	int	21h

	mov	ax, balance
	call	display_num

	mov	ah, 09h				; enter deposit amount
	lea	dx, msg7
	int	21h

	mov	cx, 4
	mov	si, 0

input_deposit:
	mov	ah, 01h
	int	21h

	mov	vinput[si], al		; input deposit amount
	inc	si
	loop	input_deposit

	mov	cx, 4
	mov	si, 0

check_deposit:
	cmp	vinput[si], "0"
	jb	error

	cmp	vinput[si], "9"
	ja	error

	inc	si
	loop	check_deposit

	mov	ax, 0
	mov	si, 0
	mov	cx, 4

convert_deposit:
	mov	bl, vinput[si]
	sub	bl, "0"

	mov	bh, 0
	mov	dx, 10

	mul	dx
	add	ax, bx

	inc	si
	loop	convert_deposit
	mov	deposit, ax

	mov	ax, balance		; deposit calculation
	add	deposit, ax
	mov	newbalance, ax

	mov	ah, 09h			; display deposit successful
	lea	dx, msg8
	int	21h

	mov	ah, 09h			; current balance
	lea	dx, msg9
	int	21h

	mov	ax, balance
	call	display_num

	mov	ah, 09h			; deposit amount
	lea	dx, msg10
	int	21h
	
	mov	ax, deposit
	call	display_num

	mov	ah, 09h			; display new balance
	lea	dx, msg11
	int	21h

	mov	ax, newbalance		; update balance in record
	call	display_num

	mov	ax, newbalance
	mov	bx, 10

	mov	si, 8
	mov	cx, 4

clear_balance:
	mov	record[si], "0"
	dec	si
	loop	clear_balance

	mov	ax, newbalance
	mov	si, 8

convert_newbalance:
	mov	dx, 0
	div	bx
	
	add	dl, "0"
	mov	record[si], dl
	dec	si

	cmp	ax, 0
	jne	convert_newbalance

	mov	ah, 42h
	mov	al, 1

	mov	bx, filehandle

	mov	cx, 0
	mov	dx, -11

	int	21h
	jc	file_error

	mov	ah, 40h			; write updated record
	mov	bx, filehandle
	
	mov	cx, 11
	lea	dx, record
	int	21h

	jc	file_error

	mov	ah, 09h			; update successful
	lea	dx, msg12
	int	21h

	mov 	ah, 3Eh			; close file
	mov	bx, filehandle
	int	21h

	jmp	exit

error:	
	mov	ah, 09h			; invalid input after file open
	lea	dx, msg13
	int	21h

	mov	ah, 3Eh
	mov	bx, filehandle
	int	21h

	jmp	start

acc_not_found:
	mov	ah, 09h
	lea	dx, msg15
	int	21h

	mov	ah, 3Eh
	mov	bx, filehandle
	int	21h

	jmp	start

file_error:
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