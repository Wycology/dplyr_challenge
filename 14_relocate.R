###############################################################
# Script: 14_dplyr_relocate_columns.R
#
# Purpose:
#   Demonstrate how to reorder columns using dplyr::relocate().
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea farms + region + yield + altitude)
#     - Move a single column to the front
#     - Move a column to the end
#     - Reorder multiple columns at once
#     - Use .before / .after for explicit control
#     - Combine relocate() with tidyselect helpers
#       (where(), starts_with(), ends_with())
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Move columns to front/back
#   4. Reorder using .before and .after
#   5. Use relocate() + tidyselect helpers
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-14
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + region + yield + altitude)
# ---------------------------------------------------------------------------
df <- tibble(
  farm        = paste0("F_", 1:4),
  region      = c("Kericho","Bomet","Nandi","Meru"),
  tea_kg      = c(400, 550, 300, 450),
  altitude_m  = c(2000, 1950, 2100, 1800)
)

df

# ---------------------------------------------------------------------------
# 3. Move column to the front
# ---------------------------------------------------------------------------
# Move tea_kg to be the first column
df %>%
  relocate(tea_kg)

# Move two columns (farm, tea_kg) to the front
df %>%
  relocate(farm, tea_kg)

# ---------------------------------------------------------------------------
# 4. Move column to the end
# ---------------------------------------------------------------------------
# Move region to the last position
df %>%
  relocate(region, .after = last_col())

# ---------------------------------------------------------------------------
# 5. Reorder using .before and .after explicitly
# ---------------------------------------------------------------------------
# Place altitude_m before tea_kg
df %>%
  relocate(altitude_m, .before = tea_kg)

# Place farm after region
df %>%
  relocate(farm, .after = region)

# ---------------------------------------------------------------------------
# 6. relocate() + tidyselect helpers
# ---------------------------------------------------------------------------
# Move numeric columns to the front
df %>%
  relocate(where(is.numeric))

# Move columns starting with "t" to the front
df %>%
  relocate(starts_with("t"))

# Move altitude_m and tea_kg to the end
df %>%
  relocate(altitude_m, tea_kg, .after = last_col())

# ---------------------------------------------------------------------------
# End of script — Experiment with moving specific or helper-selected columns!
# ---------------------------------------------------------------------------
# 💡 Tip:
# relocate() is great for clean data presentation before exporting or plotting.
###############################################################
