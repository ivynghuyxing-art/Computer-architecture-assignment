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
    msg_interest        db 13,10,"Interest Amount : RM $" 
    msg_not_found       db 13,10,"Error : Account not found!$" 
    msg_file_error      db 13,10,"Error : Cannot open account.txt!$" 
    msg_continue        db 13,10,"Do you want to continue? (Y/N) : $" 
 
    account_filename    db "account.txt",0           ;store account file name
    account_handle      dw ?                         ;store opened file handle
    file_bytes          dw ?                         ;store number of bytes read
    file_end            dw ?                         ;store ending position of file
 
    file_buffer         db 4096 dup(?)                ;buffer to store account file data
 
    account_input       db 20                         ;maximum 20 characters can be entered
                        db ?                          ;store actual number of characters entered
                        db 20 dup(0)                  ;store account number entered by user
 
    current_balance     dw 0                          ;store current account balance
    interest_amount     dw 0                          ;store calculated interest amount
 
    number_temp         dw 0                          ;temporary storage for number display
    number_started      db 0                          ;check whether number display has started
 
;================================================================== 
.code 
 
    main    proc    far 
 
    mov ax,@data                                        ;load data segment address
    mov ds,ax                                           ;initialize data segment
 
 
interest_start: 
 
    mov ah,09h                                          ;display calculate interest logo
    lea dx,logo_interest 
    int 21h 
 
    mov ah,09h                                          ;ask user to enter account number
    lea dx,msg_account 
    int 21h 
 
    mov ah,0Ah                                          ;read account number from keyboard
    lea dx,account_input 
    int 21h 
 
    mov ah,3Dh                                          ;3Dh = open file
    mov al,0                                            ;AL = 0 means read only
    lea dx,account_filename                             ;load account.txt filename
    int 21h 
 
    jnc open_file_ok                                    ;if no error, continue
    jmp file_error                                      ;if error, display file error
 
 
open_file_ok: 
 
    mov account_handle,ax                               ;save file handle
 
    mov bx,account_handle                               ;BX = file handle
    mov ah,3Fh                                          ;3Fh = read file
    mov cx,4096                                         ;maximum 4096 bytes to read
    lea dx,file_buffer                                  ;store file data into buffer
    int 21h 
 
    jnc read_file_ok                                    ;if read successful, continue
    jmp file_error_close                                ;if error, close file first
 
 
read_file_ok: 
 
    mov file_bytes,ax                                   ;AX contains actual bytes read
 
    lea si,file_buffer                                  ;SI points to beginning of file buffer
    mov bx,si                                           ;BX = starting position
    add bx,file_bytes                                   ;add actual number of bytes read
    mov file_end,bx                                     ;save ending position of file
 
    mov bx,account_handle                               ;BX = file handle
    mov ah,3Eh                                          ;3Eh = close file
    int 21h 
 
    lea si,file_buffer                                  ;start reading file from beginning
 
search_line: 
 
    cmp si,file_end                                     ;check whether end of file is reached
    jb search_has_data                                  ;if not end, continue searching
    jmp account_not_found                               ;if end reached, account not found
 
 
search_has_data: 
 
    mov al,[si]                                         ;read current character from file
 
    cmp al,13                                           ;check carriage return
    jne search_not_cr 
 
    jmp next_char                                       ;skip carriage return
 
 
search_not_cr: 
 
    cmp al,10                                           ;check line feed
    jne search_not_lf 
 
    jmp next_char                                       ;skip line feed
 
 
search_not_lf: 
 
    cmp al,'#'                                          ;check whether current line is header
    jne search_not_header 
 
    jmp skip_line                                       ;skip header line
 
 
search_not_header: 
 
    mov cx,2                                            ;skip Customer ID and Name fields
 
skip_field: 
 
    cmp si,file_end                                     ;check end of file
    jb skip_field_has_data 
 
    jmp account_not_found                               ;account not found if file ends
 
 
skip_field_has_data: 
 
    mov al,[si]                                         ;read current character
    inc si                                              ;move to next character
 
    cmp al,','                                          ;check comma between fields
    jne skip_field 
 
    loop skip_field                                     ;repeat until 2 fields are skipped
 
    lea di,account_input+2                              ;DI points to entered account number
 
    xor cx,cx                                           ;clear CX
    mov cl,account_input+1                              ;get number of characters entered
 
 
