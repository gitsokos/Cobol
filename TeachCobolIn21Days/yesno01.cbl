       IDENTIFICATION DIVISION.
       PROGRAM-ID. YESNO01.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  YES-OR-NO      PIC X VALUE "Y".
      
       PROCEDURE DIVISION.


       PROGRAM-BEGIN.
           PERFORM GET-THE-ANSWER.
           PERFORM DISPLAY-THE-ANSWER.
      
       PROGRAM-DONE.
           STOP RUN.

       GET-THE-ANSWER.
           DISPLAY "Is (Y)es or (N)o?".
           ACCEPT YES-OR-NO.

       DISPLAY-THE-ANSWER.
           IF YES-OR-NO EQUAL "Y"
               DISPLAY "Answered YES.".
           IF YES-OR-NO EQUAL "N"
               DISPLAY "Answered NO.".
