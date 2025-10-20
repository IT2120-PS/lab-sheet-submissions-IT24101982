setwd("C:\\IT24101982 Lab 10")
getwd()
observed <- c(A =120, B = 95, C = 85, D = 100)
# i) State the hypothses
cat("i) Hypotheses:\n")
cat("H0: Customers choose A, B, C, D equally (p_A = p_B = p_C = P_D =0.25)\n")
cat("H1: The choice probabilities are not all equal (some p_i !=0.25)\n")

# ii) Apply chi-square goodness-pf-fit test
total <- sum(observed)
expected <- rep(total / 4, 4)

cat("Observed counts:\n"); print(observed)
cat("Expected counts under H0 (each = total/4):\n");print(expected); cat("\n")

# Use built-in chi-square test
chisq_test <- chisq.test(x = observed, p = rep(0.25,4))

# Display test output
cat("ii) Chi-square test result (chisq.test):\n")
print(chisq_test)
cat("\n")

# Manual calculation (same result)
Chisq_manual <- sum((observed - expected)^2 / expected)
df <- length(observed) - 1
p_value_manual <- pchisq(Chisq_manual, df = df, lower.tail = FALSE)

cat("Manual chi-square calculation:\n")
cat(sprintf("Chi-square = %.4f, df = %d, p-value = %.4f\n\n",Chisq_manual, df, p_value_manual))

# iii) Conclusion for results

#At the 5% significance level (α = 0.05), the p-value is greater than 0.05, so we do not have enough evidence to reject the null hypothesis.
#This means the data do not show a significant difference from equal snack perference - customers apper to chooseA, B, C, and D roughly equally.
#However, at the 10% level (α = 0.10), the p-value is slightly smaller than 0.10, which suggests weak or marginal evidence that customers may perfer some snacks more than others.