library(ggplot2)

trials = 75
balls <- c(1, 1, 1, 0, 0)
number_of_red_balls <- vector(mode = "integer", length = trials)

for (n in 1:trials){
  s = sample(balls, 4, replace = T)
  number_of_red_balls[n] <- sum(s)
  
}

number_of_red_balls
t = table(number_of_red_balls)/trials
t
qplot(number_of_red_balls) + theme_tufte() + 
  xlab("Number of red balls") + ylab("Count")

mean(number_of_red_balls)

# # sampling distribution
# probs <- c(0.0256, 0.1536, 0.3456, 0.3456, 0.1296)
# plot(probs, type = "h")
# ?plot