compare_account: 
 
    cmp cx,0                                            ;check whether all characters matched
    je check_account_end 
 
    cmp si,file_end                                     ;check end of file
    jb compare_has_data 
 
    jmp account_not_found                               ;account not found if file ends
 
 
compare_has_data: 
 
    mov al,[si]                                         ;read account number character from file
 
    cmp al,[di]                                         ;compare file character with user input
    je compare_match 
 
    jmp skip_line                                       ;if not same, skip current record
 
 
compare_match: 
 
    inc si                                              ;move to next file character
    inc di                                              ;move to next input character
    dec cx                                              ;reduce remaining character count
 
    jmp compare_account                                 ;continue comparing
 
 
check_account_end: 
 
    cmp byte ptr [si],','                               ;account number must end with comma
    je account_end_ok 
 
    jmp skip_line                                       ;if not comma, account number is different
 
 
account_end_ok: 
 
    inc si                                              ;skip comma after account number
 
find_type_end: 
 
    cmp si,file_end                                     ;check end of file
    jb type_has_data 
 
    jmp account_not_found 
 
 
type_has_data: 
 
    mov al,[si]                                         ;read account type character
 
    cmp al,','                                          ;look for comma after account type
    je balance_found                                    ;balance starts after this comma
 
    inc si                                              ;move to next character
 
    jmp find_type_end                                   ;continue searching
 
balance_found: 
 
    inc si                                              ;skip comma before balance
 
    xor ax,ax                                           ;clear AX before converting balance
 
 
parse_balance: 
 
    cmp si,file_end                                     ;check end of file
    jae balance_complete 
 
    mov dl,[si]                                         ;read one balance character
 
    cmp dl,13                                           ;check carriage return
    je balance_complete 
 
    cmp dl,10                                           ;check line feed
    je balance_complete 
 
    cmp dl,'0'                                          ;check if character is below 0
    jb balance_complete 
 
    cmp dl,'9'                                          ;check if character is above 9
    ja balance_complete 
 
    sub dl,'0'                                          ;convert ASCII digit to number
 
    xor dh,dh                                           ;clear DH
 
    mov cx,dx                                           ;save current digit into CX
 
    mov bx,10                                           ;prepare to multiply previous value by 10
    mul bx                                              ;AX = AX x 10
 
    add ax,cx                                           ;add current digit
 
    inc si                                              ;move to next balance character
 
    jmp parse_balance                                   ;continue reading balance
 
balance_complete: 
 
    mov current_balance,ax                              ;save current balance
 
    mov ax,current_balance                              ;get current balance
 
    mov bx,5                                            ;interest rate = 5%
    mul bx                                              ;current balance x 5
 
    mov bx,100                                          ;divide by 100
    div bx 
 
    mov interest_amount,ax                              ;save calculated interest amount
 
    mov ah,09h                                          ;display Current Balance message
    lea dx,msg_balance 
    int 21h 
 
    mov ax,current_balance                              ;get current balance
 
    mov number_temp,ax                                  ;store balance temporarily
 
    mov number_started,0                                ;reset number display flag
 
 
current_10000: 
 
    mov ax,number_temp                                  ;get remaining number
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,10000                                        ;check ten-thousands digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne current_display_10000 
 
    cmp number_started,1                                ;check if previous digit displayed
    je current_display_10000 
 
    jmp current_1000                                    ;skip leading zero
 
 
current_display_10000: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al                                           ;move digit to DL
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
current_1000: 
 
    mov ax,number_temp                                  ;get remaining number
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,1000                                         ;check thousands digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne current_display_1000 
 
    cmp number_started,1                                ;check if previous digit displayed
    je current_display_1000 
 
    jmp current_100                                     ;skip leading zero
 
 
current_display_1000: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
current_100: 
 
    mov ax,number_temp                                  ;get remaining number
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,100                                          ;check hundreds digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne current_display_100 
 
    cmp number_started,1                                ;check if previous digit displayed
    je current_display_100 
 
    jmp current_10                                      ;skip leading zero
 
 
current_display_100: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
current_10: 
 
    mov ax,number_temp                                  ;get remaining number
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,10                                           ;check tens digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne current_display_10 
 
    cmp number_started,1                                ;check if previous digit displayed
    je current_display_10 
 
    jmp current_1                                       ;skip leading zero
 
 
