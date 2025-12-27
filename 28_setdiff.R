###############################################################
# Script: 28_dplyr_setdiff.R
#
# Purpose:
#   Demonstrate how to find rows present in one dataset but not 
#   in another using dplyr::setdiff().
#
#   Demonstrated steps:
#     - Create two tea datasets with some overlapping rows
#     - Use setdiff() to return rows in the first table not in the second
#     - Ensure same columns and types in both tables
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibbles
#   3. Find rows unique to the first dataset with setdiff()
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-28
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
# 3. setdiff(): find rows in df_a NOT in df_b
# ---------------------------------------------------------------------------
setdiff(df_a, df_b)

# ---------------------------------------------------------------------------
# 5. Notes:
# ---------------------------------------------------------------------------
# - Columns and types must match
# - setdiff() is useful to identify data in one dataset missing in another

# ---------------------------------------------------------------------------
# End of script — Use setdiff() to filter rows not present in another table!
# ---------------------------------------------------------------------------
###############################################################
