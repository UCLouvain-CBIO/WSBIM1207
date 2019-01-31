library("tidyverse")

# Create the tibble called "clinical" from the clinical.csv file
clinical <- read_csv("clinical.csv")

# Inspect the data 
clinical
str(clinical)

# Create a smaller data frame called "clinical_mini" containing only the columns corresponding to
# submitter_id, gender, tumor_stage, age_at_diagnosis, vital_status. 
clinical_small <- clinical %>% 
  select(submitter_id, gender, tumor_stage, age_at_diagnosis, vital_status)

# Calcute the number of males and females
clinical_small %>% 
  group_by(gender) %>% 
  count()

# Create a new column "years_at_diagnosis" corresponding to the age at diagnosis converted in years (instead of in days)
clinical_small <- clinical_small %>% 
  mutate(years_at_diagnosis = age_at_diagnosis / 365)

# Calculate the mean and median age at diagnosis (in years)
clinical_small %>% 
  summarize(mean_age = mean(years_at_diagnosis, na.rm = TRUE)) 

clinical_small %>%  
  filter(!is.na(years_at_diagnosis)) %>% # idem but removing NA values befor
  summarize(mean_age = mean(years_at_diagnosis)) 

# Calculate the mean and median age at diagnosis for males and females
clinical_small %>% 
  group_by(gender) %>% 
  summarize(mean_age = mean(years_at_diagnosis, na.rm = TRUE))


# How many patient were diagnosed before 40 years?
clinical_small %>% 
  filter(years_at_diagnosis < 40) %>% 
  count()

# How many patient diagnosed with "stage iv" tumor are alive
clinical_small %>% 
  filter(tumor_stage == "stage iv") %>% 
  group_by(vital_status) %>% 
  count()

# Compare to patient diagnosed with "stage i" tumor
clinical_small %>% 
  filter(tumor_stage == "stage i") %>% 
  group_by(vital_status) %>% 
  count()
