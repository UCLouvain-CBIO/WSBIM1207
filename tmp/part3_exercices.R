# Load the "clinical1.csv" file
clinical <- read.csv("clinical1.csv")

# Inspect the data using str() and View()
View(clinical)
str(clinical)

# How many cases (or patients) are recorded in the table ?
# 516

# Print the columns names of the dataframe
names(clinical)
colnames(clinical) # idem

# Create a smaller data frame called "clinical_mini" containing only the columns corresponding to
# patientID, gender, age_at_diagnosis, smoking_history. 
# Try to do this using different ways (using column indexes, or column names for example)
clinical_mini <- clinical[, c(1, 3, 4, 12)]
clinical_mini <- clinical[, c("patientID", "gender", "age_at_diagnosis", "smoking_history")]

# Inspect the smoking_history column, how many categories are recorded ?
levels(clinical_mini$smoking_history)

# Use the plot function to roughly estimate the number of males and females
plot(clinical_mini$gender)

# The column age at diagnosis is recorded in days.
# Create a new column "years_at_diagnosis" corresponding to the age at diagnosis converted in years
clinical_mini$years_at_diagnosis <- clinical_mini$age_at_diagnosis / 365

# Calculate the mean and median age at diagnosis (pay attention to missing values!)
mean(clinical_mini$years_at_diagnosis, na.rm = TRUE)
median(clinical_mini$years_at_diagnosis, na.rm = TRUE)

# Use the quantile() function to calculate the first and last quartile of age at diagnosis
# Use the help function (?quantile) to see how to use the quantile() function
?quantile
quantile(clinical_mini$years_at_diagnosis, 0.25, na.rm = TRUE)
quantile(clinical_mini$years_at_diagnosis, 0.75, na.rm = TRUE)

# use the summary() function to confirm your previous results
summary(clinical_mini$years_at_diagnosis)

