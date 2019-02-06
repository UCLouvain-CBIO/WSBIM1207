library("tidyverse")

# Load the expression.csv file
expression <- read_csv("expression.csv")

# The sampleID column gives the TCGA reference of the sample (is sample is unique)
# The 12 first characters (TCGA-XX-XXXX) of the samples ID are unique to each patient.
# The 3 last characters of the samples ID indicate the type of sample:
# Samples ending with '-01A' (TCGA-XX-XXXX-01A) correspond to tumors
# Samples ending with '-11A' (TCGA-XX-XXXX-11A) correspond to normal peritumoral tissues

# The patient column gives the reference of each patient 
# Note that some patient for which both tumor and normal tissue were analysed are recorded twice

# The type column gives the nature of each sample (tumor or normal tissue)

# The 5 next column give the expression levels of 5 genes in each sample.

# Inspect the data 
expression


# Using the geom_point() function, draw a plot showing expression level of A2M in normal tissue samples and in primary tumor samples
ggplot(data = expression, mapping = aes(x = type, y = A2LD1)) +
  geom_point()

# Do the same thing using this time the geom_jitter() function, is it better?
ggplot(data = expression, mapping = aes(x = type, y = A2LD1)) +
  geom_jitter()

# Color the samples according to the type of tissue
ggplot(data = expression, mapping = aes(x = type, y = A2LD1, color = type)) +
  geom_jitter()

# Color the points corresponding to patient "TCGA-73-4676"
ggplot(data = expression, mapping = aes(x = type, y = A2LD1, color = patient == "TCGA-73-4676")) +
  geom_jitter()

# Add a boxplot to the graph
ggplot(data = expression, mapping = aes(x = type, y = A2LD1)) +
  geom_jitter(aes(color = type)) +
  geom_boxplot(alpha = 0) 

# Change the y scale into a log10 scale
ggplot(data = expression, mapping = aes(x = type, y = A2LD1)) +
  geom_jitter(aes(color = type)) +
  geom_boxplot(alpha = 0) +
  scale_y_log10() 


