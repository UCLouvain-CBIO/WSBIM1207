library("tidyverse")

# Load clinical data from TCGA patients from "clinical2.rda" and expression data from TCGA patients from "expression.rda"
# Inspect the 2 tables
load("clinical2.rda")
load("expression.rda")

# Inspect the clinical data, what kind of information do we have and how many patients are recorded?
clinical2
# 516

# Inspect the expression data, how many samples are recorded?
expression
# 570

# Join expression and clinical2 tables by the patient reference, using the left_join() and the right_join() functions.
# Why are the results different?
right_join(expression, clinical2, by = c("patient" = "patientID"))

left_join(expression, clinical2, by = c("patient" = "patientID"))
# 3 patients recorded in clinical data are not recorded in expression.

# Join expression and clinical2 tables in order to create a table containing merged data exclusively for normal samples
expression %>% 
  filter(type == "normal") %>% 
  left_join(clinical2, by = c("patient" = "patientID"))

