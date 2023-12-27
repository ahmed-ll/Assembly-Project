.MODEL SMALL 

.DATA 

Name_Section DB ,0AH ," Name    : Ahmed Ezzat Sayed Ahmed Farag",0AH
                  DB  " Section : 4",0AH ,'$'

List DB ,0AH ,"<< << << << Hobbies >> >> >> >>",0AH,0AH
          DB  "     Choose One form Hobbies :-     ",0AH,0AH
          
          DB " Press 'R' For Reading Books  ",0AH
          DB " Press 'Q' For Reading Quran  ",0AH
          DB " Press 'L' For Learn Language ",0AH
          DB " Press 'P' For Playing Online ",0AH
          DB " Press 'F' For Football       ",0AH
          DB " Press 'M' For Movies         ",0AH
          DB " Press 'C' For Chess          ",0AH
          DB " Press 'K' For Cooking        ",0AH,0AH
          
          DB "-------------------------------",0AH
          DB "-------------------------------",0AH,0AH

          DB "Enter Your CHOICE" ,0AH,'$'     
          
          ;______________________________________
       
          Invalid  DB ,0DH,0AH,"Invalid Character , Try Again.." ,0AH,'$' 
          Continue DB ,0DH,0AH,"DO YOU WANT TO CONTINUE?" ,0AH,'$' 
          Close    DB ,0DH,0AH,"Thank you and GOOD BYE."     ,0AH,'$'  
          
          ;______________________________________
          
          read  DB ,0DH,0AH,"We Recommend to you Website : Rashf"    ,0AH,'$'
          quran DB ,0DH,0AH,"We Recommend to you Website : Quran"    ,0AH,'$'
          learn DB ,0DH,0AH,"We Recommend to you Website : Duolingo" ,0AH,'$' 
          ball  DB ,0DH,0AH,"We Recommend to you Website : Fotmap"   ,0AH,'$'
          movie DB ,0DH,0AH,"We Recommend to you Website : Egybest"  ,0AH,'$'
          chess DB ,0DH,0AH,"We Recommend to you Website : Flyordie" ,0AH,'$'
          play  DB ,0DH,0AH,"We Recommend to you Website : Poki"     ,0AH,'$'
          cook  DB ,0DH,0AH,"We Recommend to you Website : Lazezh"   ,0AH,'$'
.386
.CODE 
;______________________________________

MAIN PROC FAR
     .STARTUP

Entry_Point:

     CALL Student
     
     CALL Display_List

     CALL Compare_Chars

     CALL Try_Again

        .EXIT
MAIN ENDP

;______________________________________

Student PROC NEAR

MOV AH,09H
lea DX, Name_Section
INT 21H
RET 
Student ENDP

;______________________________________

Display_List PROC NEAR
MOV AH,09H
lea DX, List
INT 21H
RET 
Display_List ENDP

;______________________________________

Compare_Chars PROC NEAR

MOV AH,01H
INT 21H

A:
cmp al , 'R'
JE R
cmp al , 'Q'
JE Q
cmp al , 'P'
JE P
cmp al , 'L'
JE L
cmp al , 'F'
JE F
cmp al , 'C'
JE C
cmp al , 'K'
JE K
cmp al , 'M'
JE M
Loop A
JNE invalid

Q:
CMP al,'Q'
MOV AH,09H
lea DX, quran
INT 21H
CALL Try_Again

R:
CMP al,'R'
MOV AH,09H
lea DX, read
INT 21H
CALL Try_Again

F:
CMP al,'F'
MOV AH,09H
lea DX, ball
INT 21H
CALL Try_Again

L:
CMP al,'L'
MOV AH,09H
lea DX, learn
INT 21H
CALL Try_Again

M:
CMP al,'M'
MOV AH,09H
lea DX, movie
INT 21H
CALL Try_Again

P:
CMP al,'P'
MOV AH,09H
lea DX, play
INT 21H
CALL Try_Again

K:
CMP al,'K'
MOV AH,09H
lea DX, cook
INT 21H
CALL Try_Again

C:
CMP al,'C'
MOV AH,09H
lea DX, chess
INT 21H
CALL Try_Again

RET 
Compare_Chars ENDP

;______________________________________

invalid PROC NEAR

MOV AH,09H
lea DX, Invalid
INT 21H
CALL Try_Again
RET
invalid ENDP

;______________________________________

Try_Again PROC NEAR
MOV AH,09H
lea DX,Continue
INT 21H

MOV AH,01H
INT 21H

cmp al , 'Y'
JE Entry_Point
cmp al , 'N'
JE close
JNE invalid
RET
Try_Again ENDP

;______________________________________

close PROC NEAR

    MOV AH,09H
    lea DX, Close
    INT 21H
    JMP EX
close ENDP

;______________________________________

EX:
END MAIN