title       assignment       login function

.model      small
.stack      64

.data

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
dup_comma_count     db 0            ;count commas when checking duplicate email


file_username       db 21 dup(0)	;store username read from user.txt
file_password       db 21 dup(0)	;store password read from user.txt
file_phone          db 16 dup(0)	;store phone read from user.txt
file_email          db 31 dup(0)	;store email from user.txt

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
        jmp     register_successful

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

        jmp     menu

login_error:
        mov     ah,09h

        lea     dx,msg22

        int     21h

        jmp     menu

exit_program:
        mov     ax,4C00h

        int     21h

	main 	endp

end main