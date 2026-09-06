TITLE Add Interest Into Balance

.MODEL SMALL
.STACK 64

.DATA

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

    msg_file_error      DB 13,10
                        DB "Error: Cannot open or read account.txt!$"

    msg_update_error    DB 13,10
                        DB "Error: Cannot update account.txt!$"

    filename            DB "account.txt",0
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

.CODE

MAIN PROC FAR

    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

    ; Display title
    MOV AH,09H
    LEA DX,msg_title
    INT 21H

    ; Ask for account number
    MOV AH,09H
    LEA DX,msg_account
    INT 21H

    MOV AH,0AH
    LEA DX,account_input
    INT 21H

    ; Validate account number
    CALL validate_account_input

    JNC input_is_valid
    JMP invalid_input_error

input_is_valid:

    ; Load account.txt into buffer
    CALL load_account_file

    JNC file_loaded
    JMP account_file_error

file_loaded:

    ; Find account and read balance
    CALL find_account

    JNC account_is_found
    JMP account_not_found_error

account_is_found:

    ; Calculate interest
    CALL calculate_interest

    ; Display calculation result
    CALL display_result

    ; Update balance inside account.txt
    CALL update_account_file

    JNC update_is_successful
    JMP account_update_error

update_is_successful:

    MOV AH,09H
    LEA DX,msg_success
    INT 21H

    JMP exit_program

invalid_input_error:

    MOV AH,09H
    LEA DX,msg_invalid
    INT 21H

    JMP exit_program

account_file_error:

    MOV AH,09H
    LEA DX,msg_file_error
    INT 21H

    JMP exit_program

account_not_found_error:

    MOV AH,09H
    LEA DX,msg_not_found
    INT 21H

    JMP exit_program

account_update_error:

    MOV AH,09H
    LEA DX,msg_update_error
    INT 21H

    JMP exit_program

exit_program:

    MOV AX,4C00H
    INT 21H

MAIN ENDP

; =========================================================
; Validate the account number
; Account Number must contain exactly 4 digits
;
; Return:
; CF = 0: Valid
; CF = 1: Invalid
; =========================================================

validate_account_input PROC

    CMP BYTE PTR account_input+1,4
    JE validate_length_correct

    STC
    RET

validate_length_correct:

    LEA SI,account_input+2
    MOV CX,4

validate_digit_loop:

    MOV AL,[SI]

    CMP AL,'0'
    JAE validate_check_nine

    STC
    RET

validate_check_nine:

    CMP AL,'9'
    JBE validate_next_digit

    STC
    RET

validate_next_digit:

    INC SI
    LOOP validate_digit_loop

    CLC
    RET

validate_account_input ENDP

; =========================================================
; Open and read account.txt
;
; Return:
; CF = 0: File successfully loaded
; CF = 1: File error
; =========================================================

load_account_file PROC

    ; Open account.txt
    MOV AH,3DH
    MOV AL,0
    LEA DX,filename
    INT 21H

    JNC load_file_opened

    STC
    RET

load_file_opened:

    MOV file_handle,AX

    ; Read file
    MOV BX,file_handle
    MOV AH,3FH
    MOV CX,4096
    LEA DX,file_buffer
    INT 21H

    JNC load_file_read_success

    ; Close file if read failed
    MOV BX,file_handle
    MOV AH,3EH
    INT 21H

    STC
    RET

load_file_read_success:

    MOV file_size,AX

    LEA BX,file_buffer
    ADD BX,file_size
    MOV file_end,BX

    ; Close account.txt
    MOV BX,file_handle
    MOV AH,3EH
    INT 21H

    CLC
    RET

load_account_file ENDP

; =========================================================
; Find Account Number in the third field
;
; File format:
; CustomerID,Name,Account Number,Account Type,Balance
;
; Return:
; CF = 0: Account found
; CF = 1: Account not found
; =========================================================

find_account PROC

    LEA SI,file_buffer

find_record_start:

    CMP SI,file_end
    JB find_record_available

    STC
    RET

