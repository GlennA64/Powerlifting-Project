#Get an initial summary of the dataset
summary(PLD)

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

#Take the columns we want and filter for data with integrity
PLD <- PLD %>%
  filter(Tested == "Yes") %>%
  filter(Sanctioned == "Yes") %>%
  select(Name, Sex, Equipment, Age, BodyweightKg, Best3BenchKg, Place, 
         Country, ParentFederation, Date, MeetCountry)
