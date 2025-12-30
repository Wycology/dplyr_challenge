###############################################################
# Script: 30_dplyr_rowwise.R
#
# Purpose:
#   Demonstrate how to perform row-wise operations on a dataset
#   using dplyr::rowwise().
#
#   Demonstrated steps:
#     - Create a dummy tea dataset with multiple numeric columns
#     - Use rowwise() to compute a new column based on multiple columns
#     - Combine with mutate() and summarise()
#     - Apply custom functions row-wise
#     - Compare rowwise() behavior with regular vectorised operations
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. rowwise() with mutate()
#   4. rowwise() with summarise()
#   5. Apply custom functions row-wise
#   6. Ungroup after row-wise operations
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-30
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Dataset
# ---------------------------------------------------------------------------
df <- tibble(
  farm       = paste0("F_", 1:4),
  tea_kg     = c(400, 550, 300, 450),
  fertilizer = c(50, 60, 40, 55),
  rainfall   = c(120, 100, 90, 110)
)

df

# ---------------------------------------------------------------------------
# 3. rowwise() with mutate(): compute row-wise total input
# ---------------------------------------------------------------------------
df %>%
  rowwise() %>%
  mutate(total_input = tea_kg + fertilizer + rainfall)

# ---------------------------------------------------------------------------
# 4. rowwise() with summarise(): compute row-wise mean
# ---------------------------------------------------------------------------
df %>%
  rowwise() %>%
  summarise(mean_value = mean(c(tea_kg, fertilizer, rainfall)))

# ---------------------------------------------------------------------------
# 5. Apply custom functions row-wise
# ---------------------------------------------------------------------------
df %>%
  rowwise() %>%
  mutate(adjusted_yield = tea_kg * log(fertilizer + 1))

# ---------------------------------------------------------------------------
# 6. Ungroup after row-wise operations
# ---------------------------------------------------------------------------
df %>%
  rowwise() %>%
  mutate(total_input = tea_kg + fertilizer + rainfall) %>%
  ungroup()

# ---------------------------------------------------------------------------
# End of script — Use rowwise() for operations that need to consider each row individually!
# ---------------------------------------------------------------------------
# 💡 Tip:
# rowwise() is particularly useful when combining multiple columns with custom functions row by row.
###############################################################