find_record_available:

    MOV AL,[SI]

    ; Skip carriage return
    CMP AL,13
    JNE find_check_lf

    INC SI
    JMP find_record_start

find_check_lf:

    ; Skip line feed
    CMP AL,10
    JNE find_check_comment

    INC SI
    JMP find_record_start

find_check_comment:

    ; Skip comment lines
    CMP AL,'#'
    JNE find_prepare_fields

    JMP find_skip_line

find_prepare_fields:

    ; Skip CustomerID and Name
    MOV BL,2

find_skip_field:

    CMP SI,file_end
    JB find_field_has_data

    STC
    RET

find_field_has_data:

    MOV AL,[SI]
    INC SI

    CMP AL,','
    JNE find_skip_field

    DEC BL
    JNZ find_skip_field

    ; SI now points to Account Number
    LEA DI,account_input+2
    MOV CX,4

find_compare_account:

    CMP SI,file_end
    JB find_compare_has_data

    STC
    RET

find_compare_has_data:

    MOV AL,[SI]

    CMP AL,[DI]
    JE find_digit_equal

    JMP find_skip_line

find_digit_equal:

    INC SI
    INC DI
    LOOP find_compare_account

    ; Account number must be followed by comma
    CMP BYTE PTR [SI],','
    JE find_account_match

    JMP find_skip_line

find_account_match:

    ; Skip comma after Account Number
    INC SI

    ; Find comma after Account Type
find_type_comma:

    CMP SI,file_end
    JB find_type_has_data

    STC
    RET

find_type_has_data:

    CMP BYTE PTR [SI],','
    JE find_balance_position

    INC SI
    JMP find_type_comma

find_balance_position:

    ; Skip comma before Current Balance
    INC SI

    MOV balance_start,SI
    MOV current_balance,0

find_read_balance:

    CMP SI,file_end
    JB find_balance_has_data

    JMP find_balance_complete

find_balance_has_data:

    MOV AL,[SI]

    CMP AL,13
    JE find_balance_complete

    CMP AL,10
    JE find_balance_complete

    ; Balance must contain numeric characters
    CMP AL,'0'
    JAE find_balance_check_nine

    STC
    RET

find_balance_check_nine:

    CMP AL,'9'
    JBE find_convert_balance

    STC
    RET

find_convert_balance:

    SUB AL,'0'
    XOR AH,AH

    MOV BX,AX

    ; Current Balance = Current Balance * 10
    MOV AX,current_balance
    MOV DX,10
    MUL DX

    ; Add current digit
    ADD AX,BX
    MOV current_balance,AX

    INC SI
    JMP find_read_balance

find_balance_complete:

    MOV balance_end,SI

    CLC
    RET

find_skip_line:

    CMP SI,file_end
    JB find_skip_has_data

    STC
    RET

find_skip_has_data:

    MOV AL,[SI]
    INC SI

    CMP AL,10
    JNE continue_skip_line

    JMP find_record_start

continue_skip_line:

    JMP find_skip_line

find_account ENDP

; =========================================================
; Calculate 5% interest
;
; Interest = Current Balance * 5 / 100
; New Balance = Current Balance + Interest
; =========================================================

calculate_interest PROC

    MOV AX,current_balance
    MOV BX,5
    MUL BX

    MOV BX,100
    DIV BX

    MOV interest_amount,AX

    MOV AX,current_balance
    ADD AX,interest_amount
    MOV new_balance,AX

    RET

calculate_interest ENDP

; =========================================================
; Display Current Balance, Interest and New Balance
; =========================================================

display_result PROC

    ; Current Balance
    MOV AH,09H
    LEA DX,msg_current
    INT 21H

    MOV AX,current_balance
    CALL display_number

    ; Interest Rate
    MOV AH,09H
    LEA DX,msg_rate
    INT 21H

    ; Interest Added
    MOV AH,09H
    LEA DX,msg_interest
    INT 21H

    MOV AX,interest_amount
    CALL display_number

    ; New Balance
    MOV AH,09H
    LEA DX,msg_new
    INT 21H

    MOV AX,new_balance
    CALL display_number

    RET

