getwd()
setwd("C:\\Users\\it24101982\\Desktop\\IT24101982")
getwd()
##exercise

# Import the dataset
Delivery_Times <- read.table("Exercise - Lab 05.txt", header = TRUE)

# Draw histogram with 9 class intervals (20 to 70, right open)
hist(Delivery_Times$Time, breaks = seq(20, 70, length.out = 10), right = FALSE, 
     main = "Histogram of Delivery Times", xlab = "Delivery Time", ylab = "Frequency")

# Comment on the shape (to be added as a screenshot in Word doc)
# The distribution appears to be [shape description, e.g., skewed right, to be observed from histogram]

# Draw cumulative frequency polygon (ogive)
times <- Delivery_Times$Time
breaks <- seq(20, 70, length.out = 10)
h <- hist(times, breaks = breaks, plot = FALSE)
plot(h$mids, cumsum(h$counts), type = "l", main = "Cumulative Frequency Polygon", 
     xlab = "Delivery Time", ylab = "Cumulative Frequency", ylim = c(0, length(times)))
