# You’re doing an experiment counting every day how many molds you see in your cell cultures. Create a vector molds containing the results of your counts: 1,2,5,8,10
# Let’s assume the experiment started on a Monday. Create a vector days containing the days of the week (from Monday to Friday).
# Set the names of molds as days and extract the number of molds identified on Wednesday,
# Create a data frame molds_study and label variable days as Time and variable molds as Molds_count.

molds <- c(1,2,5,8,10)
days <-  c("Monday","Tuesday","Wednesday","Thursday","Friday")
molds_study <- data.frame("Time" = days, "Molds_count" = molds)

# Create a vector named x containing the numbers 20 to 2. Retrieve elements that are larger than 5 and smaller than 15.
# Remove the first 8 elements from x and store the result in x2.

x <- 20:2
x
x[x > 5 & x < 15]
x2 <- x[-(1:8)]

# Referring to elements of a data frame
# On which days did we observe more than 2 molds

select <- molds_study$Molds_count > 2
select
molds_study$Time[select]

# Change label of molds count by molds_test

names(molds_study)[2] <- "molds_test"
molds_study

# You repeat the molds study experiment with the following numbers of molds counted : 1, 6, 6, 5, 4. Add this as a third column to the data frame

molds_study$molds_2 <- c(1,6,6,5,4)
molds_study

# Relabel the 3 columns as "Day", "Molds_1" and "Molds_2"

names(molds_study)[1:3] <- c("Day", "Molds_1", "Molds_2")
molds_study

# Calculate for each experiment the total number of molds counted. Check if the first experiment counted more molds than the second one. Use the sum function.

total1 <- sum(molds_study$Molds_1)
total2 <- sum(molds_study$Molds_2)
total1 > total2


