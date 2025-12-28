###############################################################
# Script: 29_dplyr_across.R
#
# Purpose:
#   Demonstrate how to apply a function across multiple columns
#   using dplyr::across().
#
#   Demonstrated steps:
#     - Create a dummy tea dataset with multiple numeric columns
#     - Use across() with mutate() to scale numeric columns
#     - Use across() with summarise() to compute column-wise stats
#     - Apply custom functions across selected columns
#     - Use across() with selection helpers (starts_with, ends_with)
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Use across() with mutate()
#   4. Use across() with summarise()
#   5. Apply custom functions
#   6. Use column selection helpers
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-29
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
# 3. across() with mutate(): scale numeric columns
# ---------------------------------------------------------------------------
df %>%
  mutate(across(where(is.numeric), ~ .x / 100))

# ---------------------------------------------------------------------------
# 4. across() with summarise(): compute column-wise stats
# ---------------------------------------------------------------------------
df %>%
  summarise(across(where(is.numeric), mean, na.rm = TRUE))

# ---------------------------------------------------------------------------
# 5. Apply custom functions across selected columns
# ---------------------------------------------------------------------------
df %>%
  mutate(across(c(tea_kg, fertilizer), ~ .x * 2))

# ---------------------------------------------------------------------------
# 6. Use selection helpers
# ---------------------------------------------------------------------------
# Columns starting with "t"
df %>%
  summarise(across(starts_with("t"), sum))

# Columns ending with "l"
df %>%
  summarise(across(ends_with("l"), mean))

# ---------------------------------------------------------------------------
# End of script — Use across() to apply functions efficiently across multiple columns!
# ---------------------------------------------------------------------------
# 💡 Tip:
# across() simplifies repetitive operations in mutate() and summarise() and works with helpers for column selection.
###############################################################
