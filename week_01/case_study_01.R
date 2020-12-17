data(iris)
mean(iris$Petal.Length)
hist(iris$Petal.Length,
     main="Histogram for Petal Length",
     xlab="Petal Length",
     border="blue",
     col="green",
     xlim=c(1,7),
     ylim=c(0,40),
     las=1)
