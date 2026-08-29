title       assignment       login function

.model      small
.stack      64
.data

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

msg1    db 10,13,10,13,"==============================$"
msg2    db 10,13,"Welcome to ABC Company$"
msg3    db 10,13,"==============================$"
msg4    db 10,13,"1. Login$"
msg5    db 10,13,"2. Register$"
msg6    db 10,13,"3. Exit$"
msg7    db 10,13,"Enter your choice: $"

msg8    db 10,13,10,13,"==============================$"
msg9    db 10,13,"REGISTER$"
msg10   db 10,13,"==============================$"
msg11   db 10,13,"Enter Username : $"
msg12   db 10,13,"Enter Password : $"
msg13   db 10,13,"Enter Phone Number : $"
msg14   db 10,13,"Enter Email : $"
msg15   db 10,13,"Password must contain uppercase, lowercase, special character and number!$"

msg16   db 	10,13,10,13,"==============================$"
msg17   db 	10,13,"LOGIN$"
msg18   db 	10,13,"==============================$"
msg19   db 	10,13,"Enter Username : $"
msg20   db 	10,13,"Enter Password : $"
msg21   db 	10,13,"Login Successfully!$"
msg22   db 	10,13,"Invalid username or password!$"
msg23   db 	10,13,"Register Successfully!$"
msg24   db 	10,13,"Invalid email ! Please enter correct email !"

reg_username    db 	21 dup(0)
reg_password    db 	21 dup(0)

reg_phone       db 	16 dup(0)
reg_email       db 	31 dup(0)
login_username  db 	21 dup(0)
login_password  db 	21 dup(0)

has_upper       db 	0
has_lower       db 	0
has_number      db 	0
has_special     db 	0

has_at	db	0		;for email validation @
has_dot	db	0		;for email validation .

;===========================================================
.code

	main proc far

    	mov     ax,@data
    	mov     ds,ax

    	mov     ah,09h			;display logo
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

    	mov   ah,09h
    	lea     dx,logo5
    	int     21h

    	mov     ah,09h
    	lea     dx,logo6
    	int     21h

    	mov   ah,09h
    	lea     dx,logo7
    	int     21h

    	mov     ah,09h
    	lea     dx,logo8
    	int     21h

    	mov   ah,09h
    	lea     dx,logo9
    	int     21h

    	mov   ah,09h
    	lea     dx,logo10
    	int     21h

    	mov   ah,09h
    	lea     dx,logo11
    	int     21h

press_enter:

    	mov   ah,01h
    	int     21h

    	cmp   al,0Dh
    	jne     press_enter

    	jmp     menu

menu:

    	mov   ah,09h
    	lea     dx,msg1
    	int     21h

    	mov   ah,09h
    	lea     dx,msg2
    	int     21h

    	mov   ah,09h
    	lea     dx,msg3
    	int     21h

    	mov   ah,09h
    	lea     dx,msg4
    	int     21h

    	mov   ah,09h
    	lea     dx,msg5
    	int     21h

    	mov   ah,09h
    	lea     dx,msg6
    	int     21h

    	mov   ah,09h
    	lea     dx,msg7
    	int     21h


    	mov   ah,01h
    	int     21h

    	cmp   al,'1'
    	je      menu_login

    	cmp   al,'2'
   	je      menu_register

    	cmp   al,'3'
    	je      menu_exit

   	jmp     menu

menu_login:

    	jmp     login

menu_register:

    	jmp     register

menu_exit:

    	jmp     exit_program

register:

    	mov   ah,09h
    	lea     dx,msg8
   	int     21h

    	mov   ah,09h
    	lea     dx,msg9
    	int     21h

    	mov   ah,09h
    	lea     dx,msg10
    	int     21h


    	mov   ah,09h
    	lea     dx,msg11
    	int     21h

    	mov     si,0

register_username:

    	mov   ah,01h
    	int     21h

    	cmp   al,0Dh
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

    	mov   ah,09h
    	lea     dx,msg12
    	int     21h

    	mov     si,0
	
register_password:

    	mov   ah,08h
   	    int     21h

    	cmp   al,0Dh						; ENTER
    	je      password_done

    	cmp   al,08h						; BACKSPACE
   	    je      register_password_backspace

    	cmp    si,20						 ; Maximum 20 characters for register password
    	jae     register_password

   	    mov     reg_password[si],al			; Store password

    	inc     si

    	mov   dl,'*'						; password display *
    	mov   ah,02h
    	int     21h

    	jmp     register_password

