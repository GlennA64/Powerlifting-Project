#Get an initial summary of the dataset
summary(PLD)

#Take the columns we want
PLD <- PLD %>%
  select(Name, Sex, Equipment, Age, BodyweightKg, Best3BenchKg, Place, Tested, 
         Country, ParentFederation, Date, MeetCountry, Sanctioned)

#See how many unique individuals there are
length(unique(PLD$Name))

#See basic info on all variables
table(PLD$Sex)
table(PLD$Equipment)
table(PLD$Place)
table(PLD$Tested)
table(PLD$Sanctioned)
table(PLD$ParentFederation)
table(PLD$Country)
table(PLD$MeetCountry)
