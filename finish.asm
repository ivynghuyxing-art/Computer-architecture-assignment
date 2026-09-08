Title BankInterestAssignment 

.MODEL SMALL
.STACK 64 
.DATA
;--------------------------------Ivy Data------------------------------------------------
	main1	db	10,13,"----------------------------------------- $"
	main2	db	10,13,"		       MAIN MENU		 $"
	main3	db	10,13,"----------------------------------------- $"
	main4	db	10,13,"1. Account Management $"
	main5	db	10,13,"2. Transaction $"
	main6	db	10,13,"3. Interest & Loan $"
	main7	db	10,13,"4. Generate Bank Statement $"
	main8	db	10,13,"5. Logout $"
	main9	db	10,13,"Select the option: $"

;--------------------------- Account Management Submenu ------------------------------------------
	acc1	db	10,13,"----------------------------------------- $"
	acc2	db	10,13,"		   ACCOUNT MANAGEMENT	         $"
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

    int1	db	10,13,"------------------------------------------ $"
	int2	db	10,13,"	       INTEREST & LOAN MANAGEMENT         $"
	int3	db	10,13,"------------------------------------------ $"
	int4	db	10,13,"1. Calculate Interest $"
	int5	db	10,13,"2. Add Interest to Balance $"
	int6	db	10,13,"3. Loan $"
	int7	db	10,13,"4. Back to Main Menu $"
	int8	db	10,13,"Select the option: $"

	gnt1	db	10,13,"----------------------------------------- $"
	gnt2	db	10,13,"	       GENERATE BANK MANAGEMENT	         $"
	gnt3	db	10,13,"----------------------------------------- $"
	gnt4	db	10,13,"Enter account number: $"

	accFoundStr	db	10,13,"Account found. $"
	pressKeyStr	db	10,13,"Press any key to generate statement... $"
	invalidStr	db	10,13,"Invalid input! Please enter numeric number. $"
	accNotFound	db	10,13,"Account not found! $"
	logoutStr	db	10,13,"Logging out... $"
	accNum		db	4 dup(?)


;---------------------------------Login-------------------------------------------------------	
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

msg_file_error db 10,13,"Error: Cannot open user.txt!$"


;===========================================================
; REGISTER DATA
;===========================================================

reg_username        db 21 dup(0)
reg_password        db 21 dup(0)
reg_phone           db 16 dup(0)
reg_email           db 31 dup(0)

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


file_username       db 21 dup(0)	;store username read from user.txt
file_password       db 21 dup(0)	;store password read from user.txt
file_phone          db 16 dup(0)	;store phone read from user.txt
file_email          db 31 dup(0)	;store email from user.txt

;--------------------------------Joey Data-----------------------------------------------
;----------------------------------------------------------------------------------------

;-------------------------------- Xin Jie Data----------------------------------------
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
; ------------------------------------------------------------- check balance ---------------------------------------------------------
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

;--------------------------------Cayenne Data---------------------------------------------
withdraw_amount		dw	?

withdraw_title1		db	10,13,"---------------------------------------$"
withdraw_title2		db	10,13,"               WITHDRAW                $"
withdraw_title3		db	10,13,"---------------------------------------$"

wd_msg2		db	10,13,"Enter account number: $"
wd_msg3		db	10,13,"Account found. $"
wd_msg4		db	10,13,"Current Balance: RM$"
wd_msg5		db	10,13,"Enter withdrawal amount: RM$"
wd_msg6		db	10,13,10,13,"Withdrawal successful! $"
wd_msg7		db	10,13,"Current Balance: RM$"
wd_msg8		db	10,13,"Withdrawal Amount: RM$"
wd_msg9		db	10,13,"New Balance: RM$"
wd_msg10	db	10,13,"Account balance updated successfully! $"
wd_msg11	db	10,13,10,13,"Invalid input! Please enter numeric number. $"
wd_msg12	db	10,13,"Account not found! $"
wd_msg13	db	10,13,"Transaction file error! $"
wd_msg14	db	10,13,10,13,"Error! Insufficient balance! $"
;----------------------------------------------------------------------------------------

;--------------------------------Emily Data----------------------------------------------

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

;----------------------------------------------------------------------------------------

;========================================================================================
.CODE

MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX

;--------------------------------------------------Login Page------------------------------------------
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
        call     logout

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

        jmp     password_again