register_password_backspace:

    	cmp  si,0
    	je      register_password


    	dec    si

    	mov     byte ptr reg_password[si],0

    	mov   dl,08h						; Cursor back
   	    mov   ah,02h
    	int      21h

    	mov   dl,' '						 ; Print space
    	mov   ah,02h
    	int      21h

    	mov  dl,08h						; Cursor back again
    	mov  ah,02h
    	int     21h

    	jmp    register_password

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

    	cmp     al,0						 ; End of password
    	je      check_password_requirement

    	cmp     al,41h						; Check uppercase A-Z
    	jb      validate_lowercase

    	cmp     al,5Ah
    	jbe     validate_upper_found

validate_lowercase:

    	cmp     al,61h						; Check number 0-9
    	jb      validate_number

    	cmp     al,7Ah
    	jbe     validate_lower_found

validate_number:

    	cmp     al,30h							; Check number 0-9
    	jb      validate_special_found

    	cmp     al,39h
    	jbe     validate_number_found

    	jmp     validate_special_found			; Anything else is special character

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

    	mov     ah,09h
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

input_email_start:			;register email

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

    	cmp     byte ptr reg_email[0],0			    ; Email cannot be empty
    	je      email_invalid

     	cmp     byte ptr reg_email[0],'@'		           ; First character cannot be @
    	je      email_invalid

 	    cmp     byte ptr reg_email[0],'.'			   ; First character cannot be .
   	    je      email_invalid

validate_email_loop:

    	mov     al,reg_email[si]

    	cmp     al,0								    ; End of email
    	je      email_validate_end

	    cmp     al,' '							; Space is not allow
    	je      email_invalid
	   
	    cmp     al,'@'							 ; Check @
    	je      email_at_found

	    cmp     al,'.'							   ; Check .
    	je      email_dot_found

    	inc     si

    	jmp     validate_email_loop

email_at_found:					;if found @

    	cmp  has_at,1					 ; Only one @ is allowed
    	je      email_invalid

   	    mov    has_at,1

    	inc     si

    	jmp     validate_email_loop

email_dot_found:				;if found dot

    	cmp     email_has_at,1			 ; Only count . if @ already appeared
    	jne     email_dot_continue

    	mov     email_has_dot,1

email_dot_continue:

    	inc     si

    	jmp     validate_email_loop

email_validate_end:

    	cmp     email_has_at,1			    ; Must have @
    	jne     email_invalid

    	cmp     email_has_dot,1				    ; Must have . after @
    	jne     email_invalid

	    cmp     si,0					 ; SI currently points to ending 0
    	je      email_invalid

    	dec     si						;SI move back 1 one position

    	mov     al,reg_email[si]			    ; Last character cannot be .

   	    cmp     al,'.'
    	je      email_invalid

    	cmp     al,'@'				    ; Last character cannot be @
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

        mov     ah,09h
        lea     dx,msg23
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

    	cmp     al,0Dh						; enter

   	    je      login_password_done

    	cmp     al,08h							; backspace
    	je      login_password_backspace

    	cmp     si,20							; Maximum 20 characters
    	jae     input_login_password

   	    mov     login_password[si],al			 ; Store password
	
   	    inc     si

    	mov     dl,'*'						 ; Password display *
    	mov     ah,02h
    	int     21h
   	
	    jmp     input_login_password

login_password_backspace:

    	cmp     si,0
    	je      input_login_password

    	dec     si

    	mov     byte ptr login_password[si],0

    	mov     dl,08h						 ; Cursor backward
    	mov     ah,02h
    	int     21h

    	mov     dl,' '						 ; Delete *
    	mov     ah,02h
    	int     21h
	
    	mov     dl,08h						; Cursor backward
    	mov     ah,02h
    	int     21h

    	jmp     input_login_password

login_password_done:

    	mov     byte ptr login_password[si],0

    	jmp     check_login

check_login:

    	mov     si,0

check_username:

    	mov     al,reg_username[si]

    	cmp     al,login_username[si]
    	jne     username_not_same

    	cmp     al,0
    	je      check_login_password

    	inc     si

   	    jmp     check_username

username_not_same:

    	jmp     login_error

check_login_password:

    	mov     si,0

check_password_login:

    	mov     al,reg_password[si]

    	cmp     al,login_password[si]
    	jne     password_not_same

    	cmp     al,0
    	je      login_success

    	inc     si

    	jmp     check_password_login

password_not_same:

    	jmp     login_error

login_success:

    	mov     ah,09h
    	lea     dx,msg21
    	int     21h

    	jmp     menu

login_error:

    	mov     ah,09h
   	    lea     dx,msg22
    	int     21h

    	jmp     menu

exit_program:

    	mov     ax,4c00h
   	    int     21h

	main 	endp

end 	main