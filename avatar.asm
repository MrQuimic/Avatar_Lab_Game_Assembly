;------------------------------------------------------------------------
;	Base para TRABALHO PRATICO - TECNOLOGIAS e ARQUITECTURAS de COMPUTADORES
;
;	ANO LECTIVO 2020/2021
;--------------------------------------------------------------
; Demostração da navegação do Ecran com um avatar
;
;		arrow keys to move
;		press ESC to exit
;
;--------------------------------------------------------------

.8086
.model small
.stack 2048

dseg	segment para public 'data'


		STR12	 		DB 		"            "	; String para 12 digitos
		DDMMAAAA 		db		"                     "         
		MSG_MAZE1		DB "                                                                               ", 0AH, 0DH
                        DB "                                                                               ", 0AH, 0DH
                        DB " ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±", 0AH, 0DH
 						DB " ±±                                          S±±J               ±±B         T±±", 0AH, 0DH
						DB " ±±     ±±   ±±      ±±±±±±±±±±±±±±±±±±±±  ±±±±±±±±  ±±±±±±  ±±±±±±      ±±±±±±", 0AH, 0DH
 						DB " ±±     ±±  J±±      ±±              X ±±     A      ±±Y                     ±±", 0AH, 0DH
						DB " ±±     ±±±±±±±      ±±                ±±  ±±±±±±±±  ±±±±±±±±±±±±±±±±±±±±±±  ±±", 0AH, 0DH
						DB " ±±         A±±    U ±±  N                           K±±                 ±± B±±", 0AH, 0DH
						DB " ±±    C     ±±      ±±      ±±±±±±±±±±±±±±±±    ±±±±±±±±±±  ±±±±±±±     ±±±±±±", 0AH, 0DH
						DB " ±±  ±±±±±±  ±±    V ±±          ±±I  S  ±±                  ±±             E±±", 0AH, 0DH
 						DB " ±±  ±±      ±±      ±±          ±±      ±±        U        W ±±  ±±I       Q±±", 0AH, 0DH
						DB " ±±Z ±±      ±±±±±±±±±±          ±±     E±±  ±±              ±±           ±±±±±", 0AH, 0DH
						DB " ±±  ±±      I   ±±              ±±A     ±±N ±±                              ±±", 0AH, 0DH
						DB " ±±  ±±         ±±          ±±±±±±±±±±  ±±±±±±±±±     P     ±±±±    ±±±±±    ±±", 0AH, 0DH
						DB " ±±  ±±                ±±   T        ±±                       ±±R       ±±   ±±", 0AH, 0DH
						DB " ±±  ±±±±±±±±±±±±      ±±            ±±     L      ±±±±±±±±±±±±±±±±±±        ±±", 0AH, 0DH
						DB " ±±     S      O±±     ±±            ±±            ±±          G             ±±", 0AH, 0DH
						DB " ±±          ±±±±±±±   ±±  ±±±±±±±±  ±±±±±±±±±±         V     ±±         ±±  ±±", 0AH, 0DH
 						DB " ±±H        D±±M           ±±C       ±±L         B    E         ±±       ±±F ±±", 0AH, 0DH
 						DB " ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±$"     

		MSG_MAZE2       DB "                                                                               ", 0AH, 0DH
                        DB "                                                                               ", 0AH, 0DH
                        DB " ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±", 0AH, 0DH
 						DB " ±±     X±±      ±±E                         S±±J            ±±   B         T±±", 0AH, 0DH
						DB " ±±  ±±  ±±  ±±  ±±  ±±±±±±±±±±±±±±±±±±±±  ±±±±±±±±  ±±±±±±  ±±±±±±±±±±  ±±±±±±", 0AH, 0DH
 						DB " ±±  ±±      ±±  ±±  ±±            ±±N ±±        ±±  ±±Y       Z             ±±", 0AH, 0DH
						DB " ±±  ±±±±±±±±±±  ±±      ±±±±±±±±±±±±  ±±  ±±±±±±±±  ±±±±±±±±±±±±±±±±±±±±±   ±±", 0AH, 0DH
						DB " ±±         A±±  ±±U ±±                              ±±K                     ±±", 0AH, 0DH
						DB " ±±              ±±  ±±          M           N       ±±           D    K     ±±", 0AH, 0DH
						DB " ±±      ±±      ±±V ±±                  ±±          ±±      ±±             E±±", 0AH, 0DH
 						DB " ±±  ±±±±±±  ±±           R   ±±  ±±      ±±      ±±      ±±W ±±  ±±I       Q±±", 0AH, 0DH
						DB " ±±  ±±Z ±±  ±±±±±±±±±±±±±±±±±±  ±±  ±±  ±±  ±±        ±±±±  ±±  ±±±±±±±  ±±±±±", 0AH, 0DH
						DB " ±±  ±±  ±±  I                   ±±A ±±  ±±N ±±                  ±±          ±±", 0AH, 0DH
						DB " ±±  ±±  ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±  ±±±±±±±±±±±±±±±±±±  ±±±±±±  ±±±±±±  ±±", 0AH, 0DH
						DB " ±±  ±±S         L         ±±       E    ±±                    ±±R       ±±  ±±", 0AH, 0DH
						DB " ±±      ±±±±±±±±±±±±  ±±±±±±±±±±±±      ±±  ±±      ±±±±±±±±±±±±±±±±±±  ±±  ±±", 0AH, 0DH
						DB " ±±           O±±      ±±       C            ±±           ±±        G±±  ±±  ±±", 0AH, 0DH
						DB " ±±±±±±±  ±±±±±±±±±±   ±±  ±±±±±±±±  ±±±±±±±±±±   W       ±±  ±±  ±±±±±  ±±  ±±", 0AH, 0DH
 						DB " ±±S        D±±M                     ±±L              Y       ±±         ±±F ±±", 0AH, 0DH
 						DB " ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±$"


 		Top10title      DB " ____________________________________________________________________________", 0AH, 0DH
                        DB "                                                                             ", 0AH, 0DH
                        DB "       __________                                                            ", 0AH, 0DH
                        DB "     (____    ____)   _____        ______           ____      ___            ", 0AH, 0DH
                        DB "          |  |      /  ___  \     |   __  \       /     |   /  _  \          ", 0AH, 0DH
                        DB "          |  |     |  |   |  |    |  |__|  |     |__/|  |  |  | |  |         ", 0AH, 0DH 
                        DB "          |  |     |  |   |  |    |   ___ /          |  |  |  | |  |         ", 0AH, 0DH  
                        DB "          |  |     |  |___|  |    |  |               |  |  |  |_|  |         ", 0AH, 0DH  
                        DB "          |__|      \ _____ /     |__|               |__|   \ ___ /          ", 0AH, 0DH 
                        DB "                                                                             ", 0AH, 0DH
                        DB "                                                                             ", 0AH, 0DH
                        DB " _____________________________________________________________________________$"    


		Horas			dw		0				; Vai guardar a HORA actual
		Minutos			dw		0				; Vai guardar os minutos actuais
		Segundos		dw		0				; Vai guardar os segundos actuais
		Old_seg			dw		0				; Guarda os ultimos segundos que foram lidos
		Tempo_init		dw		0				; Guarda O Tempo de inicio do jogo
		Tempo_j			dw		0				; Guarda O Tempo que decorre o  jogo
        TopScore        db      " 0$ "          ; Top score ao contrário - que conta o tempo decorrido depois quem tiver menos é o top score no fim do jogo ciclo para transformar em decimal e exportar
		Tempo_limite	dw		60				; tempo maximo de Jogo
		Tempo_limite1	dw		60   			; tempo maximo de Jogo
		Tempo_limite2	dw		100   			; tempo maximo de Jogo
		Tempo_limite3	dw		70   			; tempo maximo de Jogo
		Tempo_limite4	dw		100   			; tempo maximo de Jogo
	    Tempo_limite5	dw		70   			; tempo maximo de Jogo
	    Nivel1          db      "Nivel 1 - The begin $"
	    Nivel2          db      "Nivel 2 - Runner $"
	    Nivel3          db      "Nivel 3 - Run faster $"
	    Nivel4          db      "Nivel 4 - Rampage $"
	    Nivel5          db      "Nivel 5- Final $"

                        
		String_TJ		db		" /100$"

		String_num 		db 		"  0 $ "
        String_nome  	db	    "ISEC$ "
		String_nomeaux  db	    "ISEC$ "
		Construir_nome	db	    "    $ "; vazia para funcionar - colocar espa‡os da palavra para alocar tamanho
		Str_nomtlt  	db	    "Palavra:$ "
        Cons_nomtlt  	db	    " $ "
		count_car	 	db		0
        INSTR1          DB      20 DUP("$")
		dim_nome		dw		4	; Comprimento do Nome
		;indice_nome	dw		0	; indice que aponta para Contruir_nome

		Fim_Nivel		db	    " Bem jogado! $"
        Fim_Ganhou  	db	    " PARABENS ganhou o jogo! $"
        Credits         db       "         _____   AVATAR LAB     _  _  _         ", 0AH, 0DH
                        db       "        /  __ \                | |(_)| |        ", 0AH, 0DH
                        db       "        | /  \/ _ __   ___   __| | _ | |_  ___  ", 0AH, 0DH
                        db       "        | |    | '__| / _ \ / _` || || __|/ __| ", 0AH, 0DH
                        db       "        | \__/\| |   |  __/| (_| || || |_ \__ \ ", 0AH, 0DH
                        db       "         \____/|_|    \___| \__,_||_| \__||___/ $"

        Credits1        db      " Jogo com 5 niveis de dificuldade e com o objectivo de encontrar a palavra pedida.$"
        Credits2        db      " Para jogar:", 0AH, 0DH
                        db      " - Teclas direccionais para jogar", 0AH, 0DH
                        db      " - Tecla n passa de nivel de forma a testar o jogo mais rapidamente", 0AH, 0DH
                        db      " - Tecla s ou esc permite sair do jogo", 0AH, 0DH
                        db      " - Tecla p para pausar o tempo$"
        Credits3        db      " Trabalho realizado em contexto academico para a disciplina de TAC$"
        Credits4        db      " Realizado por Carlos Santos e Diogo Coelho$"

        Fim_Perdeu2     db      "Perdeu, mas tente de novo... Acredito em si!$"

 		Fim_Perdeu3		db	    "      (         (    (                  ", 0AH, 0DH
                        db      "      )\ )      )\ ) )\ )               ", 0AH, 0DH
                        db      "     (()/( (   (()/((()/(   (       (   ", 0AH, 0DH
                        db      "      /(_)))\   /(_))/(_))  )\      )\  ", 0AH, 0DH
                        db      "     (_)) ((_) (_)) (_))_  ((_)  _ ((_) ", 0AH, 0DH
                        db      "     | _ \| __|| _ \ |   \ | __|| | | | ", 0AH, 0DH
                        db      "     |  _/| _| |   / | |) || _| | |_| | ", 0AH, 0DH
                        db      "     |_|  |___||_|_\ |___/ |___| \___/ $"

        Logo            db      "   __   _  _   __   ____   __   ____        __     __   ____   ", 0AH, 0DH
                        db      "  / _\ / )( \ / _\ (_  _) / _\ (  _ \      (  )   / _\ (  _ \  ", 0AH, 0DH
                        db      " /    \\ \/ //    \  )(  /    \ )   /      / (_/\/    \ ) _ (  ", 0AH, 0DH
                        db      " \_/\_/ \__/ \_/\_/ (__) \_/\_/(__\_)      \____/\_/\_/(____/ $ "

        carregetecla    db      "Carregue em qualquer tecla para continuar$"

		Proximo_Nivel	db		"Boa vamos para o proximo nivel! $"
		Nivel_Desejado  db		"Entre no nivel em que deseja começar:  $"
		Counter         dw 		02H    
		C1              dw 		0H   
        Dificuldade     dw 		02H   
		Direcao		    db 		0H  
		MSG_INSTRUCTION db 		"Bem Vindo !!! $"
		menu1 			db 		"Acesso ao menu:$"
		menu2 			db 		"1 Jogar:$"
		menu3 			db 		"2 Top 10:$"
		menu4 			db 		"3 Info / Credits$"
		menu5 			db 		"0 Sair$"

        Erro_Open       db      'Erro ao tentar abrir o ficheiro$'
        Erro_Ler_Msg    db      'Erro ao tentar ler do ficheiro$'
        Erro_Close      db      'Erro ao tentar fechar o ficheiro$'
        Fich         	db      'labi.TXT$',0
        Fichtop10       db      'Top10.TXT$',0
        HandleFich      dw      0
        car_fich        db      ?

		player			db 		10 dup(' ') ; Nomes de Jogador
		player_msg 		db 		'Insire o nome de jogador para o Top10:','$'
		Max_letters 	db 		'(Limite -> 10 letras)','$'


		string			db	    "Teste prático de T.I$",0
		Car				db	    32	; Guarda um caracter do Ecran
		Cor				db	    7	; Guarda os atributos de cor do caracter
		Level			db	    1   ;nivel do jogo
        maxx            db      78	; POSx pode ir [1..78]
        maxy            db      18  ; POSx pode ir [1..18]
		POSx			db	    25	; POSx pode ir [1..78]
		POSy			db	    5  ; a linha pode ir de [1 .. 25]
		POSxa			db	    25	; posicao anterior de x
		POSya			db	    5  ; posicao anterior de y

	    ultimo_num_al   dw      0
	    str_num         db      5 dup(?),'$'
        
        fname	        db		'futuret.txt',0
		fhandle			dw		0
		buffer			db		'                                               ',13,10
						db 		'_______________________________________________',13,10
						db		'_______________________________________________',13,10
						db 		'_______________________________________________',13,10
						db		'_______________________________________________',13,10
						db		'_______________________________________________',13,10
		msgErrorCreate	db		"Ocorreu um erro na criacao do ficheiro!$"
		msgErrorWrite	db		"Ocorreu um erro na escrita para ficheiro!$"
		msgErrorClose	db		"Ocorreu um erro no fecho do ficheiro!$"
		
