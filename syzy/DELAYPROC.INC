;��ʱ1����λʱ����ӳ���
DELAY   PROC
        PUSH AX
        PUSH CX
D0:     MOV  CX, 200H
D1:     MOV  AX, 0FFFFH
D2:     DEC  AX 
        JNZ  D2
        LOOP D1
        POP  CX
        POP  AX     
        RET                                
DELAY   ENDP                               

;��ʱN����λʱ����ӳ��� (��ڣ�DL=N)
DELAY_N  PROC
DN:      CALL DELAY   ;�ӳ�1��ʱ�䵥λ
         DEC  DL      ;ʱ�䵥λ������1 
         JNZ  DN      ;����Ϊ0�������ӳ� 
         RET          ;������������������� 
DELAY_N  ENDP  