###############################################################
# Script: 02_dplyr_select.R
# 
# Purpose:
#   Demonstrate column selection in R using dplyr::select()
#   including renaming, moving columns, and using helpers.
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea production & rainfall)
#     - Select specific columns
#     - Exclude columns using "-"
#     - Use helper functions (starts_with, ends_with, contains)
#     - Rename columns during selection
#     - Reorder columns using relocate()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Select specific columns
#   4. Drop/exclude columns
#   5. Use select helpers
#   6. Rename and reorder columns
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-02
###############################################################

# ---------------------------------------------------------------------------
# Load required package
# ---------------------------------------------------------------------------
library(dplyr)  # Version 1.1.4 ==> Data wrangling 

# ---------------------------------------------------------------------------
# 1. Create Dummy Dataset (Tea Production Example)
# ---------------------------------------------------------------------------
# Data represents tea production (kg), rainfall (mm/year) & soil info
df <- tibble(
  plot_id   = paste0("plot_", 1:5),
  tea_kg    = c(500, 150, 250, NA, 400),
  rainfall  = c(1200, 900, 1100, 1300, 800),
  soil_ph   = c(5.8, 6.0, 5.5, 6.3, 5.9),
  soil_type = c("Loam", "Clay", "Sandy", "Loam", "Clay")
)

# Print dataset
df

# ---------------------------------------------------------------------------
# 2. Select Specific Columns
# ---------------------------------------------------------------------------
# Select only plot_id and tea_kg
df %>%
  select(plot_id, tea_kg)

# Select plot_id, rainfall, soil_type
df %>%
  select(plot_id, rainfall, soil_type)

# ---------------------------------------------------------------------------
# 3. Exclude Columns Using "-"
# ---------------------------------------------------------------------------
# Drop soil information, keep others
df %>%
  select(-soil_ph, -soil_type)

# Keep everything except rainfall
df %>%
  select(-rainfall)

# ---------------------------------------------------------------------------
# 4. Use Helper Functions for Fast Selection
# ---------------------------------------------------------------------------
# Select columns that start with "soil"
df %>%
  select(starts_with("soil"))

# Select columns that end with "kg"
df %>%
  select(ends_with("kg"))

# Select columns that contain "rain"
df %>%
  select(contains("rain"))

# ---------------------------------------------------------------------------
# 5. Rename Columns During Selection
# ---------------------------------------------------------------------------
# Rename tea_kg to tea_yield
df %>%
  select(plot_id, tea_yield = tea_kg)

# Rename multiple + keep only selected columns
df %>%
  select(id = plot_id, yield = tea_kg, rain = rainfall)

# ---------------------------------------------------------------------------
# 6. Reorder Columns with relocate()
# ---------------------------------------------------------------------------
# Move rainfall to the first column
df %>%
  relocate(rainfall, .before = everything())

# Move soil columns to the end
df %>%
  relocate(starts_with("soil"), .after = last_col())

# ---------------------------------------------------------------------------
# End of script — Explore your own selections!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Combine helpers + renaming for clean workflows. Example:
# df %>% select(id = plot_id, starts_with("soil"))
#
# Stay tuned: Tomorrow we cover dplyr::mutate() to create new variables.
###############################################################