username_full:
        mov     byte ptr reg_username[si],0

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
        mov     ah,01h
        int     21h

        cmp     al,0Dh
        je      email_done

        cmp     si,30
        jae     email_done

        mov     reg_email[si],al

        inc     si

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
        jmp     register_successful

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
    mov     ah,09h

    lea     dx,msg21

    int     21h



;===========================================================
; FOR TESTING
;
; WHEN COMBINE WITH BANKING MAIN MENU,
; CHANGE "jmp menu" TO YOUR BANK MENU LABEL
;===========================================================

    jmp     Mainmenu

login_error:
    mov     ah,09h

    lea     dx,msg22

    int     21h

    jmp     menu

;------------------------------- Main Menu ------------------------------------------
Mainmenu:
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
	;je	transaction

	cmp	al, '3'
	call	interest_loan

	cmp	al, '4'
	;je	generate_statement

	cmp	al, '5' ; Fixed
	je       back_logout

	jmp	invalid_main

back_logout:
       call logout

invalid_main:

	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	Mainmenu


;------------------------------------------------ -account_management page ----------------------------------------------------
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

	;cmp	al, '1'
	;je	create_acc

	;cmp	al, '2'
	;je	update_acc

	;cmp	al, '3'
	;je	view_acc

	cmp	al, '4'
	call	Mainmenu        

	jmp	invalid_acc

invalid_acc:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	acc_management

; --------------------------------------- Transaction page --------------------------------------------------
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
	;je	deposit_money

	cmp	al, '2'
	;je	withdrawal_money Didn't put the code for this function yetfor this three

	cmp	al, '3'
	;je	check_bal

	cmp	al, '4'
	call	Mainmenu

	jmp	invalid_trans

invalid_trans:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	transaction                ; invalid choice

deposit_start:
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

	jmp	deposit_start

acc_not_found:
	mov	ah, 09h
	lea	dx, msg15
	int	21h

	jmp	deposit_start

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

display_success:
        mov     ah, 09H
        lea     dx, msg12
        int     21H

        jmp     transaction_menu

; --------------------------------------------- withraw money --------------------------------------------------------
withdraw:
	mov	ah, 09h
	lea	dx, withdraw_title1
	int	21h
 
	mov	ah, 09h
	lea	dx, withdraw_title2
	int	21h
 
	mov	ah, 09h
	lea	dx, withdraw_title3
	int	21h
 
	mov	ah, 09h			; enter account number
	lea	dx, wd_msg2
	int	21h
 
	mov	cx, 4
	mov	si, 0
 
wd_input_acc:
	mov	ah, 01h
	int	21h
 
	mov	vinput[si], al
	inc	si
	loop	wd_input_acc
 
	mov	cx, 4			; check account number is numeric
	mov	si, 0
 
wd_check_acc:
	cmp	vinput[si], "0"
	jae	wd_valid_digit1
	jmp	wd_error
 
wd_valid_digit1:
	cmp	vinput[si], "9"
	jbe	wd_valid_digit2
	jmp	wd_error
 
wd_valid_digit2:
	inc	si
	loop	wd_check_acc
 
	mov	ax, 0			; convert account number
	mov	si, 0
	mov	cx, 4
 
wd_convert_acc:
	mov	bl, vinput[si]
	sub	bl, "0"
 
	mov	bh, 0
	mov	dx, 10
	mul	dx
 
	add	ax, bx
	inc	si
	loop	wd_convert_acc
 
	mov	acc_num, ax
 
	mov	ah, 3Dh			; open account.txt
	mov	al, 2
 
	lea	dx, filename
	int	21h
 
	jnc	wd_file_open_ok
	jmp	wd_error
 
wd_file_open_ok:
	mov	filehandle, ax
 
	mov	ah, 3Fh			; read account.txt
	mov	bx, filehandle
	mov	cx, 512
 
	lea	dx, acc_buffer
	int	21h
 
	jnc	wd_acc_read_ok
	jmp	wd_acc_file_error
 
wd_acc_read_ok:
	mov	acc_size, ax
 
	mov	ah, 3Eh
	mov	bx, filehandle
	int	21h
 
	mov	si, 0
	mov	cx, acc_size
 
wd_search_acc:
	cmp	cx, 0
	jne	wd_search_ok1
	jmp	wd_acc_not_found
 
wd_search_ok1:
	cmp	acc_buffer[si], ","		; look for 1st comma
	jne	wd_next_acc_char
 
	inc	si
	dec	cx
 
