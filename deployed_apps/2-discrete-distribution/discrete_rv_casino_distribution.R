library(ggplot2)
library(ggthemes)

# define number of games and a set of 3 red, 2 blue balls
games = 75
balls <- c(1, 1, 1, 0, 0)

number_of_red_balls <- vector(mode = "integer", length = games)

# choose 4 balls 'games' number of times
for (n in 1:games){
  s = sample(balls, 4, replace = T)
  number_of_red_balls[n] <- sum(s)
}

number_of_red_balls
table(number_of_red_balls)


qplot(number_of_red_balls)  + 
  xlab("Number of red balls") + ylab("Count") + 
  ggtitle("Distribution of X = Number of Red Balls")

mean(number_of_red_balls)