dseg	ends

cseg	segment para public 'code'
assume		cs:cseg, ds:dseg


;########################################################################
goto_xy	macro		POSx,POSy
			mov		ah,02h
			mov		bh,0		; numero da página
			mov		dl,POSx
			mov		dh,POSy
			int		10h
		
endm

;########################################################################
; MOSTRA - Faz o display de uma string terminada em $


MOSTRA MACRO STR
			mov	    AH,09H
			LEA	    DX,STR
			int	    21H
ENDM

IMP_FICH2	PROC
			;abre ficheiro
			mov     ah,3dh
			mov     al,0
			;lea     dx,Fich
			lea  	dx,Fichtop10
			int     21h
			jc      erro_abrir
			mov     HandleFich,ax
			jmp     ler_ciclo		;abre ficheiro


	Nextstep:        
			int     21h
			jc      erro_abrir
			mov     HandleFich,ax
			jmp     ler_ciclo

	erro_abrir:
			mov     ah,09h
			lea     dx,Erro_Open
			int     21h
			jmp     sai_f

	ler_ciclo:
			mov     ah,3fh
			mov     bx,HandleFich
			mov     cx,1
			lea     dx,car_fich
			int     21h
			jc		erro_ler
			cmp		ax,0		;EOF?
			je		fecha_ficheiro
			mov     ah,02h
			mov		dl,car_fich
			int		21h
			jmp		ler_ciclo

	erro_ler:
			mov     ah,09h
			lea     dx,Erro_Ler_Msg
			
			int     21h
			jmp 	sai_f
			
	fecha_ficheiro:
			mov     ah,3eh
			mov     bx,HandleFich
			int     21h
			jnc     sai_f

			mov     ah,09h
			lea     dx,Erro_Close
			int     21h
	sai_f:
			ret

