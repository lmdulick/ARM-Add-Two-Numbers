# pa1.txt
.section .data

inputted_x_value  :   .asciz  "Please enter x: "
inputted_y_value  :   .asciz  "Please enter y: "
answer  :   .asciz  "%d"
output  :   .asciz  "x*y = %d\n"

.section .text

.global main

main:

# CITATION: from the input_and_add_two_numbers.s
#create room on stack for x
sub sp, sp, 8
# input x prompt
ldr x0, = inputted_x_value
bl printf	
#get input x value
# spec input
ldr x0, = answer
mov x1, sp
bl scanf
ldr x19, [sp]

# CITATION: from the input_and_add_two_numbers.s
#get y input value
# enter y output
ldr x0, = inputted_y_value
bl printf
# spec input
ldr x0, = answer
mov x1, sp
bl scanf
ldr x20, [sp]

# initialize answer to 0
mov x21, 0

#perform x*y using addition 
#loop 
loop_start:
        # Check if y is zero (loop termination condition)
        cmp x20, 0
        beq loop_end

        # Add x to the answer
        add x21, x21, x19

        # Decrement y by 1
        sub x20, x20, 1

        # Repeat the loop
        b loop_start

#loop end   
loop_end:

    # Output the answer
    ldr x0, =output
    mov x1, x21
    bl printf

# restore the stack
add sp, sp, 16

# branch to this label on program completion
exit:
    mov x0, 0
    mov x8, 93
    svc 0
    ret

