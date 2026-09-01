title	bank system	main,submenu

.model	small
.stack	64
.data
;--------------------------- MAIN MENU -----------------------------------------------------
mainMenu	db	10,13,"-----------------------------------------"
		db	10,13,"		      MAIN MENU			"
		db	10,13,"-----------------------------------------"
		db	10,13,"1. Account Management"
		db	10,13,"2. Transaction"
		db	10,13,"3. Interest & Loan"
		db	10,13,"4. Generate Bank Statement"
		db	10,13,"5. Logout"
		db	10,13,"Select the option: $"

;--------------------------- Account Management Submenu ------------------------------------------
accMenuStr	db	10,13,"-----------------------------------------"
		db	10,13,"		  ACCOUNT MANAGEMENT	        "
		db	10,13,"-----------------------------------------"
		db	10,13,"1. Create Account"
		db	10,13,"2. Update Account"
		db	10,13,"3. View Account Details"
		db	10,13,"4. Back to Main Menu"
		db	10,13,"Select the option: $"

;------------------------------- Transaction Submenu ------------------------------------------
transMenuStr	db	10,13,"-----------------------------------------"
		db	10,13,"	        TRANSACTION MANAGEMENT	        "
		db	10,13,"-----------------------------------------"
		db	10,13,"1. Deposit Money"
		db	10,13,"2. Withdrawal Money"
		db	10,13,"3. Check Balance"
		db	10,13,"4. Back to Main Menu"
		db	10,13,"Select the option: $"

;----------------------------- Interest & Loan Submenu ------------------------------------------
intMenuStr	db	10,13,"------------------------------------------"
		db	10,13,"	       INTEREST & LOAN MANAGEMENT        "
		db	10,13,"------------------------------------------"
		db	10,13,"1. Calculate Interest"
		db	10,13,"2. Add Interest to Balance"
		db	10,13,"3. Loan"
		db	10,13,"4. Back to Main Menu"
		db	10,13,"Select the option: $"

;--------------------------- Account Management Submenu ------------------------------------------
mainMenu	db	10,13,"-----------------------------------------"
		db	10,13,"	       GENERATE BANK MANAGEMENT	        "
		db	10,13,"-----------------------------------------"
		db	10,13,"Enter account number: $"

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
	lea	dx, mainMenu
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
	lea	dx, accMenuStr
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
	lea	dx, transMenuStr
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
	lea	dx, intMenuStr
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

generate_management:
	mov	ah, 09h
	lea	dx, statementMenuStr
	int	21h

	mov	cx, 6
	mov	si, 0

invalid_acc:
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

	jmp	main_menu

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
	lea	dx, accnotFoundStr
	int	21h

	jmp	main_menu

logout:
	mov	ah, 09h
	lea	dx, logoutStr
	int	21h

	mov	ax, 4C00h
	int	21h

