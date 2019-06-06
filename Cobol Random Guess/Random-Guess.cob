      * Guessing Game: Guess value between 1 and 1000
       IDENTIFICATION DIVISION.
       PROGRAM-ID. RANDOM-GUESS.
       AUTHOR.  Jesse Racine.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 RandNum      PIC 9999.                 
       01 GuessedNum   PIC 9999 VALUE 0.
           88 Valid-Value  VALUE 0001 THRU 1000. 
       01 DateSeed     PIC 9(16).
       PROCEDURE DIVISION.
           Begin.
            MOVE FUNCTION CURRENT-DATE(1:16) TO DateSeed.
            COMPUTE RandNum = Function RANDOM(DateSeed) * 1000 + 1            
            PERFORM UNTIL 1 <> 1    
               PERFORM Get-Guess WITH TEST AFTER UNTIL Valid-Value
               IF GuessedNum = RandNum THEN
                  DISPLAY "You guessed correctly"
                  STOP RUN
               END-IF
               IF GuessedNum < RandNum THEN
                  DISPLAY "Your guess was lower than the target"
               END-IF
               
               IF GuessedNum > RandNum THEN
                  DISPLAY "Your guess was higher than the target"
               END-IF
            END-PERFORM
            STOP RUN.
           Get-Guess.
               DISPLAY "Guess Number between 1 - 1000"
               ACCEPT GuessedNum
               IF NOT Valid-Value THEN
                   DISPLAY "Your guess was not valid, try again"
               END-IF.         