IMP_FICH2   ENDP
; FIM DAS MACROS

;ROTINA PARA APAGAR ECRAN
apaga_ecran	proc
			mov		ax,0B800h
			mov		es,ax
			xor		bx,bx
			mov		cx,25*80

	apaga:		
			mov		byte ptr es:[bx],' '
			mov		byte ptr es:[bx+1],7
			inc		bx
			inc 	bx
			loop	apaga
			ret
apaga_ecran	endp

;---------------------------------------------------Start change for TP---------------------------------------------------Time ADD
;********************************************************************************
;********************************************************************************
; HORAS  - LE Hora DO SISTEMA E COLOCA em tres variaveis (Horas, Minutos, Segundos)
; CH - Horas, CL - Minutos, DH - Segundos
;********************************************************************************
Ler_TEMPO PROC

			PUSH 	AX
			PUSH 	BX
			PUSH 	CX
			PUSH 	DX

			PUSHF

			mov 	AH, 2CH             ; Buscar a hORAS
			int 	21H

			xor 	AX,AX
			mov 	AL, DH              ; segundos para al
			mov 	Segundos, AX		; guarda segundos na variavel correspondente

			xor 	AX,AX
			mov 	AL, CL              ; Minutos para alF
			mov 	Minutos, AX         ; guarda MINUTOS na variavel correspondente

			xor 	AX,AX
			mov 	AL, CH              ; Horas para al
			mov 	Horas,AX			; guarda HORAS na variavel correspondente

			POPF
			POP 	DX
			POP 	CX
			POP 	BX
			POP 	AX
			ret
			
Ler_TEMPO   ENDP

;********************************************************************************
;********************************************************************************
;-------------------------------------------------------------------
; HOje - LE DATA DO SISTEMA E COLOCA NUMA STRING NA FORMA DD/MM/AAAA
; CX - ANO, DH - MES, DL - DIA
;-------------------------------------------------------------------
HOje PROC 

			PUSH 	AX
			PUSH 	BX
			PUSH 	CX
			PUSH 	DX
			PUSH 	SI
			PUSHF

			mov 	AH, 2AH             ; Buscar a data
			int 	21H
			PUSH 	CX                 ; Ano-> PILHA
			xor 	CX,CX              	; limpa CX
			mov 	CL, DH              ; Mes para CL
			PUSH 	CX                 ; Mes-> PILHA
			mov 	CL, DL				; Dia para CL
			PUSH 	CX                 ; Dia -> PILHA
			xor 	DH,DH
			xor		SI,SI
	; DIA ------------------
	; DX=DX/AX --- RESTO DX
			xor 	DX,DX               ; Limpa DX
			POP 	AX                  ; Tira dia da pilha
			mov 	CX, 0               ; CX = 0
			mov 	BX, 10              ; Divisor
			mov		CX,2
	DD_DIV:
			DIV 	BX                  ; Divide por 10
			PUSH 	DX                 ; Resto para pilha
			mov 	DX, 0               ; Limpa resto
			loop 	dd_div
			mov		CX,2
	DD_RESTO: 
			POP 	DX                  ; Resto da divisao
			ADD 	DL, 30h             ; ADD 30h (2) to DL
			mov 	DDMMAAAA[SI],DL
			INC		SI
			LOOP 	DD_RESTO
			mov 	DL, '/'             ; Separador
			mov 	DDMMAAAA[SI],DL
			INC 	SI
			
	; MES -------------------
	; DX=DX/AX --- RESTO DX

			mov 	DX, 0               ; Limpar DX
			POP 	AX                  ; Tira mes da pilha
			xor 	CX,CX
			mov 	BX, 10				; Divisor
			mov 	CX,2
	MM_DIV:
			DIV 	BX                  ; Divisao or 10
			PUSH 	DX                 ; Resto para pilha
			mov 	DX, 0               ; Limpa resto
			LOOP 	MM_DIV
			mov 	CX,2
	MM_RESTO:
			POP 	DX                  ; Resto
			ADD 	DL, 30h             ; SOMA 30h
			mov 	DDMMAAAA[SI],DL
			INC 	SI
			LOOP 	MM_RESTO

			mov 	DL, '/'             ; Character to display goes in DL
			mov 	DDMMAAAA[SI],DL
			INC 	SI

	;  ANO ----------------------
			mov 	DX, 0
			POP 	AX                  ; mes para AX
			mov 	CX, 0               ;
			mov 	BX, 10              ;
	 AA_DIV: 
			DIV 	BX
			PUSH 	DX                 ; Guarda resto
			ADD 	CX, 1               ; Soma 1 contador
			mov 	DX, 0               ; Limpa resto
			cmp 	AX, 0               ; Compara quotient com zero
			jne 	AA_DIV              ; Se nao zero
	AA_RESTO: 
			POP 	DX
			ADD 	DL, 30h             ; ADD 30h (2) to DL
			mov 	DDMMAAAA[SI],DL
			INC 	SI
			LOOP 	AA_RESTO
			POPF
			POP 	SI
			POP 	DX
			POP		CX
			POP 	BX
			POP 	AX
			ret
