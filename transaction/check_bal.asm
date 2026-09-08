title	Check balance system

.model	small
.stack	64
.data
    chk1	db	10,13,"------------------------- $"
	chk2	db	10,13,"       CHECK BALANCE       $"
	chk3	db	10,13,"------------------------- $"
	chk4	db	10,13,"Enter account number: $"
	chk5	db	10,13,"Account found. $"
	chk6	db	10,13,"Current Balance: RM$"
	chk7	db	10,13,10,13,"Invalid input! Please enter numeric number. $"
	chk8	db	10,13,"Account not found! $"
	chk9	db	10,13,"Transaction file error! $"

	found_flag	db	0
	acc_num	dw	?
	balance	dw	?
	vinput	db	4 dup(?)

	filename2	db	"transaction.txt",0
	filehandle2	dw	?

	trans_buffer	db	1024 dup(?)
	trans_size	dw	?

;***********************************************************************************************
.code
	main	proc	far

	mov		ax, @data
	mov		ds, ax

	mov		ah, 09h				; display check balance title
	lea		dx, chk1
	int		21h

	mov		ah, 09h
	lea		dx, chk2
	int		21h

	mov		ah, 09h
	lea		dx, chk3
	int		21h

	mov		ah, 09h
	lea		dx, chk4			; enter account number
	int		21h

	mov		cx, 4
	mov		si, 0

input_check_acc:
	mov		ah, 01h
	int		21h

	cmp		al, '0'
	jb		check_invalid

	cmp		al, '9'
	ja		check_invalid

	mov		vinput[si], al
	inc		si
	loop	input_check_acc

	mov		ah, 3Dh				; open transaction.txt
	mov		al, 0
	
	lea		dx, filename2
	int		21h
	
	jc		check_file_error
	mov		filehandle2,ax

	mov		ah, 3Fh
	mov		bx, filehandle2			; read transaction.txt
	mov		cx, 1024

	lea		dx, trans_buffer
	int		21h
	
	jc		check_file_error
	mov		trans_size, ax

	mov		ah, 3Eh				; close transaction.txt
	mov		bx, filehandle2
	int		21h

	mov		si, 0					; search transaction record
	mov		balance, 0

search_trans:
	cmp		si, trans_size
	jae		trans_not_found

	cmp		si, 0							; check wheter is begining of new record
	je		check_acc

	cmp		trans_buffer[si-1], 0Ah
	je		check_acc

	inc		si
	jmp		search_trans

check_acc:
	mov		di, 0
	mov		bx, si

compare_check_acc:
	mov		al, trans_buffer[bx]
	cmp		al, vinput[di]
	jne		check_not_match

	inc		bx
	inc		di

	cmp		di, 4
	jne		compare_check_acc

	cmp		trans_buffer[bx], ','				; after acc number must be ","
	jne		check_not_match

	mov		found_flag, 1

	mov		ah, 09H							; account found
	lea		dx, chk5
	int		21H

	mov		si, bx
	inc		si

find_type_end:
    cmp     si, trans_size					; skip transaction type
    jae     trans_not_found

    cmp     trans_buffer[si], ","
    je      find_amt_start

    inc     si
    jmp     find_type_end

find_amt_start:
    inc     si							; skip amount field

find_amt_end:
    cmp     si, trans_size
    jae     trans_not_found

    cmp     trans_buffer[si], ","
    je      read_check_bal

    inc     si
    jmp     find_amt_end

read_check_bal:
	inc		si									; read new balance
	mov		balance, 0

read_balance_digit:
    cmp     si, trans_size
    jae     save_check_balance

    mov     bl, trans_buffer[si]

    cmp     bl, ","
    jae      save_check_balance

    cmp     al, 0Dh
    jae      save_check_balance

    cmp     al, 0Ah
    jae      save_check_balance

    sub     al, "0"
    mov     bh, 0

    mov     dx, 10
    mul     dx
    add     ax, bx

    inc     si
    jmp     read_balance_digit

save_check_balance:
	mov		balance, ax
    jmp     search_trans

check_not_match:
	inc		si
	jmp		search_trans

check_not_found:
    cmp     found_flag, 0
    je      check_acc_not_found

    mov     ah, 09h
    lea     dx, chk6						; display balance
    int     21h

    mov     ax, balance
    call    display_num

    jmp     transaction

check_invalid:
	mov		ah, 09h				; invalid input
	lea		dx, chk7
	int		21h

	jmp		transaction

check_acc_not_found:
	mov		ah, 09h				; account not found
	lea		dx, chk8
	int		21h

	jmp		transaction

check_file_error:
	mov		ah, 09h
	lea		dx, chk9
	int		21h

	jmp		transaction

check_bal endp

display_num_chk proc			; display number
	mov		bx, 10
	mov		cx, 0

convert_num:
	mov		dx, 0
	div		bx

	push	dx
	inc		cx

	cmp		ax, 0
	jne		convert_num

print_num:	
	pop		dx
	add		dl, "0"

	mov		ah, 02h
	int		21h

	loop	print_num
	ret

display_num_chk endp

exit:	
	mov		ax, 4c00h
	int		21h

	main	endp
end	main