      * Euler Project Problem# 1:  https://projecteuler.net/problem=1
      * If we list all the natural numbers below 10 that are multiples 
      * of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 
      * 23. Find the sum of all the multiples of 3 or 5 below 1000.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RANDOM-GUESS.
       AUTHOR.  Jesse Racine.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Counter PIC 9999.
       01 Total    PIC 999999  VALUE ZEROS.                                          
       PROCEDURE DIVISION.
           Begin.
               PERFORM Factor VARYING Counter FROM 3 BY 1 UNTIL 
                   Counter = 1000.
               DISPLAY Total.
               STOP RUN.
           
           Factor.          
           IF FUNCTION MOD( Counter, 3) = 0 OR 
               FUNCTION MOD(Counter, 5) = 0 THEN             
               COMPUTE Total = Counter + Total
           END-IF.

               

                   