HOje   ENDP

;---------------------------------------------------End change for TP---------------------------------------------------Time add
Copia_ECRAN	PROC

		
			mov		ah, 3ch				; Abrir o ficheiro para escrita
			mov		cx, 00H				; Define o tipo de ficheiro ??
			lea		dx, fname			; DX aponta para o nome do ficheiro 
			int		21h					; Abre efectivamente o ficheiro (AX fica com o Handle do ficheiro)
			jnc		escreve				; Se não existir erro escreve no ficheiro
		
			mov		ah, 09h
			lea		dx, msgErrorCreate
			int		21h
		
			jmp		fim

	escreve:
			mov		bx, ax				; Coloca em BX o Handle
			mov		ah, 40h				; indica que é para escrever

			;mov		dl,0
			;mov		dh,0
		
			lea		dx, buffer			; DX aponta para a infromação a escrever
			mov		cx, 3000				; CX fica com o numero de bytes a escrever
			int		21h		

			; Chama a rotina de escrita
			jnc		close				; Se nao existir erro na escrita fecha o ficheiro
			;lea		dx, buffer	
			
			mov		ah, 09h
			lea		dx, msgErrorWrite
			int		21h
			
	close:
			mov		ah,3eh				; fecha o ficheiro
			int		21h
			jnc		fim
		
			mov		ah, 09h
			lea		dx, msgErrorClose
			int		21h
			fim:
Copia_ECRAN endp
	;########################################################################
	; IMP_FICH

IMP_FICH	PROC
			;abre ficheiro
			mov     ah,3dh
			mov     al,0
			lea     dx,Fich
			int     21h
			jc      erro_abrir
			mov     HandleFich,ax
			jmp     ler_ciclo

	erro_abrir:
			mov     ah,09h
			lea     dx,Erro_Open
			int     21h
			jmp     sai_f

	ler_ciclo:
			mov     ah,3fh
			mov     bx,HandleFich
			mov     cx,1
			lea     dx,car_fich
			int     21h
			jc		erro_ler
			cmp		ax,0		;EOF?
			je		fecha_ficheiro
			mov     ah,02h
			mov		dl,car_fich
			int		21h
			jmp		ler_ciclo

	erro_ler:
			mov     ah,09h
			lea     dx,Erro_Ler_Msg
			int     21h

	fecha_ficheiro:
			mov     ah,3eh
			mov     bx,HandleFich
			int     21h
			jnc     sai_f

			mov     ah,09h
			lea     dx,Erro_Close
			int     21h
	sai_f:
			ret

IMP_FICH	endp


;********************************************************************************
;********************************************************************************
; LEITURA DE UMA TECLA DO TECLADO
; LE UMA TECLA	E DEVOLVE VALOR EM AH E AL
; SE ah=0 É UMA TECLA NORMAL
; SE ah=1 É UMA TECLA EXTENDIDA
; AL DEVOLVE O CÓDIGO DA TECLA PREMIDA
LE_TECLA	PROC
	sem_tecla:
	;---------------------------------------------------Start change for TP---------------------------------------------------start - Time - To continue without pressing the keyboard
			GOTO_XY	50,0	
			MOSTRA	String_TJ
			call	 Trata_Horas
			mov		AH,0BH
			int 	21h
			cmp		AL,0
			je		sem_tecla 
	;---------------------------------------------------End change for TP---------------------------------------------------end
			mov		AH,08H
			int		21H
			mov		AH,0
			cmp		AL,0
			jne		SAI_TECLA
			mov		AH, 08H
			int		21H
			mov		AH,1
	SAI_TECLA:
			ret
LE_TECLA	ENDP
;********************************************************************************

LE_TECLA2	PROC
	sem_tecla:
	;---------------------------------------------------Start change for TP---------------------------------------------------start - Time - To continue without pressing the keyboard
			GOTO_XY	50,0
			;MOSTRA	String_TJ
			;call	 Trata_Horas
			mov	ah, 02h
			;mov ch, 32
			mov ch, 32
			mov ah, 1
			int 10h
			
			mov		AH,08H
			int		21H
			mov		AH,0
			cmp		AL,0
			jne		SAI_TECLA
			mov		AH, 08H
			int		21H
			mov		AH,1
	SAI_TECLA:
			ret
LE_TECLA2	ENDP

;********************************************************************************

;---------------------------------------------------Start change for TP---------------------------------------------------start - Time - To continue without pressing the keyboard

;********************************************************************************
; Imprime o tempo e a data no monitor

