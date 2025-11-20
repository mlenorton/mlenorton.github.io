# birthday simulation

# Q1: what is the probability that exactly 9 out of 18 kids share a birthday month
# i.e. for X ~ Bin(18,1/12), what is P(X = 9)?
choose(18,9)*((1/12)^9)*((11/12)^9)*12  # 5.167351e-05

n_sim = 100000
total_wins <- 0
for (s in 1:n_sim) {
all_bdays <- floor(runif(18, min = 1, max = 13))
win <- ifelse(max(table(all_bdays))==9,1,0)
total_wins <- total_wins + win
}

freq = total_wins/n_sim

# Q2: Given that we know Ebbie's birthday is in November, what is the probability
# that exactly 8 other children out of 17 also have a November birthday?
choose(17,8)*((1/12)^8)*((11/12)^9) # 2.583675e-05

n_sim = 100000
total_wins <- 0
for (s in 1:n_sim) {
  all_bdays <- sample(1:12,17,replace = TRUE)
  win <- ifelse(length(which(all_bdays==11))==8,1,0)
  total_wins <- total_wins + win
}

freq = total_wins/n_sim