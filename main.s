.data
N:
    .word 4
M:
    .word 5

matrix:
    .word  1,  -2,  3,  -4
    .word -5,   6, -7,   8
    .word  9, -10,  1,  -2
    .word  3,   4, -5,  -6
    .word -7,  -8,  9,  10

positive:
    .word 0
negative:
    .word 0

.text

main:
    la a2, N          
    la a3, M          
    la a4, matrix     
    la a5, positive   
    la a6, negative  
    call process

    la a2, positive
    la a3, negative
    call print

    call exit

print:
    lw a1, 0(a2)
    addi a0, x0, 1     # print_int
    ecall
    
    addi a0, x0, 11    
    addi a1, x0, 32    # print ' '
    ecall

    lw a1, 0(a3)
    addi a0, x0, 1     # print_int
    ecall

    addi a0, x0, 11    
    addi a1, x0, 10    # print '\n'
    ecall

    ret

process:
    lw t1, 0(a2)      
    lw t2, 0(a3)      

    addi t5, x0, 0    
    addi t6, x0, 0    

    addi t3, x0, 0    

row_loop:
    addi t4, x0, 0    

col_loop:
    lw t0, 0(a4)      
    addi a4, a4, 4    

    bgt t0, x0, inc_pos

    blt t0, x0, inc_neg

    j skip_count

inc_pos:
    addi t5, t5, 1
    j skip_count

inc_neg:
    addi t6, t6, 1

skip_count:
    addi t4, t4, 1    
    blt t4, t1, col_loop

    addi t3, t3, 1    
    blt t3, t2, row_loop

    sw t5, 0(a5)
    sw t6, 0(a6)

    ret

exit:
    addi a0, x0, 10
    ecall
