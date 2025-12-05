###############################################################
# Script: 04_dplyr_summarise.R
#
# Purpose:
#   Demonstrate summarising data in R using dplyr::summarise()
#   to compute summary statistics for numeric variables.
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea production + region)
#     - Compute summary statistics (mean, sum, median, sd)
#     - Summarise multiple statistics at once
#     - Handle missing values using na.rm = TRUE
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic summary without grouping
#   4. Multiple summary metrics
#   5. Handle missing values
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-06
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea production in 3 regions)
# ---------------------------------------------------------------------------
df <- tibble(
  region  = c("Highlands", "Lowlands", "Highlands", "Midlands", "Lowlands"),
  tea_kg  = c(500, 200, 450, 300, NA),
  price   = c(2.5, 2.0, 2.8, 3.0, 2.3)
)

# Print dataset
df

# ---------------------------------------------------------------------------
# 3. Basic Summary (Overall totals)
# ---------------------------------------------------------------------------
# Compute mean tea production (NA will cause warning)
df %>%
  summarise(mean_tea = mean(tea_kg, na.rm = TRUE))

# ---------------------------------------------------------------------------
# 4. Multiple Summary Statistics
# ---------------------------------------------------------------------------
df %>%
  summarise(
    mean_tea   = mean(tea_kg, na.rm = TRUE),
    median_tea = median(tea_kg, na.rm = TRUE),
    sd_tea     = sd(tea_kg, na.rm = TRUE),
    total_tea  = sum(tea_kg, na.rm = TRUE)
  )

# ---------------------------------------------------------------------------
# 5. Handling Missing Values Explicitly
# ---------------------------------------------------------------------------
# Count of missing values in tea_kg
df %>%
  summarise(missing_values = sum(is.na(tea_kg)))

#------------------------------------------------------------------------
# End of script — Try adding more statistics (e.g. min, max, IQR)!
# ---------------------------------------------------------------------------
# 💡 Tip:
# summarise() reduces many rows into one summary row.
# Tomorrow we pair it with summarise()’s best friend: group_by() 💚
###############################################################