Trata_Horas PROC

			PUSHF
			PUSH AX
			PUSH BX
			PUSH CX
			PUSH DX

			call 	Ler_TEMPO				; Horas MINUTOS e segundos do Sistema

			mov		AX, Segundos
			cmp		AX, Old_seg			; VErifica se os segundos mudaram desde a ultima leitura
			je		fim_horas			; Se a hora não mudou desde a última leitura sai.
			mov		Old_seg, AX			; Se segundos são diferentes actualiza informação do tempo

			mov 	ax,Horas
			mov		bl, 10
			div 	bl
			add 	al, 30h				; Caracter Correspondente às dezenas
			add		ah,	30h				; Caracter Correspondente às unidades
			mov 	STR12[0],al			;
			mov 	STR12[1],ah
			mov 	STR12[2],'h'
			mov 	STR12[3],'$'
			GOTO_XY 2,0
			MOSTRA STR12

			mov 	ax,Minutos
			mov 	bl, 10
			div 	bl
			add 	al, 30h				; Caracter Correspondente às dezenas
			add		ah,	30h				; Caracter Correspondente às unidades
			mov 	STR12[0],al			;
			mov 	STR12[1],ah
			mov 	STR12[2],'m'
			mov 	STR12[3],'$'
			GOTO_XY	6,0
			MOSTRA	STR12


			mov 	ax,Segundos
			mov 	bl, 10
			div 	bl
			add 	al, 30h				; Caracter Correspondente às dezenas
			add		ah,	30h				; Caracter Correspondente às unidades
			mov 	STR12[0],al			;
			mov 	STR12[1],ah
			mov 	STR12[2],'s'
			mov 	STR12[3],'$'

			GOTO_XY	10,0
			MOSTRA	STR12

	Timer: 				; change for TP
			cmp 	Tempo_limite, 0 ; Compara se o tempo limite está 0
			jne 	Timer_dec ; Senão decrementa e continua, caso chega a 0 termina o jogo
			call 	apaga_ecran  ;
			GOTO_XY	0,1
			MOSTRA  Logo
			goto_xy 10,8
			Mostra	Fim_Perdeu2
			GOTO_XY	12,15
			MOSTRA	carregetecla
			call	LE_TECLA2	; paragem à espera que o jogador carregue numa tecla

			jmp 	MAIN

	Timer_dec:
			dec     Tempo_limite
			mov 	ax,Tempo_limite
			;inc 	TopScore
			mov 	bl, 10
			div 	bl
			add 	al, 30h				; Caracter Correspondente às dezenas
			add		ah,	30h				; Caracter Correspondente às unidades
			mov 	STR12[0],al			;
			mov 	STR12[1],ah
			mov 	STR12[3],'$'

			GOTO_XY	48,0
			MOSTRA	STR12

			;GOTO_XY	1,22
			;mostra TopScore


			call 	HOje				; Data de HOje
			mov 	al ,DDMMAAAA[0]
			mov 	STR12[0], al
			mov 	al ,DDMMAAAA[1]
			mov 	STR12[1], al
			mov 	al ,DDMMAAAA[2]
			mov 	STR12[2], al
			mov 	al ,DDMMAAAA[3]
			mov 	STR12[3], al
			mov 	al ,DDMMAAAA[4]
			mov 	STR12[4], al
			mov 	al ,DDMMAAAA[5]
			mov 	STR12[5], al
			mov 	al ,DDMMAAAA[6]
			mov 	STR12[6], al
			mov 	al ,DDMMAAAA[7]
			mov 	STR12[7], al
			mov 	al ,DDMMAAAA[8]
			mov 	STR12[8], al
			mov 	al ,DDMMAAAA[9]
			mov 	STR12[9], al
			mov 	STR12[10],'$'
			GOTO_XY	64,0
			MOSTRA	STR12

	fim_horas:

			goto_xy	POSx,POSy			; Volta a colocar o cursor onde estava antes de actualizar as horas

			POPF
			POP 	DX
			POP 	CX
			POP 	BX
			POP 	AX
			ret	

Trata_Horas ENDP


	;---------------------------------------------------End change for TP---------------------------------------------------
			mov 	ah, 06h		;Paints first row
			xor 	CX, CX     	;Upper left corner CH=row, CL=column
			mov 	DH, 0H  	;lower DH=row
			mov 	DL, 73  	;lower DL=column // First line except the check char under avatar
			mov 	BH,09H    	;Color
			int 	10H

			mov 	ah, 06h		;Paint Palavra: / game:
			xor 	CH, 14H     ;Upper CH=row
			xor 	CL, 1H      ;Upper CL=column
			mov 	DH, 16H  	;lower DH=row
			mov 	DL, 9H  	;lower DL=column
			mov 	BH,	03H     ;Color
			int 	10H


;--------------------------------------------------Start Change for TP-------------------------------------------------- Escolher Dificuldade do nivel dps do primeiro Nivel

Levels PROC
			;call Copia_ECRAN
			;goto_xy	0,5

			cmp  	Level,06H       ; difficulty = 02H, you have pass all the games
			jne  	NEqual
			je   	ENDLVL

	NEqual:
			goto_xy 0,0
			MOSTRA	Logo
			goto_xy 10,20
			MOSTRA 	carregetecla
			goto_xy 10,10
			MOSTRA 	Proximo_Nivel   ; if  difficulty != 02H, go to choose if go to the next level   ; if  difficulty != 02H, go to choose if go to the next level
			
			cmp  	Level, 1
			je 		Level1proc
			jmp  	NEXT_GAME            ; if  difficulty == 02H, go to choose if continue
	NEXT_GAME:
			call 	apaga_ecran
			goto_xy 0,0
			MOSTRA	Logo
			goto_xy 10,20
			MOSTRA 	carregetecla
			MOSTRA 	Fim_Nivel
			
			mov 	bl,Level
			mov 	Level, bl
			call 	LE_TECLA2

			call 	apaga_ecran

			mov     ah, 06h		;Paints first row
			xor     CX, CX     	;Upper left corner CH=row, CL=column
			;mov    DX, 184FH  ;lower right corner DH=row, DL=column
			mov     DH, 0H  	;lower DH=row
			mov     DL, 73  	;lower DL=column // First line except the check char under avatar
			mov     BH,09H    	;Color
			int     10H


			mov     ah, 06h		;Paint Palavra: / game:
			xor     CX, CX     	;Upper left corner CH=row, CL=column
			xor     CH, 15H     ;Upper CH=row
			xor     CL, 1H      ;Upper CL=column
			xor     DX, DX     	;Upper left corner CH=row, CL=column
			mov     DH, 16H  	;lower DH=row
			mov     DL, 9H  	;lower DL=column
			mov     BH,	03H     ;Color
			int     10H

			GOTO_XY	1,21
			MOSTRA	Str_nomtlt  
			GOTO_XY	10,21
			MOSTRA	String_nome ; Motra palavra em baixo --- neste caso ISEC
			GOTO_XY 1,22
			MOSTRA	Cons_nomtlt

			cmp  	Level, 1
			je 		Level1proc
			cmp  	Level, 2
			je 		Level2
			cmp  	Level, 3
			je 		Level3
			cmp  	Level, 4
			je 		Level4
			cmp  	Level, 5
			je 		Level5
			cmp		Level, 6 ; if it's the EXIT, then you win!!!
			je   	ENDLVL                    ; default : easy game

	Level1:
			mov	    DX,Tempo_limite1
			goto_xy	0,0
			;call	IMP_FICH
			Mostra 	MSG_MAZE1
			goto_xy	23,0
			Mostra 	Nivel1

			mov  	Tempo_limite1, DX
			mov  	Tempo_limite, DX
			call 	LE_TECLA
			jmp 	AVATAR
			goto_xy	0,22

	Level2:
			mov	    DX,Tempo_limite2
			mov  	Tempo_limite, DX
			goto_xy	0,0
			Mostra 	MSG_MAZE2
			goto_xy	23,0
			Mostra 	Nivel2

			jmp 		AVATAR
			goto_xy		0,22
	Level3:
			mov	    DX,Tempo_limite3
			mov  	Tempo_limite, DX
			goto_xy	0,0
			Mostra 	MSG_MAZE2
			goto_xy	23,0
			Mostra 	Nivel3
			jmp 	AVATAR
			goto_xy		0,22
	Level4:

			mov	    DX,Tempo_limite4
			mov  	Tempo_limite, DX
			goto_xy	0,0
			call	IMP_FICH
			goto_xy	20,0
			Mostra 	Nivel4
			jmp 	AVATAR
			goto_xy	0,22
	Level5:

			mov	    DX,Tempo_limite5
			mov  	Tempo_limite, DX
			goto_xy	0,0
			call	IMP_FICH
			goto_xy	20,0
			Mostra Nivel5
			jmp 	AVATAR
			goto_xy	0,22
	ENDLVL: 
			call 	apaga_ecran     		   
			mov 	Level, 1
			goto_xy 0,0
			MOSTRA	Logo
			goto_xy 10,20
			MOSTRA 	carregetecla
			goto_xy 9,10
			MOSTRA 	Fim_Ganhou
			call 	PLAYER_NAME			
			call 	LE_TECLA2
			jmp 	MAIN
			
              
