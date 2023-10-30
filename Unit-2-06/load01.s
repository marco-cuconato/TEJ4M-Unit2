/*-- load01.s */

/* Data section */
.data

/* Ensure variable is 4-byte aligned */
.balign
/* Define storage for myvar1 */
myvar1:
       /* Contents fo myvar1 is 4 byte containing the value  3 */
       .word3 

/* Ensure variable is 4-byte aligned */
.balign4 
/* Define storage fro myvar1 */
myvar2 :
        /* contents fo myvar2 is 4 byte containing the value 4 */
        .word4

/*  -- Code section */
.text

/* Ensure variable is 4-byte aligned */
.balign4
.global main
main: 
     ldr r1, addr_of_myvar1 // r1 <- &myvar1
	 ldr r1, [r1]           // r1 <- *r1
	 ldr r2, addr_of_myvar2 // r2 <- &myvar2
	 ldr r2, [r2]           // r2 <- *r2
	 add r0, r1, r2         // r0 <- r1 + r2
	 bx lr

/*Labels needed to access data */
addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2