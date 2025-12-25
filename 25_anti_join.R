###############################################################
# Script: 25_dplyr_anti_join.R
#
# Purpose:
#   Demonstrate how to filter a table to keep only rows that 
#   do NOT have matching keys in another table using dplyr::anti_join().
#
#   Demonstrated steps:
#     - Create two tea datasets sharing a common key (farm)
#     - Perform anti_join() using default matching column names
#     - Join using different column names from each side
#     - Join by multiple keys
#
# Workflow:
#   1. Load dplyr
#   2. Create example tables
#   3. Perform basic anti_join()
#   4. Join using different column names
#   5. Join using multiple key columns
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-25
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Datasets
# ---------------------------------------------------------------------------
# Main tea yield table
df_yield <- tibble(
  farm   = paste0("F_", 1:5),
  tea_kg = c(400, 550, 300, 450, 500)
)

# Table of farms to exclude (right table)
df_exclude <- tibble(
  farm  = c("F_1","F_3","F_4")
)

df_yield
df_exclude

# ---------------------------------------------------------------------------
# 3. Basic anti_join(): keep only rows in df_yield NOT in df_exclude
# ---------------------------------------------------------------------------
anti_join(df_yield, df_exclude, by = "farm")

# ---------------------------------------------------------------------------
# 4. anti_join() using different column names
# ---------------------------------------------------------------------------
df_exclude2 <- tibble(
  farm_id = c("F_2","F_5")
)

anti_join(df_yield, df_exclude2, by = c("farm" = "farm_id"))

# ---------------------------------------------------------------------------
# 5. anti_join() with multiple keys
# ---------------------------------------------------------------------------
df_yield_multi <- tibble(
  farm   = c("F_1","F_2","F_2","F_3","F_5"),
  grade  = c("BP","PF","PF","PD","BP"),
  tea_kg = c(400, 550, 560, 300, 500)
)

df_exclude_multi <- tibble(
  farm  = c("F_2","F_3"),
  grade = c("PF","PD")
)

anti_join(df_yield_multi, df_exclude_multi, by = c("farm","grade"))

# ---------------------------------------------------------------------------
# End of script — anti_join() filters the left table to exclude matches!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use anti_join() to remove rows from a table that have a match in another reference table.
###############################################################