wd_search_second_comma:
	cmp	cx, 0				; look for 2nd comma
	jne	wd_search_ok2
	jmp	wd_acc_not_found
 
wd_search_ok2:
	cmp	acc_buffer[si], ","
	je	wd_check_acc_num
 
	inc	si
	dec	cx
	jmp	wd_search_second_comma
 
wd_check_acc_num:
	inc	si
	dec	cx
 
	cmp	cx, 4
	jae	wd_size_ok
	jmp	wd_acc_not_found
 
wd_size_ok:
	mov	di, 0
	mov	bx, si
 
wd_compare_acc:
	mov	al, acc_buffer[bx]
	cmp	al, vinput[di]
	jne	wd_num_not_match
 
	inc	bx
	inc	di
 
	cmp	di, 4
	jne	wd_compare_acc
 
	jmp	wd_acc_found			; Account found
 
wd_num_not_match:
	mov	si, bx				; Continue searching
 
wd_next_acc_char:
	inc	si
	dec	cx
	jmp	wd_search_acc
 
wd_acc_found:
	mov	ah, 09h				; account found
	lea	dx, wd_msg3
	int	21h
 
	mov	ah, 3Dh				; open transaction.txt
	mov	al, 0
 
	lea	dx, filename2
	int	21h
 
	jnc	wd_trans_open_ok
	jmp	wd_trans_file_error
 
wd_trans_open_ok:
	mov	filehandle2, ax
 
	mov	ah, 3Fh				; read transaction.txt
	mov	bx, filehandle2
	mov	cx, 1024
 
	lea	dx, trans_buffer
	int	21h
 
	jnc	wd_trans_read_ok
	jmp	wd_trans_file_error
 
wd_trans_read_ok:
	mov	trans_size, ax
 
	mov	ah, 3Eh				; close transaction.txt
	mov	bx, filehandle2
	int	21h
 
	mov	si, 0
	mov	balance, 0
 
wd_search_trans:
	cmp	si, trans_size
	jb	wd_search_con1
	jmp	wd_search_done
 
wd_search_con1:
	cmp	si, 0
	je	wd_check_trans_acc
 
	cmp	trans_buffer[si-1], 0Dh
	je	wd_check_trans_acc
 
	cmp	trans_buffer[si-1], 0Ah
	je	wd_check_trans_acc
 
	inc	si
	jmp	wd_search_trans
 
wd_check_trans_acc:
	mov	ax, trans_size
	sub	ax, si
 
	cmp	ax, 5
	jae	wd_search_con2
	jmp	wd_search_done
 
wd_search_con2:
	mov	di, 0				; Compare account number
	mov	bx, si
 
wd_compare_trans_acc:
	mov	al, trans_buffer[bx]
	cmp	al, vinput[di]
	jne	wd_trans_not_match
 
	inc	bx
	inc	di
 
	cmp	di, 4
	jne	wd_compare_trans_acc
 
	cmp	trans_buffer[bx], ","
	jne	wd_trans_not_match
 
	mov	si, bx				; Account number matches
	inc	si				; Now find balance
 
wd_find_type_end:
	cmp	si, trans_size
	jb	wd_find_type_con1
	jmp	wd_search_done
 
wd_find_type_con1:
	cmp	trans_buffer[si], ","
	je	wd_find_amt_end
 
	inc	si
	jmp	wd_find_type_end
 
wd_find_amt_end:
	inc	si
 
wd_find_third_comma:
	cmp	si, trans_size
	jb	wd_third_comma_con1
	jmp	wd_search_done
 
wd_third_comma_con1:
	cmp	trans_buffer[si], ","
	je	wd_read_balance
 
	inc	si
	jmp	wd_find_third_comma
 
wd_read_balance:
	inc	si
	mov	ax, 0
 
wd_read_balance_digit:
	cmp	si, trans_size
	jae	wd_save_balance
 
	mov	bl, trans_buffer[si]
 
	cmp	bl, ","
	je	wd_save_balance
 
	cmp	bl, 0Dh
	je	wd_save_balance
 
	cmp	bl, 0Ah
	je	wd_save_balance
 
	sub	bl, "0"
	mov	bh, 0
 
	mov	dx, 10
	mul	dx
 
	add	ax, bx
	inc	si
	jmp	wd_read_balance_digit
 
wd_save_balance:
	mov	balance, ax
	jmp	wd_search_trans
 
wd_trans_not_match:
	inc	si
	jmp	wd_search_trans
 
