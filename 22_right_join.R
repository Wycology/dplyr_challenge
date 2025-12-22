###############################################################
# Script: 22_dplyr_right_join.R
#
# Purpose:
#   Demonstrate how to merge datasets using dplyr::right_join()
#   (keeps all rows from the right table and matches from the left).
#
#   Demonstrated steps:
#     - Create two tea datasets sharing a common key (farm)
#     - Perform right_join() using default matching column names
#     - Join using different column names from each side
#     - Join by multiple keys
#
# Workflow:
#   1. Load dplyr
#   2. Create example tables
#   3. Perform basic right_join()
#   4. Join using different column names
#   5. Join using multiple key columns
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-22
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Datasets
# ---------------------------------------------------------------------------
# Tea yield by farm (left table)
df_yield <- tibble(
  farm   = paste0("F_", 1:5),
  tea_kg = c(400, 550, 300, 450, 500)
)

# Tea grades by farm (right table, missing F_5, extra F_6)
df_grade <- tibble(
  farm  = c(paste0("F_", 1:4), "F_6"),
  grade = c("BP","PF","PD","BP","PF")
)

df_yield
df_grade

# ---------------------------------------------------------------------------
# 3. Basic right_join(): keeps all rows from right table
# ---------------------------------------------------------------------------
right_join(df_yield, df_grade, by = "farm")

# ---------------------------------------------------------------------------
# 4. Join using different column names
# ---------------------------------------------------------------------------
df_yield2 <- tibble(
  farm_id = c(paste0("F_", 1:3),"F_5"),
  tea_kg  = c(400, 550, 300, 500)
)

right_join(df_yield2, df_grade, by = c("farm_id" = "farm"))

# ---------------------------------------------------------------------------
# 5. Join using multiple keys
# ---------------------------------------------------------------------------
df_multi <- tibble(
  farm   = c("F_1","F_2","F_2","F_3","F_5"),
  grade  = c("BP","PF","PF","PD","BP"),
  tea_kg = c(400, 550, 560, 300, 500)
)

df_grade_multi <- tibble(
  farm  = c("F_1","F_2","F_2","F_3","F_6"),
  grade = c("BP","PF","PD","PD","BP"),
  quality = c("High","Medium","Low","Medium","Low")
)

right_join(df_multi, df_grade_multi, by = c("farm","grade"))

# ---------------------------------------------------------------------------
# End of script — right_join() preserves all rows from the right table!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use right_join() when the right table contains essential records that must be retained.
###############################################################
