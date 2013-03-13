\name{hsicCCA}
\alias{hsicCCA}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Canonical Correlation Analysis based on the Hilbert-Schmidt Independence Criterion.
}
\description{
Given two multi-dimensional data sets, find pairs of canonical projection pairs that maximize the HSIC criterion.
}
\usage{
hsicCCA(x, y, M, sigmax = NULL, sigmay = NULL, numrepeat = 5, numiter = 100, reltolstop = 1e-04)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
The x-variable data matrix. One row per observation.
}
  \item{y}{
The y-variable data matrix. One row per observation.
}
  \item{M}{
Number of canonical projection pairs to extract.
}
  \item{sigmax}{
The bandwidth parameter for the Gaussian kernel on the x-variable set. A positive value. The smaller the smoother. If NULL, set to median(dist(x)), and will be updated automatically for extracting different pairs of canonical projection.
}
  \item{sigmay}{
The bandwidth parameter for the Gaussian kernel on the y-variable set. A positive value. The smaller the smoother. If NULL, set to median(dist(y)), and will be updated automatically for extracting different pairs of canonical projection.
}
  \item{numrepeat}{
Number of random restarts.
}
  \item{numiter}{
Maximum number of iterations for extracting each pair of canonical projections.
}
  \item{reltolstop}{
Convergence threshold. Algorithm stops when relative change in cost from consecutive iterations is less than the threshold and will then move on to find the next pair of canonical vectors.
}
}
\details{
Optimization is done by gradient descent, where Nelder-Mead is used for step-size selection. Nelder Mead may fail to increase the cost at times (when stuck at local minima). User may consider restarting the algorithm when this happens.
}
\value{
A list containing:
\item{Wx }{The M canoncial projection vectors for the x-variable set. Each column corresponds to a projection vector.}
\item{Wy }{The M canoncial projection vectors for the y-variable set. Each column corresponds to a projection vector.}
%% ...
}
\references{
Chang et. al. (2013) Canonical Correlation Analysis based on Hilbert-Schmidt Independence Criterion and Centered Kernel Target Alignment. ICML 2013.

Gretton et. al. (2005) Measuring statistical dependence with Hilbert-Schmidt Norm. In Algorithmic Learning Theory 2005.
}
\author{
Billy Chang
}
\note{
Current implementation is slow and requires high storage for large sample data. Sample size > 2000 not recommended.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{ktaCCA}}, \code{\link{hsicCCAfunc}}
}
\examples{
set.seed(1)
numData <- 100
numDim <- 3
x <- matrix(rnorm(numData*numDim),numData,numDim)
y <- matrix(rnorm(numData*numDim),numData,numDim)
z <- runif(numData,-pi,pi)
y[,1] <- cos(z)+rnorm(numData,sd=0.1); x[,1] <- sin(z)+rnorm(numData,sd=0.1)
y[,2] <- x[,2]+rnorm(numData,sd=0.5)
x <- scale(x)
y <- scale(y)

fit <- hsicCCA(x,y,2,numrepeat=2,numiter=10)
par(mfrow=c(1,2))
for (K in 1:2) plot(x\%*\%fit$Wx[,K],y\%*\%fit$Wy[,K])
}