current_display_10: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
current_1: 
 
    mov ax,number_temp                                  ;get ones digit
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display ones digit
    int 21h 
 
    mov ah,09h                                          ;display Interest Rate message
    lea dx,msg_rate 
    int 21h 
 
    mov ah,09h                                          ;display Interest Amount message
    lea dx,msg_interest 
    int 21h 
 
    mov ax,interest_amount                              ;get calculated interest amount
 
    mov number_temp,ax                                  ;store interest temporarily
 
    mov number_started,0                                ;reset number display flag
 
 
interest_10000: 
 
    mov ax,number_temp                                  ;get remaining interest amount
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,10000                                        ;check ten-thousands digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne interest_display_10000 
 
    cmp number_started,1                                ;check if previous digit displayed
    je interest_display_10000 
 
    jmp interest_1000                                   ;skip leading zero
 
 
interest_display_10000: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
interest_1000: 
 
    mov ax,number_temp                                  ;get remaining interest amount
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,1000                                         ;check thousands digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne interest_display_1000 
 
    cmp number_started,1                                ;check if previous digit displayed
    je interest_display_1000 
 
    jmp interest_100                                    ;skip leading zero
 
 
interest_display_1000: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
interest_100: 
 
    mov ax,number_temp                                  ;get remaining interest amount
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,100                                          ;check hundreds digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne interest_display_100 
 
    cmp number_started,1                                ;check if previous digit displayed
    je interest_display_100 
 
    jmp interest_10                                     ;skip leading zero
 
 
interest_display_100: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
interest_10: 
 
    mov ax,number_temp                                  ;get remaining interest amount
 
    xor dx,dx                                           ;clear DX before division
 
    mov bx,10                                           ;check tens digit
    div bx 
 
    mov number_temp,dx                                  ;save remainder
 
    cmp ax,0                                            ;check whether digit is zero
    jne interest_display_10 
 
    cmp number_started,1                                ;check if previous digit displayed
    je interest_display_10 
 
    jmp interest_1                                      ;skip leading zero
 
 
interest_display_10: 
 
    mov number_started,1                                ;number display has started
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display one character
    int 21h 
 
 
interest_1: 
 
    mov ax,number_temp                                  ;get ones digit
 
    add al,'0'                                          ;convert digit to ASCII
 
    mov dl,al 
 
    mov ah,02h                                          ;display ones digit
    int 21h 
 
    jmp ask_continue                                    ;ask user whether to continue
 
account_not_found: 
 
    mov ah,09h                                          ;display account not found message
    lea dx,msg_not_found 
    int 21h 
 
    jmp ask_continue                                    ;ask whether user wants to continue
 
file_error_close: 
 
    mov bx,account_handle                               ;load file handle
 
    mov ah,3Eh                                          ;close opened file
    int 21h 
 
 
file_error: 
 
    mov ah,09h                                          ;display file error message
    lea dx,msg_file_error 
    int 21h 
 
    jmp ask_continue                                    ;ask whether user wants to continue
 
ask_continue: 
 
    mov ah,09h                                          ;display continue message
    lea dx,msg_continue 
    int 21h 
 
    mov ah,01h                                          ;read one character from keyboard
    int 21h 
 
    cmp al,'Y'                                          ;check uppercase Y
    je restart_interest 
 
    cmp al,'y'                                          ;check lowercase y
    jne exit_program                                    ;if not Y/y, exit program
 
 
restart_interest: 
 
    jmp interest_start                                  ;restart calculate interest process
 
next_char: 
 
    inc si                                              ;move to next file character
 
    jmp search_line                                     ;continue searching records
 
skip_line: 
 
    cmp si,file_end                                     ;check whether file has ended
    jb skip_line_has_data 
 
    jmp account_not_found                               ;if end reached, account not found
 
 
skip_line_has_data: 
 
    mov al,[si]                                         ;read current character
 
    inc si                                              ;move to next character
 
    cmp al,10                                           ;look for line feed
    jne skip_line                                       ;continue until current line ends
 
    jmp search_line                                     ;start searching next record
 
exit_program: 

    mov ax,4C00h                                        ;terminate program and return to DOS
    int 21h 
 
    main endp 
 
end main