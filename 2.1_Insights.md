Initial Insights:
>summary(PLD)
     Name               Sex               Event            Equipment              Age            AgeClass        
 Length:3301623     Length:3301623     Length:3301623     Length:3301623     Min.   : 0.0      Length:3301623    
 Class :character   Class :character   Class :character   Class :character   1st Qu.:20.5      Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :27.0      Mode  :character  
                                                                             Mean   :30.7                        
                                                                             3rd Qu.:38.0                        
                                                                             Max.   :98.0                        
                                                                             NA's   :1180291                     
 BirthYearClass       Division          BodyweightKg    WeightClassKg         Squat1Kg          Squat2Kg      
 Length:3301623     Length:3301623     Min.   : 10.00   Length:3301623     Min.   :-555.0    Min.   :-580.0   
 Class :character   Class :character   1st Qu.: 67.10   Class :character   1st Qu.:  90.0    1st Qu.:  82.5   
 Mode  :character   Mode  :character   Median : 81.80   Mode  :character   Median : 145.0    Median : 147.5   
                                       Mean   : 83.99                      Mean   : 116.0    Mean   : 101.0   
                                       3rd Qu.: 98.60                      3rd Qu.: 197.5    3rd Qu.: 202.5   
                                       Max.   :300.00                      Max.   : 555.0    Max.   : 577.5   
                                       NA's   :39855                       NA's   :2288939   NA's   :2298833  
    Squat3Kg          Squat4Kg        Best3SquatKg        Bench1Kg          Bench2Kg          Bench3Kg      
 Min.   :-600.5    Min.   :-550      Min.   :-508.0    Min.   :-635.5    Min.   :-635.5    Min.   :-575.0   
 1st Qu.:-150.0    1st Qu.: -82      1st Qu.: 122.5    1st Qu.:  57.5    1st Qu.:  30.0    1st Qu.:-130.0   
 Median : 120.0    Median : 130      Median : 170.0    Median : 102.1    Median :  95.0    Median : -57.5   
 Mean   :  42.5    Mean   :  76      Mean   : 173.1    Mean   :  83.6    Mean   :  58.2    Mean   : -13.7   
 3rd Qu.: 192.5    3rd Qu.: 195      3rd Qu.: 215.5    3rd Qu.: 140.0    3rd Qu.: 140.0    3rd Qu.: 115.0   
 Max.   : 595.0    Max.   : 592      Max.   : 595.0    Max.   : 551.0    Max.   : 521.6    Max.   : 635.5   
 NA's   :2324458   NA's   :3292727   NA's   :1060373   NA's   :1779358   NA's   :1796042   NA's   :1841218  
    Bench4Kg        Best3BenchKg     Deadlift1Kg       Deadlift2Kg       Deadlift3Kg       Deadlift4Kg     
 Min.   :-515      Min.   :-522.5   Min.   :-500.0    Min.   :-502.5    Min.   :-587.5    Min.   :-500     
 1st Qu.:-118      1st Qu.:  75.0   1st Qu.: 125.0    1st Qu.: 120.0    1st Qu.:-200.0    1st Qu.: -92     
 Median :  75      Median : 113.4   Median : 180.0    Median : 177.5    Median : 125.0    Median : 143     
 Mean   :  24      Mean   : 116.8   Mean   : 160.0    Mean   : 135.0    Mean   :  24.9    Mean   :  80     
 3rd Qu.: 150      3rd Qu.: 150.0   3rd Qu.: 222.5    3rd Qu.: 230.0    3rd Qu.: 207.5    3rd Qu.: 205     
 Max.   : 488      Max.   : 635.5   Max.   : 450.0    Max.   : 467.5    Max.   : 487.5    Max.   : 440     
 NA's   :3279803   NA's   :383637   NA's   :2163510   NA's   :2182727   NA's   :2225820   NA's   :3277339  
 Best3DeadliftKg     TotalKg          Place                Dots            Wilks         Glossbrenner   
 Min.   :-410.0   Min.   :   1.0   Length:3301623     Min.   :  0.68   Min.   :  0.67   Min.   :  0.64  
 1st Qu.: 140.0   1st Qu.: 205.0   Class :character   1st Qu.:150.88   1st Qu.:150.29   1st Qu.:141.99  
 Median : 188.2   Median : 357.5   Mode  :character   Median :299.76   Median :298.71   Median :278.31  
 Mean   : 188.7   Mean   : 378.8                      Mean   :277.14   Mean   :276.02   Mean   :259.77  
 3rd Qu.: 235.0   3rd Qu.: 533.0                      3rd Qu.:373.13   3rd Qu.:371.41   3rd Qu.:351.34  
 Max.   : 487.5   Max.   :1407.5                      Max.   :799.11   Max.   :793.33   Max.   :756.90  
 NA's   :879312   NA's   :220061                      NA's   :245392   NA's   :245392   NA's   :245392  
    Goodlift         Tested            Country             State            Federation        ParentFederation  
 Min.   :  0.5    Length:3301623     Length:3301623     Length:3301623     Length:3301623     Length:3301623    
 1st Qu.: 52.7    Class :character   Class :character   Class :character   Class :character   Class :character  
 Median : 64.4    Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
 Mean   : 64.5                                                                                                  
 3rd Qu.: 75.8                                                                                                  
 Max.   :176.1                                                                                                  
 NA's   :509938                                                                                                 
     Date           MeetCountry         MeetState           MeetTown           MeetName          Sanctioned       
 Length:3301623     Length:3301623     Length:3301623     Length:3301623     Length:3301623     Length:3301623    
 Class :character   Class :character   Class :character   Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character

So we can see that there are 3301623 observations.
There are 42 different variables, however, many are redundant and I will describe/group why below.
Event is not necessary as we are focusing on specific lifts, in this case bench, deadlift or squat.
Age class is not necessary as we have the age variable and missing values have already been cross checked and estimated from age class to age.
Similarly to above for Birth Year class.
Similarly to divison as well.
Weight class is almost already encoded into body weight and so is not necessary.
We will only be looking at the best squat/deadlift/bench a person commits so the 3-4 columns are redundant.
We do not need total as we will be comparing different lifts separately.
We do not need any metrics and these can be derived from data we are leaving in as well.
We do not need state as this is too specific given we already have country.
Same goes for Meet state, town and name.
We will not be keeping federation as parent federation covers it more broadly.

There are 861823 unique individuals in the dataset (with potential errors).
There are 860288 female entries and 2441247 male entries and 88 mx entries (which may be removed due to the small sample).
There are 125931 multi-ply entries, 1501773 raw entries, 1353597 single-ply, 76 straps, 105204 unlimited and 215042 wraps entries.
Some competitions have many people and so many places but in particular, 1712 DD (Doping), 200755 DQ (Disqualification), 10161 G (Guest) and 17594 NS (No show).
There are 2454934 tested entries where tested is drug tested and 846689 blank entries.
There are 3296814 sanctioned events which is an event recognised by an official federation and 4809 unsactioned.
There are 24 parent federations with 1211378 entries not coming from a parent federation.
There are many countries and meet countries, I have decided to map the data to match with rnaturalearth package countries as we will be producing plots based on the countries in that package. This means changes have been made to the data such as 'UK' being mapped to 'United Kingdom' to be recognised properly. There are 1414920 entries missing a birth country but there is no missing data for meet country.
The mapping was done in '1_Packages_and_Data.R'.
