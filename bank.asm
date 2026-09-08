title       assignment       login function

.model      small
.stack      64

.data
;=================================LOGIN============================================
;===========================================================
; LOGO
;===========================================================

logo1   db 10,13,"============================================================$"
logo2   db 13,10," *                                                          * $"
logo3   db 13,10,"  *     AAA       BBBBB      CCCCC                           $"
logo4   db 13,10,"       A   A      B    B     C                               $"
logo5   db 13,10,"      AAAAAAA     BBBBB      C                               $"
logo6   db 13,10,"      A     A     B    B     C                               $"
logo7   db 13,10,"*     A     A     BBBBB      CCCCC   *                       $"
logo8   db 13,10,"$"
logo9   db 13,10,"                 ABC COMPANY$"
logo10  db 13,10,"============================================================$"
logo11  db 13,10,13,10,"               Press ENTER to continue...$"


;===========================================================
; MAIN MENU
;===========================================================

msg1    db 10,13,10,13,"==============================$"
msg2    db 10,13,"Welcome to ABC Company$"
msg3    db 10,13,"==============================$"
msg4    db 10,13,"1. Login$"
msg5    db 10,13,"2. Register$"
msg6    db 10,13,"3. Exit$"
msg7    db 10,13,"Enter your choice: $"


;===========================================================
; REGISTER
;===========================================================

msg8    db 10,13,10,13,"==============================$"
msg9    db 10,13,"REGISTER$"
msg10   db 10,13,"==============================$"
msg11   db 10,13,"Enter Username : $"
msg12   db 10,13,"Enter Password : $"
msg13   db 10,13,"Enter Phone Number : $"
msg14   db 10,13,"Enter Email : $"

msg15   db 10,13
        db "Password must contain uppercase, lowercase, "
        db "special character and number!$"


;===========================================================
; LOGIN
;===========================================================

msg16   db 10,13,10,13,"==============================$"
msg17   db 10,13,"LOGIN$"
msg18   db 10,13,"==============================$"
msg19   db 10,13,"Enter Username : $"
msg20   db 10,13,"Enter Password : $"

msg21   db 10,13,"Login Successfully!$"

msg22   db 10,13,"Invalid username or password!$"

msg23   db 10,13,"Register Successfully!$"

msg24   db 10,13,"Invalid email! Please enter correct email!$"
msg25   db 10,13,"Email already registered! Please enter another email!$"
msg26   db 10,13,"Username already exists! Please enter another username!$"
msg27   db 10,13,"Select Account Type:$"
msg28   db 10,13,"1. Saving$"
msg29   db 10,13,"2. Current$"
msg30   db 10,13,"Enter your choice (1 or 2) : $"
msg31   db 10,13,"Invalid account type! Please choose 1 or 2.$"
msg32   db 10,13,"Your Account Number : $"
msg33   db 10,13,"Error: Cannot create or update account.txt!$"

msg_file_error db 10,13,"Error: Cannot open user.txt!$"

;================================Account detail============================================
logo_account        db 13,10,"=========================="
                        db 13,10,"        .--------."
                        db 13,10,"        |   O    |"
                        db 13,10,"        |  /|\   |"
                        db 13,10,"        |  / \   |"
                        db 13,10,"        '--------'"
                        db 13,10,"      ACCOUNT MANAGEMENT"
                        db 13,10,"==========================$"

    msg_account_acc         db 13,10,"=========================="
                        db 13,10,"    Account Management"
                        db 13,10,"==========================$"

    msg_view            db 13,10,"1. View Account Details$"
    msg_update          db 13,10,"2. Update Account$"
    msg_change          db 13,10,"3. Change Password$"
    msg_back            db 13,10,"4. Back$"

    msg_choice1         db 13,10,"Enter your choice (1 to 4) : $"

    msg_details         db 13,10,"=========================="
                        db 13,10,"      Account Details"
                        db 13,10,"==========================$"
    msg_username1       db 13,10,"Username        : $"
    msg_email1          db 13,10,"Email           : $"
    msg_phone1          db 13,10,"Phone Number    : $"
    msg_accountno1      db 13,10,"Account Number  : $"
    msg_acctype1        db 13,10,"Account Type    : $"
    msg_current_acc     db 13,10,"Current Balance : RM $"
    msg_return1         db 13,10,13,10
                        db "Press ENTER to return to Account Management...$"

    msg_updateacc       db 13,10,"=========================="
                        db 13,10,"      Update Account"
                        db 13,10,"==========================$"
    msg_username2       db 13,10,"1. Username$"
    msg_phone2          db 13,10,"2. Phone Number$"
    msg_email2          db 13,10,"3. Email$"
    msg_back2           db 13,10,"4. Back$"
    msg_choice2         db 13,10,"Enter your choice (1 to 4) : $"
    msg_invalid_acc         db 13,10,"Invalid choice! Please try again!$"
    msg_currentname     db 13,10,"Current Username     : $"
    msg_newname         db 13,10,"New Username         : $"
    msg_currentphone    db 13,10,"Current Phone Number : $"
    msg_newphone        db 13,10,"New Phone Number     : $"
    msg_currentemail    db 13,10,"Current Email        : $"
    msg_newemail        db 13,10,"New Email            : $"
    msg_updatesuccess   db 13,10,"Update successful!$"
    msg_invalid2        db 13,10,"Username cannot be same as current!$"
    msg_invalid3        db 13,10,"Phone number cannot be same as current!$"
    msg_invalid4        db 13,10,"Email cannot be same as current!$"
    msg_empty           db 13,10,"Input cannot be empty!$"
    msg_invalidemail    db 13,10,"Invalid email! Please enter correct email!$"

    msg_changepass      db 13,10,"=========================="
                        db 13,10,"      Change Password"
                        db 13,10,"==========================$"
    msg_currentpass     db 13,10,"Current Password : $"
    msg_newpass         db 13,10,"New Password     : $"
    msg_confirmpass     db 13,10,"Confirm Password : $"
    msg_invalid5        db 13,10,"Password must contain uppercase, lowercase, special character and number!$"
    msg_updatesuccess2  db 13,10,"Update successful!$"
    msg_invalid6        db 13,10,"Password cannot be same as current!$"
    msg_invalid7        db 13,10,"Password does not match!$"
    msg_wrongpass       db 13,10,"Current password is incorrect!$"


;=================================MAIN MENU============================================

	main1	db	10,13,"----------------------------------------- $"
	main2	db	10,13,"		          MAIN MENU					 $"
	main3	db	10,13,"----------------------------------------- $"
	main4	db	10,13,"1. Account Management $"
	main5	db	10,13,"2. Transaction $"
	main6	db	10,13,"3. Interest & Loan $"
	main7	db	10,13,"4. Generate Bank Statement $"
	main8	db	10,13,"5. Logout $"
	main9	db	10,13,"Select the option: $"

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


;=================================LOAN AND INTEREST============================================

;======LOAN========================
Layout DB "  **	* *          \`````````````/ 	|          |	",13,10
DB      "       * *  *   *    \           /  	|	   |	",13,10
DB 	"   * **		   * (===========)     (	   )   ",13,10
DB 	" *	            * /   S|S|S  \      |          |   ",13,10
DB 	" *	             /	 S | | `  \ *	|          |   ",13,10
DB 	"  *                / 	  `S |     \ *  \          |   ",13,10
DB 	"   * * *          /	   |`S      \  * *|        |   ",13,10
DB 	"	         /	 S | |S      \	  o\       |*  ",13,10
DB 	"	        /	  `SSSS`      \  o  \      |  * ",13,10
DB 	"	        (______________________) o    \    |   *",13,10
DB 	" +-+  +--++-+    +-+ +-+        s-s     o     \  |  * ",13,10
DB 	" | |  |||||  \   |  \| |	@  s-----s      \uu+  **    ",13,10
DB 	" | |  ||||| A \  |   \ |      @ \___________/   |     ",13,10
DB 	" | |__||||| |\ \ | |   |        \  \--------/  / /      ",13,10
DB 	" |____|__||_| \_\|_|\__|         \____________/_/      $"



    Loan1 DB 10,13,"ENTER LOAN AMOUNT TO BORROW:$"
    Year2 DB 10,13, "ENTER YEAR TO BORROW:$"
    Menu3 DB 10,13,"+==================================+",13,10
	 DB "TOTAL LOAN YOU NEED TO RETURN:RM $"

    LoanMenu DB 10,13,"+=================================+",13,10
    	 DB  "|1.RM 15,000		        ",13,10
    	 DB  "|2.RM 20,000			",13,10   ; Loan Layout 
    	 DB  "|3.RM 25,000     		    	",13,10
    	 DB  "|4.RM 30,000 		        ",13,10
         DB  "+=================================+$"

    YearMenu DB 10,13,"+=================================+",13,10
	 DB"|1. 5 year                          ",13,10	;Year Layout 
         DB"|2. 10 year                         ",13,10
	 DB "+=================================+$"

    ExitMsg DB 10,13, "Enter ('Y') to exit:$"
    ErrorMsg1 DB 10,13, "Invalid, choose between (1,2,3 or 4)!$"
    ErrorMsg2 DB 10,13, "Invalid, choose between (1 or 2)!$"


;=============================INTEREST===========================
;=========================ADD INTEREST===================================

msg_title           DB 13,10,"======================================="
                        DB 13,10,"      ADD INTEREST INTO BALANCE"
                        DB 13,10,"=======================================$"

    msg_account         DB 13,10,"Enter Account Number: $"
    msg_current         DB 13,10,"Current Balance : RM $"
    msg_rate            DB 13,10,"Interest Rate   : 5%$"
    msg_interest        DB 13,10,"Interest Added  : RM $"
    msg_new             DB 13,10,"New Balance     : RM $"

    msg_success         DB 13,10,13,10
                        DB "Interest added successfully!$"

    msg_invalid         DB 13,10
                        DB "Invalid input! Enter exactly 4 digits.$"

    msg_not_found       DB 13,10
                        DB "Account not found!$"

    msg_file_error_int      DB 13,10
                        DB "Error: Cannot open or read account.txt!$"

    msg_update_error    DB 13,10
                        DB "Error: Cannot update account.txt!$"

;===================CALCULATE INTEREST=================================

 logo_interest       db 13,10,"======================================="
                        db 13,10,"          CALCULATE INTEREST"
                        db 13,10,"=======================================$"

    msg_account_input         db 13,10,"Enter Account Number : $"
    msg_balance_input         db 13,10,"Current Balance : RM $"
    msg_rate_input            db 13,10,"Interest Rate   : 5%$"
    msg_interest_input        db 13,10,"Interest Amount : RM $"
    msg_not_found_error       db 13,10,"Error : Account not found!$"
    msg_file_error_calc      db 13,10,"Error : Cannot open account.txt!$"
    msg_continue        db 13,10,"Do you want to continue? (Y/N) : $"

;=========================TRANSACTION========================

;=========================CHECK BALANCE======================
chk1	db	10,13,"------------------------- $"
	chk2	db	10,13,"       CHECK BALANCE       $"
	chk3	db	10,13,"------------------------- $"
	chk4	db	10,13,"Enter account number: $"
	chk5	db	10,13,"Account found. $"
	chk6	db	10,13,"Current Balance: RM$"
	chk7	db	10,13,10,13,"Invalid input! Please enter numeric number. $"
	chk8	db	10,13,"Account not found! $"
	chk9	db	10,13,"Transaction file error! $"


;=========================DEPOSIT=============================
    dep1	db	10,13,"========================================= $"
	dep2	db	10,13,"        			 DEPOSIT      		     $"
	dep3	db	10,13,"========================================= $"
	dep4	db	10,13,"Enter account number: $"
	dep5	db	10,13,"Account found. $"
	dep6	db	10,13,"Current Balance: RM$"
	dep7	db	10,13,"Enter deposit amount: RM$"
	dep8	db	10,13,10,13,"Deposit successful! $"
	dep9	db	10,13,10,13,"Current Balance: RM$"
	dep10	db	10,13,"Deposit Amount: RM$"
	dep11	db	10,13,"New Balance: RM$"
	dep12	db	10,13,"Account balance updated successfully! $"
	dep13	db	10,13,10,13,"Invalid input! Please enter numeric number. $"
	dep14	db	10,13,10,13,"Do you want to continue (Y or N): $"
	dep15	db	10,13,"Account not found! $"
	dep16	db	10,13,"Transaction file error! $"
