###############################################################
# Script: 20_dplyr_inner_join.R
#
# Purpose:
#   Demonstrate how to merge datasets using dplyr::inner_join()
#   (returns only matching rows between tables).
#
#   Demonstrated steps:
#     - Create two tea datasets sharing a common key (farm)
#     - Perform inner_join() using default matching column names
#     - Join using different column names from each side
#     - Join by multiple keys
#
# Workflow:
#   1. Load dplyr
#   2. Create example tables
#   3. Perform basic inner_join()
#   4. Join using different column names
#   5. Join using multiple key columns
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-20
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Datasets
# ---------------------------------------------------------------------------
# Tea yield by farm
df_yield <- tibble(
  farm   = paste0("F_", 1:5),
  tea_kg = c(400, 550, 300, 450, 500)
)

# Tea grades by farm (missing F_5, extra F_6)
df_grade <- tibble(
  farm  = paste0("F_", 1:5),
  grade = c("BP","PF","PD","BP","PF")
)

df_yield
df_grade

# ---------------------------------------------------------------------------
# 3. Basic inner_join(): keeps matching rows only
# ---------------------------------------------------------------------------
inner_join(df_yield, df_grade, by = "farm")

# ---------------------------------------------------------------------------
# 4. Join using different column names
# ---------------------------------------------------------------------------
df_yield2 <- tibble(
  farm_id = c("F_1","F_2","F_3"),
  tea_kg  = c(400, 550, 300)
)

inner_join(df_yield2, df_grade, by = c("farm_id" = "farm"))

# ---------------------------------------------------------------------------
# 5. Join using multiple keys
# ---------------------------------------------------------------------------
df_multi <- tibble(
  farm   = c("F_1","F_2","F_2","F_3"),
  grade  = c("BP","PF","PF","PD"),
  tea_kg = c(400, 550, 560, 300)
)

inner_join(
  df_multi,
  df_grade,
  by = c("farm","grade")
)

# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# End of script — inner_join() returns only matching values from both tables!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use inner_join() when you need strict matches between tables (data validation).
###############################################################
