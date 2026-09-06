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
	msg16	db	10,13,"Transaction file error! $"

	acc_num	dw	?
	balance	dw	?
	deposit	dw	?
	newbalance	dw	?
	vinput	db	4 dup(?)

	filename	db	"account.txt",0
	filehandle	dw	?
	
	filename2	db	"transaction.txt",0
	filehandle2	dw	?

	acc_buffer	db	512 dup(?)
	acc_size	dw	?

	trans_buffer	db	1024 dup(?)
	trans_size	dw	?

	trans_record	db	80 dup(?)
	trans_length	dw	?

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
	inc	si
	loop	input_acc

	mov	cx, 4			; check account number is numeric
	mov	si,0

check_acc:	
	cmp	vinput[si], "0"		; check account number
	jae	valid_acc_digit1
	jmp	error
	
valid_acc_digit1:
	cmp	vinput[si], "9"
	jbe	valid_acc_digit2
	jmp	error

valid_acc_digit2:
	inc	si
	loop	check_acc

	mov	ax, 0			; convert account number
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

	jnc	file_open_ok
	jmp	file_error

file_open_ok:
	mov	filehandle, ax

	mov	ah, 3Fh			; search account number from account.txt
	mov	bx, filehandle
	mov	cx, 512

	lea	dx, acc_buffer
	int	21h

	jnc	acc_read_ok
	jmp	acc_file_error

acc_read_ok:
	mov	acc_size, ax

	mov	ah, 3Eh
	mov	bx, filehandle
	int	21h

	mov	si, 0
	mov	cx, acc_size

search_acc:
	cmp	cx, 0
	jne	search_second_comma_ok1
	jmp	near ptr acc_not_found

search_second_comma_ok1:
	cmp	acc_buffer[si], ","	; look for 1st comma
	jne	next_acc_char
	
	inc	si
	dec	cx

search_second_comma:
	cmp	cx, 0			; look for 2nd comma
	jne	search_second_comma_ok2
	jmp	near ptr acc_not_found

search_second_comma_ok2:
	cmp	acc_buffer[si], ","
	je	check_acc_num

	inc	si
	dec	cx

	jmp	search_second_comma

check_acc_num:
	inc	si
	dec	cx

	cmp	cx, 4
	jae	acc_size_ok
	jmp	acc_not_found
	
acc_size_ok:
	mov	di, 0
	mov	bx, si

compare_acc:
	mov	al, acc_buffer[bx]
	cmp	al, vinput[di]
	jne	acc_num_not_match

	inc	bx
	inc	di

	cmp	di, 4
	jne	compare_acc

	jmp	acc_found		; Account found

acc_num_not_match:
	mov	si, bx			; Continue searching

next_acc_char:
	inc	si
	dec	cx

	jmp	near ptr search_acc

acc_found:
	mov	ah, 09h			; account found
	lea	dx, msg5
	int	21h

	mov	ah, 3Dh			; open transaction.txt
	mov	al, 0
	
	lea	dx, filename2
	int	21h

	jnc	trans_open_ok
	jmp	near ptr trans_file_error

trans_open_ok:
	mov	filehandle2, ax
	mov	ah, 3Fh			; read transaction.txt
	mov	bx, filehandle2

	mov	cx, 1024
	lea	dx, trans_buffer
	int	21h

	jnc	trans_read_ok
	jmp	near ptr trans_file_error

trans_read_ok:
	mov	trans_size, ax

	mov	ah, 3Eh			; close transaction.txt
	mov	bx, filehandle2
	int	21h

	mov	si, 0
	mov	balance, 0

search_trans:
	cmp	si, trans_size
	jb	trans_search_con1
	jmp	trans_search_done

trans_search_con1:
	cmp	si, 0
	je	check_trans_acc

	cmp	trans_buffer[si-1], 0Dh
	je	check_trans_acc

	cmp	trans_buffer[si-1], 0Ah
	je	check_trans_acc

	inc	si
	jmp	near ptr search_trans

check_trans_acc:
	mov	ax, trans_size
	sub	ax, si

	cmp	ax, 5
	jae	trans_search_con2
	jmp	near ptr trans_search_done

trans_search_con2:
	mov	di, 0			; Compare account number
	mov	bx, si

compare_trans_acc:
	mov	al, trans_buffer[bx]
	cmp	al, vinput[di]
	jne	trans_not_match

	inc	bx
	inc	di

	cmp	di, 4
	jne	compare_trans_acc

	cmp	trans_buffer[bx], ","
	jne	trans_not_match

	mov	si, bx			; Account number matches
	inc	si			; Now find balance

find_type_end:
	cmp	si, trans_size
	jb	find_type_con1
	jmp	near ptr find_type_end

find_type_con1:
	cmp	trans_buffer[si], ","
	je	find_amt_end

	inc	si
	jmp	near ptr find_type_end

find_amt_end:
	inc	si

find_third_comma:
	cmp	si, trans_size
	jb	third_comma_con1
	jmp	near ptr trans_search_done

third_comma_con1:
	cmp	trans_buffer[si], ","
	je	read_trans_balance

	inc	si
	jmp	near ptr find_third_comma