;=========================WITHDRAWAL==========================
	msg_withdraw_title1		db	10,13,"---------------------------------------$"
	msg_withdraw_title2		db	10,13,"               WITHDRAW                $"
	msg_withdraw_title3		db	10,13,"---------------------------------------$"

    msg_balance				db	10,13,"Your current balance : RM $"
	msg_withdraw			db	10,13,"Please enter withdraw amount : RM $"
	msg_withdraw_success	db	10,13,"Withdraw successful! New balance : RM $"
	msg_withdraw_fail		db	10,13,"Error : Insufficient balance!$"
	msg_withdraw_invalid	db	10,13,"Error : Invalid amount! (Number only, RM1-9999)$"
	msg_withdraw_continue	db	10,13,10,13,"Do you want to continue? (Y/N) : $"


;=======================Variable setting input ========================
;=========================Account Detail ========================
    current_balance_acc     dw 0

    acc_username        db 21 dup(0)
    acc_phone           db 16 dup(0)
    acc_email           db 31 dup(0)

    acc_currentpass     db 21 dup(0)
    acc_newpass         db 21 dup(0)
    acc_confirmpass     db 21 dup(0)

    acc_has_upper       db 0
    acc_has_lower       db 0
    acc_has_number      db 0
    acc_has_special     db 0

    acc_has_at          db 0
    acc_has_dot         db 0

    balance_digit       db 6 dup(0)

;--------------Main Menu variable part----------------
accNum		db	6 dup(?)

;--------------Login variable part----------------

;===========================================================
; REGISTER DATA
;===========================================================

reg_username        db 21 dup(0)
reg_password        db 21 dup(0)
reg_phone           db 16 dup(0)
reg_email           db 31 dup(0)

; registration bank account data
reg_account_type    db 8 dup(0)          ; "Saving" or "Current"
reg_customer_id     db 5 dup(0)          ; e.g. C004 + null
reg_account_number  db 5 dup(0)          ; e.g. 9013 + null
reg_customer_value  dw 0
reg_account_value   dw 0
reg_found_customer  db 0

; account management bank details
view_account_number db 5 dup(0)
view_account_type   db 8 dup(0)
account_name_temp   db 21 dup(0)
account_manage_buffer db 4096 dup(?)
account_manage_size dw 0
account_manage_handle dw ?
account_detail_found db 0

login_username      db 21 dup(0)
login_password      db 21 dup(0)

has_upper           db 0			;password validation
has_lower           db 0
has_number          db 0
has_special         db 0

has_at              db 0			;email validation
has_dot             db 0

;===========================================================
; USER.TXT
;===========================================================

user_filename       db "user.txt",0
user_handle         dw ?			;file handle

comma_char          db ","			;seperate user data with ,
new_line            db 13,10		;one user finish, go to next line
file_char           db ?			;read one character from user.txt
file_eof            db 0			;check end of file
dup_comma_count     db 0            ;count commas when checking duplicate email


file_username       db 21 dup(0)	;store username read from user.txt
file_password       db 21 dup(0)	;store password read from user.txt
file_phone          db 16 dup(0)	;store phone read from user.txt
file_email          db 31 dup(0)	;store email from user.txt

;===========================================================
; ACCOUNT.TXT REGISTRATION DATA
;===========================================================
account_header      db "# CustomerID, Name, Account Number, Account Type, Current Balance",13,10
account_header_len  equ $-account_header
zero_balance_char   db "0"

saving_text         db "Saving",0
current_text        db "Current",0

;========================LOAN AND INTEREST VARIABLE========================
;======LOAN========================
NUM1 DB 0 ;num1 to num2 do the input 
NUM2 DB 0
NUM3 DB 0 ; num3 to num7 is display the value 
NUM4 DB 0
NUM5 DB 0
NUM6 DB 0
NUM7 DB 0 
LOAN DW 0 	; Store value to protect 
YEAR DW 0 	;Store value to protect 
RESULT DW 0	; final result (loan * year *interest)
INTEREST DW 0 	;Interest result 
;===============================INTEREST=============================
;=======================ADD INTEREST===================================
    acc_filename            DB "account.txt",0
    temp_filename       DB "temp.txt",0

    file_handle         DW ?
    temp_handle         DW ?

    file_size           DW ?
    file_end            DW ?

    balance_start       DW ?
    balance_end         DW ?

    current_balance     DW 0
    interest_amount     DW 0
    new_balance         DW 0

    ; DOS buffered input
    ; Maximum 4 characters
    account_input       DB 5
                        DB 0
                        DB 6 DUP(0)

    file_buffer         DB 4096 DUP(?)

    number_buffer       DB 6 DUP(0)
    number_pointer      DW ?
    number_length       DW ?

;=======================CALCULATE INTEREST=============================
 account_filename    db "account.txt",0
    account_handle      dw ?
    file_bytes          dw ?
    file_end_calc            dw ?

    file_buffer_calc         db 4096 dup(?)

    account_input_calc       db 20               ;maximum 20 character can be entered
                        db ?                ;store actual number of character entered
                        db 20 dup(0)        ;store the account number entered by user

    current_balance_calc     dw 0
    interest_amount_calc     dw 0

    number_temp         dw 0
    number_started      db 0

;========================TRANSACTION=========================================

;=======================CHECK BALANCE=======================
    found_flag	db	0
	acc_num	dw	?
	balance_chk	dw	?
	vinput_chk	db	4 dup(?)

	filename2	db	"transaction.txt",0
	filehandle2	dw	?

	trans_buffer_chk	db	1024 dup(?)
	trans_size	dw	?

;=======================DEPOSIT=============================
    acc_num_dep	dw	?
	balance_dep	dw	?
	deposit	dw	?
	newbalance	dw	?
	vinput_dep	db	4 dup(?)
        acc_input db 4 dup(?)

	filename	db	"account.txt",0
	filehandle	dw	?
	
	;filename2	db	"transaction.txt",0 same file in check balance
	;filehandle2	dw	?

	acc_buffer	db	512 dup(?)
	acc_size	dw	?

	trans_buffer_dep	db	1024 dup(?)
	trans_size_dep	dw	?

	trans_record	db	80 dup(?)
	trans_length	dw	?

        date_day    db ?
	date_month  db ?
	date_year   dw ?

;=======================WITHDRAWAL=======================
    balance_wid					dw	1000
    withdraw_amount     	dw	0
    input               	db	6, ?, 6 dup('$')

;==================================================================
.code
	main 	proc 	far

        mov     ax,@data
        mov     ds,ax

        mov     ah,09h				;display logo
        lea     dx,logo1
        int     21h

        mov     ah,09h
        lea     dx,logo2
        int     21h

        mov     ah,09h
        lea     dx,logo3
        int     21h

        mov     ah,09h
        lea     dx,logo4
        int     21h

        mov     ah,09h
        lea     dx,logo5
        int     21h

        mov     ah,09h
        lea     dx,logo6
        int     21h

        mov     ah,09h
        lea     dx,logo7
        int     21h

        mov     ah,09h
        lea     dx,logo8
        int     21h

        mov     ah,09h
        lea     dx,logo9
        int     21h

        mov     ah,09h
        lea     dx,logo10
        int     21h

        mov     ah,09h
        lea     dx,logo11
        int     21h

press_enter:
        mov     ah,01h				;press enter
        int     21h

        cmp     al,0Dh
        jne     press_enter

        jmp     menu

menu:
        mov     ah,09h				;display main menu
        lea     dx,msg1
        int     21h

        mov     ah,09h
        lea     dx,msg2
        int     21h

        mov     ah,09h
        lea     dx,msg3
        int     21h

        mov     ah,09h
        lea     dx,msg4
        int     21h

        mov     ah,09h
        lea     dx,msg5
        int     21h

        mov     ah,09h
        lea     dx,msg6
        int     21h

        mov     ah,09h
        lea     dx,msg7
        int     21h

        mov     ah,01h
        int     21h

        cmp     al,'1'
        je      menu_login

        cmp     al,'2'
        je      menu_register

        cmp     al,'3'
        je      menu_exit

        jmp     menu

menu_login:
        jmp     login

menu_register:
        jmp     register

menu_exit:
        jmp     exit_program

register:
        mov     ah,09h
        lea     dx,msg8
        int     21h

        mov     ah,09h
        lea     dx,msg9
        int     21h

        mov     ah,09h
        lea     dx,msg10
        int     21h

        jmp     input_register_username_start

input_register_username_start:
        mov     ah,09h
        lea     dx,msg11
        int     21h

        mov     si,0

register_username:
        mov     ah,01h
        int     21h

        cmp     al,0Dh
        je      username_done

        mov     reg_username[si],al

        inc     si

        cmp     si,20
        jae     username_full

        jmp     register_username

username_done:
        mov     byte ptr reg_username[si],0

        jmp     check_duplicate_username

username_full:
        mov     byte ptr reg_username[si],0

        jmp     check_duplicate_username

check_duplicate_username:
        mov     ax,3D00h               ;open user.txt for reading
        lea     dx,user_filename
        int     21h

        jnc     duplicate_username_file_open_ok

        cmp     ax,2                   ;error 2 = file does not exist yet
        jne     duplicate_username_open_error
        jmp     username_not_found

duplicate_username_open_error:
        jmp     user_file_error

duplicate_username_file_open_ok:
        mov     user_handle,ax

duplicate_username_next_record:
        mov     si,0

read_existing_username:
        mov     bx,user_handle
        mov     ah,3Fh
        mov     cx,1
        lea     dx,file_char
        int     21h

        cmp     ax,0
        je      duplicate_username_not_found_close

        mov     al,file_char

        cmp     al,13                  ;skip CR between records
        je      read_existing_username

        cmp     al,10                  ;skip LF between records
        je      read_existing_username

        cmp     al,','                 ;end of username field
        je      existing_username_done

        cmp     si,20
        jae     read_existing_username

        mov     file_username[si],al
        inc     si

        jmp     read_existing_username

existing_username_done:
        mov     byte ptr file_username[si],0
        mov     si,0

compare_existing_username:
        mov     al,file_username[si]
        cmp     al,reg_username[si]
        jne     duplicate_username_skip_record

        cmp     al,0
        je      duplicate_username_found

        inc     si
        jmp     compare_existing_username

duplicate_username_skip_record:
        mov     bx,user_handle
        mov     ah,3Fh
        mov     cx,1
        lea     dx,file_char
        int     21h

        cmp     ax,0
        je      duplicate_username_not_found_close

        mov     al,file_char
        cmp     al,13
        je      duplicate_username_next_record
        cmp     al,10
        je      duplicate_username_next_record

        jmp     duplicate_username_skip_record

duplicate_username_found:
        mov     bx,user_handle
        mov     ah,3Eh
        int     21h

        mov     ah,09h
        lea     dx,msg26
        int     21h

        jmp     input_register_username_start

duplicate_username_not_found_close:
        mov     bx,user_handle
        mov     ah,3Eh
        int     21h

username_not_found:
        jmp     password_again

password_again:
        mov     ah,09h
        lea     dx,msg12
        int     21h

        mov     si,0

register_password:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      password_done

        cmp     al,08h
        je      register_password_backspace

        cmp     si,20
        jae     register_password

        mov     reg_password[si],al

        inc     si

        mov     dl,'*'
        mov     ah,02h
        int     21h

        jmp     register_password

