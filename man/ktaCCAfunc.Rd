\name{ktaCCAfunc}
\alias{ktaCCAfunc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Canonical Correlation Analysis based on the centered kernel target alignment.
}
\description{
Given two multi-dimensional data sets, find a pair of canonical projection pairs that maximizes the kernel alignment criterion. Called by ktaCCA, and intended for internal use, but users may play with it for potential finer controls. 
}
\usage{
ktaCCAfunc(x, y, Wx = NULL, Wy = NULL, sigmax, sigmay, numiter = 20, reltolstop = 1e-04)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
The x-variable data matrix. One row per observation.
}
  \item{y}{
The y-variable data matrix. One row per observation.
}
  \item{Wx}{
Initial projection vector for the x data set. Randomly set if NULL.
}
  \item{Wy}{
Initial projection vector for the y data set. Randomly set if NULL.
}
  \item{sigmax}{
The bandwidth parameter for the Gaussian kernel on the x-variable set. A positive value. The smaller the smoother.
}
  \item{sigmay}{
The bandwidth parameter for the Gaussian kernel on the y-variable set. A positive value. The smaller the smoother.
}
  \item{numiter}{
Maximum number of iterations.
}
  \item{reltolstop}{
Convergence threshold. Algorithm stops when relative changes in cost from consecutive iterations is less than the threshold.
}
}
\details{
Optimization is done by gradient descent, where Nelder-Mead is used for step-size selection. Nelder Mead may fail to increase the cost at times (when stuck at local minima). User may consider restarting the algorithm when this happens.
}
\value{
A list containing:
\item{Wx }{The canoncial projection vector for the x-variable set. }
\item{Wy }{The canoncial projection vector for the y-variable set. }
\item{cost }{A vector of (negative) cost values at each iteration.}
}
\references{
Chang et. al. (2013) Canonical Correlation Analysis based on Hilbert-Schmidt Independence Criterion and Centered Kernel Target Alignment. ICML 2013.

Cortes et. al. (2012) Algorithms for learning kernels based on centered alignments. JMLR 13:795-828.
}
\author{
Billy Chang
}
\note{
Current implementation is slow and requires high storage for large sample data. Sample size > 2000 not recommended.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{ktaCCA}}
}
\examples{
set.seed(10)
numData <- 100
numDim <- 2
x <- matrix(rnorm(numData*numDim),numData,numDim)
y <- matrix(rnorm(numData*numDim),numData,numDim)
z <- runif(numData,-pi,pi)
y[,1] <- cos(z)+rnorm(numData,sd=0.1); x[,1] <- sin(z)+rnorm(numData,sd=0.1)
x <- scale(x)
y <- scale(y)

fit <- ktaCCAfunc(x,y,sigmax=1,sigmay=1)
plot(x\%*\%fit$Wx,y\%*\%fit$Wy)
}
