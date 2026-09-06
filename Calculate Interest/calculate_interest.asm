title       assignment calculate interest

.model      small
.stack      64
.data
    logo_interest       db 13,10,"======================================="
                        db 13,10,"          CALCULATE INTEREST"
                        db 13,10,"=======================================$"
    msg_account         db 13,10,"Enter Account Number : $"
    msg_balance         db 13,10,"Current Balance : RM $"
    msg_rate            db 13,10,"Interest Rate   : 5%$"
    msg_interest        db 13,10,"Interest Added  : RM $"
    msg_new_balance     db 13,10,"New Balance     : RM $"
    msg_not_found       db 13,10,"Error : Account not found!$"
    msg_file_error      db 13,10,"Error : Cannot open account.txt!$"
    msg_continue        db 13,10,"Do you want to continue? (Y/N) : $"

    account_filename    db "account.txt",0
    account_handle      dw ?
    file_bytes          dw ?
    file_end            dw ?

    file_buffer         db 4096 dup(?)

    account_input       db 20       ;maximum 20 character can be entered
                        db ?        ;store actual number of character entered
                        db 20 dup(0)    ;store the account number entered by user

    current_balance     dw 0
    interest_amount     dw 0
    new_balance         dw 0

    number_temp         dw 0
    number_started      db 0

;==================================================================
.code

    main    proc    far

    mov ax,@data
    mov ds,ax

interest_start:
    mov ah,09h              ;display logo
    lea dx,logo_interest
    int 21h

    mov ah,09h              ;ask Account Number
    lea dx,msg_account
    int 21h

    mov ah,0Ah              ;get Account Number
    lea dx,account_input
    int 21h

    mov ah,3Dh              ;3Dh means open file

    mov al,0                ;AL = 0 means read only

    lea dx,account_filename

    int 21h                 ;open file

    jc file_error

    mov account_handle,ax      ;save file handle

    mov bx,account_handle       ;bx = file handle

    mov ah,3Fh                  ;ah = 3Fh means read file

    mov cx,4096                 ;maximum 4096 bytes

    lea dx,file_buffer          ;store file data into file_buffer

    int 21h                     ;read file

    jc file_error_close

    mov file_bytes,ax           ;ax = actual bytes read

    lea si,file_buffer          ;si points to start of file_buffer

    mov bx,si                   ;bx = start position

    add bx,file_bytes           ; Add number of bytes read

    mov file_end,bx             ;save end position

    mov bx,account_handle       ;bx = file handle

    mov ah,3Eh                   ;ah = 3Eh means close file

    int 21h                     ;close file

    lea si,file_buffer          ; Start reading from beginning


search_line:
    cmp si,file_end             ;check whether file has ended
    jae account_not_found

    mov al,[si]                 ;read current character

    cmp al,13                   ;skip next line
    je next_char

    cmp al,10                   ;skip next line
    je next_char

    cmp al,'#'
    je skip_line

    mov cx,2                    ;skip cust id and name

skip_field:
    cmp si,file_end               ;check end of file
    jae account_not_found

    mov al,[si]                  ; Read current character

    inc si                        ;move SI forward

    cmp al,','                    ;check for comma
    jne skip_field

    loop skip_field

    lea di,account_input+2          ;di points to user's input

    xor cx,cx                       ;clear CX

    mov cl,account_input+1          ;get user's input length

compare_account:
    cmp cx,0                        ;if all characters compared
    je check_account_end

    cmp si,file_end                  ; Check file end
    jae account_not_found

    mov al,[si]                     ;get character from account.txt

    cmp al,[di]                      ;compare with user's input

    jne skip_line                   ;if different, skip this record

    inc si                          ;move to next file character

    inc di                          ;move to next user input character

    dec cx                          ;reduce counter

    jmp compare_account             ;compare next character

check_account_end:
    cmp byte ptr [si],','           ;after Account Number must be comma
    jne skip_line

    inc si                          ;skip comma after Account Number

find_type_end:
    cmp si,file_end                 ;check file end
    jae account_not_found

    mov al,[si]                     ;read current character

    cmp al,','                      ;check comma after Account Type

    je balance_found                ;if comma found, balance starts next

    inc si                          ;move to next character

    jmp find_type_end               ;continue searching

balance_found:
    inc si                          ;skip comma

    xor ax,ax                       ;clear ax and ax store in current balance

parse_balance:
    cmp si,file_end                 ;check file end
    jae balance_complete

    mov dl,[si]                     ;read balance character

    cmp dl,13
    je balance_complete

    cmp dl,10
    je balance_complete

    cmp dl,'0'                      ;check if below '0'
    jb balance_complete

    cmp dl,'9'                      ;check if above '9'
    ja balance_complete

    sub dl,'0'                      ;convert ASCII to number

    xor dh,dh                       ;clear DH

    mov cx,dx                       ;save digit into CX

    mov bx,10                       ; AX = AX x 10
    mul bx

    add ax,cx                       ;add new digit

    inc si                          ;move to next character

    jmp parse_balance


balance_complete:
    mov current_balance,ax          ;save Current Balance
    mov ax,current_balance          ;ax= Current Balance

    mov bx,5                        ;multiply by 5
    mul bx

    mov bx,100                      ;divide by 100
    div bx

    mov interest_amount,ax           ;save Interest

    mov ax,current_balance          ;ax = Current Balance

    add ax,interest_amount          ;add Interest

    mov new_balance,ax              ;save New Balance

    mov ah,09h                      ;display message new balance
    lea dx,msg_balance
    int 21h

    mov ax,current_balance          ;get Current Balance

    mov number_temp,ax              ;store number temporarily

    mov number_started,0            ;no number displayed yet

