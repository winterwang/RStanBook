//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

data {
  int I;
  int<lower=0, upper=1> A[I];
  real<lower=0, upper=1> Score[I];
  int<lower=0, upper=1> W_B[I];
  int<lower=0, upper=1> W_C[I];
  int<lower=0, upper=1> Y[I];
}

// The parameters accepted by the model. 
parameters {
  real b[5];
}

// The model to be estimated. 
model {
   for (i in 1:I)
    Y[i] ~ bernoulli_logit(b[1] + b[2]*A[i] + b[3]*Score[i] + b[4]*W_B[i] + b[5]*W_C[i]);
}

