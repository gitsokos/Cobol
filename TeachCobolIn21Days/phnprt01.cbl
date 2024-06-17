000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. PHNPRT01.
000400
000500
000600
000700 ENVIRONMENT DIVISION.
000800 INPUT-OUTPUT SECTION.
000900 FILE-CONTROL.
001000     SELECT OPTIONAL PHONE-FILE
001000*    SELECT PHONE-FILE
001100
001200         ASSIGN TO "phone.dat"
001300
001400         ORGANIZATION IS SEQUENTIAL.
001500
001600     SELECT PRINTER-FILE
001700         ASSIGN TO "PRINTER"
001800         ORGANIZATION IS LINE SEQUENTIAL.
001900
002000 DATA DIVISION.
002100 FILE SECTION.
002200 FD  PHONE-FILE
002300     LABEL RECORDS ARE STANDARD.
002400 01  PHONE-RECORD.
002500     05  PHONE-LAST-NAME      PIC X(20).
002600     05  PHONE-FIRST-NAME     PIC X(20).
002700     05  PHONE-NUMBER         PIC X(15).
002800     05  PHONE-EXTENSION      PIC X(5).
002900
003000 FD  PRINTER-FILE
003100     LABEL RECORDS OMITTED.
003200 01  PRINTER-RECORD           PIC X(80).
003300
003400 WORKING-STORAGE SECTION.
003500
003600
003700 01  FIELDS-TO-PRINT.
003800     05  FILLER               PIC X(4)  VALUE "Lst:".
003900     05  PRINT-LAST-NAME      PIC X(20).
004000     05  FILLER               PIC X(4)  VALUE "1st:".
004100     05  PRINT-FIRST-NAME     PIC X(20).
004200     05  FILLER               PIC X(3)  VALUE "NO:".
004300     05  PRINT-NUMBER         PIC X(15).
004400     05  FILLER               PIC X(4)  VALUE "Xtn:".
004500     05  PRINT-EXTENSION      PIC X(5).
004600
004700 01  END-OF-FILE              PIC X.
004800
004900 01  PRINT-LINES              PIC 99.
005000
005100 PROCEDURE DIVISION.
005200 MAIN-LOGIC SECTION.
005300 PROGRAM-BEGIN.
005400
005500     PERFORM OPENING-PROCEDURE.
005600     MOVE ZEROES TO PRINT-LINES.
005700     MOVE "N" TO END-OF-FILE.
005800     PERFORM READ-NEXT-RECORD.
005900     PERFORM PRINT-RECORDS
006000         UNTIL END-OF-FILE = "Y".
006100     PERFORM CLOSING-PROCEDURE.
006200
006300 PROGRAM-DONE.
006400     STOP RUN.
006500
006600 OPENING-PROCEDURE.
006700     OPEN INPUT PHONE-FILE.
006800     OPEN OUTPUT PRINTER-FILE.
006900
007000 CLOSING-PROCEDURE.
007100   CLOSE PHONE-FILE.
007200   MOVE SPACES TO PRINTER-RECORD.
007300   WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
007400   CLOSE PRINTER-FILE.
007500
007600 PRINT-RECORDS.
007700     PERFORM PRINT-FIELDS.
007800     PERFORM READ-NEXT-RECORD.
007900
008000 PRINT-FIELDS.
008100     IF PRINT-LINES = 5
008200         PERFORM NEW-PAGE.
008300     MOVE PHONE-LAST-NAME TO PRINT-LAST-NAME.
008400     MOVE PHONE-FIRST-NAME TO PRINT-FIRST-NAME.
008500     MOVE PHONE-NUMBER TO PRINT-NUMBER.
008600     MOVE PHONE-EXTENSION TO PRINT-EXTENSION.
008700     MOVE FIELDS-TO-PRINT TO PRINTER-RECORD.
008800     WRITE PRINTER-RECORD BEFORE ADVANCING 1.
008900
009000     ADD 1 TO PRINT-LINES.
009100
009200 READ-NEXT-RECORD.
009300     READ PHONE-FILE NEXT RECORD
009400         AT END
009500         MOVE "Y" TO END-OF-FILE.
009600
009700 NEW-PAGE.
009800     MOVE SPACE TO PRINTER-RECORD.
009900     WRITE PRINTER-RECORD BEFORE ADVANCING PAGE.
010000     MOVE ZEROES TO PRINT-LINES.

