title	bank system	main,submenu

.model	small
.stack	64
.data
;--------------------------- MAIN MENU -----------------------------------------------------
	main1	db	10,13,"----------------------------------------- $"
	main2	db	10,13,"		          MAIN MENU					 $"
	main3	db	10,13,"----------------------------------------- $"
	main4	db	10,13,"1. Account Management $"
	main5	db	10,13,"2. Transaction $"
	main6	db	10,13,"3. Interest & Loan $"
	main7	db	10,13,"4. Generate Bank Statement $"
	main8	db	10,13,"5. Logout $"
	main9	db	10,13,"Select the option: $"

;--------------------------- Account Management Submenu ------------------------------------------
	acc1	db	10,13,"----------------------------------------- $"
	acc2	db	10,13,"		 	  ACCOUNT MANAGEMENT	         $"
	acc3	db	10,13,"----------------------------------------- $"
	acc4	db	10,13,"1. Create Account $"
	acc5	db	10,13,"2. Update Account $"
	acc6	db	10,13,"3. View Account Details $"
	acc7	db	10,13,"4. Back to Main Menu $"
	acc8	db	10,13,"Select the option: $"

;------------------------------- Transaction Submenu ------------------------------------------
	trans1	db	10,13,"----------------------------------------- $"
	trans2	db	10,13,"	        TRANSACTION MANAGEMENT	         $"
	trans3	db	10,13,"----------------------------------------- $"
	trans4	db	10,13,"1. Deposit Money $"
	trans5	db	10,13,"2. Withdrawal Money $"
	trans6	db	10,13,"3. Check Balance $"
	trans7	db	10,13,"4. Back to Main Menu $"
	trans8	db	10,13,"Select the option: $"

;----------------------------- Interest & Loan Submenu ------------------------------------------
	int1	db	10,13,"------------------------------------------ $"
	int2	db	10,13,"	       INTEREST & LOAN MANAGEMENT         $"
	int3	db	10,13,"------------------------------------------ $"
	int4	db	10,13,"1. Calculate Interest $"
	int5	db	10,13,"2. Add Interest to Balance $"
	int6	db	10,13,"3. Loan $"
	int7	db	10,13,"4. Back to Main Menu $"
	int8	db	10,13,"Select the option: $"

;--------------------------- Account Management Submenu ------------------------------------------
	gnt1	db	10,13,"----------------------------------------- $"
	gnt2	db	10,13,"	       GENERATE BANK MANAGEMENT	         $"
	gnt3	db	10,13,"----------------------------------------- $"
	gnt4	db	10,13,"Enter account number: $"

	accFoundStr	db	10,13,"Account found. $"
	pressKeyStr	db	10,13,"Press any key to generate statement... $"
	invalidStr	db	10,13,"Invalid input! Please enter numeric number. $"
	accNotFound	db	10,13,"Account not found! $"
	logoutStr	db	10,13,"Logging out... $"
	accNum		db	6dup(?)

;***********************************************************************************************
.code
	main	proc	far

	mov	ax, @data
	mov	ds, ax

main_menu:
	mov	ah, 09h
	lea	dx, main1
	int	21h

	mov	ah, 09h
	lea	dx, main2
	int	21h

	mov	ah, 09h
	lea	dx, main3
	int	21h

	mov	ah, 09h
	lea	dx, main4
	int	21h

	mov	ah, 09h
	lea	dx, main5
	int	21h

	mov	ah, 09h
	lea	dx, main6
	int	21h

	mov	ah, 09h
	lea	dx, main7
	int	21h

	mov	ah, 09h
	lea	dx, main8
	int	21h

	mov	ah, 09h
	lea	dx, main9
	int	21h

	mov	ah, 01h
	int	21h

	cmp	al, '1'
	je	acc_management	

	cmp	al, '2'
	je	transaction

	cmp	al, '3'
	je	interest_loan

	cmp	al, '4'
	je	generate_statement

	cmp	al, '5'
	je	logout

	jmp	invalid_main

invalid_main:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	main_menu

acc_management:
	mov	ah, 09h
	lea	dx, acc1
	int	21h

	mov	ah, 09h
	lea	dx, acc2
	int	21h

	mov	ah, 09h
	lea	dx, acc3
	int	21h

	mov	ah, 09h
	lea	dx, acc4
	int	21h

	mov	ah, 09h
	lea	dx, acc5
	int	21h

	mov	ah, 09h
	lea	dx, acc6
	int	21h

	mov	ah, 09h
	lea	dx, acc7
	int	21h

	mov	ah, 09h
	lea	dx, acc8
	int	21h

	mov	ah, 01h
	int	21h

	cmp	al, '1'
	je	create_acc

	cmp	al, '2'
	je	update_acc

	cmp	al, '3'
	je	view_acc

	cmp	al, '4'
	je	main_menu

	jmp	invalid_acc

invalid_acc:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	acc_management

transaction:
	mov	ah, 09h
	lea	dx, trans1
	int	21h

	mov	ah, 09h
	lea	dx, trans2
	int	21h

	mov	ah, 09h
	lea	dx, trans3
	int	21h

	mov	ah, 09h
	lea	dx, trans4
	int	21h

	mov	ah, 09h
	lea	dx, trans5
	int	21h

	mov	ah, 09h
	lea	dx, trans6
	int	21h

	mov	ah, 09h
	lea	dx, trans7
	int	21h

	mov	ah, 09h
	lea	dx, trans8
	int	21h

	mov	ah, 01h
	int	21h

	cmp	al, '1'
	je	deposit_money

	cmp	al, '2'
	je	withdrawal_money

	cmp	al, '3'
	je	check_bal

	cmp	al, '4'
	je	main_menu

	jmp	invalid_trans

invalid_trans:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	transaction

interest_loan:
	mov	ah, 09h
	lea	dx, int1
	int	21h

	mov	ah, 09h
	lea	dx, int2
	int	21h

	mov	ah, 09h
	lea	dx, int3
	int	21h

	mov	ah, 09h
	lea	dx, int4
	int	21h

	mov	ah, 09h
	lea	dx, int5
	int	21h

	mov	ah, 09h
	lea	dx, int6
	int	21h

	mov	ah, 09h
	lea	dx, int7
	int	21h

	mov	ah, 09h
	lea	dx, int8
	int	21h

	mov	ah, 01h
	int	21h

	cmp	al, '1'
	je	cal_interest

	cmp	al, '2'
	je	add_interest

	cmp	al, '3'
	je	loan

	cmp	al, '4'
	je	main_menu

	jmp	invalid_interest

invalid_interest:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	interest_loan

generate_statement:
	mov	ah, 09h
	lea	dx, statementMenuStr
	int	21h

	mov	cx, 6
	mov	si, 0

input_acc:
	mov	ah, 01h
	int	21h

	mov	accNum[si], al
	inc	si
	loop	input_acc

	mov	cx, 6
	mov	si, 0

check_acc:
	cmp	accNum[si], '0'
	jb	error

	cmp	accNum[si], '9'
	ja	error

	inc	si
	loop	check_acc

error:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	generate_statement

acc_found:
	mov	ah, 09h
	lea	dx, accFoundStr
	int	21h

	mov	ah, 09h
	lea	dx, pressKeyStr
	int	21h

	mov	ah, 01h
	int	21h
	jmp 	main_menu			; generate statement here

acc_not_found:
	mov	ah, 09h
	lea	dx, accNotFound
	int	21h

	jmp	main_menu

logout:
	mov	ah, 09h
	lea	dx, logoutStr
	int	21h

	mov	ax, 4C00h
	int	21h