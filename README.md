# Baseball_Visualization

library(ggplot2)
library(dplyr)
library(stringr)

'''
Halladay<-mutate(Halladay,
                 Foul_Ball=str_detect(description, "foul"),
                 Hit_Into_Play=str_detect(description, "hit"),
                 Swinging_Miss=str_detect(description, "swinging"),
                 Swing=Foul_Ball|Hit_Into_Play|Swinging_Miss)
'''
