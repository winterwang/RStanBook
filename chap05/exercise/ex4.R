library(rstan)

d <- read.csv(file='chap05/input/data-attendance-3.txt')
d_conv <- data.frame(X=c(1, 2, 3))
rownames(d_conv) <- c('A', 'B', 'C')
data <- list(I=nrow(d), A=d$A, Score=d$Score/200, WID=d_conv[d$Weather, ], Y=d$Y)

fit <- stan(file='chap05/exercise/ex4.stan', data=data, pars=c('b', 'bw2', 'bw3'), seed=1234)

# turn weather into dummy variables ---------------------------------------

d <- fastDummies::dummy_cols(d, select_columns = "Weather")
head(d)
data <- list(I=nrow(d), A=d$A, Score=d$Score/200, 
             W_A=d$Weather_A, W_B = d$Weather_B, W_C = d$Weather_C, 
             Y=d$Y)
fit1 <- stan(file='chap05/exercise/myex4.stan', data=data, pars=c('b'), seed=1234)

