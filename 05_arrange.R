###############################################################
# Script: 05_dplyr_arrange.R
#
# Purpose:
#   Demonstrate sorting (ordering) rows using dplyr::arrange().
#
#   Demonstrated steps:
#     - Create dummy dataset (Tea production)
#     - Sort in ascending & descending order
#     - Sort by multiple columns
#     - Sort character/text values
#     - Handle NA values in ordering
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic ascending & descending sorting
#   4. Multiple sorting conditions
#   5. Sorting text/categorical values
#   6. NA handling in arrange()
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-05
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset
# ---------------------------------------------------------------------------
df <- tibble(
  name     = paste0("plot_", 1:5),
  tea_kg   = c(450, NA, 300, 600, 200),
  rainfall = c(1100, 900, 1000, 1200, 950)
)

df

# ---------------------------------------------------------------------------
# 3. Basic Sorting (Ascending is default)
# ---------------------------------------------------------------------------
df %>%
  arrange(tea_kg)

# Descending sort: use desc()
df %>%
  arrange(desc(tea_kg))

# ---------------------------------------------------------------------------
# 4. Sorting Using Multiple Columns
# ---------------------------------------------------------------------------
# First by rainfall (ascending), then tea_kg (descending)
df %>%
  arrange(rainfall, desc(tea_kg))

# ---------------------------------------------------------------------------
# 5. Sorting Text / Categorical Values
# ---------------------------------------------------------------------------
df %>%
  arrange(name)

# ---------------------------------------------------------------------------
# 6. Handling NA Values
# ---------------------------------------------------------------------------
# NAs appear last by default. To move NAs first:
df %>%
  arrange(is.na(tea_kg), tea_kg)

df %>%
  arrange(!is.na(tea_kg), tea_kg)
# ---------------------------------------------------------------------------
# End of script — Try sorting the dataset in creative ways!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use desc() to reverse order of individual columns.
###############################################################
