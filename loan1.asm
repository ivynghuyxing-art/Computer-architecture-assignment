TITLE ASSIGNMENT BANK INTEREST

.MODEL SMALL
.STACK 64  
.DATA 

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


;==============================================================
.CODE

MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    
;====== Display layout=====

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
	JE EXIT
	CMP AL, "y"
	JE EXIT
	
	CMP AL, "N"
	JE Continue

ERROR1:MOV AH, 09H
	LEA DX, ErrorMsg1
	INT 21H
	JMP loanloop

ERROR2:MOV AH, 09H
	LEA DX, ErrorMsg2
	INT 21H
	JMP Yearloop

Continue:
	JMP loanloop

EXIT:	MOV AX, 4C00H
	INT 21H

	MAIN ENDP
END MAIN