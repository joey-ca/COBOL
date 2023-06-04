      ******************************************************************
      * Author: Guannan Zhao
      * Date: May 29, 2023
      * Purpose: Write Student Records to a file from the data fields
      * entered by the user.
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITE-STUDENT-RECORD.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE-OUT ASSIGN TO "./STUDENTFILE.TXT"
                ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD STUDENT-FILE-OUT.
       01 STUDENT-RECORD.
           05 STUDENT-NUMBER PIC 9(7).
           05 TUITION-OWED PIC 9(5).
           05 STUDENT-NAME PIC X(40).
       WORKING-STORAGE SECTION.
       01 CONTROL-FIELDS.
           05 EOF-FLG PIC X.
       PROCEDURE DIVISION.
       100-CREATE-STUDENT-RECORDS.
           PERFORM 201-INITIATE-STUDENT-RECORD-CREATION-JOB.
           PERFORM 202-CREATE-ONE-STUDENT-RECORD UNTIL EOF-FLG='N'.
           PERFORM 203-CLOSE-STUDENT-FILE.
           STOP RUN.

       201-INITIATE-STUDENT-RECORD-CREATION-JOB.
           OPEN OUTPUT STUDENT-FILE-OUT.
           DISPLAY "DO YOU WANT TO ADD A NEW RECORD?(Y/N) ".
           ACCEPT EOF-FLG.

       202-CREATE-ONE-STUDENT-RECORD.
           DISPLAY "PLEASE ENTER STUDENT NUMBER: ".
           ACCEPT STUDENT-NUMBER.

           DISPLAY "PLEASE ENTER TUITION OWED: ".
           ACCEPT TUITION-OWED.

           DISPLAY "PLEASE ENTER STUDENT NAME: ".
           ACCEPT STUDENT-NAME.

           WRITE STUDENT-RECORD.

           DISPLAY "DO YOU WANT TO ADD A NEW RECORD?(Y/N) ".
           ACCEPT EOF-FLG.

       203-CLOSE-STUDENT-FILE.
           CLOSE STUDENT-FILE-OUT.

       END PROGRAM WRITE-STUDENT-RECORD.