wd_search_done:
	mov	ah, 09h				; display current balance
	lea	dx, wd_msg2
	int	21h
 
	mov	ax, balance
	call	display_num
 
	mov	ah, 09h				; enter withdrawal amount
	lea	dx, wd_msg3
	int	21h
 
	mov	cx, 4
	mov	si, 0
 
wd_input_withdraw:
	mov	ah, 01h
	int	21h
 
	mov	vinput[si], al
	inc	si
	loop	wd_input_withdraw
 
	mov	cx, 4				; check withdrawal input
	mov	si, 0
 
wd_check_withdraw:
	cmp	vinput[si], "0"
	jae	wd_digit_ok1
	jmp	wd_error
 
wd_digit_ok1:
	cmp	vinput[si], "9"
	jbe	wd_digit_ok2
	jmp	wd_error
 
wd_digit_ok2:
	inc	si
	loop	wd_check_withdraw
 
	mov	ax, 0				; convert withdrawal amount
	mov	si, 0
	mov	cx, 4
 
wd_convert_withdraw:
	mov	bl, vinput[si]
	sub	bl, "0"
 
	mov	bh, 0
	mov	dx, 10
	mul	dx
 
	add	ax, bx
	inc	si
	loop	wd_convert_withdraw
 
	mov	withdraw_amount, ax
 
	cmp	ax, balance			; check sufficient balance
	ja	wd_insufficient
 
	mov	ax, balance			; withdrawal calculation
	sub	ax, withdraw_amount
	mov	newbalance, ax
 
	mov	ah, 09h				; display withdrawal successful
	lea	dx, wd_msg2
	int	21h
 
	mov	ah, 09h				; current balance
	lea	dx, wd_msg3
	int	21h
 
	mov	ax, balance
	call	display_num
 
	mov	ah, 09h				; withdrawal amount
	lea	dx, wd_msg2
	int	21h
 
	mov	ax, withdraw_amount
	call	display_num
 
	mov	ah, 09h				; display new balance
	lea	dx, wd_msg3
	int	21h
 
	mov	ax, newbalance
	call	display_num
 
	lea	di, trans_record		; create new transaction record
	mov	si, 0
	mov	cx, 4
 
wd_copy_acc_num:
	mov	al, vinput[si]
	mov	[di], al
 
	inc	si
	inc	di
	loop	wd_copy_acc_num
 
	mov	al, ","
	mov	[di], al
	inc	di
 
	mov	al, "W"				; "Withdrawal"
	mov	[di], al
	inc	di
	mov	al, "i"
	mov	[di], al
	inc	di
	mov	al, "t"
	mov	[di], al
	inc	di
	mov	al, "h"
	mov	[di], al
	inc	di
	mov	al, "d"
	mov	[di], al
	inc	di
	mov	al, "r"
	mov	[di], al
	inc	di
	mov	al, "a"
	mov	[di], al
	inc	di
	mov	al, "w"
	mov	[di], al
	inc	di
	mov	al, "a"
	mov	[di], al
	inc	di
	mov	al, "l"
	mov	[di], al
	inc	di
 
	mov	al, ","
	mov	[di], al
	inc	di
 
	mov	ax, withdraw_amount
	mov	bx, 10
	mov	cx, 0
 
wd_convert_amt_record:
	mov	dx, 0
	div	bx
 
	push	dx
	inc	cx
 
	cmp	ax, 0
	jne	wd_convert_amt_record
 
wd_print_amt_record:
	pop	dx
	add	dl, "0"
 
	mov	[di], dl
	inc	di
	loop	wd_print_amt_record
 
	mov	al, ","
	mov	[di], al
	inc	di
 
	mov	ax, newbalance
	mov	bx, 10
	mov	cx, 0
 
wd_convert_newbal_record:
	mov	dx, 0
	div	bx
 
	push	dx
	inc	cx
 
	cmp	ax, 0
	jne	wd_convert_newbal_record
 
wd_print_newbal_record:
	pop	dx
	add	dl, "0"
 
	mov	[di], dl
	inc	di
	loop	wd_print_newbal_record
 
	mov	al, ","
	mov	[di], al
	inc	di
 
	mov	al, "0"				; date (edit as needed)
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
 
	jc	wd_trans_file_error
	mov	filehandle2, ax
 
	mov	ah, 42h
	mov	al, 2				; from end
 
	mov	bx, filehandle2
	mov	cx, 0
	mov	dx, 0
	int	21h
 
	jc	wd_trans_file_error
 
	mov	ah, 40h
	mov	bx, filehandle2
	mov	cx, trans_length
 
	lea	dx, trans_record
	int	21h
	jc	wd_trans_file_error
 
	mov	ah, 3Eh
	mov	bx, filehandle2
	int	21h
 
	mov	ah, 09h
	lea	dx, wd_msg2
	int	21h
 
	jmp	transaction
 