Levels		endp

CriaFich proc

			
			mov		ah, 3ch				; Abrir o ficheiro para escrita
			mov		cx, 00H				; Define o tipo de ficheiro ??
			lea		dx, fname			; DX aponta para o nome do ficheiro 
			int		21h					; Abre efectivamente o ficheiro (AX fica com o Handle do ficheiro)
			jnc		escreve				; Se n„o existir erro escreve no ficheiro
		
			mov		ah, 09h
			lea		dx, msgErrorCreate
			int		21h
		
			jmp		fim

	escreve:
			mov		bx, ax				; Coloca em BX o Handle
			mov		ah, 40h				; indica que ‚ para escrever
			
			lea		dx, buffer			; DX aponta para a infroma‡„o a escrever
			mov		cx, 240				; CX fica com o numero de bytes a escrever
			int		21h					; Chama a rotina de escrita
			jnc		close				; Se n„o existir erro na escrita fecha o ficheiro
		
			mov		ah, 09h
			lea		dx, msgErrorWrite
			int		21h
	close:
			mov		ah,3eh				; fecha o ficheiro
			int		21h
			jnc		fim
		
			mov		ah, 09h
			lea		dx, msgErrorClose
			int		21h
	fim:
		ret		
CriaFich	endp




;---------------------------------------------------End change for TP---------------------------------------------------

PLAYER_NAME PROC 
			
			GOTO_XY	10,16	
			mov 	AH,9
			LEA 	DX,Max_letters
			int 	21H
			goto_xy 0,0
			MOSTRA	Logo


	play_msg:

			GOTO_XY	10,14		
			mov 	AH,9
			LEA 	DX,player_msg
			int 	21H
			
			;ENTER PLAYER 1 NAME
			mov 	ah,0AH        ;Read from keyboard
			LEA 	dx, player                   
			int 	21h 
			
			GOTO_XY	10,8	  
			xor 	si, si		

	copy_ciclepl:
		mov 	al, player[si]
			cmp 	al, 32
			
				;copy str1 to str2
			mov 	buffer[si], al
			inc 	si;increment source and destination
			cmp 	si, 10
			jne 	copy_ciclepl


	criaF:		
	call CriaFich

			;Display the input data in a new location
			mov 	dx, offset carregetecla
			mov 	ah, 9
			int 	21h
			
			GOTO_XY	10,10	
					
			mov 	AH , 0
			int 	16h		
	ret		

PLAYER_NAME Endp
;------------------------------------------------------
;CalcAleat - calcula um numero aleatorio de 16 bits
;Parametros passados pela pilha
;entrada:
;não tem parametros de entrada
;saida:
;param1 - 16 bits - numero aleatorio calculado
;notas adicionais:
; deve estar definida uma variavel => ultimo_num_aleat dw 0
; assume-se que DS esta a apontar para o segmento onde esta armazenada ultimo_num_aleat
CalcAleat proc near

			sub		sp,2
			push	bp
			mov		bp,sp
			push	ax
			push	cx
			push	dx
			mov		ax,[bp+4]
			mov		[bp+2],ax

			mov		ah,00h
			int		1ah

			add		dx,ultimo_num_al
			add		cx,dx
			mov		ax,65521
			push	dx
			mul		cx
			pop		dx
			xchg	dl,dh
			add		dx,32749
			add		dx,ax

			mov		ultimo_num_al,dx

			mov		[BP+4],dx

			pop		dx
			pop		cx
			pop		ax
			pop		bp
			ret
CalcAleat endp

;------------------------------------------------------
;impnum - imprime um numero de 16 bits na posicao x,y
;Parametros passados pela pilha
;entrada:
;param1 -  8 bits - posicao x
;param2 -  8 bits - posicao y
;param3 - 16 bits - numero a imprimir
;saida:
;não tem parametros de saída
;notas adicionais:
; deve estar definida uma variavel => str_num db 5 dup(?),'$'
; assume-se que DS esta a apontar para o segmento onde esta armazenada str_num
; sao eliminados da pilha os parametros de entrada
impnum proc near
			push	bp
			mov		bp,sp
			push	ax
			push	bx
			push	cx
			push	dx
			push	di
			mov		ax,[bp+4] ;param3
			lea		di,[str_num+5]
			mov		cx,2 ; numero de digitos CHANGE FOR TP


	prox_dig:
			xor		dx,dx
			mov		bx,10
			div		bx
			add		dl,'0' ; dh e' sempre 0
			dec		di
			mov		[di],dl
			loop	prox_dig

			mov		ah,02h
			mov		bh,00h
			mov		dl,[bp+7] ;param1
			mov		dh,[bp+6] ;param2
			int		10h


			mov		dx,di

			pop		di
			pop		dx
			pop		cx
			pop		bx
			pop		ax
			pop		bp
			ret		4 ;limpa parametros (4 bytes) colocados na pilha
impnum endp

PRINC PROC

			call	CalcAleat
			pop	    ax ; vai buscar 'a pilha o numero aleatorio
			xor	    ah,ah
			mov	    dx,ax
			mov	    dh,00
			push	dx
			push	ax
			call	impnum

		ret
