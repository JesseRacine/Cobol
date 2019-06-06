      * Processes CSV File containing crash data
      * Some Information collected from 
      * http://queenofcobol.com/reading-a-csv-file/
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CSV-Loader.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT CSVCrashDataFile ASSIGN TO "crash-data.csv"
       ORGANIZATION IS LINE SEQUENTIAL.
       SELECT CrashDataFile ASSIGN TO "Crash-Data.dat"
       ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD CSVCrashDataFile.         
       01 CSVCrashRec.
       88 EndOfCSVFile VALUE HIGH-VALUES.   
       02 CSVCrashID PIC 9(5).
       02 CSVLoc PIC X(54).
       02 CSVRdFeature PIC X(34).
       02 CSVRdCharacter PIC X(23).
       02 CSVRdClass PIC X(23).
       02 CSVRDConfig PIC X(41).
       02 CSVRDSurface PIC X(16).
       02 CSVRDCond PIC X(24).
       02 CSVLightCond PIC X(26).
       02 CSVWeather PIC X(34).
       02 CSVTrafControl PIC X(35).
       02 CSVLat PIC X(12).
       02 CSVLong PIC X(12).
       02 CSVLat2 PIC X(10).
       02 CSVLong2 PIC X(10).
       02 CSVTract PIC X(4).
       02 CSVZone PIC X(4).
       02 CSVFatality PIC X(1).
       02 CSVInjury PIC X(1).
       02 CSVNumPass PIC X(3).
       02 CSVNumPed PIC X(1).
       02 CSVContrCir1 PIC X(38).
       02 CSVContrCir2 PIC X(38).
       02 CSVContrCir3 PIC X(38).
       02 CSVContrCir4 PIC X(38).
       02 CSVVehicle1 PIC X(36).
       02 CSVVehicle2 PIC X(36).
       02 CSVVehicle3 PIC X(36).
       02 CSVVehicle4 PIC X(36).
       02 CSVVehicle5 PIC X(36).
       02 CSVWorkArea PIC X(45).
       02 CSVRcds PIC 9(5).
       02 CSVCDate.
       03 CSVYear PIC 9(4).
       03 FILLER PIC X(1).
       03 CSVMONTH PIC 9(2).
       03 FILLER PIC X(1).
       03 CSVDOM PIC 9(2).
       02 CSVCTime.
       03 CSVTHour PIC 9(2).
       03 CSVTMin PIC 9(2).
       03 CSVTSec PIC 9(2).
       03 CSVTAM PIC 9.
       03 FILLER PIC X(3).
       02 CSVCDateTime PIC X(25).
       02 CSVGeoLoc PIC X(26).
       02 CSVTYear PIC 9(4).
       02 CSVFatalityBool PIC 9.
       02 CSVInjuryBool PIC 9.
       02 CSVTMonth PIC 99.
       02 CSVContrFac1 PIC X(72).
       02 CSVContrFac2 PIC X(80).
       02 CSVContrFac3 PIC X(82).
       02 CSVVehicleCat1 PIC X(69).
       02 CSVVehicleCat2 PIC X(83).
       02 CSVVehicleCat3 PIC X(87).
       02 CSVVehicleType PIC X(89).
       
       FD CrashDataFile.       
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
           OPEN INPUT CSVCrashDataFile.  
           OPEN OUTPUT CRashDataFile.         
           READ CSVCrashDataFile.
      * Throw out first entry because first entry is CSV Header   
           PERFORM UNTIL EndOfCSVFile                 
           READ CSVCrashDataFile
               AT END SET EndOfCSVFile To TRUE
           END-READ          
           UNSTRING CSVCrashRec DELIMITED BY ";"           
           INTO CrashID, Loc, RdFeature, RdCharacter, RdClass,
           RDConfig, RDSurface, RDCond, LightCond, Weather, TrafControl,
           Lat, Long, Lat2,Long2, Tract, Zone, Fatality, Injury, 
           NumPass, NumPed, ContrCir1, ContrCir2, ContrCir3, ContrCir4,
           Vehicle1, Vehicle2, Vehicle3, Vehicle4, Vehicle5, WorkArea, 
           Rcds, CDate,  CTime, 
           TAM, CDateTime, GeoLoc, TYear, FatalityBool, InjuryBool, 
           TMonth, ContrFac1, ContrFac2, ContrFac3, VehicleCat1, 
           VehicleCat2, VehicleCat3, VehicleType 
           WRITE CrashRec
           DISPLAY CrashID
           DISPLAY RdFeature
           END-PERFORM
           CLOSE CSVCrashDataFile.
           CLOSE CrashDataFile.
           STOP RUN.