display_result ENDP

; =========================================================
; Update account.txt using temp.txt
;
; Return:
; CF = 0: Update successful
; CF = 1: Update failed
; =========================================================

update_account_file PROC

    ; Create temp.txt
    MOV AH,3CH
    MOV CX,0
    LEA DX,temp_filename
    INT 21H

    JNC update_temp_created

    STC
    RET

update_temp_created:

    MOV temp_handle,AX

    ; Calculate number of bytes before old balance
    MOV AX,balance_start
    LEA DX,file_buffer
    SUB AX,DX

    ; Write content before old balance
    MOV CX,AX
    MOV BX,temp_handle
    MOV AH,40H
    LEA DX,file_buffer
    INT 21H

    JNC update_prefix_written
    JMP update_write_failed

update_prefix_written:

    ; Convert New Balance into ASCII
    MOV AX,new_balance
    CALL number_to_ascii

    ; Write New Balance
    MOV BX,temp_handle
    MOV AH,40H
    MOV CX,number_length
    MOV DX,number_pointer
    INT 21H

    JNC update_balance_written
    JMP update_write_failed

update_balance_written:

    ; Calculate number of bytes after old balance
    MOV AX,file_end
    SUB AX,balance_end
    MOV CX,AX

    ; Write the remaining content
    MOV BX,temp_handle
    MOV AH,40H
    MOV DX,balance_end
    INT 21H

    JNC update_suffix_written
    JMP update_write_failed

update_suffix_written:

    ; Close temp.txt
    MOV BX,temp_handle
    MOV AH,3EH
    INT 21H

    ; Delete original account.txt
    MOV AH,41H
    LEA DX,filename
    INT 21H

    JNC update_original_deleted

    STC
    RET

update_original_deleted:

    ; Rename temp.txt to account.txt
    PUSH DS
    POP ES

    MOV AH,56H
    LEA DX,temp_filename
    LEA DI,filename
    INT 21H

    JNC update_rename_success

    STC
    RET

update_rename_success:

    CLC
    RET

update_write_failed:

    MOV BX,temp_handle
    MOV AH,3EH
    INT 21H

    STC
    RET

update_account_file ENDP

; =========================================================
; Convert unsigned number in AX into ASCII
;
; Return:
; number_pointer = address of first digit
; number_length  = total number of digits
; =========================================================

number_to_ascii PROC

    PUSH BX
    PUSH CX
    PUSH DX
    PUSH DI

    LEA DI,number_buffer+6
    XOR CX,CX
    MOV BX,10

    CMP AX,0
    JNE ascii_convert_loop

    DEC DI
    MOV BYTE PTR [DI],'0'
    MOV CX,1
    JMP ascii_conversion_done

ascii_convert_loop:

    XOR DX,DX
    DIV BX

    ADD DL,'0'
    DEC DI
    MOV [DI],DL

    INC CX

    CMP AX,0
    JNE ascii_convert_loop

ascii_conversion_done:

    MOV number_pointer,DI
    MOV number_length,CX

    POP DI
    POP DX
    POP CX
    POP BX

    RET

number_to_ascii ENDP

; =========================================================
; Display unsigned number stored in AX
; =========================================================

display_number PROC

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV BX,10
    XOR CX,CX

    CMP AX,0
    JNE display_convert_loop

    MOV DL,'0'
    MOV AH,02H
    INT 21H

    JMP display_number_done

display_convert_loop:

    XOR DX,DX
    DIV BX

    PUSH DX
    INC CX

    CMP AX,0
    JNE display_convert_loop

display_print_loop:

    POP DX
    ADD DL,'0'

    MOV AH,02H
    INT 21H

    LOOP display_print_loop

display_number_done:

    POP DX
    POP CX
    POP BX
    POP AX

    RET

display_number ENDP

END MAIN