register_password_backspace:
        cmp     si,0
        je      register_password

        dec     si

        mov     byte ptr reg_password[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     register_password

password_done:
        mov     byte ptr reg_password[si],0

        jmp     validate_password

validate_password:
        mov     has_upper,0
        mov     has_lower,0
        mov     has_number,0
        mov     has_special,0

        mov     si,0

validate_loop:
        mov     al,reg_password[si]

        cmp     al,0
        je      check_password_requirement

        cmp     al,41h					;check uppercase
        jb      validate_lowercase

        cmp     al,5Ah
        jbe     validate_upper_found

validate_lowercase:
        cmp     al,61h					;check lowercase
        jb      validate_number

        cmp     al,7Ah
        jbe     validate_lower_found

validate_number:
        cmp     al,30h					;check number
        jb      validate_special_found

        cmp     al,39h
        jbe     validate_number_found

        jmp     validate_special_found

validate_upper_found:
        mov     has_upper,1

        inc     si

        jmp     validate_loop

validate_lower_found:
        mov     has_lower,1

        inc     si

        jmp     validate_loop

validate_number_found:
        mov     has_number,1

        inc     si

        jmp     validate_loop

validate_special_found:
        mov     has_special,1

        inc     si

        jmp     validate_loop

check_password_requirement:
        cmp     has_upper,1
        jne     password_invalid

        cmp     has_lower,1
        jne     password_invalid

        cmp     has_number,1
        jne     password_invalid

        cmp     has_special,1
        jne     password_invalid

        jmp     input_phone_start

password_invalid:
        mov     ah,09h
        lea     dx,msg15
        int     21h

        jmp     password_again


input_phone_start:

        mov     ah,09h			;display phone number
        lea     dx,msg13
        int     21h

        mov     si,0

input_phone:
        mov     ah,01h
        int     21h

        cmp     al,0Dh
        je      phone_done

        mov     reg_phone[si],al

        inc     si

        cmp     si,15
        jae     phone_done

        jmp     input_phone

phone_done:
        mov     byte ptr reg_phone[si],0

        jmp     input_email_start

input_email_start:
        mov     ah,09h
        lea     dx,msg14
        int     21h

        mov     si,0

input_email:
        mov     ah,08h                 ;read without automatic echo
        int     21h

        cmp     al,0Dh                 ;ENTER
        je      email_done

        cmp     al,08h                 ;BACKSPACE
        je      email_backspace

        cmp     al,00h                 ;extended key prefix
        je      email_extended_key

        cmp     al,0E0h                ;extended key prefix on some keyboards
        je      email_extended_key

        cmp     si,30
        jae     input_email

        mov     reg_email[si],al
        inc     si

        mov     dl,al                  ;manual echo
        mov     ah,02h
        int     21h

        jmp     input_email

email_extended_key:
        mov     ah,08h                 ;read scan code
        int     21h

        cmp     al,53h                 ;DELETE key
        je      email_backspace        ;treat DELETE as delete previous character

        jmp     input_email

email_backspace:
        cmp     si,0
        je      input_email

        dec     si
        mov     byte ptr reg_email[si],0

        mov     dl,08h                 ;move cursor left
        mov     ah,02h
        int     21h

        mov     dl,' '                 ;erase character
        mov     ah,02h
        int     21h

        mov     dl,08h                 ;move cursor left again
        mov     ah,02h
        int     21h

        jmp     input_email

email_done:
        mov     byte ptr reg_email[si],0

        jmp     validate_email

validate_email:
        mov     has_at,0
        mov     has_dot,0

        mov     si,0

        cmp     byte ptr reg_email[0],0
        je      email_invalid

        cmp     byte ptr reg_email[0],'@'
        je      email_invalid

        cmp     byte ptr reg_email[0],'.'
        je      email_invalid

validate_email_loop:
        mov     al,reg_email[si]

        cmp     al,0
        je      email_validate_end

        cmp     al,' '
        je      email_invalid

        cmp     al,'@'
        je      email_at_found

        cmp     al,'.'
        je      email_dot_found

        inc     si

        jmp     validate_email_loop

email_at_found:
        cmp     has_at,1
        je      email_invalid

        mov     has_at,1

        inc     si

        jmp     validate_email_loop

email_dot_found:
        cmp     has_at,1
        jne     email_dot_continue

        mov     has_dot,1

email_dot_continue:
        inc     si

        jmp     validate_email_loop

email_validate_end:
        cmp     has_at,1
        jne     email_invalid

        cmp     has_dot,1
        jne     email_invalid

        cmp     si,0
        je      email_invalid

        dec     si

        mov     al,reg_email[si]

        cmp     al,'.'
        je      email_invalid

        cmp     al,'@'
        je      email_invalid

        jmp     email_valid

email_invalid:
        mov     ah,09h
        lea     dx,msg24
        int     21h

        jmp     input_email_start

email_valid:
        jmp     check_duplicate_email

;===========================================================
; CHECK DUPLICATE EMAIL IN USER.TXT
;===========================================================
check_duplicate_email:
        mov     ax,3D00h               ;open user.txt for reading
        lea     dx,user_filename
        int     21h

        jnc     duplicate_file_open_ok

        cmp     ax,2                   ;error 2 = file does not exist yet
        je      duplicate_file_missing

        jmp     user_file_error

duplicate_file_missing:
        jmp     select_account_type

duplicate_file_open_ok:
        mov     user_handle,ax

        jmp     duplicate_next_record

duplicate_next_record:
        mov     dup_comma_count,0

find_email_field:
        mov     bx,user_handle
        mov     ah,3Fh
        mov     cx,1
        lea     dx,file_char
        int     21h

        cmp     ax,0
        jne     find_email_char_ok

        jmp     duplicate_not_found

find_email_char_ok:
        mov     al,file_char

        cmp     al,13                  ;skip CR
        je      find_email_field

        cmp     al,10                  ;skip LF
        je      find_email_field

        cmp     al,','
        jne     find_email_field

        inc     dup_comma_count

        cmp     dup_comma_count,3      ;email is the 4th field
        jne     find_email_field

        mov     si,0

read_existing_email:
        mov     bx,user_handle
        mov     ah,3Fh
        mov     cx,1
        lea     dx,file_char
        int     21h

        cmp     ax,0
        je      existing_email_eof

        mov     al,file_char

        cmp     al,13
        je      existing_email_done

        cmp     al,10
        je      existing_email_done

        cmp     si,30
        jae     skip_existing_email_char

        mov     file_email[si],al
        inc     si

skip_existing_email_char:
        jmp     read_existing_email

existing_email_eof:
        mov     byte ptr file_email[si],0
        jmp     compare_existing_email

existing_email_done:
        mov     byte ptr file_email[si],0

compare_existing_email:
        mov     si,0

compare_existing_email_loop:
        mov     al,file_email[si]
        mov     dl,reg_email[si]

        ;compare email case-insensitively for A-Z
        cmp     al,'A'
        jb      existing_email_char_ready
        cmp     al,'Z'
        ja      existing_email_char_ready
        add     al,20h

existing_email_char_ready:
        cmp     dl,'A'
        jb      registered_email_char_ready
        cmp     dl,'Z'
        ja      registered_email_char_ready
        add     dl,20h

registered_email_char_ready:
        cmp     al,dl
        jne     duplicate_email_not_same

        cmp     al,0
        je      duplicate_email_found

        inc     si
        jmp     compare_existing_email_loop

duplicate_email_not_same:
        jmp     duplicate_next_record

duplicate_email_found:
        mov     bx,user_handle
        mov     ah,3Eh
        int     21h

        mov     ah,09h
        lea     dx,msg25
        int     21h

        jmp     input_email_start

duplicate_not_found:
        mov     bx,user_handle
        mov     ah,3Eh
        int     21h

        jmp     select_account_type

;===========================================================
; SELECT ACCOUNT TYPE
;===========================================================
select_account_type:
        mov     ah,09h
        lea     dx,msg27
        int     21h

        mov     ah,09h
        lea     dx,msg28
        int     21h

        mov     ah,09h
        lea     dx,msg29
        int     21h

        mov     ah,09h
        lea     dx,msg30
        int     21h

        mov     ah,01h
        int     21h

        cmp     al,'1'
        je      select_saving

        cmp     al,'2'
        je      select_current

        mov     ah,09h
        lea     dx,msg31
        int     21h
        jmp     select_account_type

select_saving:
        mov     si,0

copy_saving_type:
        mov     al,saving_text[si]
        mov     reg_account_type[si],al
        cmp     al,0
        je      register_successful
        inc     si
        jmp     copy_saving_type

select_current:
        mov     si,0

copy_current_type:
        mov     al,current_text[si]
        mov     reg_account_type[si],al
        cmp     al,0
        je      register_successful
        inc     si
        jmp     copy_current_type

register_successful:
        mov     ax,3D02h
        lea     dx,user_filename
        int     21h

        jc      create_user_file

        mov     user_handle,ax

        jmp     move_user_file_end

create_user_file:

        mov     ah,3Ch				;create user.txt
        mov     cx,0
        lea     dx,user_filename
        int     21h

        jnc     create_user_ok

        jmp     user_file_error

create_user_ok:
        mov     user_handle,ax

move_user_file_end:
        mov     bx,user_handle			;move pointer to end user.txt

        mov     ax,4202h

        mov     cx,0
        mov     dx,0

        int     21h

        mov     si,0

count_reg_username:
        cmp     byte ptr reg_username[si],0			;count username length
        je      save_reg_username

        inc     si

        jmp     count_reg_username

save_reg_username:
        mov     cx,si

        mov     bx,user_handle

        mov     ah,40h

        lea     dx,reg_username

        int     21h

        mov     bx,user_handle

        mov     ah,40h

        mov     cx,1

        lea     dx,comma_char

        int     21h

        mov     si,0

count_reg_password:
        cmp     byte ptr reg_password[si],0     ;count password length
        je      save_reg_password

        inc     si

        jmp     count_reg_password

save_reg_password:
        mov     cx,si

        mov     bx,user_handle

        mov     ah,40h

        lea     dx,reg_password

        int     21h

        mov     bx,user_handle

        mov     ah,40h

        mov     cx,1

        lea     dx,comma_char

        int     21h

        mov     si,0


count_reg_phone:
        cmp     byte ptr reg_phone[si],0			;count phone length
        je      save_reg_phone

        inc     si

        jmp     count_reg_phone

save_reg_phone:
        mov     cx,si

        mov     bx,user_handle

        mov     ah,40h

        lea     dx,reg_phone

        int     21h

        mov     bx,user_handle

        mov     ah,40h

        mov     cx,1

        lea     dx,comma_char

        int     21h

        mov     si,0

count_reg_email:
        cmp     byte ptr reg_email[si],0		;count email length
        je      save_reg_email

        inc     si

        jmp     count_reg_email

save_reg_email:
        mov     cx,si

        mov     bx,user_handle

        mov     ah,40h
        lea     dx,reg_email

        int     21h

        mov     bx,user_handle		;write new line

        mov     ah,40h

        mov     cx,2

        lea     dx,new_line

        int     21h

        mov     bx,user_handle		;close user.txt

        mov     ah,3Eh

        int     21h

        ; create a matching bank account in account.txt
        call    reg_create_account_record
        jnc     register_account_created

        mov     ah,09h
        lea     dx,msg33
        int     21h
        jmp     menu

register_account_created:
        mov     ah,09h
        lea     dx,msg32
        int     21h

        mov     si,0

display_new_account_number:
        mov     dl,reg_account_number[si]
        cmp     dl,0
        je      display_register_success

        mov     ah,02h
        int     21h
        inc     si
        jmp     display_new_account_number

display_register_success:
        mov     ah,09h			;display register successful
        lea     dx,msg23
        int     21h

        jmp     menu

user_file_error:
        mov     ah,09h	        	;display file error message
        lea     dx,msg_file_error

        int     21h

        jmp     menu

login:
        mov     ah,09h
        lea     dx,msg16
        int     21h

        mov     ah,09h
        lea     dx,msg17
        int     21h

        mov     ah,09h
        lea     dx,msg18
        int     21h

        mov     ah,09h
        lea     dx,msg19
        int     21h

        mov     si,0

input_login_username:
        mov     ah,01h
        int     21h

        cmp     al,0Dh
        je      login_username_done

        mov     login_username[si],al

        inc     si

        cmp     si,20
        jae     login_username_done

        jmp     input_login_username


login_username_done:
        mov     byte ptr login_username[si],0

        jmp     input_login_password_start

input_login_password_start:
        mov     ah,09h
        lea     dx,msg20
        int     21h

        mov     si,0

input_login_password:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      login_password_done

        cmp     al,08h
        je      login_password_backspace

        cmp     si,20
        jae     input_login_password

        mov     login_password[si],al

        inc     si

        mov     dl,'*'

        mov     ah,02h

        int     21h

        jmp     input_login_password


login_password_backspace:
        cmp     si,0
        je      input_login_password

        dec     si

        mov     byte ptr login_password[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     input_login_password


login_password_done:
        mov     byte ptr login_password[si],0

        jmp     check_login

check_login:
        mov     ax,3D00h			;open user.txt

        lea     dx,user_filename

        int     21h

        jnc     login_open_ok

        jmp     login_user_file_error


login_open_ok:
        mov     user_handle,ax

read_user_record:
        mov     file_eof,0				;read one user record

        mov     si,0

read_file_username:
        mov     bx,user_handle			;read username

        mov     ah,3Fh

        mov     cx,1

        lea     dx,file_char

        int     21h

        cmp     ax,0
        jne     username_read_ok

        jmp     no_more_user

username_read_ok:
        mov     al,file_char

        cmp     al,13					;skip new line
        je      read_file_username

        cmp     al,10
        je      read_file_username

        cmp     al,','
        je      file_username_done

        cmp     si,20
        jb      username_room

        jmp     skip_user_record

username_room:
        mov     file_username[si],al

        inc     si

        jmp     read_file_username

file_username_done:

        mov     byte ptr file_username[si],0

        mov     si,0

read_file_password:
        mov     bx,user_handle				;read password

        mov     ah,3Fh

        mov     cx,1

        lea     dx,file_char

        int     21h

        cmp     ax,0
        jne     password_read_ok

        jmp     no_more_user

password_read_ok:
        mov     al,file_char

        cmp     al,','
        je      file_password_done

        cmp     si,20
        jb      password_room

        jmp     skip_user_record

password_room:
        mov     file_password[si],al

        inc     si

        jmp     read_file_password

file_password_done:
        mov     byte ptr file_password[si],0

        mov     si,0

read_file_phone:
        mov     bx,user_handle				;read phone

        mov     ah,3Fh

        mov     cx,1

        lea     dx,file_char

        int     21h

        cmp     ax,0
        jne     phone_read_ok

        jmp     no_more_user


phone_read_ok:
        mov     al,file_char

        cmp     al,','
        je      file_phone_done

        cmp     si,15
        jb      phone_room

        jmp     skip_user_record

phone_room:
        mov     file_phone[si],al

        inc     si

        jmp     read_file_phone


file_phone_done:
        mov     byte ptr file_phone[si],0

        mov     si,0

read_file_email:
        mov     bx,user_handle				;read email

        mov     ah,3Fh

        mov     cx,1

        lea     dx,file_char

        int     21h

        cmp     ax,0
        je      file_email_eof

        mov     al,file_char

        cmp     al,13
        je      file_email_done

        cmp     al,10
        je      file_email_done

        cmp     si,30
        jb      email_room

        jmp     skip_user_record


email_room:
        mov     file_email[si],al

        inc     si

        jmp     read_file_email

file_email_eof:

        mov     file_eof,1


file_email_done:

        mov     byte ptr file_email[si],0

        mov     si,0

compare_file_username:
        mov     al,file_username[si]			;compare username

        cmp     al,login_username[si]
        jne     username_not_match_local

        cmp     al,0
        je      compare_password_start

        inc     si

        jmp     compare_file_username

username_not_match_local:
        jmp     user_not_match

compare_password_start:
        mov     si,0			

compare_file_password:
        mov     al,file_password[si]		;compare password

        cmp     al,login_password[si]
        jne     password_not_match_local

        cmp     al,0
        je      user_match

        inc     si

        jmp     compare_file_password

password_not_match_local:
        jmp     user_not_match

user_not_match:

        cmp     file_eof,1
        jne     try_next_user

        jmp     no_more_user

try_next_user:
        jmp     read_user_record

user_match:
        mov     si,0

copy_file_username:
        mov     al,file_username[si]

        mov     reg_username[si],al

        cmp     al,0
        je      copy_password_start

        inc     si

        jmp     copy_file_username

copy_password_start:
        mov     si,0

copy_file_password:
        mov     al,file_password[si]

        mov     reg_password[si],al

        cmp     al,0
        je      copy_phone_start

        inc     si

        jmp     copy_file_password

copy_phone_start:
        mov     si,0

copy_file_phone:
        mov     al,file_phone[si]

        mov     reg_phone[si],al

        cmp     al,0
        je      copy_email_start

        inc     si

        jmp     copy_file_phone

copy_email_start:
        mov     si,0

copy_file_email:
        mov     al,file_email[si]

        mov     reg_email[si],al

        cmp     al,0
        je      login_file_close_success

        inc     si

        jmp     copy_file_email

login_file_close_success:
        mov     bx,user_handle			;close file after login

        mov     ah,3Eh

        int     21h

        jmp     login_success

skip_user_record:
        mov     bx,user_handle

        mov     ah,3Fh

        mov     cx,1

        lea     dx,file_char

        int     21h

        cmp     ax,0
        jne     skip_char_ok

        jmp     no_more_user

skip_char_ok:
        mov     al,file_char

        cmp     al,13
        jne     skip_check_lf

        jmp     read_user_record

skip_check_lf:
        cmp     al,10
        jne     skip_user_record

        jmp     read_user_record

no_more_user:
        mov     bx,user_handle

        mov     ah,3Eh

        int     21h

        jmp     login_error

login_user_file_error:
        mov     ah,09h

        lea     dx,msg_file_error		;display file error message

        int     21h

        jmp     menu

login_success:
        ; load this user's account number, type and balance from account.txt
        call    acc_load_bank_details

        mov     ah,09h

        lea     dx,msg21

        int     21h

        jmp     MainMenu

login_error:
        mov     ah,09h

        lea     dx,msg22

        int     21h

        jmp     menu

;=========================MAIN MENU==================================
MainMenu:
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
	je	acc_menu	

	cmp	al, '2'
	je	submenu_trans

	cmp	al, '3'
	je	submenu_loan

	cmp	al, '4'
	;je	generate_statement

	cmp	al, '5'
	je	logout

	jmp	invalid_main

logout:
    mov     ah, 09h
    lea     dx, logoutStr
    int     21h

    call exit_program

submenu_trans:
    call transaction

submenu_loan:
    call interest_loan

invalid_main:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	MainMenu
;=======================Account Management==========================================
acc_menu:
    mov     ah,09h
        lea     dx,msg_account_acc				;display account management menu
        int     21h

        mov     ah,09h
        lea     dx,msg_view
        int     21h

        mov     ah,09h
        lea     dx,msg_update
        int     21h

        mov     ah,09h
        lea     dx,msg_change
        int     21h

        mov     ah,09h
        lea     dx,msg_back
        int     21h

        mov     ah,09h
        lea     dx,msg_choice1
        int     21h

        mov     ah,01h
        int     21h

        cmp     al,'1'
        jne     acc_check_choice2

        jmp     acc_view

acc_check_choice2:
        cmp     al,'2'
        jne     acc_check_choice3
        jmp     acc_update_menu

acc_check_choice3:  
        cmp     al,'3'
        jne     acc_check_choice4
        jmp     acc_change_password

acc_check_choice4:
        cmp     al,'4'
        jne     acc_choice_invalid
        jmp     acc_back

acc_choice_invalid:
        mov     ah,09h
        lea     dx,msg_invalid_acc
        int     21h
        jmp     acc_menu

acc_view:

        mov     ah,09h
        lea     dx,msg_details		;display view account details
        int     21h

        mov     ah,09h
        lea     dx,msg_username1			;print username
        int     21h
        mov     si,0

acc_view_username:
        mov     dl,reg_username[si]

        cmp     dl,0
        je      acc_view_email_start

        mov     ah,02h
        int     21h
        inc     si
        jmp     acc_view_username


acc_view_email_start:
        mov     ah,09h
        lea     dx,msg_email1			;print email
        int     21h
        mov     si,0

acc_view_email:
        mov     dl,reg_email[si]
        cmp     dl,0
        je      acc_view_phone_start

        mov     ah,02h
        int     21h
        inc     si
        jmp     acc_view_email

acc_view_phone_start:
        mov     ah,09h
        lea     dx,msg_phone1			;print phone
        int     21h

        mov     si,0

acc_view_phone:

        mov     dl,reg_phone[si]


        cmp     dl,0
        je      acc_view_account_number


        mov     ah,02h
        int     21h


        inc     si


        jmp     acc_view_phone


acc_view_account_number:
        mov     ah,09h
        lea     dx,msg_accountno1
        int     21h

        mov     si,0

acc_print_account_number:
        mov     dl,view_account_number[si]
        cmp     dl,0
        je      acc_view_account_type

        mov     ah,02h
        int     21h
        inc     si
        jmp     acc_print_account_number

acc_view_account_type:
        mov     ah,09h
        lea     dx,msg_acctype1
        int     21h

        mov     si,0

acc_print_account_type:
        mov     dl,view_account_type[si]
        cmp     dl,0
        je      acc_view_balance

        mov     ah,02h
        int     21h
        inc     si
        jmp     acc_print_account_type


acc_view_balance:

        mov     ah,09h
        lea     dx,msg_current_acc			;print balance
        int     21h
        mov     ax,current_balance_acc
        mov     bx,10

        mov     si,0

acc_balance_convert:
        mov     dx,0				;convert balance into digit
        div     bx
        add     dl,'0'
        mov     balance_digit[si],dl
        inc     si

        cmp     ax,0
        jne     acc_balance_convert

        dec     si					;print digit backwards

acc_balance_print:
        mov     dl,balance_digit[si]
        mov     ah,02h
        int     21h

        cmp     si,0
        je      acc_view_return

        dec     si

        jmp     acc_balance_print

acc_view_return:

        mov     ah,09h
        lea     dx,msg_return1			;press enter to return
        int     21h

acc_wait_enter:
        mov     ah,01h
        int     21h

        cmp     al,0Dh
        jne     acc_wait_enter

        jmp     acc_menu

acc_update_menu:
        mov     ah,09h
        lea     dx,msg_updateacc
        int     21h

        mov     ah,09h
        lea     dx,msg_username2
        int     21h

        mov     ah,09h
        lea     dx,msg_phone2
        int     21h

        mov     ah,09h
        lea     dx,msg_email2
        int     21h

        mov     ah,09h
        lea     dx,msg_back2
        int     21h

        mov     ah,09h
        lea     dx,msg_choice2
        int     21h

        mov     ah,01h
        int     21h

        cmp     al,'1'
        jne     acc_update_check2

        jmp     acc_update_username

acc_update_check2:
        cmp     al,'2'
        jne     acc_update_check3

        jmp     acc_update_phone

acc_update_check3:
        cmp     al,'3'
        jne     acc_update_check4

        jmp     acc_update_email

acc_update_check4:
        cmp     al,'4'
        jne     acc_update_invalid

        jmp     acc_menu

acc_update_invalid:
        mov     ah,09h
        lea     dx,msg_invalid_acc
        int     21h

        jmp     acc_update_menu

acc_update_username:

        mov     ah,09h						;display current username
        lea     dx,msg_currentname
        int     21h

        mov     si,0

acc_print_current_username:
        mov     dl,reg_username[si]

        cmp     dl,0
        je      acc_new_username_start

        mov     ah,02h
        int     21h

        inc     si

        jmp     acc_print_current_username

acc_new_username_start:
        mov     ah,09h				;display new username
        lea     dx,msg_newname
        int     21h

        mov     si,0

acc_input_username:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      acc_username_done

        cmp     al,08h
        je      acc_username_backspace

        cmp     si,20
        jae     acc_input_username

        mov     acc_username[si],al

        inc     si

        mov     dl,al
        mov     ah,02h
        int     21h

        jmp     acc_input_username

acc_username_backspace:
        cmp     si,0				;username backspace
        je      acc_input_username

        dec     si

        mov     byte ptr acc_username[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     acc_input_username

acc_username_done:
        mov     byte ptr acc_username[si],0

        cmp     si,0
        jne     acc_username_compare

        mov     ah,09h
        lea     dx,msg_empty
        int     21h

        jmp     acc_update_username

acc_username_compare:
        mov     si,0			;compare username

acc_username_compare_loop:
        mov     al,acc_username[si]

        cmp     al,reg_username[si]
        jne     acc_username_different

        cmp     al,0
        je      acc_username_same

        inc     si

        jmp     acc_username_compare_loop

acc_username_same:
        mov     ah,09h
        lea     dx,msg_invalid2
        int     21h

        jmp     acc_update_username


acc_username_different:
        mov     si,0			;copy username

acc_copy_username:
        mov     al,acc_username[si]

        mov     reg_username[si],al

        cmp     al,0
        je      acc_username_success

        inc     si

        jmp     acc_copy_username

acc_username_success:
        mov     ah,09h
        lea     dx,msg_updatesuccess
        int     21h

        jmp     acc_update_menu

acc_update_phone:
        mov     ah,09h					;display current phone message
        lea     dx,msg_currentphone
        int     21h

        mov     si,0

acc_print_current_phone:
        mov     dl,reg_phone[si]

        cmp     dl,0
        je      acc_new_phone_start

        mov     ah,02h
        int     21h

        inc     si

        jmp     acc_print_current_phone

acc_new_phone_start:

        mov     ah,09h
        lea     dx,msg_newphone				;display new username
        int     21h

        mov     si,0

acc_input_phone:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      acc_phone_done

        cmp     al,08h
        je      acc_phone_backspace

        cmp     si,15
        jae     acc_input_phone

        mov     acc_phone[si],al

        inc     si

        mov     dl,al
        mov     ah,02h
        int     21h

        jmp     acc_input_phone

acc_phone_backspace:
        cmp     si,0				;phone backspace
        je      acc_input_phone

        dec     si

        mov     byte ptr acc_phone[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     acc_input_phone

acc_phone_done:
        mov     byte ptr acc_phone[si],0

        cmp     si,0
        jne     acc_phone_compare

        mov     ah,09h
        lea     dx,msg_empty
        int     21h

        jmp     acc_update_phone

acc_phone_compare:
        mov     si,0				;compare phone

acc_phone_compare_loop:
        mov     al,acc_phone[si]

        cmp     al,reg_phone[si]
        jne     acc_phone_different

        cmp     al,0
        je      acc_phone_same

        inc     si

        jmp     acc_phone_compare_loop

acc_phone_same:
        mov     ah,09h
        lea     dx,msg_invalid3
        int     21h

        jmp     acc_update_phone

acc_phone_different:
        mov     si,0			;copy phone

acc_copy_phone:
        mov     al,acc_phone[si]

        mov     reg_phone[si],al

        cmp     al,0
        je      acc_phone_success

        inc     si

        jmp     acc_copy_phone

acc_phone_success:
        mov     ah,09h
        lea     dx,msg_updatesuccess
        int     21h

        jmp     acc_update_menu

acc_update_email:
        mov     ah,09h
        lea     dx,msg_currentemail			;display current email
        int     21h

        mov     si,0

acc_print_current_email:
        mov     dl,reg_email[si]

        cmp     dl,0
        je      acc_new_email_start

        mov     ah,02h
        int     21h

        inc     si

        jmp     acc_print_current_email

acc_new_email_start:
        mov     ah,09h
        lea     dx,msg_newemail				;display new email
        int     21h

        mov     si,0

acc_input_email:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      acc_email_done

        cmp     al,08h
        je      acc_email_backspace

        cmp     si,30
        jae     acc_input_email

        mov     acc_email[si],al

        inc     si

        mov     dl,al
        mov     ah,02h
        int     21h

        jmp     acc_input_email

acc_email_backspace:
        cmp     si,0					;email backspace
        je      acc_input_email

        dec     si

        mov     byte ptr acc_email[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     acc_input_email

acc_email_done:
        mov     byte ptr acc_email[si],0			;email done

        cmp     si,0
        jne     acc_check_email_same

        mov     ah,09h
        lea     dx,msg_empty
        int     21h

        jmp     acc_update_email

acc_check_email_same:
        mov     si,0

acc_email_same_loop:
        mov     al,acc_email[si]

        cmp     al,reg_email[si]
        jne     acc_start_email_validation

        cmp     al,0
        je      acc_email_same

        inc     si

        jmp     acc_email_same_loop

acc_email_same:
        mov     ah,09h
        lea     dx,msg_invalid4
        int     21h

        jmp     acc_update_email

acc_start_email_validation:
        mov     acc_has_at,0				;email validation

        mov     acc_has_dot,0

        mov     si,0

        cmp     byte ptr acc_email[0],'@'			;first cannot @
        jne     acc_email_first_dot_check

        jmp     acc_invalid_email

acc_email_first_dot_check:
        cmp     byte ptr acc_email[0],'.'			;first cannot dot
        jne     acc_validate_email_loop

        jmp     acc_invalid_email

acc_validate_email_loop:
        mov     al,acc_email[si]

        cmp     al,0
        jne     acc_email_check_space

        jmp     acc_email_validation_end

acc_email_check_space:
        cmp     al,' '
        jne     acc_email_check_at
        jmp     acc_invalid_email

acc_email_check_at:
        cmp     al,'@'				;check @
        jne     acc_email_check_dot

        cmp     acc_has_at,1
        jne     acc_email_at_found

        jmp     acc_invalid_email

acc_email_at_found:
        mov     acc_has_at,1

        inc     si

        jmp     acc_validate_email_loop

acc_email_check_dot:
        cmp     al,'.'				;check dot
        jne     acc_email_next

        cmp     acc_has_at,1
        jne     acc_email_next

        mov     acc_has_dot,1

acc_email_next:
        inc     si

        jmp     acc_validate_email_loop

acc_email_validation_end:
        cmp     acc_has_at,1
        je      acc_email_check_dot_exist

        jmp     acc_invalid_email

acc_email_check_dot_exist:
        cmp     acc_has_dot,1
        je      acc_email_check_last

        jmp     acc_invalid_email

acc_email_check_last:
        dec     si			;check last character

        mov     al,acc_email[si]

        cmp     al,'.'
        jne     acc_email_last_at

        jmp     acc_invalid_email

acc_email_last_at:
        cmp     al,'@'
        jne     acc_copy_new_email

        jmp     acc_invalid_email

acc_invalid_email:
        mov     ah,09h
        lea     dx,msg_invalidemail
        int     21h

        jmp     acc_update_email

acc_copy_new_email:
        mov     si,0

acc_copy_email_loop:
        mov     al,acc_email[si]

        mov     reg_email[si],al

        cmp     al,0
        je      acc_email_success

        inc     si

        jmp     acc_copy_email_loop

acc_email_success:
        mov     ah,09h
        lea     dx,msg_updatesuccess
        int     21h

        jmp     acc_update_menu

acc_change_password:
        mov     ah,09h				;display change password
        lea     dx,msg_changepass
        int     21h

        mov     ah,09h
        lea     dx,msg_currentpass
        int     21h

        mov     si,0

acc_input_currentpass:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      acc_currentpass_done

        cmp     al,08h
        je      acc_currentpass_backspace

        cmp     si,20
        jae     acc_input_currentpass

        mov     acc_currentpass[si],al

        inc     si

        mov     dl,al
        mov     ah,02h
        int     21h

        jmp     acc_input_currentpass

acc_currentpass_backspace:
        cmp     si,0
        je      acc_input_currentpass

        dec     si

        mov     byte ptr acc_currentpass[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     acc_input_currentpass

acc_currentpass_done:
        mov     byte ptr acc_currentpass[si],0

        mov     si,0

acc_check_currentpass:
        mov     al,acc_currentpass[si]

        cmp     al,reg_password[si]
        jne     acc_wrong_currentpass

        cmp     al,0
        je      acc_input_newpass_start

        inc     si

        jmp     acc_check_currentpass

acc_wrong_currentpass:
        mov     ah,09h
        lea     dx,msg_wrongpass
        int     21h

        jmp     acc_change_password

acc_input_newpass_start:
        mov     ah,09h					;input new password
        lea     dx,msg_newpass
        int     21h

        mov     si,0

acc_input_newpass:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      acc_newpass_done

        cmp     al,08h
        je      acc_newpass_backspace

        cmp     si,20
        jae     acc_input_newpass

        mov     acc_newpass[si],al

        inc     si

        mov     dl,al
        mov     ah,02h
        int     21h

        jmp     acc_input_newpass

acc_newpass_backspace:
        cmp     si,0
        je      acc_input_newpass

        dec     si

        mov     byte ptr acc_newpass[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     acc_input_newpass

acc_newpass_done:
        mov     byte ptr acc_newpass[si],0

        mov     si,0

acc_check_newpass_same:
        mov     al,acc_newpass[si]				;check new password same as current

        cmp     al,reg_password[si]
        jne     acc_start_password_validation

        cmp     al,0
        je      acc_newpass_same

        inc     si

        jmp     acc_check_newpass_same

acc_newpass_same:
        mov     ah,09h
        lea     dx,msg_invalid6
        int     21h

        jmp     acc_change_password

acc_start_password_validation:
        mov     acc_has_upper,0

        mov     acc_has_lower,0

        mov     acc_has_number,0

        mov     acc_has_special,0

        mov     si,0

acc_validate_password:
        mov     al,acc_newpass[si]

        cmp     al,0
        je      acc_check_password_requirement

        cmp     al,'A'
        jb      acc_validate_lowercase

        cmp     al,'Z'
        jbe     acc_upper_found

acc_validate_lowercase:
        cmp     al,'a'
        jb      acc_validate_number

        cmp     al,'z'
        jbe     acc_lower_found

acc_validate_number:
        cmp     al,'0'
        jb      acc_special_found

        cmp     al,'9'
        jbe     acc_number_found

        jmp     acc_special_found

acc_upper_found:
        mov     acc_has_upper,1

        inc     si

        jmp     acc_validate_password

acc_lower_found:
        mov     acc_has_lower,1

        inc     si

        jmp     acc_validate_password

acc_number_found:
        mov     acc_has_number,1

        inc     si

        jmp     acc_validate_password

acc_special_found:
        mov     acc_has_special,1

        inc     si

        jmp     acc_validate_password

acc_check_password_requirement:
        cmp     acc_has_upper,1
        je      acc_check_lower_requirement

        jmp     acc_invalid_password

acc_check_lower_requirement:
        cmp     acc_has_lower,1
        je      acc_check_number_requirement

        jmp     acc_invalid_password

acc_check_number_requirement:
        cmp     acc_has_number,1
        je      acc_check_special_requirement

        jmp     acc_invalid_password

acc_check_special_requirement:
        cmp     acc_has_special,1
        je      acc_confirm_password_start

        jmp     acc_invalid_password

acc_invalid_password:
        mov     ah,09h
        lea     dx,msg_invalid5
        int     21h

        jmp     acc_change_password

acc_confirm_password_start:
        mov     ah,09h				;confirm password
        lea     dx,msg_confirmpass
        int     21h

        mov     si,0

acc_input_confirmpass:
        mov     ah,08h
        int     21h

        cmp     al,0Dh
        je      acc_confirmpass_done

        cmp     al,08h
        je      acc_confirmpass_backspace

        cmp     si,20
        jae     acc_input_confirmpass

        mov     acc_confirmpass[si],al

        inc     si

        mov     dl,'*'
        mov     ah,02h
        int     21h

        jmp     acc_input_confirmpass

acc_confirmpass_backspace:
        cmp     si,0
        je      acc_input_confirmpass

        dec     si

        mov     byte ptr acc_confirmpass[si],0

        mov     dl,08h
        mov     ah,02h
        int     21h

        mov     dl,' '
        mov     ah,02h
        int     21h

        mov     dl,08h
        mov     ah,02h
        int     21h

        jmp     acc_input_confirmpass

acc_confirmpass_done:
        mov     byte ptr acc_confirmpass[si],0

        mov     si,0

acc_compare_confirm:
        mov     al,acc_newpass[si]				;compare new and confirm password

        cmp     al,acc_confirmpass[si]
        jne     acc_password_not_match

        cmp     al,0
        je      acc_copy_new_password

        inc     si

        jmp     acc_compare_confirm

acc_password_not_match:
        mov     ah,09h
        lea     dx,msg_invalid7
        int     21h

        jmp     acc_change_password

acc_copy_new_password:
        mov     si,0				;copy new password to register

acc_copy_password_loop:
        mov     al,acc_newpass[si]

        mov     reg_password[si],al

        cmp     al,0
        je      acc_password_success

        inc     si

        jmp     acc_copy_password_loop

acc_password_success:
        mov     ah,09h
        lea     dx,msg_updatesuccess2
        int     21h

        jmp     acc_menu

acc_back:
        jmp     MainMenu
;=======================Transaction==========================================
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
	je	deposit_start

	cmp	al, '2'
	je	withdrawmenu

	cmp	al, '3'
	je	check_bal_menu

	cmp	al, '4'
	jmp	back_to_main

	jmp	invalid_trans
check_bal_menu:
    jmp check_bal

withdrawmenu:
    jmp withdrawal_money

invalid_trans:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	transaction
;========================Deposit Money==========================================
deposit_start:				; display deposit title
	mov	ah, 09h
	lea	dx, dep1
	int	21h

	mov	ah, 09h
	lea	dx, dep2
	int	21h

	mov	ah, 09h
	lea	dx, dep3
	int	21h

	mov	ah, 09h			; enter account number
	lea	dx, dep4
	int	21h

	mov	cx, 4
	mov	si, 0

input_acc_Dep:	
	mov	ah, 01h			; input account number
	int	21h

	mov	vinput_dep[si], al
	inc	si
	loop	input_acc_Dep

	mov	cx, 4			; check account number is numeric
	mov	si,0

check_acc:	
	cmp	vinput_dep[si], "0"		; check account number
	jae	valid_acc_digit1
	jmp	error
	
valid_acc_digit1:
	cmp	vinput_dep[si], "9"
	jbe	valid_acc_digit2
	jmp	error

valid_acc_digit2:
	inc	si
	loop	check_acc

	mov	ax, 0			; convert account number
	mov	si, 0
	mov	cx, 4

convert_acc:
	mov	bl, vinput_dep[si]
	sub	bl, "0"

	mov	bh, 0
	mov	dx, 10
	mul	dx

	add	ax, bx
	inc	si
	loop	convert_acc

	mov	acc_num_dep, ax
        mov	si, 0
	mov	cx, 4

save_acc_input:
	mov	al, vinput_dep[si]
	mov	acc_input[si], al
	inc	si
	loop	save_acc_input

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
	jmp	near ptr acc_not_found_dep

search_second_comma_ok1:
	cmp	acc_buffer[si], ","	; look for 1st comma
	jne	next_acc_char
	
	inc	si
	dec	cx

search_second_comma:
	cmp	cx, 0			; look for 2nd comma
	jne	search_second_comma_ok2
	jmp	near ptr acc_not_found_dep

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
	jmp	acc_not_found_dep
	
acc_size_ok:
	mov	di, 0
	mov	bx, si

compare_acc:
	mov	al, acc_buffer[bx]
	cmp	al, vinput_dep[di]
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
	lea	dx, dep5
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
	lea	dx, trans_buffer_dep
	int	21h

	jnc	trans_read_ok
	jmp	near ptr trans_file_error

trans_read_ok:
	mov	trans_size_dep, ax

	mov	ah, 3Eh			; close transaction.txt
	mov	bx, filehandle2
	int	21h

	mov	si, 0
	mov	balance_dep, 0

search_trans:

    ; Check if reached end of file
    cmp si, trans_size
    jb si_in_range1
    jmp near ptr trans_search_done
si_in_range1:

    ; ==============================
    ; Make sure SI is at beginning
    ; of a transaction record
    ; ==============================

    cmp si, 0
    je check_trans_acc

    cmp trans_buffer_dep[si-1], 0Ah
    je check_trans_acc

    inc si
    jmp search_trans


check_trans_acc:

    ; Make sure at least 4 account digits exist
    mov ax, trans_size
    sub ax, si
    cmp ax, 4
    jae enough_digits
    jmp near ptr trans_search_done
enough_digits:

    ; ==============================
    ; Compare account number
    ; ==============================

    mov di, 0
    mov bx, si

compare_trans_acc:

    mov al, trans_buffer_dep[bx]
    cmp al, acc_input[di]
    jne near ptr trans_skip_record

trans_acc_match:
    inc bx
    inc di

    cmp di, 4
    jne compare_trans_acc

    ; Must have comma after account number
    cmp trans_buffer_dep[bx], ","
    jne trans_skip_record

    ; ==============================
    ; Account number matched
    ; ==============================

    mov si, bx
    inc si


    ; ==============================
    ; Skip Transaction Type
    ; Example:
    ; Deposit,
    ; ==============================

skip_transaction_type:

    cmp si, trans_size
    jae trans_search_done

    cmp trans_buffer_dep[si], ","
    je transaction_type_done

    inc si
    jmp skip_transaction_type


transaction_type_done:

    inc si


    ; ==============================
    ; Skip Amount
    ; Example:
    ; 500,
    ; ==============================

skip_amount:

    cmp si, trans_size
    jae trans_search_done

    cmp trans_buffer_dep[si], ","
    je amount_done

    inc si
    jmp skip_amount


amount_done:

    inc si


    ; ==============================
    ; Read New Balance
    ; ==============================

    mov ax, 0


read_trans_balance:

    cmp si, trans_size
    jae save_trans_balance

    mov bl, trans_buffer_dep[si]

    cmp bl, ","
    je save_trans_balance

    cmp bl, 0Dh
    je save_trans_balance

    cmp bl, 0Ah
    je save_trans_balance

    ; Convert ASCII digit to number
    sub bl, "0"
    mov bh, 0

    mov dx, 10
    mul dx

    add ax, bx

    inc si
    jmp read_trans_balance

save_trans_balance:

    ; Save latest balance
    mov balance_dep, ax

    ; ==============================
    ; Move to next transaction line
    ; ==============================

skip_to_next_line:

    cmp si, trans_size
    jae trans_search_done

    cmp trans_buffer_dep[si], 0Ah
    je next_transaction

    inc si
    jmp skip_to_next_line


next_transaction:

    inc si
    jmp search_trans


; ==================================
; Account number does not match
; ==================================

trans_skip_record:

skip_current_record:

    cmp si, trans_size
    jae trans_search_done

    cmp trans_buffer_dep[si], 0Ah
    je skip_line_done

    inc si
    jmp skip_current_record


skip_line_done:

    inc si
    jmp search_trans

trans_search_done:
	mov	ah, 09h			; diaplsy current balance
	lea	dx, dep6
	int	21h

	mov	ax, balance_dep
	call	display_num_dep

	mov	ah, 09h			; enter deposit amount
	lea	dx, dep7
	int	21h

	mov	cx, 4
	mov	si, 0

input_deposit:
	mov	ah, 01h
	int	21h

	mov	vinput_dep[si], al		; input deposit amount
	inc	si
	loop	input_deposit

	mov	cx, 4			; check deposit input
	mov	si, 0

check_deposit:
	cmp	vinput_dep[si], "0"
	jae	deposit_digit_ok1
	jmp	near ptr error

deposit_digit_ok1:
	cmp	vinput_dep[si], "9"
	jbe	deposit_digit_ok2
	jmp	near ptr error

deposit_digit_ok2:
	inc	si
	loop	check_deposit

	mov	ax, 0			; convert deposit amount
	mov	si, 0
	mov	cx, 4

convert_deposit:
	mov	bl, vinput_dep[si]
	sub	bl, "0"

	mov	bh, 0
	mov	dx, 10

	mul	dx
	add	ax, bx

	inc	si
	loop	convert_deposit
	mov	deposit, ax

	mov	ax, balance_dep		; deposit calculation
	add	ax, deposit
	mov	newbalance, ax

	mov	ah, 09h			; display deposit successful
	lea	dx, dep8
	int	21h

	mov	ah, 09h			; current balance
	lea	dx, dep9
	int	21h

	mov	ax, balance_dep
	call	display_num_dep

	mov	ah, 09h			; deposit amount
	lea	dx, dep10
	int	21h
	
	mov	ax, deposit
	call	display_num_dep

	mov	ah, 09h			; display new balance
	lea	dx, dep11
	int	21h

	mov	ax, newbalance		; update balance in record
	call	display_num_dep

	lea	di, trans_record	; create new transaction record
	mov	si, 0
	mov	cx, 4

copy_acc_num:
	mov	al, vinput_dep[si]
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

	mov ah, 2Ah  			; get current date
	int 21h

; DL = day
; DH = month
; CX = year

; Save date values
mov date_day, dl
mov date_month, dh
mov date_year, cx

; ----------------
; Day
; ----------------
mov al, date_day
call write_2_digit

mov al, "/"
mov [di], al
inc di

; ----------------
; Month
; ----------------
mov al, date_month
call write_2_digit

mov al, "/"
mov [di], al
inc di

; ----------------
; Year
; ----------------
mov ax, date_year
call write_4_digit

; ----------------
; CR LF
; ----------------
mov al, 0Dh
mov [di], al
inc di

mov al, 0Ah
mov [di], al
inc di

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
	lea	dx, dep12
	int	21h

        mov ah,09h
	lea dx, dep14
	int 21h

	mov ah,01h
	int 21h

	and al,0DFh        ; convert lowercase to uppercase

	cmp al,'Y'
	je continue_yes

	cmp al,'N'
	je continue_no

	jmp	back_to_submenu_trans

	continue_yes:
    	jmp deposit_start

	continue_no:
	jmp	back_to_submenu_trans

error:	
	mov	ah, 09h			; invalid input after file open
	lea	dx, dep13
	int	21h

	jmp	deposit_start

acc_not_found_dep:
	mov	ah, 09h
	lea	dx, dep15
	int	21h

	jmp	deposit_start

acc_file_error:
	mov	ah, 3Eh
	mov	bx, filehandle

	int	21h
	jmp	back_to_submenu_trans


trans_file_error:
	mov	ah, 09h
	lea	dx, dep16
	int	21h

	mov	ah, 3Eh
	mov	bx, filehandle2
	int	21h

	jmp	back_to_submenu_trans


file_error:
	jmp	back_to_submenu_trans


back_to_submenu_trans:
    call	transaction

write_2_digit proc			; AL = value (0-99), writes 2 ASCII chars to [di]
	mov	ah, 0
	mov	bl, 10
	div	bl			; al = tens digit, ah = ones digit

	add	al, "0"
	mov	[di], al
	inc	di

	mov	al, ah
	add	al, "0"
	mov	[di], al
	inc	di

	ret
write_2_digit endp

write_4_digit proc			; AX = value (0-9999), writes 4 ASCII chars to [di]
	mov	bx, 10
	mov	cx, 0

convert_4_digit:
	mov	dx, 0
	div	bx

	push	dx
	inc	cx

	cmp	ax, 0
	jne	convert_4_digit

print_4_digit:
	pop	dx
	add	dl, "0"

	mov	[di], dl
	inc	di
	loop	print_4_digit

	ret
write_4_digit endp

display_num_dep proc			; display number
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

display_num_dep endp
;============================== Withdrawal Money ================================
withdrawal_money:
    mov		ah , 09h						; Display withdraw title
    lea		dx , msg_withdraw_title1
    int		21h
    	
    mov		ah , 09h
    lea		dx , msg_withdraw_title2
    int		21h
    	
    mov		ah , 09h
    lea		dx , msg_withdraw_title3
    int     21h

START_withdraw:
	mov    	ah , 09h
	lea    	dx , msg_balance			; Display current balance
	int    	21h

	mov    	ax , balance_wid				; Display balance in 4 digits
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

    cmp    	ax , balance_wid				; Check if the balance is sufficient
    ja     	INSUFFICIENT

    sub    	balance_wid , ax				; Execute withdraw

    mov    	ah , 09h
    lea    	dx , msg_withdraw_success	; Shwo the withdrawal was successful
    int    	21h

    mov    	ax , balance_wid				; Display new balance
	call	DISPLAY_NUM

    jmp    	CONTINUE

GO_START:
	jmp	START_withdraw

CONTINUE:
    mov    	ah , 09h
    lea    	dx , msg_withdraw_continue	; Prompt msg to ask user whether want to continue to withdraw
    int    	21h

    mov    	ah , 01h
    int    	21h

    and    	al , 0DFh

    cmp    	al , 'Y'
    je     	GO_START

    jmp    	back_to_submenu_trans

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

DISPLAY_NUM proc
    mov     bx, 1000
    mov     dx, 0
    div     bx
    mov     cl, al
    add     cl, '0'
    mov     dl, cl
    mov     ah, 02h
    int     21h

    mov     ax, dx
    mov     bx, 100
    mov     dx, 0
    div     bx
    mov     cl, al
    add     cl, '0'
    mov     dl, cl
    mov     ah, 02h
    int     21h

    mov     ax, dx
    mov     bx, 10
    mov     dx, 0
    div     bx
    mov     cl, al
    add     cl, '0'
    mov     dl, cl
    mov     ah, 02h
    int     21h

    mov     dl, dl          ; remainder from last div = ones digit
    add     dl, '0'
    mov     ah, 02h
    int     21h
    ret
DISPLAY_NUM endp

;==========================CHECK BALANCE=========================================
check_bal:
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

    mov		cx, 4
	mov		si, 0

input_check_acc:
	cmp		al, '0'
	jb		chk_invalid

	cmp		al, '9'
	ja		chk_invalid

	jmp		chk_valid

chk_invalid:
	call	check_invalid
	
chk_valid:
	mov		vinput_chk[si], al
	inc		si
	loop	input_check_acc

	mov		ah, 3Dh				; open transaction.txt
	mov		al, 0
	
	lea		dx, filename2
	int		21h
	
	jc		chk_file_error
	mov		filehandle2,ax

	mov		ah, 3Fh
	mov		bx, filehandle2			; read transaction.txt
	mov		cx, 1024

	lea		dx, trans_buffer_chk
	int		21h
	
	jc		chk_file_error
	mov		trans_size, ax

	mov		ah, 3Eh				; close transaction.txt
	mov		bx, filehandle2
	int		21h

	mov		si, 0					; search transaction record
	mov		balance_chk, 0

chk_file_error:
    jmp check_file_error
search_trans_chk:
	cmp		si, trans_size
	jb		search_trans_chk_continue
	jmp		check_not_found
search_trans_chk_continue:
	cmp		si, 0							; check wheter is begining of new record
	je		check_acc_chk

	cmp		trans_buffer_chk[si-1], 0Ah
	je		check_acc_chk

	inc		si
	jmp		search_trans_chk

check_acc_chk:
	mov		di, 0
	mov		bx, si

compare_check_acc:
	mov		al, trans_buffer_chk[bx]
	cmp		al, vinput_chk[di]
	jne		check_not_match

	inc		bx
	inc		di

	cmp		di, 4
	jne		compare_check_acc

	cmp		trans_buffer_chk[bx], ','				; after acc number must be ","
	jne		check_not_match

	mov		found_flag, 1

	mov		ah, 09H							; account found
	lea		dx, chk5
	int		21H

	mov		si, bx
	inc		si

find_type_end_chk:
    cmp     si, trans_size					; skip transaction type
    jae     check_not_found

    cmp     trans_buffer_chk[si], ","
    je      find_amt_start

    inc     si
    jmp     find_type_end_chk

find_amt_start:
    inc     si							; skip amount field

find_amt_end_chk:
    cmp     si, trans_size
    jae     check_not_found

    cmp     trans_buffer_chk[si], ","
    je      read_check_bal

    inc     si
    jmp     find_amt_end_chk

read_check_bal:
	inc		si									; read new balance
	mov		balance_chk, 0

read_balance_digit_chk:
    cmp     si, trans_size
    jae     save_check_balance

    mov     bl, trans_buffer_chk[si]

    cmp     bl, ","
    je      save_check_balance

    cmp     bl, 0Dh
    je      save_check_balance

    cmp     bl, 0Ah
    je      save_check_balance

    sub     bl, "0"
    mov     bh, 0

    mov     dx, 10
    mul     dx
    add     ax, bx

    inc     si
    jmp     read_balance_digit_chk

save_check_balance:
	mov		balance_chk, ax
    jmp     search_trans_chk

check_not_match:
	inc		si
	jmp		search_trans_chk

check_not_found:
    cmp     found_flag, 0
    je      check_acc_not_found

    mov     ah, 09h
    lea     dx, chk6						; display balance
    int     21h

    mov     ax, balance_chk
    call    display_num_chk

    jmp     transaction

check_invalid:
	mov		ah, 09h				; invalid input
	lea		dx, chk7
	int		21h

	call	transaction

check_acc_not_found:
	mov		ah, 09h				; account not found
	lea		dx, chk8
	int		21h

	call		transaction

check_file_error:
	mov		ah, 09h
	lea		dx, chk9
	int		21h

	jmp		transaction

display_num_chk proc			; display number
	mov		bx, 10
	mov		cx, 0

convert_num_chk:
	mov		dx, 0
	div		bx

	push	dx
	inc		cx

	cmp		ax, 0
	jne		convert_num_chk

print_num_chk:	
	pop		dx
	add		dl, "0"

	mov		ah, 02h
	int		21h

	loop	print_num_chk
	ret

display_num_chk endp


;=======================Loan & Interest==========================================
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
	;je	cal_interest

	cmp	al, '2'
	;je	add_interest

	cmp	al, '3'
	je	loanpart

	cmp	al, '4'
	jmp	back_to_main

	jmp	invalid_interest

loanpart:
    jmp Loancalc

invalid_interest:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

;=======================Loan calculation==========================================
Loancalc:
	mov ah, 02h
	mov bh, 00h
	mov dh, 05h
	mov dl, 0Ah
	int 10h

	mov ah, 09h
	mov al, ''
	mov bh, 00h	; Print color layout 
	mov bl, 0Ah
	mov cx, 1190
	int 10h 

	mov ah, 09h
	lea dx, Layout
	int 21h

;====== DISPLAY MSG1 & READ LOAN AMOUNT =========
loanloop:
	MOV AH, 09H
   	LEA DX, LoanMenu
  	INT 21H
	
	MOV AH, 09H
   	LEA DX, Loan1 
  	INT 21H

	MOV AH, 01H
   	INT 21H
	
	CMP AL, '1'
	JE place1	; check input and jmp to next line  
	
	CMP AL, '2' 
	JE place2	; check input and jmp to next line  

	
	CMP AL, '3' 
	JE place3	; check input and jmp to next line  

	CMP AL, '4'
	JE place4	; check input and jmp to next line 
 
	
	JMP ERROR1


place1:
	MOV LOAN,15000  ; If 1 loan place 15000 
	JMP Yearloop
	
place2:
	MOV LOAN,20000 ; If 2 loan place 20,000
	JMP Yearloop

place3:
	MOV LOAN,25000  ; If 3 loan place 25000 
	JMP Yearloop

place4:
	MOV LOAN,30000  ; If 4 loan place 30,000 
	JMP Yearloop

	
;========= Read Year Input & Msg2=======================

Yearloop:
	MOV AH, 09H
   	LEA DX, YearMenu
  	INT 21H
	
	MOV AH, 09H 
	LEA DX, Year2
	INT 21H
	
	MOV AH, 01H
   	INT 21H

	CMP AL, '1'
	JE placeYear1 ; Check is the input is 1 

	CMP AL, '2'
	JE placeYear2	; Check is the input is 2 
	
	JMP ERROR2

placeYear1:
	MOV YEAR, 5  ; store year 5 and went to next line cal1 
	JMP LoopCal1


placeYear2:
	MOV YEAR, 10 ; store year 10 and went to next line cal2
	JMP LoopCal1


;=========Calculate the loan, interest and year ======

LoopCal1:
	
	MOV AX, LOAN ;receive loan and year 
	MOV BX, YEAR

	MUL BX ; multiple loan and year 


	MOV BX ,10 ; store bx in 10 
	;MUL BX 	; 10 * ( loan * year )

	;MOV BX, 100   div 100 with loan * year / 100
	;XOR DX, DX
	DIV BX
	MOV INTEREST, AX

	MOV AX, LOAN ; mov loan value in ax 
	ADD AX, INTEREST ; add interest and loan together
	MOV RESULT, AX   ; place ax in result 

;========Show result loan total and year==============

	MOV AH, 09H
   	LEA DX, Menu3
  	INT 21H
	
	MOV DX, 0
	MOV AX , RESULT 
	MOV CX, 10000
	DIV CX 
	MOV NUM3, AL

	MOV AX, DX 
	MOV DX, 0  
	MOV CX, 1000
	DIV CX 
	MOV NUM4, AL

	MOV AX, DX
	MOV DX, 0
	MOV BX, 100
	DIV BX
	MOV NUM5, AL

	MOV AX, DX 
	MOV BL, 10
	DIV BL
	MOV NUM6, AL
	MOV NUM7, AH

;====== Display value in loan =========
	
	MOV DL, NUM3  ;Check is got any zero from first digit 
	CMP DL, 0
	JE Printout
	
	MOV AH, 02H
	ADD DL, 30H	; No it will print out 
	INT 21H
Printout:
	MOV AH, 02H
	MOV DL, NUM4
	ADD DL, 30H
	INT 21H

	MOV AH, 02H
	MOV DL, ","
	INT 21H

	MOV AH, 02H
	MOV DL, NUM5
	ADD DL, 30H
	INT 21H

	MOV AH, 02H
	MOV DL, NUM6
	ADD DL, 30H
	INT 21H
	
	MOV AH, 02H
	MOV DL, NUM7
	ADD DL, 30H
	INT 21H
	
	
;======Asking user want to continues======

	MOV AH,09H
	LEA DX, ExitMsg
	INT 21H
	
	MOV AH, 01H
	INT 21H

	CMP AL, "Y"
	JMP interest_loan
	CMP AL, "y"
	JMP interest_loan
	
	;CMP AL, "N"
	;JE Continue

ERROR1:MOV AH, 09H
	LEA DX, ErrorMsg1
	INT 21H

	JMP loanloop

ERROR2:MOV AH, 09H
	LEA DX, ErrorMsg2
	INT 21H

	JMP Yearloop
;===================================================================

back_to_main:
    call	MainMenu

generate_statement:
	mov	ah, 09h
	lea	dx, gnt1
	int	21h

	mov	ah, 09h
	lea	dx, gnt2
	int	21h

	mov	ah, 09h
	lea	dx, gnt3
	int	21h

	mov	ah, 09h
	lea	dx, gnt4
	int	21h
input_acc:
	mov	ah, 01h
	int	21h

	mov	accNum[si], al
	inc	si
	loop	input_acc

	mov	cx, 6
	mov	si, 0

check_acc_dep:
	cmp	accNum[si], '0'
	jb	error3

	cmp	accNum[si], '9'
	ja	error3

	inc	si
	loop	check_acc_dep

error3:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	generate_statement

acc_found_login:
	mov	ah, 09h
	lea	dx, accFoundStr
	int	21h

	mov	ah, 09h
	lea	dx, pressKeyStr
	int	21h

	mov	ah, 01h
	int	21h
	jmp 	MainMenu			; generate statement here

acc_not_found:
	mov	ah, 09h
	lea	dx, accNotFound
	int	21h

	jmp	MainMenu



;==============================================================================
; AUTO-GENERATE BANK ACCOUNT DURING REGISTRATION
; account.txt format:
; CustomerID,Name,Account Number,Account Type,Current Balance
; Example: C004,Joey,9013,Saving,0
;==============================================================================
reg_create_account_record proc
        ; defaults used when account.txt has no customer record
        mov     reg_customer_value,1
        mov     reg_account_value,1000
        mov     reg_found_customer,0

        ; try to open account.txt
        mov     ax,3D00h
        lea     dx,filename
        int     21h

        jc      regacc_open_failed
        jmp     regacc_open_ok

regacc_open_failed:
        ; file missing -> create it and write the header first
        cmp     ax,2
        je      regacc_create_new

        stc
        ret

regacc_create_new:
        mov     ah,3Ch
        mov     cx,0
        lea     dx,filename
        int     21h

        jnc     regacc_create_ok
        jmp     regacc_fail

regacc_create_ok:
        mov     account_manage_handle,ax

        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,account_header_len
        lea     dx,account_header
        int     21h

        jnc     regacc_header_written
        jmp     regacc_close_fail

regacc_header_written:
        mov     bx,account_manage_handle
        mov     ah,3Eh
        int     21h

        jmp     regacc_make_strings

regacc_open_ok:
        mov     account_manage_handle,ax

        mov     bx,account_manage_handle
        mov     ah,3Fh
        mov     cx,4096
        lea     dx,account_manage_buffer
        int     21h

        jnc     regacc_read_ok
        jmp     regacc_close_fail

regacc_read_ok:
        mov     account_manage_size,ax

        mov     bx,account_manage_handle
        mov     ah,3Eh
        int     21h

        ; scan all lines and keep the last valid Cxxx record
        mov     si,0

regacc_scan_line:
        cmp     si,account_manage_size
        jb      regacc_line_in_range
        jmp     regacc_after_scan

regacc_line_in_range:
        mov     al,account_manage_buffer[si]
        cmp     al,'C'
        je      regacc_possible_customer
        jmp     regacc_skip_line

regacc_possible_customer:
        ; need C + 3 digits + comma
        mov     ax,account_manage_size
        sub     ax,si
        cmp     ax,6
        jae     regacc_enough_chars
        jmp     regacc_after_scan

regacc_enough_chars:
        mov     al,account_manage_buffer[si+1]
        cmp     al,'0'
        jae     regacc_digit1_low_ok
        jmp     regacc_skip_line
regacc_digit1_low_ok:
        cmp     al,'9'
        jbe     regacc_digit1_ok
        jmp     regacc_skip_line

regacc_digit1_ok:
        mov     al,account_manage_buffer[si+2]
        cmp     al,'0'
        jae     regacc_digit2_low_ok
        jmp     regacc_skip_line
regacc_digit2_low_ok:
        cmp     al,'9'
        jbe     regacc_digit2_ok
        jmp     regacc_skip_line

regacc_digit2_ok:
        mov     al,account_manage_buffer[si+3]
        cmp     al,'0'
        jae     regacc_digit3_low_ok
        jmp     regacc_skip_line
regacc_digit3_low_ok:
        cmp     al,'9'
        jbe     regacc_digit3_ok
        jmp     regacc_skip_line

regacc_digit3_ok:
        cmp     byte ptr account_manage_buffer[si+4],','
        je      regacc_customer_format_ok
        jmp     regacc_skip_line

regacc_customer_format_ok:
        ; parse customer number Cxxx
        xor     ax,ax
        mov     al,account_manage_buffer[si+1]
        sub     al,'0'
        mov     bl,100
        mul     bl
        mov     dx,ax

        xor     ax,ax
        mov     al,account_manage_buffer[si+2]
        sub     al,'0'
        mov     bl,10
        mul     bl
        add     dx,ax

        xor     ax,ax
        mov     al,account_manage_buffer[si+3]
        sub     al,'0'
        add     dx,ax

        mov     reg_customer_value,dx
        mov     reg_found_customer,1

        ; find second comma: skip CustomerID then Name
        mov     di,si
        add     di,5

regacc_find_second_comma:
        cmp     di,account_manage_size
        jb      regacc_second_range_ok
        jmp     regacc_after_scan

regacc_second_range_ok:
        mov     al,account_manage_buffer[di]
        cmp     al,','
        je      regacc_account_start

        cmp     al,0Dh
        jne     regacc_second_not_cr
        jmp     regacc_skip_line_from_di
regacc_second_not_cr:
        cmp     al,0Ah
        jne     regacc_second_normal
        jmp     regacc_skip_line_from_di

regacc_second_normal:
        inc     di
        jmp     regacc_find_second_comma

regacc_account_start:
        inc     di
        xor     ax,ax

regacc_parse_account:
        cmp     di,account_manage_size
        jb      regacc_account_range_ok
        jmp     regacc_after_scan

regacc_account_range_ok:
        mov     dl,account_manage_buffer[di]

        cmp     dl,','
        jne     regacc_account_not_comma
        jmp     regacc_save_last_account

regacc_account_not_comma:
        cmp     dl,'0'
        jae     regacc_account_low_ok
        jmp     regacc_skip_line_from_di
regacc_account_low_ok:
        cmp     dl,'9'
        jbe     regacc_account_digit_ok
        jmp     regacc_skip_line_from_di

regacc_account_digit_ok:
        sub     dl,'0'
        xor     dh,dh

        push    dx
        mov     bx,10
        mul     bx
        pop     dx
        add     ax,dx

        inc     di
        jmp     regacc_parse_account

regacc_save_last_account:
        mov     reg_account_value,ax
        jmp     regacc_skip_line_from_di

regacc_skip_line:
        mov     di,si

regacc_skip_line_from_di:
        cmp     di,account_manage_size
        jb      regacc_skip_range_ok
        jmp     regacc_after_scan

regacc_skip_range_ok:
        cmp     byte ptr account_manage_buffer[di],0Ah
        je      regacc_next_line
        inc     di
        jmp     regacc_skip_line_from_di

regacc_next_line:
        inc     di
        mov     si,di
        jmp     regacc_scan_line

regacc_after_scan:
        cmp     reg_found_customer,1
        je      regacc_use_next_values

        ; no customer record yet: start with C001 / 1000
        mov     reg_customer_value,1
        mov     reg_account_value,1000
        jmp     regacc_make_strings

regacc_use_next_values:
        inc     reg_customer_value
        inc     reg_account_value

regacc_make_strings:
        ; build CustomerID: Cxxx
        mov     byte ptr reg_customer_id[0],'C'

        mov     ax,reg_customer_value
        xor     dx,dx
        mov     bx,100
        div     bx
        add     al,'0'
        mov     reg_customer_id[1],al

        mov     ax,dx
        xor     dx,dx
        mov     bx,10
        div     bx
        add     al,'0'
        mov     reg_customer_id[2],al

        add     dl,'0'
        mov     reg_customer_id[3],dl
        mov     byte ptr reg_customer_id[4],0

        ; build 4-digit account number
        mov     ax,reg_account_value
        xor     dx,dx
        mov     bx,1000
        div     bx
        add     al,'0'
        mov     reg_account_number[0],al

        mov     ax,dx
        xor     dx,dx
        mov     bx,100
        div     bx
        add     al,'0'
        mov     reg_account_number[1],al

        mov     ax,dx
        xor     dx,dx
        mov     bx,10
        div     bx
        add     al,'0'
        mov     reg_account_number[2],al

        add     dl,'0'
        mov     reg_account_number[3],dl
        mov     byte ptr reg_account_number[4],0

        ; open account.txt for append
        mov     ax,3D02h
        lea     dx,filename
        int     21h

        jnc     regacc_append_open_ok
        jmp     regacc_fail

regacc_append_open_ok:
        mov     account_manage_handle,ax

        mov     bx,account_manage_handle
        mov     ax,4202h
        xor     cx,cx
        xor     dx,dx
        int     21h

        jnc     regacc_seek_ok
        jmp     regacc_close_fail

regacc_seek_ok:
        ; CustomerID
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,4
        lea     dx,reg_customer_id
        int     21h

        jnc     regacc_customer_written
        jmp     regacc_close_fail

regacc_customer_written:
        ; comma
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,1
        lea     dx,comma_char
        int     21h

        jnc     regacc_comma1_written
        jmp     regacc_close_fail

regacc_comma1_written:
        ; Name = registered username
        mov     si,0

regacc_count_name:
        cmp     byte ptr reg_username[si],0
        je      regacc_write_name
        inc     si
        jmp     regacc_count_name

regacc_write_name:
        mov     cx,si
        mov     bx,account_manage_handle
        mov     ah,40h
        lea     dx,reg_username
        int     21h

        jnc     regacc_name_written
        jmp     regacc_close_fail

regacc_name_written:
        ; comma
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,1
        lea     dx,comma_char
        int     21h

        jnc     regacc_comma2_written
        jmp     regacc_close_fail

regacc_comma2_written:
        ; account number
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,4
        lea     dx,reg_account_number
        int     21h

        jnc     regacc_account_written
        jmp     regacc_close_fail

regacc_account_written:
        ; comma
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,1
        lea     dx,comma_char
        int     21h

        jnc     regacc_comma3_written
        jmp     regacc_close_fail

regacc_comma3_written:
        ; account type
        mov     si,0

regacc_count_type:
        cmp     byte ptr reg_account_type[si],0
        je      regacc_write_type
        inc     si
        jmp     regacc_count_type

regacc_write_type:
        mov     cx,si
        mov     bx,account_manage_handle
        mov     ah,40h
        lea     dx,reg_account_type
        int     21h

        jnc     regacc_type_written
        jmp     regacc_close_fail

regacc_type_written:
        ; comma
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,1
        lea     dx,comma_char
        int     21h

        jnc     regacc_comma4_written
        jmp     regacc_close_fail

regacc_comma4_written:
        ; opening balance = 0
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,1
        lea     dx,zero_balance_char
        int     21h

        jnc     regacc_zero_written
        jmp     regacc_close_fail

regacc_zero_written:
        ; CR LF
        mov     bx,account_manage_handle
        mov     ah,40h
        mov     cx,2
        lea     dx,new_line
        int     21h

        jnc     regacc_newline_written
        jmp     regacc_close_fail

regacc_newline_written:
        mov     bx,account_manage_handle
        mov     ah,3Eh
        int     21h

        clc
        ret

regacc_close_fail:
        mov     bx,account_manage_handle
        mov     ah,3Eh
        int     21h

regacc_fail:
        stc
        ret
reg_create_account_record endp


;==============================================================================
; LOAD LOGGED-IN USER BANK DETAILS FROM ACCOUNT.TXT
; matches account.txt Name field with reg_username
;==============================================================================
acc_load_bank_details proc
        mov     account_detail_found,0
        mov     current_balance_acc,0
        mov     byte ptr view_account_number[0],0
        mov     byte ptr view_account_type[0],0

        mov     ax,3D00h
        lea     dx,filename
        int     21h

        jnc     am_open_ok
        ret

am_open_ok:
        mov     account_manage_handle,ax

        mov     bx,account_manage_handle
        mov     ah,3Fh
        mov     cx,4096
        lea     dx,account_manage_buffer
        int     21h

        jnc     am_read_ok
        jmp     am_close_return

am_read_ok:
        mov     account_manage_size,ax

        mov     bx,account_manage_handle
        mov     ah,3Eh
        int     21h

        mov     si,0

am_next_line:
        cmp     si,account_manage_size
        jb      am_line_range_ok
        ret

am_line_range_ok:
        ; find first comma (end CustomerID)
        mov     di,si

am_find_first_comma:
        cmp     di,account_manage_size
        jb      am_first_range_ok
        ret

am_first_range_ok:
        mov     al,account_manage_buffer[di]
        cmp     al,','
        je      am_name_start

        cmp     al,0Ah
        je      am_line_after_lf

        inc     di
        jmp     am_find_first_comma

am_line_after_lf:
        inc     di
        mov     si,di
        jmp     am_next_line

am_name_start:
        inc     di
        mov     bx,0

am_read_name:
        cmp     di,account_manage_size
        jb      am_name_range_ok
        ret

am_name_range_ok:
        mov     al,account_manage_buffer[di]
        cmp     al,','
        jne     am_name_not_comma
        jmp     am_name_done

am_name_not_comma:
        cmp     al,0Dh
        jne     am_name_not_cr
        jmp     am_skip_line
am_name_not_cr:
        cmp     al,0Ah
        jne     am_name_normal
        jmp     am_skip_line

am_name_normal:
        cmp     bx,20
        jae     am_name_advance

        mov     account_name_temp[bx],al
        inc     bx

am_name_advance:
        inc     di
        jmp     am_read_name

am_name_done:
        mov     byte ptr account_name_temp[bx],0

        ; compare Name with logged-in username
        mov     bx,0

am_compare_name:
        mov     al,account_name_temp[bx]
        cmp     al,reg_username[bx]
        je      am_name_char_same
        jmp     am_skip_line

am_name_char_same:
        cmp     al,0
        je      am_record_match

        inc     bx
        jmp     am_compare_name

am_record_match:
        mov     account_detail_found,1

        ; DI points to comma after Name
        inc     di
        mov     bx,0

am_read_account_number:
        cmp     di,account_manage_size
        jb      am_acc_range_ok
        ret

am_acc_range_ok:
        mov     al,account_manage_buffer[di]
        cmp     al,','
        je      am_account_done

        cmp     bx,4
        jae     am_acc_advance

        mov     view_account_number[bx],al
        inc     bx

am_acc_advance:
        inc     di
        jmp     am_read_account_number

am_account_done:
        mov     byte ptr view_account_number[bx],0
        inc     di
        mov     bx,0

am_read_type:
        cmp     di,account_manage_size
        jb      am_type_range_ok
        ret

am_type_range_ok:
        mov     al,account_manage_buffer[di]
        cmp     al,','
        je      am_type_done

        cmp     bx,7
        jae     am_type_advance

        mov     view_account_type[bx],al
        inc     bx

am_type_advance:
        inc     di
        jmp     am_read_type

am_type_done:
        mov     byte ptr view_account_type[bx],0
        inc     di

        ; parse Current Balance
        xor     ax,ax

am_read_balance:
        cmp     di,account_manage_size
        jb      am_balance_range_ok
        jmp     am_balance_done

am_balance_range_ok:
        mov     dl,account_manage_buffer[di]
        cmp     dl,0Dh
        jne     am_balance_not_cr
        jmp     am_balance_done

am_balance_not_cr:
        cmp     dl,0Ah
        jne     am_balance_not_lf
        jmp     am_balance_done

am_balance_not_lf:
        cmp     dl,'0'
        jae     am_balance_low_ok
        jmp     am_balance_done

am_balance_low_ok:
        cmp     dl,'9'
        jbe     am_balance_digit_ok
        jmp     am_balance_done

am_balance_digit_ok:
        sub     dl,'0'
        xor     dh,dh

        push    dx
        mov     cx,10
        mul     cx
        pop     dx
        add     ax,dx

        inc     di
        jmp     am_read_balance

am_balance_done:
        mov     current_balance_acc,ax
        ret

am_skip_line:
        cmp     di,account_manage_size
        jb      am_skip_range_ok
        ret

am_skip_range_ok:
        cmp     byte ptr account_manage_buffer[di],0Ah
        je      am_skip_line_done

        inc     di
        jmp     am_skip_line

am_skip_line_done:
        inc     di
        mov     si,di
        jmp     am_next_line

am_close_return:
        mov     bx,account_manage_handle
        mov     ah,3Eh
        int     21h
        ret
acc_load_bank_details endp


exit_program:
        mov     ax,4C00h

        int     21h

	main 	endp

end main