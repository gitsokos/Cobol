000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. DAY2.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION.
000410 WORKING-STORAGE SECTION.
000412 01  FIRST-NUMBER     PIC 99.
000414 01  SECOND-NUMBER    PIC 99.
000416 01  THE-RESULT       PIC 999.
000420 01  THE-NAME         PIC X(10).
000422 01  LONG-MSG         PIC X(80)
             VALUE
             "12345678 112345678 21234567
000423-      "8 312345678 412345678 512345678 612345678 7".
000500 PROCEDURE DIVISION.
000501 
000600 PROGRAM-BEGIN.
000610*    DISPLAY "Enter first.".
000612*    ACCEPT  FIRST-NUMBER.
000614*    DISPLAY "Enter second.".
000616*    ACCEPT  SECOND-NUMBER.
000620*    COMPUTE THE-RESULT = FIRST-NUMBER + SECOND-NUMBER.
000630*    DISPLAY "The result:" THE-RESULT.
000640*    DISPLAY THE-RESULT.
000650     MOVE "123 56 89012345" TO THE-NAME.
000651     DISPLAY "[" THE-NAME "]".
000660     MOVE 123 to FIRST-NUMBER.
000661     DISPLAY FIRST-NUMBER.
000670     DISPLAY "[" LONG-MSG "]".
000700
000800 PROGRAM-DONE.
000900     STOP RUN.