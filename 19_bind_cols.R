###############################################################
# Script: 19_dplyr_bind_cols.R
#
# Purpose:
#   Demonstrate how to combine data frames horizontally using
#   dplyr::bind_cols().
#
#   Demonstrated steps:
#     - Create separate tea datasets with matching row counts
#     - Bind columns from multiple data frames side-by-side
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibbles
#   3. bind_cols() basic usage
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-19
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Farm Data (column sets)
# ---------------------------------------------------------------------------
df_a <- tibble(
  farm   = paste0("F_", 1:4),
  county = c("Kericho","Bomet","Nandi","Meru")
)

df_b <- tibble(
  tea_kg = c(400, 550, 300, 450),
  grade  = c("BP","PF","PD","BP")
)

# Shorter dataset (only 3 rows)
df_c <- tibble(
  altitude_m = c(2000, 1950, 2100)
)

# ---------------------------------------------------------------------------
# 3. Basic bind_cols(): Combine side-by-side
# ---------------------------------------------------------------------------
bind_cols(df_a, df_b)

# ---------------------------------------------------------------------------
# 4. Bind data frames with unequal rows (ERROR)
# ---------------------------------------------------------------------------
bind_cols(df_a, df_c) # Error

# ---------------------------------------------------------------------------
# 5. Bind a list of data frames
# ---------------------------------------------------------------------------
dfs <- list(df_a, df_b)

# Bind with automatic name repair
bind_cols(dfs)

# Add prefixes to avoid duplicate names
bind_cols(
  setNames(dfs, paste0("tbl", seq_along(dfs)))
)

# ---------------------------------------------------------------------------
# End of script — Use bind_cols() for side-by-side merging!
# ---------------------------------------------------------------------------
# 💡 Tip:
# bind_cols() is great for column-wise joining when tables share row order but not keys.
###############################################################
