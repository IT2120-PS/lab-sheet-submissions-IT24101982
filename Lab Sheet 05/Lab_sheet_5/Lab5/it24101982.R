getwd()
setwd("C:\\Users\\it24101982\\Desktop\\Lab5")
getwd()
## Setting the director

## Importing the data set
data <- read.table("Data.txt", header = TRUE, sep = ",")

## View the file in a separate window
fix(data)
# Close the data window before you run the rest of the commands.
# Otherwise, the rest of the commands won't run.

## Attach the file into R so you can call the variables by their names
attach(data)

##2
## Part 1

## Rename the variables (column headings) of the data set as x1 and x2
names(data) <- c("x1", "x2")

## Attach the file into R again as we renamed the variables
attach(data)

## Obtain histogram for number of shareholders
hist(x2, main = "Histogram for Number of Shareholders", xlab = "Number of Shareholders", col = "lightblue", border = "black")

## Part 2

# Using "breaks" we can define the number of classes in the histogram,
# along with the lower and upper limits.
# Using "right" we can define whether intervals are closed on the right or not.

hist(x2, 
     main = "Histogram for Number of Shareholders", 
     breaks = seq(130, 270, length.out = 8), 
     right = FALSE, 
     xlab = "Number of Shareholders", 
     col = "lightgreen", 
     border = "darkgreen")

# To check how each argument inside the "hist" function works, use:
help(hist)

##3


## Part 3

# Create histogram object to extract components
histogram <- hist(x2, 
                  breaks = seq(130, 270, length.out = 8), 
                  right = FALSE, 
                  plot = FALSE)

# Assign class limits of the frequency distribution into a variable called "breaks"
breaks <- round(histogram$breaks)

# Assign class frequencies of the histogram into a variable called "freq"
freq <- histogram$counts

# Assign midpoints of each class into a variable called "mids"
mids <- histogram$mids

# Create a variable called "classes" for the frequency distribution
classes <- paste(head(breaks, -1), "-", tail(breaks, -1))
##4

## Part 4

# Draw frequency polygon on the same histogram plot
hist(x2, 
     breaks = seq(130, 270, length.out = 8), 
     right = FALSE, 
     main = "Histogram with Frequency Polygon", 
     xlab = "Number of Shareholders", 
     col = "lightgray", 
     border = "black")

lines(mids, freq, type = "l", col = "blue", lwd = 2)

# Draw frequency polygon in a new plot
plot(mids, freq, 
     type = "l", 
     main = "Frequency Polygon for Shareholders", 
     xlab = "Number of Shareholders", 
     ylab = "Frequency", 
     ylim = c(0, max(freq) + 5), 
     col = "red", 
     lwd = 2)
##5

## Part 5
## Using "cumsum" command to get cumulative frequencies
freq <- c(5, 10, 15, 20)              # Example frequency data
breaks <- c(0, 10, 20, 30, 40)        # Class boundaries (e.g., histogram breaks)
cum.freq <- cumsum(freq)             # Cumulative frequencies

## Creating a new vector to store cumulative frequencies
new <- c(0, cum.freq)                # Start with 0 for the first break

## Draw cumulative frequency polygon (Ogive)
plot(breaks, new, type = 'l',        # 'l' for line plot
     main = "Cumulative Frequency Polygon for Shareholders",
     xlab = "Shareholders",
     ylab = "Cumulative Frequency",
     ylim = c(0, max(new)))

## Create a table of upper class limits and cumulative frequencies
ogive_table <- cbind(Upper_Breaks = breaks, CumFreq = new)
print(ogive_table)

##Exercise 5