current_10000:
    mov ax,number_temp
    xor dx,dx
    mov bx,10000
    div bx

    mov number_temp,dx              ;save remainder

    cmp ax,0                        ;check digit
    jne current_display_10000

    cmp number_started,1            ;if number already started, show zero
    je current_display_10000

    jmp current_1000                ; Otherwise skip to current_1000


current_display_10000:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

current_1000:
    mov ax,number_temp
    xor dx,dx
    mov bx,1000
    div bx

    mov number_temp,dx

    cmp ax,0
    jne current_display_1000

    cmp number_started,1
    je current_display_1000

    jmp current_100

current_display_1000:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

current_100:
    mov ax,number_temp
    xor dx,dx
    mov bx,100
    div bx

    mov number_temp,dx

    cmp ax,0
    jne current_display_100

    cmp number_started,1
    je current_display_100

    jmp current_10

current_display_100:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

current_10:
    mov ax,number_temp
    xor dx,dx
    mov bx,10
    div bx

    mov number_temp,dx

    cmp ax,0
    jne current_display_10

    cmp number_started,1
    je current_display_10

    jmp current_1

current_display_10:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

current_1:
    mov ax,number_temp

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

    mov ah,09h              ;display interest rate
    lea dx,msg_rate
    int 21h

    mov ah,09h              ;display interest rate
    lea dx,msg_interest
    int 21h

    mov ax,interest_amount      ;get interest amount

    mov number_temp,ax          ;store number

    mov number_started,0         ;reset display flag

interest_10000:
    mov ax,number_temp
    xor dx,dx
    mov bx,10000
    div bx

    mov number_temp,dx

    cmp ax,0
    jne interest_display_10000

    cmp number_started,1
    je interest_display_10000

    jmp interest_1000

interest_display_10000:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

interest_1000:
    mov ax,number_temp
    xor dx,dx
    mov bx,1000
    div bx

    mov number_temp,dx

    cmp ax,0
    jne interest_display_1000

    cmp number_started,1
    je interest_display_1000

    jmp interest_100

interest_display_1000:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

interest_100:
    mov ax,number_temp
    xor dx,dx               ;clear dx
    mov bx,100
    div bx

    mov number_temp,dx

    cmp ax,0
    jne interest_display_100

    cmp number_started,1
    je interest_display_100

    jmp interest_10

interest_display_100:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

interest_10:
    mov ax,number_temp
    xor dx,dx
    mov bx,10
    div bx

    mov number_temp,dx

    cmp ax,0
    jne interest_display_10

    cmp number_started,1
    je interest_display_10

    jmp interest_1

interest_display_10:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

interest_1:
    mov ax,number_temp

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

    mov ah,09h                  ;display new balance
    lea dx,msg_new_balance
    int 21h

    mov ax,new_balance          ;get New Balance

    mov number_temp,ax          ;store number

    mov number_started,0        ;reset display flag

new_10000:
    mov ax,number_temp
    xor dx,dx
    mov bx,10000
    div bx

    mov number_temp,dx

    cmp ax,0
    jne new_display_10000

    cmp number_started,1
    je new_display_10000

    jmp new_1000

new_display_10000:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

new_1000:
    mov ax,number_temp
    xor dx,dx
    mov bx,1000
    div bx

    mov number_temp,dx

    cmp ax,0
    jne new_display_1000

    cmp number_started,1
    je new_display_1000

    jmp new_100

new_display_1000:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

new_100:
    mov ax,number_temp          ;move remaining new balance value into ax
    xor dx,dx                   ;clear dx before division
    mov bx,100                  ;check hundred digits
    div BX                      ;divide bx

    mov number_temp,dx          ;save remainder into number_temp

    cmp ax,0                    ;check if hundred digits is 0
    jne new_display_100

    cmp number_started,1
    je new_display_100

    jmp new_10                  ;skip leading zero

new_display_100:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

new_10:
    mov ax,number_temp
    xor dx,dx
    mov bx,10
    div bx

    mov number_temp,dx

    cmp ax,0
    jne new_display_10

    cmp number_started,1
    je new_display_10

    jmp new_1

new_display_10:
    mov number_started,1

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

new_1:
    mov ax,number_temp

    add al,'0'
    mov dl,al

    mov ah,02h
    int 21h

    jmp ask_continue


account_not_found:
    mov ah,09h                  ;display not found message
    lea dx,msg_not_found
    int 21h

    jmp ask_continue

file_error_close:
    mov bx,account_handle       ;close file first

    mov ah,3Eh
    int 21h

file_error:
    mov ah,09h                  ;display file message error
    lea dx,msg_file_error
    int 21h

    jmp ask_continue

ask_continue:
    mov ah,09h                  ;display continue message
    lea dx,msg_continue
    int 21h

    mov ah,01h                  ;read one character
    int 21h

    cmp al,'Y'
    je interest_start

    cmp al,'y'
    je interest_start

    jmp exit_program


next_char:
    inc si                      ;move to next character
    jmp search_line     


skip_line:
        cmp si,file_end         ;check end of file
        jae account_not_found

        mov al,[si]             ;read character

        inc si                  ;look forward

        cmp al,10               ;look for lf
        jne skip_line

        jmp search_line         ;start next record

exit_program:
        mov ax,4c00h
        int 21h


        main endp

end main