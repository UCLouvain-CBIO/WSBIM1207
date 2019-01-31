clinical <- read.table("clinical.tsv", sep = "\t", header = TRUE)
save(clinical, file = "clinical.rda")

# Save a clean version where missing values are NA
clinical[clinical == '--' | clinical == 'not reported'] <- NA
save(clinical, file = "clinical_2.rda") # Why are missing values sill '--' instead of NA in the savec object???
write.table(clinical, "clinical.csv", sep = ",", quote = FALSE, row.names = FALSE)

# Subset the data and keep only "submitter_id", "gender", "tumor_stage", "age_at_diagnosis" columns
# and clean the clinical_mini (transform the factor "age_at_diagnosis" into a numeric vector)
clinical_mini <- clinical[, c("submitter_id", "gender", "tumor_stage", "age_at_diagnosis")]
clinical_mini$age_at_diagnosis <- as.numeric(clinical_mini$age_at_diagnosis)
save(clinical_mini, file = "clinical_mini.rda")
