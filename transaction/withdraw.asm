title	bank withdraw

.model	small
.stack	64

.data
	balance					dw	1000
    withdraw_amount     	dw	0
    input               	db	6, ?, 6 dup('$')

	msg_withdraw_title1		db	10,13,"---------------------------------------$"
	msg_withdraw_title2		db	10,13,"               WITHDRAW                $"
	msg_withdraw_title3		db	10,13,"---------------------------------------$"

    msg_balance				db	10,13,"Your current balance : RM $"
	msg_withdraw			db	10,13,"Please enter withdraw amount : RM $"
	msg_withdraw_success	db	10,13,"Withdraw successful! New balance : RM $"
	msg_withdraw_fail		db	10,13,"Error : Insufficient balance!$"
	msg_withdraw_invalid	db	10,13,"Error : Invalid amount! (Number only, RM1-9999)$"
	msg_withdraw_continue	db	10,13,10,13,"Do you want to continue? (Y/N) : $"

;********************************************************************************************
.code
    	main	proc	far

    	mov    	ax , @data
    	mov    	ds , ax

		mov		ah , 09h						; Display withdraw title
    	lea		dx , msg_withdraw_title1
    	int		21h
    	
    	mov		ah , 09h
    	lea		dx , msg_withdraw_title2
    	int		21h
    	
    	mov		ah , 09h
    	lea		dx , msg_withdraw_title3
    	int		21h

START:
    	mov    	ah , 09h
    	lea    	dx , msg_balance			; Display current balance
    	int    	21h

    	mov    	ax , balance				; Display balance in 4 digits
		call	DISPLAY_NUM

    	mov    	bx , 1000					; Thousands
    	mov    	dx , 0
    	div    	bx
    	add    	al , '0'
    	mov    	dl , al
    	mov    	ah , 02h
    	int    	21h

    	mov    	ax , dx						; Hundreds
    	mov    	bx , 100
    	mov    	dx , 0
    	div    	bx
    	add    	al , '0'
    	mov    	dl , al
    	mov    	ah , 02h
    	int    	21h

    	mov    	ax , dx						; Tens
    	mov    	bx , 10
    	mov    	dx , 0
    	div    	bx
    	add    	al , '0'
    	mov    	dl , al
    	mov    	ah , 02h
    	int    	21h

    	add    	dl , '0'					; Ones
    	mov    	ah , 02h
    	int    	21h

WITHDRAW:
    	mov    	ah, 09h
    	lea    	dx , msg_withdraw			; Prompt msg to let user enter withdraw amount
    	int    	21h

    	mov    	ah , 0Ah
    	lea    	dx , input					; Get user input
    	int    	21h

    	mov    	cl , input+1          		; Actual number of characters entered
		cmp		cl , 0
		je		INVALID

		mov		ch , 0
    	lea    	si , input+2          		; Pointing to the first character

CHECK_DIGIT_LOOP:
		mov		bl , [si]

		cmp		bl , '0'
		jb		INVALID
		cmp		bl , '9'
		ja		INVALID

		inc		si
		loop	CHECK_DIGIT_LOOP

    	mov    	ax , 0
    	mov    	bx , 0
    	mov    	cx , 0

    	mov    	cl , input+1
    	lea    	si , input+2

CONVERT_LOOP:
    	mov    	bl , [si]
    	sub    	bl , '0'

    	mov    	dx , 10
    	mul    	dx
    	add    	ax , bx

    	inc    	si
    	loop   	CONVERT_LOOP

    	mov    	withdraw_amount , ax

    	cmp    	ax , 1						; Check if the amount is valid (1-9999)
    	jb     	INVALID
    	cmp    	ax , 9999
    	ja     	INVALID

    	cmp    	ax , balance				; Check if the balance is sufficient
    	ja     	INSUFFICIENT

    	sub    	balance , ax				; Execute withdraw

    	mov    	ah , 09h
    	lea    	dx , msg_withdraw_success	; Shwo the withdrawal was successful
    	int    	21h

    	mov    	ax , balance				; Display new balance
		call	DISPLAY_NUM

    	jmp    	CONTINUE

GO_START:
	jmp	START

CONTINUE:
    	mov    	ah , 09h
    	lea    	dx , msg_withdraw_continue	; Prompt msg to ask user whether want to continue to withdraw
    	int    	21h

    	mov    	ah , 01h
    	int    	21h

    	and    	al , 0DFh

    	cmp    	al , 'Y'
    	je     	GO_START

    	jmp    	EXIT

INVALID:
    	mov    	ah , 09h
    	lea    	dx , msg_withdraw_invalid	; Display msg if user input an invalid input
    	int    	21h
    	jmp    	CONTINUE

INSUFFICIENT:
    	mov    	ah , 09h
    	lea    	dx , msg_withdraw_fail		; Display msg if the withdraw amount is more than the balance
    	int    	21h
    	jmp    	CONTINUE

EXIT:
    	mov    	ax , 4C00h
    	int    	21h

    	main	endp

DISPLAY_NUM 	proc
    	mov    	bx , 1000
    	mov    	dx , 0
    	div    	bx
    	add    	al , '0'
    	mov    	dl , al
    	mov    	ah , 02h
    	int    	21h

    	mov    	ax , dx
    	mov    	bx , 100
    	mov    	dx , 0
    	div    	bx
    	add    	al , '0'
    	mov    	dl , al
    	mov    	ah , 02h
    	int    	21h

    	mov    	ax , dx
    	mov    	bx , 10
    	mov    	dx , 0
    	div    	bx
    	add    	al , '0'
    	mov    	dl , al
    	mov    	ah , 02h
    	int    	21h

    	mov    	dl , dl
    	add    	dl , '0'
    	mov    	ah , 02h
    	int    	21h

    	ret
	DISPLAY_NUM endp

end	main