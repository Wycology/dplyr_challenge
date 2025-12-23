###############################################################
# Script: 24_dplyr_semi_join.R
#
# Purpose:
#   Demonstrate how to filter a table to keep only rows that 
#   have matching keys in another table using dplyr::semi_join().
#
#   Demonstrated steps:
#     - Create two tea datasets sharing a common key (farm)
#     - Perform semi_join() using default matching column names
#     - Join using different column names from each side
#     - Join by multiple keys
#
# Workflow:
#   1. Load dplyr
#   2. Create example tables
#   3. Perform basic semi_join()
#   4. Join using different column names
#   5. Join using multiple key columns
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-24
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

# Table of farms to keep (right table)
df_selected <- tibble(
  farm  = c("F_1","F_3","F_4")
)

df_yield
df_selected

# ---------------------------------------------------------------------------
# 3. Basic semi_join(): keep only rows in df_yield matching df_selected
# ---------------------------------------------------------------------------
semi_join(df_yield, df_selected, by = "farm")

# ---------------------------------------------------------------------------
# 4. semi_join() using different column names
# ---------------------------------------------------------------------------
df_selected2 <- tibble(
  farm_id = c("F_2","F_5")
)

semi_join(df_yield, df_selected2, by = c("farm" = "farm_id"))

# ---------------------------------------------------------------------------
# 5. semi_join() with multiple keys
# ---------------------------------------------------------------------------
df_yield_multi <- tibble(
  farm   = c("F_1","F_2","F_2","F_3","F_5"),
  grade  = c("BP","PF","PF","PD","BP"),
  tea_kg = c(400, 550, 560, 300, 500)
)

df_selected_multi <- tibble(
  farm  = c("F_2","F_3"),
  grade = c("PF","PD")
)

semi_join(df_yield_multi, df_selected_multi, by = c("farm","grade"))

# ---------------------------------------------------------------------------
# End of script — semi_join() filters the left table to only matching keys!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use semi_join() when you only need rows from the left table that have a match in the right table, without bringing in new columns.
###############################################################