wd_insufficient:
	mov	ah, 09h				; not enough balance
	lea	dx, wd_msg2
	int	21h
 
	jmp	transaction
 
wd_error:
	mov	ah, 09h				; invalid input
	lea	dx, wd_msg3
	int	21h
 
	jmp	transaction
 
wd_acc_not_found:
	mov	ah, 09h
	lea	dx, wd_msg2
	int	21h
 
	jmp	transaction
 
wd_acc_file_error:
	mov	ah, 3Eh
	mov	bx, filehandle
	int	21h
	jmp	transaction
 
wd_trans_file_error:
	mov	ah, 09h
	lea	dx, wd_msg3
	int	21h
 
	mov	ah, 3Eh
	mov	bx, filehandle2
	int	21h
 
	jmp	transaction

; ----------------------------------------------- check balance ---------------------------------
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

input_check_acc:
	mov		ah, 01h
	int		21h

	cmp		al, '0'
	jb		check_invalid

	cmp		al, '9'
	ja		check_invalid

	mov		vinput[si], al
	inc		si
	loop	        input_check_acc

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
        lea     dx, chk6			; display balance
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

<<<<<<< HEAD
;------------------------------------------ Loan and interest page  ---------------------------------------
=======

;------------Transaction page ------------------------------
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
	;je	deposit_money

	cmp	al, '2'
	;je	Withdrawal

	cmp	al, '3'
	;je	check_bal

	cmp	al, '4'
	call	Mainmenu

	jmp	invalid_trans

invalid_trans:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	transaction

;------------Loan and interest page  ------------------------------
>>>>>>> ae07161e6a261132215b92e1e4e50ed249ccbde5
interest_loan:
    MOV AH, 09H
   	LEA DX, int1
  	INT 21H

    MOV AH, 09H
   	LEA DX, int2
  	INT 21H

    MOV AH, 09H
   	LEA DX, int3
  	INT 21H

    MOV AH, 09H
   	LEA DX, int4
  	INT 21H

    MOV AH, 09H
   	LEA DX, int5
  	INT 21H

    MOV AH, 09H
   	LEA DX, int6
  	INT 21H

    MOV AH, 09H
   	LEA DX, int7
  	INT 21H

    MOV AH, 09H
   	LEA DX, int8
  	INT 21H

    MOV AH , 01H
    INT 21H

    CMP AL, '1'
   ; call place1	; check input and jmp to next line  
	
    CMP AL, '2' 
    ;call place2	; check input and jmp to next line  

	
    CMP AL, '3' 
    JE loanpage ; check input and jmp to next line  

    CMP AL, '4'
    JE back ; check input and jmp to next line 

    jmp invalid_loan

back:
        call Mainmenu
        
invalid_loan:
	mov	ah, 09h
	lea	dx, invalidStr
	int	21h

	jmp	interest_loan

; ------------------------------------------- generate statement --------------------------------------------------------------
generate_statement:
	mov	ah, 09h
	;lea	dx, statementMenuStr this one didn't have this varible
	int	21h

	mov	cx, 4
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
	jmp 	Mainmenu			; generate statement here

acc_not_found:
	mov	ah, 09h
	lea	dx, accNotFound
	int	21h


	jmp	Mainmenu

;====== Display layout=====

loanpage:
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
	
	
;======Exit the loan page ======

	MOV AH,09H
	LEA DX, ExitMsg
	INT 21H
	
	MOV AH, 01H
	INT 21H

	CMP AL, "Y"
	call interest_loan
	CMP AL, "y"
	call interest_loan

	
ERROR1:MOV AH, 09H
	LEA DX, ErrorMsg1
	INT 21H
	JMP loanloop

ERROR2:MOV AH, 09H
	LEA DX, ErrorMsg2
	INT 21H
	JMP Yearloop

;outpage:
	;JMP SubMenu
;---------------------------------------------------

logout:
	mov	ah, 09h
	lea	dx, logoutStr
	int	21h

	mov	ax, 4C00h
	int	21h
	main endp 

end main