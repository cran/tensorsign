% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/signT.R
\name{SignT}
\alias{SignT}
\title{Signal tensor estimation from a noisy and incomplete data tensor based on nonparametric tensor method via sign series.}
\usage{
SignT(Y,truer,H,Lmin,Lmax,option = 1)
}
\arguments{
\item{Y}{A given (possibly noisy and incomplete) data tensor.}

\item{truer}{Sign rank of the signal tensor.}

\item{H}{Resolution parameter.}

\item{Lmin}{Minimum value of the signal tensor (or minimum value of the tensor Y).}

\item{Lmax}{Maximum value of the signal tensor (or maximum value of the tensor Y).}

\item{option}{A large margin loss to be used. Use logistic loss if \code{option} = 1, hinge loss if \code{option} = 2. Logistic loss is default.}
}
\value{
The returned object is a list of components.

\code{fitted} - A series of optimizers that minimize the weighted classification loss at each pi.

\code{est} - An estimated signal tensor based on nonparametic tensor method via sign series.
}
\description{
Estimate a signal tensor from a noisy and incomplete data tensor using nonparametric tensor method via sign series.
}
\examples{
library(rTensor)
indices = c(2,3,4)
noise = rand_tensor(indices)@data
Theta = array(runif(prod(indices),min=-3,max = 3),indices)

# The signal plus noise model
Y = Theta + noise

# Estimate Theta from nonparametic completion method via sign series
hatTheta = SignT(Y,truer = 3,H = 3,Lmin = -3,Lmax = 3, option =1)
print(hatTheta$est)

}
\references{
Lee, C., & Wang, M. (2021). Beyond the Signs: Nonparametric Tensor Completion via Sign Series. \emph{arXiv preprint arXiv:2102.00384}.
}
