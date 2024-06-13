; Ted Obuchowicz
; July 6, 2020
; if.asm


 
section .text
        global _start

_start:
        mov al, 11111111b
        mov bl, 11111110b

;  the following code performs
;  if ( al > bl)
;  {
      mov cl, 1
;  }
;  else
;  {
;     mov  cl,0
;  }
;  
;  mov dl, 5



ron:        cmp al, bl 
jack:       jg  al_bigger
bl_bigger:  mov cl , 0
            jmp next
al_bigger:  mov cl, 1
next:       mov dl, 5 



; here is an alternate version

ron2:       cmp al, bl       ; performs al - bl and updates flags
jack2:      jl bl_bigger2     ; jump result less than 0 ( al < bl)
al_bigger2: mov cl,1         ; this is the 'true stuff' we get here if al>bl
            jmp next2         ; remember to jump over the 'false' stuff
bl_bigger2: mov cl,0         ; this is the 'false' stuff we get here is al<bl
next2:      mov dl,5         ; this is next statement, we always get here




        mov eax,1            ; The system call for exit (sys_exit)
        mov ebx,0            ; Exit with return code of 0 (no error)
        int 80h

