library(ggplot2)
library(dplyr)
library(stringr)


Halladay<-read.csv("~/Desktop/MATH 2270/Assignment 2 Data 2.csv")

#Assign Outcomes to Swings
Halladay<-mutate(Halladay,
                 Foul_Ball=str_detect(description, "foul"),
                 Hit_Into_Play=str_detect(description, "hit"),
                 Swinging_Miss=str_detect(description, "swinging"),
                 Swing=Foul_Ball|Hit_Into_Play|Swinging_Miss)

#Define Strike Zone
TopStrikeZone <- 3.5
BotStrikeZone <- 1.5
LeftStrikeZone <- -0.85
RightStrikeZone <- 0.85
StrikeZone <- data.frame(
  x=c(LeftStrikeZone, LeftStrikeZone, RightStrikeZone, RightStrikeZone, LeftStrikeZone),
  y=c(BotStrikeZone, TopStrikeZone, TopStrikeZone, BotStrikeZone, BotStrikeZone))


ggplot(Halladay, aes(plate_x,plate_z,color=Swinging_Miss))+
  geom_point(alpha=.45)+
  facet_wrap(~pitch_type,ncol = 2)+
  facet_wrap(~ pitch_type, ncol=2) +
  scale_colour_manual(values = c("gray50", "blue2"),
                      guide = guide_legend(title = "Swing Outcome"),
                      labels=c("Contact","Miss")) +
  theme(strip.text = element_text(size = rel(1.2),hjust=0.5,color = "black"))+
  ggtitle("Roy Halladay Opponent Swing Outcomes by Pitch Type for 
          2010 MLB Season (Using PITCHF/x Data Sourced from baseballsavant.mlb.com)")+
  theme(plot.title = element_text(hjust = 0.5))+
  labs(y="Vertical Location", x="Horizontal Location")+
  theme(axis.title.y = element_text(angle=0, vjust = .5))+
  xlim(-2, 2) + ylim(-0.5, 5)+
  geom_path(aes(x,y),data = StrikeZone,lwd=1,col="black")