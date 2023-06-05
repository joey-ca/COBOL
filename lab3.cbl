      ******************************************************************
      * Author: Guannan Zhao
      * Date: May 25, 2023
      * Purpose: Demonstration of the usage of PROCEDURE DIVISION to read
      * records from a file
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-CAR-FILE.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CAR-FILE-IN ASSIGN TO "./CARFILE.TXT"
                ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD CAR-FILE-IN.
       01 CAR-RECORD-IN.
           05 CAR-MODEL PIC X(15).
           05 CAR-DATA.
               10 ENGINE PIC X(25).
               10 TOWING-CAPACITY PIC 9(8).
               10 OWNER-NAME PIC X(30).
       WORKING-STORAGE SECTION.
       01 CONTROL-FIELDS.
           05 EOF-FLG PIC X.
       PROCEDURE DIVISION.
       100-PRODUCE-CAR-LIST.
           PERFORM 201-INITIATE-CAR-LIST.
           PERFORM 202-DISPLAY-ONE-CAR-RECORD UNTIL EOF-FLG EQUALS 'Y'.
           PERFORM 203-CLOSE-CAR-FILE.
           STOP RUN.
       201-INITIATE-CAR-LIST.
           OPEN INPUT CAR-FILE-IN.
           READ CAR-FILE-IN
               AT END MOVE 'Y' TO EOF-FLG.
       202-DISPLAY-ONE-CAR-RECORD.
           DISPLAY CAR-MODEL.
           READ CAR-FILE-IN
               AT END MOVE 'Y' TO EOF-FLG.
       203-CLOSE-CAR-FILE.
           CLOSE CAR-FILE-IN.
       END PROGRAM READ-CAR-FILE.
