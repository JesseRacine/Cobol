      * Processes the Cobol dat file created by the CSV-loader.cob
      * file. Sorts the file by crash ID number. Writes new sorted
      * file called sorted.dat
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Sorter.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT DataFile ASSIGN TO "crash-data.dat"
       ORGANIZATION IS LINE SEQUENTIAL.

       SELECT WorkFile ASSIGN TO "work.tmp".

       SELECT SortedFile ASSIGN TO "sorted.dat"
           ORGANIZATION IS LINE SEQUENTIAL.
     
       DATA DIVISION.
       FILE SECTION.
       SD WorkFile.
       01 WorkRecord.
       02 WorkCrashID PIC 9(5).
       02 FILLER PIC X(1391).

       FD DataFile.
       01 DF PIC X(1396).

       FD SortedFile.               
       01 CrashRec.
       02 CrashID PIC 9(5).
       02 Loc PIC X(54).
       02 RdFeature PIC X(34).
       02 RdCharacter PIC X(23).
       02 RdClass PIC X(23).
       02 RDConfig PIC X(41).
       02 RDSurface PIC X(16).
       02 RDCond PIC X(24).
       02 LightCond PIC X(26).
       02 Weather PIC X(34).
       02 TrafControl PIC X(35).
       02 Lat PIC X(12).
       02 Long PIC X(12).
       02 Lat2 PIC X(10).
       02 Long2 PIC X(10).
       02 Tract PIC X(4).
       02 Zone PIC X(4).
       02 Fatality PIC X(1).
       02 Injury PIC X(1).
       02 NumPass PIC X(3).
       02 NumPed PIC X(1).
       02 ContrCir1 PIC X(38).
       02 ContrCir2 PIC X(38).
       02 ContrCir3 PIC X(38).
       02 ContrCir4 PIC X(38).
       02 Vehicle1 PIC X(36).
       02 Vehicle2 PIC X(36).
       02 Vehicle3 PIC X(36).
       02 Vehicle4 PIC X(36).
       02 Vehicle5 PIC X(36).
       02 WorkArea PIC X(45).
       02 Rcds PIC 9(5).
       02 CDate.
       03 Year PIC 9(4).
       03 FILLER PIC X(1).
       03 MONTH PIC 9(2).
       03 FILLER PIC X(1).
       03 DOM PIC 9(2).
       02 CTime.
       03 THour PIC 9(2).
       03 TMin PIC 9(2).
       03 TSec PIC 9(2).
       03 TAM PIC 9.
       03 FILLER PIC X(3).
       02 CDateTime PIC X(25).
       02 GeoLoc PIC X(26).
       02 TYear PIC 9(4).
       02 FatalityBool PIC 9.
       02 InjuryBool PIC 9.
       02 TMonth PIC 99.
       02 ContrFac1 PIC X(72).
       02 ContrFac2 PIC X(80).
       02 ContrFac3 PIC X(82).
       02 VehicleCat1 PIC X(69).
       02 VehicleCat2 PIC X(83).
       02 VehicleCat3 PIC X(87).
       02 VehicleType PIC X(89).

       PROCEDURE DIVISION.
       Begin.
           SORT WorkFile ON ASCENDING KEY WorkCrashID
               USING DataFile GIVING SortedFile
               DISPLAY "Sort Successful"
           STOP RUN.


   
