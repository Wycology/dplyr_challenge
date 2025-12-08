###############################################################
# Script: 09_dplyr_distinct.R
#
# Purpose:
#   Demonstrate the use of dplyr::distinct() to select unique rows
#   or unique combinations of columns from a dataset.
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea farms + county + crop type)
#     - Select fully distinct rows
#     - Select distinct values of a single column
#     - Select distinct combinations of multiple columns
#     - Keep only first occurrence with .keep_all = TRUE
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Get fully distinct rows
#   4. Get distinct values of a single column
#   5. Get distinct combinations of multiple columns
#   6. Keep additional columns using .keep_all
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-09
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + crop type)
# ---------------------------------------------------------------------------
df <- tibble(
  farm      = c("F_1","F_2","F_3","F_4","F_5","F_6","F_2","F_3"),
  county    = c("Kericho","Kericho","Bomet","Bomet","Nandi","Nandi","Kericho","Bomet"),
  tea_kg    = c(400, 550, 300, 450, 500, 350, 550, 300),
  crop_type = c("Black","Green","Black","Green","Black","Green","Green","Black")
)

df

# ---------------------------------------------------------------------------
# 3. Get fully distinct rows
# ---------------------------------------------------------------------------
df %>%
  distinct()
# Removes exact duplicate rows (all columns must match)

# ---------------------------------------------------------------------------
# 4. Get distinct values of a single column
# ---------------------------------------------------------------------------
df %>%
  distinct(county)

# Returns one row per county

# ---------------------------------------------------------------------------
# 5. Get distinct combinations of multiple columns
# ---------------------------------------------------------------------------
df %>%
  distinct(county, crop_type)
# Returns unique county-crop_type combinations

# ---------------------------------------------------------------------------
# 6. Keep additional columns using .keep_all
# ---------------------------------------------------------------------------
df %>%
  distinct(county, crop_type, .keep_all = TRUE)
# Returns the first occurrence of each county-crop_type combo
# while keeping all columns (farm, tea_kg, etc.)

# ---------------------------------------------------------------------------
# End of script — Explore your own combinations!
# ---------------------------------------------------------------------------
# 💡 Tip:
# distinct() is great for cleaning duplicates, getting unique IDs,
# or selecting representative rows per group.
# Tomorrow we can explore slice_sample
###############################################################
