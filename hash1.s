global sLength
global gHash

sLength:
        push    rbp                     ;the caller function is saved in the stack because the base pointer i.e rbp register is pushed onto the stack to save the position of the stack.
 
        mov     rbp, rsp		;coping from rsp to rbp, the stack pointer is initiallized to the base pointer in the stack frame. it creates a new stack frame within the main caller function and preserving the satck frame of the caller function.

        mov     QWORD [rbp-24], rdi	;copies rdi(source) to the size of 64bit and the address of [rbp-24](destination). 

        cmp     QWORD [rbp-24], 0	;compares the value in [rbp-24] with 0 and sets the flags in the EFLAGS register. 

        jne     .Length			;a conditional jump that checks the state of one or more of the status flags in the EFLAG registers. if the flags are in the specified state according to the condition, performs the jump to the target destination.

        mov     eax, 0			;copies 0 to eax which is a 32bit integer size register, returns 0 once the condition is satisfied.
        jmp     .Pop			;switches program control to a ".Pop" point which exits the function.

.Length:
        mov     DWORD [rbp-4], 0	;copies 0 to rbp register and stored in the address memory [rbp-4]. where in c program the variable interger length is initallized to 0.

        jmp     .Loop			;jumps to the ".Loop" point where the condition for the pointer variable in executed.

.inc:
        add     DWORD [rbp-4], 1	;adds 1 and the value in the address memory [rbp-4] and stores the result in the [rbp-4]. where in c program varible length is incremented to 1.

        add     QWORD [rbp-24], 1       ;adds 1 and the value in the address memory [rbp-24] and stores the result in the [rbp-24]. where in c program varible source is incremented to 1.

.Loop:
        mov     rax, QWORD [rbp-24]	;copies the value in [rbp-24] to the 64bit long size register rax which is just using a scratch register to load a stack. where in c program 
 
        movzx   eax, BYTE [rax]		;reads the contents of the register as a byte and coping it to 32bit int size register eax.

        test    al, al			;computes the bitwise logical of al and al which is the least significant byte of eax register used to return values from function calls. sets the status flag according to the result.

        jne     .inc			;a conditional jump that checks the state of one or more of the status flags in the EFLAG registers. if the flags are in the specified state according to the condition, performs the jump to the target destination.

        mov     eax, DWORD [rbp-4]	;copies the values in the memory address of [rbp-4] to eax. the value which was in [rbp-4] of the variable length to eax.

.Pop:
        pop     rbp			;pops out the 4-byte data element from the top of the stack into rbp.
        ret				;transfers the program control to rbp which was on top of the stack.
gHash:
        push    rbp			;the caller function is saved in the stack because the base pointer i.e rbp register is pushed onto the stack to save the position of the stack.

        mov     rbp, rsp		;coping from rsp to rbp, the stack pointer is initiallized to the base pointer in the stack frame. it creates a new stack frame within the main caller function and preserving the satck frame of the caller function.

        sub     rsp, 40			;subtracts 40 to rsp which is a stack pointer that is accessing memory below the base pointer which is pointing to the top of the current stack frame.

        mov     QWORD [rbp-40], rdi     ;copies rdi(source) to the size of 64bit and the address of [rbp-40](destination).

        mov     rax, QWORD [rbp-40]	;copies the value in [rbp-24] to the 64bit long size register rax which is just using a scratch register to load a stack argument. where arg source is copied to the rax register. 

        mov     rdi, rax		;the value source in rax is copied to rdi(destination index).
        call    sLength			;sLength function is called returning a variable length.
        mov     DWORD [rbp-12], eax	;copies value in variable length of eax to the address memory of [rbp-12].
        mov     DWORD [rbp-4], 0	;the value 0 is copied to the address memory of [rbp-4] in which a new variable hash is initialized to 0.
        mov     DWORD [rbp-8], 0	;value 0 is copied to the address memory of [rbp-8] which another new variable i is initiallized to 0.
        jmp     .cond			;jumps to the ".cond" point where the condition is exectued.
.Hash:
        mov     eax, DWORD [rbp-8]	;the value in memory address [rbp-8] is moved to eax and stores the value in eax.
        movsx   rdx, eax		;the value in eax is copied to rdx and stored in eax register by movsx. movsx reads the contents of the  register as byte.
        mov     rax, QWORD [rbp-40]	;copies value in address memory [rbp-40] to rax.
        add     rax, rdx		;the extended register rdx value of a byte is copied to register rax.
        movzx   eax, BYTE [rax]		;the byte value in rax is copied to eax.
        mov     BYTE [rbp-13], al	;the least significant byte of eax register is copied to the byte at the address memory [rbp-13]
        movsx   eax, BYTE [rbp-13]	;byte at the address memory [rbp-13] is copied to eax register where a new intiger variable is initiallized.
        sub     eax, 48			;the value of the eax register is decremented by 48 (48 = 0*30 = '0').
        mov     DWORD [rbp-20], eax	;after subtracting eax, the remaining value is copied to [rbp-4] and stored in address memory of [rbp-4].
        mov     edx, DWORD [rbp-4]	;value from [rbp-4] is moved to edx which is stored temporarily.
        mov     eax, edx		;the value which is stored temporarily is copied to eax.
        sal     eax, 2			;shifts a byte value in eax to left by 2 and stores the prodect in that byte.
        add     eax, edx		;adding the value which is temporarily stored in edx to eax. this is adding the variable a.
        add     eax, eax		;adding the values eax to eax itself. 
        mov     edx, eax		;now the values in eax is copied to extendable register edx.
        mov     eax, DWORD [rbp-20]	;the value in [rbp-20] of a variable is copied to eax which stores the result.
        add     eax, edx  		;adding the value of edx and eax and stores it in eax.
        mov     DWORD [rbp-4], eax	;now the eax is copied to the address memory of [rbp-4] in which a computation of a hash is intiallized to a variable.
        add     DWORD [rbp-8], 1	;another variable which is in [rbp-8] is incremented by 1 which is from a loop.
.cond:
        mov     eax, DWORD [rbp-8]	;before incrementation the value in [rbp-8] is copied to eax.
        cmp     eax, DWORD [rbp-12]	;now the value in [rbp-12] is comparing with the above eax value and store it in eax because of the condition.
        jl      .Hash			;after the condition is satisfied it checks the status flags in the EFLAG register. if the flags are according to the conditio then it performs a jump to return a value.
        mov     eax, DWORD [rbp-4]	;when the hash computation is done, the values at the memory address [rbp-4] is copied to eax which returns an integer. 
        leave				;the base pointer rbp is restored onto the stack.
        ret				;returns the final value.
