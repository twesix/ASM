DATA    SEGMENT

DELAYT  EQU 0FFFFH

;8255并行输入输出接口
CON8255 EQU 0646H
PA8255  EQU 0640H
PB8255  EQU 0642H
PC8255  EQU 0644H
CONWD8255   EQU 00001001B

;ADC0809
CONADC  EQU 0600H
;向这个地址写数据选择某个口启动转换，
;转换完成之后从这个口读取数据

;DAC0832
CONDAC  EQU 0600H
;使用时直接往这个口输出数字量即可

;8253/8254定时计数器
CON8254 EQU 0606H
CH08254 EQU 0600H
CH18254 EQU 0602H
CH28254 EQU 0604H

;数码管
LEDTAB:DB  3FH	;0的段码
       DB  06H	;1
       DB  5BH	;2
       DB  4FH	;3
       DB  66H	;4
       DB  6DH	;5
       DB  7DH	;6
       DB  07H	;7
       DB  7FH	;8
       DB  6FH	;9
       DB  77H	;A
       DB  7CH  ;B
       DB  39H	;C
       DB  5EH	;D
       DB  79H	;E
       DB  71H	;F
       
LEDDAT: DB   3FH;
        DB   3FH;
        DB   3FH;
        DB   3FH;
        DB   3FH;
        DB   3FH;

DATA    ENDS

CODE    SEGMENT

    ASSUME CS:CODE,DS:DATA
    
START:
    MOV AX,DATA
    MOV DS,AX
    
    
    MOV AH,4CH
    INT 21H
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;8255并行接口
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INIT_8255   PROC NEAR
    
    MOV AL,CONWD8255 ;8255并行输入输出接口初始化控制字
    MOV DX,CON8255
    OUT DX,AL
    RET
    
INIT_8255   ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;A口输出
OUTA    PROC
    PUSH    DX
    MOV DX,PA8255
    OUT DX,AL
    POP DX
    RET
OUTA    ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;B口输出
OUTB    PROC
    PUSH    DX
    MOV DX,PB8255
    OUT DX,AL
    POP DX
    RET
OUTB    ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;C口输出
OUTC    PROC
    PUSH    DX
    MOV DX,PC8255
    OUT DX,AL
    POP DX
    RET
OUTC    ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;C口输入
INPC    PROC
    PUSH    DX
    MOV DX,PC8255
    IN  DX,AL
    POP DX
    RET
OUTC    ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;延时函数
DELAY   PROC
    PUSH    CX
    MOV CX,DELAYT
    LOOP    $
    POP CX
DELAY   ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LED显示函数
LED1    PROC


END     START