###############################################################
# Script: 26_dplyr_union_union_all.R
#
# Purpose:
#   Demonstrate how to combine datasets using dplyr::union() and dplyr::union_all().
#
#   Demonstrated steps:
#     - Create two tea datasets with some overlapping rows
#     - Use union() to combine tables, removing duplicates
#     - Use union_all() to combine tables, keeping duplicates
#     - Compare union() vs union_all()
#     - Ensure same columns and types in both tables
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibbles
#   3. Combine with union() (unique rows)
#   4. Combine with union_all() (keep duplicates)
#   5. Compare results
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-26
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
# 3. union(): combine tables and remove duplicates
# ---------------------------------------------------------------------------
union(df_a, df_b)

# ---------------------------------------------------------------------------
# 4. union_all(): combine tables and keep duplicates
# ---------------------------------------------------------------------------
union_all(df_a, df_b)

# ---------------------------------------------------------------------------
# 5. Compare union() vs union_all()
# ---------------------------------------------------------------------------
# union() removes rows that appear in both tables
union(df_a, df_b)

# union_all() keeps all rows, including duplicates
union_all(df_a, df_b)

# ---------------------------------------------------------------------------
# 6. Notes:
# ---------------------------------------------------------------------------
# - Columns and types must match
# - Use union() when you want a unique combined dataset
# - Use union_all() when duplicates are meaningful (e.g., repeated measurements)

# ---------------------------------------------------------------------------
# End of script — Use union() and union_all() to merge tables vertically!
# ---------------------------------------------------------------------------
###############################################################
