###############################################################
# Script: 27_dplyr_intersect.R
#
# Purpose:
#   Demonstrate how to find common rows between two datasets
#   using dplyr::intersect().
#
#   Demonstrated steps:
#     - Create two tea datasets with some overlapping rows
#     - Use intersect() to return only rows present in both tables
#     - Ensure same columns and types in both tables
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibbles
#   3. Find common rows with intersect()
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-27
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Datasets
# ---------------------------------------------------------------------------
df_a <- tibble(
  farm   = paste0("F_", 1:4),
  tea_kg = c(400, 550, 300, 450)
)

df_b <- tibble(
  farm   = paste0("F_", 3:6),
  tea_kg = c(300, 450, 500, 600)
)

df_a
df_b

# ---------------------------------------------------------------------------
# 3. intersect(): find rows common to both datasets
# ---------------------------------------------------------------------------
intersect(df_a, df_b)

# ---------------------------------------------------------------------------
# 5. Notes:
# ---------------------------------------------------------------------------
# - Columns and types must match
# - intersect() is useful to identify duplicates across datasets
# - Works like SQL inner join on all columns

# ---------------------------------------------------------------------------
# End of script — Use intersect() to get common rows between tables!
# ---------------------------------------------------------------------------
###############################################################