PRINC ENDP

reset_position proc

	xcheck:
			call 	PRINC

			cmp 	al,80 ; limit x
			JA 		xcheck
			mov 	POSx, dl
			mov 	POSxa, dl

	ycheck:
			call 	PRINC
			cmp 	al,25 ; limit y
			JA 		ycheck
			mov 	POSy, dl
			mov 	POSya, dl

;            mov BH, x
;            mov		POSx,BH	; Reset da posicao do avatar ao passar de nivel
;			 mov		POSxa,BH	; Reset da posicao do avatar ao passar de nivel
;            mov BH, y
;			 mov		POSy,BH	; Reset da posicao do avatar ao passar de nivel
;			 mov 	POSya, BH ; Reset da posicao do avatar ao passar de nivel

reset_position	endp

AVATAR	PROC 
			mov		ax,0B800h
			mov		es,ax
		
			mov		ah, 02h
			mov 	ch, 32
			mov 	ah, 1
			int 	10h
	xcheck:
            call 	PRINC
            cmp 	al,maxx ; limit x
            JA 		xcheck
            cmp 	al,3 ; limit y
            JB 		xcheck
            mov 	POSx, dl
            mov 	POSxa, dl
	ycheck:
            call 	PRINC
            cmp 	al,maxy ; limit y
            JA 		ycheck
            cmp 	al,3 ; limit y
            JB 		ycheck
            mov 	POSy, dl
            mov 	POSya, dl

			goto_xy	POSx,POSy		; Vai para nova posicao
			mov 	ah, 08h			; Guarda o Caracter que está na posicao do Cursor
			mov		bh,0			; numero da página
			mov		dl, 6
			int		10h
			mov		Car, al			; Guarda o Caracter que está na posicao do Cursor
			mov		Cor, ah			; Guarda a cor que está na posicao do Cursor
 
            cmp 	Car, 32        ; check space
			jne		xcheck
			cmp 	Car, 177        ;check wall // normalmente não é necessario por que o check space faz o trabalho
			je		xcheck
			xor 	di, di
	
	CICLO:
			push 		bx	
			goto_xy		POSxa,POSya		; Vai para a posicao anterior do cursor
			mov			ah, 02h          
			mov			dl, Car			; Repoe Caracter guardado				
	No_win:	

			goto_xy	POSx,POSy		; Vai para nova posicao
			mov		ah, 08h
			mov		bh,0			; numero da página			
			int		10h
			mov		Car, al			; Guarda o Caracter que está na posicao do Cursor
			mov		Cor, ah			; Guarda a cor que está na posicao do Cursor
		
			mov     ah, 09h
			mov     bl, 07H
			mov     cx, 1
			int     10h

			goto_xy	78,0			; Mostra o caracter que estava na posicao do AVATAR
			mov		ah, 02h			; IMPRIME caracter da posicao no canto
			mov		dl, Car
			int		21H
			       				
			cmp 	Car, 177	
			je		invertpos	

			xor 	si,si	;meter indice a 0
			
			cmp 	Car, 32        ; check space // evita verificação de letra
			je	    imprime
			cmp 	Car, 177        ; check space // evita verificação de letra
			je	    imprime

			mov 	al,dl 
		

;check_carordenado:
;		lea bx, String_nome
;		cmp al,String_nome[si]
;		jne No_win
;
;		push bx
;		lea bx,Construir_nome
;		je carto_word

			xor 	si,si	;meter indice a 0

	check_car:
			lea 	bx, String_nome
			cmp 	al,Construir_nome[si] ;verifica se ja foi encontrada a letra 
			je 		imprime
		
			cmp 	al,String_nome[si]
			je 		carto_word
			inc 	si 
			cmp 	si, Dim_nome  
			jb 		check_car
			jmp 	imprime		
			
	carto_word:

			mov		[Construir_nome+si],al		
			push 	ax
			mov 	cx, si	
			add 	cl,10
			goto_xy cl,21
			mov     ah, 09h; write character and attribute at cursor position.
			mov 	al, String_nome[si]
			mov     cx, 1 ;Number of time to write char
			mov     bl, 0Eh ;Color avatar
			int     10h		
			pop 	ax
			
			goto_xy 10,22
			MOSTRA Construir_nome			
			inc 	di
			push 	ax
			mov 	cx, 0	
			goto_xy 30,21
			mov     ah, 09h; write character and attribute at cursor position.
			mov 	al, cl
			mov     cx, 1 ;Number of time to write char
			mov     bl, 0Eh ;Color avatar
			int     10h		
			pop 	ax
			inc 	count_car
		
	str_end:
			cmp di,4
			jb imprime
			
			goto_xy	POSxa,POSya		; Vai para a posicao anterior do cursor
			mov     ah, 09h; write character and attribute at cursor position.
			;mov     al, Level ;Avatar Icon
			mov     al, String_nome[di] ;Avatar Icon
			mov     cx, 1 ;Number of time to write char
			mov     bl, 0Eh ;Color avatar
			int     10h

			xor 	di, di
			xor 	bx, bx
			xor 	si, si

	copy_cicle2:

				;copy str1 to str2
			mov 	Construir_nome[si], " "
			inc 	si;increment source and destination
			cmp 	si, Dim_nome
			jne 	copy_cicle2
			mov 	Construir_nome[si], "$"

		

	;// aqui no meio função string  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	win_imprime:  
			pop 	bx         
				
			goto_xy	POSxa,POSya		; Vai para a posicao anterior do cursor
			mov		ah, 02h
			mov		dl, 32			; After pass turns map road to space "black"
			int		21H

			goto_xy	POSx,POSy		; Vai para posicao do cursor
			mov     ah, 09h; write character and attribute at cursor position.
			;mov     al, Level ;Avatar Icon
			mov     al, 2 ;Avatar Icon
			mov     cx, 1 ;Number of time to write char
			mov     bl, 0Eh ;Color avatar
			int     10h
			call 	To_win				

	To_Win:
			mov 	dh, Level
			inc 	Level						 
			call 	LE_TECLA2
			jmp 	Levels

			
	IMPRIME:	
				
			goto_xy	POSxa,POSya		; Vai para a posicao anterior do cursor
			mov		ah, 02h
			mov		dl, 32			; After pass turns map road to space "black"
			int		21H
	
			goto_xy	POSx,POSy		; Vai para posicao do cursor
			mov		ah, 02h
			mov		dl, 207		; Coloca AVATAR
			int		21H
			goto_xy	POSx,POSy	; Vai para posicao do cursor

			mov		al, POSx	; Guarda a posicao do cursor
			mov		POSxa, al	; posicao anterior
			mov		al, POSy	; Guarda a posicao do cursors
			mov 	POSya, al		
			
	;---------------------------------------------------Start change for TP---------------------------------------------------If hit wall go back					


	invertpos:

			goto_xy	POSxa,POSya
			mov     al, 177 ;rebuild wall after hit wall
			mov     ah, 09h ; write character and attribute at cursor position.
			mov     cx, 1 ;Number of time to write char
			int     10h
			
			mov		al, POSxa	; Guarda a posicao do cursor
			mov		POSx, al
			mov		al, POSya	; Guarda a posicao do cursor
			mov 	POSy, al	

			goto_xy	POSx,POSy
			mov     ah, 09h; write character and attribute at cursor position.
			mov     al, 207 ;Avatar Icon
			mov     cx, 1 ;Number of time to write char
			mov     bl, 02h ;Color avatar
			int     10h

	;---------------------------------------------------End change for TP---------------------------------------------------


	LER_SETA:	
			call 	LE_TECLA

	Smoves:
			cmp     AL, "n"
			je      win_imprime
			cmp     AL, "p"
			jne      moves
	pausem:
			call 	LE_TECLA2
			jmp     LER_SETA
	moves:
			cmp		ah, 1
			je		ESTEND
			cmp 	AL, 27	; ESCAPE
			je      FIM
			cmp     AL, "s"
			je      FIM            
			jmp		LER_SETA


	ESTEND:		
			cmp 	al,48h
			jne		BAIXO
			dec		POSy		;cima
			jmp		CICLO

	BAIXO:		
			cmp		al,50h
			jne		ESQUERDA
			inc 	POSy		;Baixo
			jmp		CICLO

	ESQUERDA:
			cmp		al,4Bh
			jne		DIREITA
			dec		POSx		;Esquerda
			jmp		CICLO

	DIREITA:
			cmp		al,4Dh
			jne		LER_SETA
			inc		POSx		;Direita
			jmp		CICLO
	 
				
	fim:
			jmp 	MAIN