read_trans_balance:
	inc	si
	mov	ax, 0

read_balance_digit:
	cmp	si, trans_size
	jae	save_balance

	mov	bl, trans_buffer[si]

	cmp	bl, ","
	je	save_balance

	cmp	bl, 0Dh
	je	save_balance

	cmp	bl, 0Ah
	je	save_balance

	sub	bl, "0"
	mov	bh, 0

	mov	dx, 10
	mul	dx

	add	ax, bx
	inc	si

	jmp	near ptr read_balance_digit

save_balance:
	mov	balance, ax
	jmp	near ptr search_trans

trans_not_match:
	inc	si
	jmp	near ptr search_trans

trans_search_done:
	mov	ah, 09h			; diaplsy current balance
	lea	dx, msg6
	int	21h

	mov	ax, balance
	call	display_num

	mov	ah, 09h			; enter deposit amount
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

	mov	cx, 4			; check deposit input
	mov	si, 0

check_deposit:
	cmp	vinput[si], "0"
	jae	deposit_digit_ok1
	jmp	near ptr error

deposit_digit_ok1:
	cmp	vinput[si], "9"
	jbe	deposit_digit_ok2
	jmp	near ptr error

deposit_digit_ok2:
	inc	si
	loop	check_deposit

	mov	ax, 0			; convert deposit amount
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
	add	ax, deposit
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

	lea	di, trans_record	; create new transaction record
	mov	si, 0
	mov	cx, 4

copy_acc_num:
	mov	al, vinput[si]
	mov	[di], al

	inc	si
	inc	di

	loop	copy_acc_num

	mov	al, ","
	mov	[di], al
	inc	di

	mov	al, "D"
	mov	[di], al
	inc	di

	mov	al, "e"
	mov	[di], al
	inc	di

	mov	al, "p"
	mov	[di], al
	inc	di

	mov	al, "o"
	mov	[di], al
	inc	di

	mov	al, "s"
	mov	[di], al
	inc	di

	mov	al, "i"
	mov	[di], al
	inc	di

	mov	al, "t"
	mov	[di], al
	inc	di

	mov	al, ","
	mov	[di], al
	inc	di

	mov	ax, deposit
	mov	bx, 10
	mov	cx, 0

convert_deposit_record:
	mov	dx, 0
	div	bx

	push	dx
	inc	cx

	cmp	ax, 0
	jne	convert_deposit_record


print_deposit_record:
	pop	dx
	add	dl, "0"

	mov	[di], dl
	inc	di
	loop	print_deposit_record

	mov	al, ","
	mov	[di], al
	inc	di

	mov	ax, newbalance
	mov	bx, 10
	mov	cx, 0

convert_newbalance_record:
	mov	dx, 0
	div	bx

	push	dx
	inc	cx

	cmp	ax, 0
	jne	convert_newbalance_record

print_newbalance_record:
	pop	dx
	add	dl, "0"

	mov	[di], dl
	inc	di
	loop	print_newbalance_record

	mov	al, ","
	mov	[di], al
	inc	di

	mov	al, "0"			; date
	mov	[di], al
	inc	di

	mov	al, "3"
	mov	[di], al
	inc	di

	mov	al, "/"
	mov	[di], al
	inc	di

	mov	al, "0"
	mov	[di], al
	inc	di

	mov	al, "9"
	mov	[di], al
	inc	di

	mov	al, "/"
	mov	[di], al
	inc	di

	mov	al, "2"
	mov	[di], al
	inc	di

	mov	al, "0"
	mov	[di], al
	inc	di

	mov	al, "2"
	mov	[di], al
	inc	di

	mov	al, "6"
	mov	[di], al
	inc	di

	mov	al, 0Dh
	mov	[di], al
	inc	di

	mov	al, 0Ah
	mov	[di], al
	inc	di

	mov	ax, di
	lea	bx, trans_record
	sub	ax, bx

	mov	trans_length, ax
	mov	ah, 3Dh
	mov	al, 2				; read/write

	lea	dx, filename2
	int	21h

	jc	trans_file_error
	mov	filehandle2, ax

	mov	ah, 42h
	mov	al, 2				; from end

	mov	bx, filehandle2

	mov	cx, 0
	mov	dx, 0

	int	21h
	jc	trans_file_error

	mov	ah, 40h
	mov	bx, filehandle2
	mov	cx, trans_length

	lea	dx, trans_record
	int	21h
	jc	trans_file_error

	mov	ah, 3Eh
	mov	bx, filehandle2
	int	21h

	mov	ah, 09h
	lea	dx, msg12
	int	21h

	jmp	exit

error:	
	mov	ah, 09h			; invalid input after file open
	lea	dx, msg13
	int	21h

	jmp	start

acc_not_found:
	mov	ah, 09h
	lea	dx, msg15
	int	21h

	jmp	start

acc_file_error:
	mov	ah, 3Eh
	mov	bx, filehandle

	int	21h
	jmp	exit

trans_file_error:
	mov	ah, 09h
	lea	dx, msg16
	int	21h

	mov	ah, 3Eh
	mov	bx, filehandle2
	int	21h

	jmp	exit

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