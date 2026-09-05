title       assignment      account management

.model      small
.stack      64
.data
    logo_account        db 13,10,"=========================="
                        db 13,10,"        .--------."
                        db 13,10,"        |   O    |"
                        db 13,10,"        |  /|\   |"
                        db 13,10,"        |  / \   |"
                        db 13,10,"        '--------'"
                        db 13,10,"      ACCOUNT MANAGEMENT"
                        db 13,10,"==========================$"

    msg_account         db 13,10,"=========================="
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
    msg_current         db 13,10,"Current Balance : RM $"
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
    msg_invalid         db 13,10,"Invalid choice! Please try again!$"
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
    msg_invalidemail    db 13,10"Invalid email! Please enter correct email!$"

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

;=========================================================
; TEMPORARY TEST DATA
;
; DELETE THESE 4 WHEN COMBINE WITH REGISTER
;=========================================================
    reg_username        db "JOEY",0,16 dup(0)
    reg_password        db "Abc@123",0,13 dup(0)
    reg_phone           db "0123456789",0,5 dup(0)
    reg_email           db "joey@gmail.com",0,16 dup(0)

    current_balance     dw 0

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

;=======================================================

.code
	main 	proc 	far

        mov     ax,@data
        mov     ds,ax

        mov     ah,09h				;display logo
        lea     dx,logo_account
        int     21h

acc_menu:
        mov     ah,09h
        lea     dx,msg_account				;display account management menu
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
        lea     dx,msg_invalid
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
        je      acc_view_balance


        mov     ah,02h
        int     21h


        inc     si


        jmp     acc_view_phone


acc_view_balance:

        mov     ah,09h
        lea     dx,msg_current			;print balance
        int     21h
        mov     ax,current_balance
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
        lea     dx,msg_invalid
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
        jmp     acc_exit

acc_exit:
        mov     ax,4C00h
        int     21h

	main 	endp

end main