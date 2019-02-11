library("tidyverse")

# Create the tibble called "clinical" from the clinical.csv file
clinical <- read_csv("clinical1.csv")

# Inspect the data
clinical
str(clinical)

# Create a smaller data frame called "clinical_mini" containing only the columns corresponding to
# patientID, gender, age_at_diagnosis, smoking_history, number_pack_years_smoked, year_of_tobacco_smoking_onset,
# and stopped_smoking_year .
clinical_mini <- clinical %>%
  select(patientID, gender, age_at_diagnosis, smoking_history, number_pack_years_smoked, year_of_tobacco_smoking_onset, stopped_smoking_year)
clinical_mini

# Calculate the number of males and females in the cohort
clinical_mini %>%
  group_by(gender) %>%
  count()

# Create a new column "years_at_diagnosis" corresponding to the age at diagnosis converted in years (instead of in days)
clinical_mini <- clinical_mini %>%
  mutate(years_at_diagnosis = age_at_diagnosis / 365)
clinical_mini

# Calculate the mean and median age at diagnosis (in years)
# ! pay attention to missing values !
clinical_mini %>%
  summarize(mean = mean(years_at_diagnosis, na.rm = TRUE), median = median(years_at_diagnosis, na.rm = TRUE))

clinical_mini %>%
  filter(!is.na(years_at_diagnosis)) %>% # idem but removing NA values before
  summarise(mean = mean(years_at_diagnosis), median = median(years_at_diagnosis))

# Calculate the mean and median age at diagnosis for males and females
clinical_mini %>%
  group_by(gender) %>%
  summarise(mean = mean(years_at_diagnosis, na.rm = TRUE), median = median(years_at_diagnosis, na.rm = TRUE))

# How many patient were diagnosed before 50 years?
clinical_mini %>%
  filter(years_at_diagnosis < 50) %>%
  count()

# Compare the mean age at diagnosis between "current smoker" and "lifelong non-smoker"?
clinical_mini %>%
  filter(smoking_history == 'current smoker' | smoking_history == 'lifelong non-smoker') %>%
  group_by(smoking_history) %>%
  summarize(mean = mean(years_at_diagnosis, na.rm = TRUE))

# Select column corresponding to smoking_history, year_of_tobacco_smoking_onset, and stopped_smoking_year.
# Select patients who stopped smoking more than 15 years ago.
# Calculate the number of smoking years for these cases
clinical_mini %>%
  select(smoking_history, year_of_tobacco_smoking_onset, stopped_smoking_year) %>%
  filter(smoking_history == "current reformed smoker for > 15 years") %>%
  mutate(years_smoked = stopped_smoking_year - year_of_tobacco_smoking_onset)

# How many of them smoked less than 5 years?
clinical_mini %>%
  select(smoking_history, year_of_tobacco_smoking_onset, stopped_smoking_year) %>%
  filter(smoking_history == "current reformed smoker for > 15 years") %>%
  mutate(years_smoked = stopped_smoking_year - year_of_tobacco_smoking_onset) %>%
  filter(years_smoked < 5) %>%
  count()


## Try to recreate the following table, reporting the number of smokers and
## lifelong-non smoker between males and females
load("table_to_create.rda")
table_to_create

clinical_mini %>%
  filter(smoking_history == 'current smoker' | smoking_history == 'lifelong non-smoker') %>%
  group_by(gender, smoking_history) %>%
  summarize(n = n()) %>%
  spread(key = smoking_history, value=n)
