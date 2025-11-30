###############################################################
# Script: 01_dplyr_filter.R
#
# Purpose:
#   Demonstrate row filtering in R using dplyr::filter() 
#   with numeric, logical, categorical, and NA conditions.
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea production & rainfall)
#     - Filter using >, >=, <, <=, ==, !=
#     - Filter using multiple conditions (AND, OR)
#     - Filter categorical values using %in%
#     - Handle missing values using is.na() and !is.na()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Filter using numeric comparisons
#   4. Filter with multiple logical conditions
#   5. Filter categorical/text values
#   6. Filter and exclude NA values
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-01
###############################################################

# ---------------------------------------------------------------------------
# Load required package
# ---------------------------------------------------------------------------
library(dplyr)  # Version 1.1.4 ==> Data wrangling 

# ---------------------------------------------------------------------------
# 1. Create Dummy Dataset (Tea Production Example)
# ---------------------------------------------------------------------------
# Data represents tea production (kg) and rainfall (mm/year) across 5 plots
df <- tibble(
  name      = paste0("plot_", 1:5),
  tea_kg    = c(500, 150, 250, NA, 400),
  rainfall  = c(1200, 900, 1100, 1300, 800)
)

# Print dataset
df

# ---------------------------------------------------------------------------
# 2. Basic Filtering with Numeric Conditions
# ---------------------------------------------------------------------------
# Keep rows where tea production is above 300 kg
df %>%
  filter(tea_kg > 300)

# Keep rows where rainfall is less than or equal to 1000 mm
df %>%
  filter(rainfall <= 1000)

# Keep rows where tea production is NOT equal to 250
df %>%
  filter(tea_kg != 250)

# ---------------------------------------------------------------------------
# 3. Filtering Using Multiple Logical Conditions
# ---------------------------------------------------------------------------
# AND: Both conditions must be TRUE
df %>%
  filter(tea_kg > 200 & rainfall > 1000)

# OR: At least one condition is TRUE
df %>%
  filter(tea_kg > 400 | rainfall < 900)

# ---------------------------------------------------------------------------
# 4. Filtering Categorical (Text) Data
# ---------------------------------------------------------------------------
# Keep only plot_1 and plot_3 using %in%
df %>%
  filter(name %in% c("plot_1", "plot_3"))

# ---------------------------------------------------------------------------
# 5. Handling NA (Missing Values)
# ---------------------------------------------------------------------------
# Remove rows where tea production value is missing
df %>%
  filter(!is.na(tea_kg))

# Combine condition + remove NA rows
df %>%
  filter(rainfall > 1000, !is.na(tea_kg))

# ---------------------------------------------------------------------------
# End of script — Try combining your own conditions!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use commas inside filter() as AND. Example:
# df %>% filter(tea_kg > 200, rainfall > 1000)
#
# Stay tuned: Tomorrow we explore dplyr::select() to pick columns.
###############################################################
