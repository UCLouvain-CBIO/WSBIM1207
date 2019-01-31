load("clinical.rda")

# Inspect the data using str() and View()
View(clinical)
str(clinical)
# How many cases (or patients) are listed in the table ?
#585

# Print the columns names of the dataframe ?
names(clinical)
colnames(clinical) # idem

# Create a smaller data frame called "clinical_mini" containing only the columns corresponding to
# submitter_id, gender, tumor_stage, age_at_diagnosis. 
# Try to do this using different ways (using column indexes, or column names for example)
clinical_mini <- clinical[, c(2, 4, 12, 13)]
clinical_mini <- clinical[, c("submitter_id", "gender", "tumor_stage", "age_at_diagnosis")]
str(clinical_mini)

# Inspect the clinical_mini dataframe: how are recorded missing values ?
# NB: 2 differents labels are used (tip: inspect carefully the line 380)
# Is it a good way to record missing values? Why ?
# Rename these labels to something more meaningful
clinical_mini[380,]
clinical_mini[clinical_mini == '--'] <- 'NA'
clinical_mini[clinical_mini == 'not reported'] <- 'NA'
clinical_mini[clinical_mini == '--' | clinical_mini == 'not reported'] <- NA # alternatively you could replace directly both labels


# Transform the column "gender" into a factor, look at the levels
clinical_mini$gender <- as.factor(clinical_mini$gender)
levels(clinical_mini$gender)

# Use the plot function to roughly estimate the number of males and females
plot(clinical_mini$gender)

# What is the structure of the colum "age_at_diagnosis" and does it makes sense? 
str(clinical_mini$age_at_diagnosis)

# Convert the column "age_at_diagnosis" into a numeric vector
clinical_mini$age_at_diagnosis <- as.numeric(clinical_mini$age_at_diagnosis)
str(clinical_mini)

# Create a new column "years_at_diagnosis" corresponding to the age at diagnosis converted in years (instead of in days)
clinical_mini$years_at_diagnosis <- clinical_mini$age_at_diagnosis / 365
str(clinical_mini)

# Calculate the mean and median age at diagnosis (in years)
mean(clinical_mini$years_at_diagnosis, na.rm = TRUE)
median(clinical_mini$years_at_diagnosis, na.rm = TRUE)

# use the summary() function to confirm your previous results
summary(clinical_mini$years_at_diagnosis)

# Use the quantile() function to calculate the first and last quartile of years_at_diagnosis
# Use the help function (?quantile) to see how to use the quantile() function
?quantile
quantile(clinical_mini$years_at_diagnosis, 0.25, na.rm = TRUE)
quantile(clinical_mini$years_at_diagnosis, 0.25, na.rm = TRUE)