AVATAR		endp

Level1proc	PROC

			call	apaga_ecran

			mov 	ah, 06h		;Paints first row
			xor 	CX, CX     	;Upper left corner CH=row, CL=column
			mov 	DH, 0H  	;lower DH=row
			mov 	DL, 73  	;lower DL=column // First line except the check char under avatar
			mov 	BH,09H    	;Color
			int 	10H

			mov 	ah, 06h		;Paint Palavra: / game:
			xor 	CH, 14H     ;Upper CH=row
			xor 	CL, 1H      ;Upper CL=column
			mov 	DH, 16H  	;lower DH=row
			mov 	DL, 9H  	;lower DL=column
			mov 	BH,	03H     ;Color
			int 	10H
;---------------------------------------------------End change for TP---------------------------------------------------;

			goto_xy	0,0
			;call	IMP_FICH
			MOSTRA 	MSG_MAZE1
			goto_xy	23,0
			Mostra  Nivel1
			;goto_xy 0,5
			;call	IMP_FICH
			;MOSTRA MSG_EASYMAZE
			goto_xy	0,0
			;call 	INSTRUCTION
			GOTO_XY	10,21
			MOSTRA	String_nome ; Motra palavra em baixo --- neste caso ISEC
			GOTO_XY 1,21
			MOSTRA  Str_nomtlt

			GOTO_XY	10,22
			MOSTRA  Construir_nome
			GOTO_XY 1,22
			MOSTRA  Cons_nomtlt

			call 	AVATAR
			goto_xy	0,22

			mov		ah,4CH
			int		21H
			ret

Level1proc	ENDP

;########################################################################
Main  proc
			mov		DX,Tempo_limite1
			mov		Tempo_limite, DX		
			mov		ax, dseg
			mov		ds,ax

			mov		ax,0B800h
			mov		es,ax
			
ciclo_menu:
			call	apaga_ecran   
			mov     ah, 06h		;Paints first row
			xor     CX, CX     	;Upper left corner CH=row, CL=column
			mov     CH, 0H     ;Upper CH=row
			mov     CL, 1H      ;Upper CL=column
			xor     DX, DX     	;Upper left corner CH=row, CL=column
			mov     DH, 5H  	;lower DH=row
			mov     DL, 80H  	;lower DL=column
			mov     BH,07H    	;Color
			int 	10h
			mov     ah, 06h		;Paints first row
			xor     CX, CX     	;Upper left corner CH=row, CL=column
			mov     CH, 4H     ;Upper CH=row
			mov     CL, 0H      ;Upper CL=column
			xor     DX, DX     	;Upper left corner CH=row, CL=column
			mov     DH, 7H  	;lower DH=row
			mov     DL, 80H  	;lower DL=column
			mov     BH,09H    	;Color
			int 	10h
					
			goto_xy 0,0
			MOSTRA	Logo
			GOTO_XY	10,6
			MOSTRA	Menu1
			GOTO_XY	10,8
			MOSTRA	Menu2
			GOTO_XY	10,10
			MOSTRA	Menu3
			GOTO_XY	10,12
			MOSTRA	Menu4
			GOTO_XY	10,14
			MOSTRA	Menu5
			GOTO_XY	10,16
			call 	LE_TECLA2

			cmp     AL, "0"
			je      EXIT
			cmp     AL, "1"
			je      Jogar
			cmp     AL, "2"
			je      TOP10
			cmp     AL, "3"
			je      Sobre_nos
			jmp 	ciclo_menu


	TOP10:
			call	apaga_ecran
			goto_xy	0,5
			call	IMP_FICH2
			call	LE_TECLA2
			call 	ciclo_menu
    Sobre_nos:
			call	apaga_ecran
			goto_xy	0,1
			MOSTRA	Credits
			goto_xy	0,9
			MOSTRA	Credits2
			goto_xy	0,17
			MOSTRA	Credits3
			goto_xy	0,19
			MOSTRA	Credits4
			call	LE_TECLA2
			call	ciclo_menu
    EXIT:
			call	apaga_ecran
			mov		AX, 4C00H
			int		21H

    Jogar:

	    ;call 		LE_TECLA2
;---------------------------------------------------Start change for TP--------------------------------------------------- Coloring
			call	apaga_ecran

;---------------------------------------------------End change for TP---------------------------------------------------;

	CICLO_MAIN:
			mov		Level, 1
			goto_xy	0,0
			;call	IMP_FICH
			call	Levels
			;call	INSTRUCTION
			goto_xy	0,22
			jmp		CICLO_MAIN
			
			mov		ah,4CH
			int		21H
                
Main	endp
Cseg	ends
end	Main



