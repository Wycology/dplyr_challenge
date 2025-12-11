###############################################################
# Script: 12_dplyr_slice_min_max.R
#
# Purpose:
#   Demonstrate how to select rows with minimum or maximum values
#   using dplyr::slice_min() and dplyr::slice_max().
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea farms + county + tea production)
#     - Select rows with smallest tea production using slice_min()
#     - Select rows with largest tea production using slice_max()
#     - Select a fixed number of rows or a fraction
#     - Apply selection within groups using group_by()
#     - Handle ties with with_ties = TRUE/FALSE
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. slice_min() examples
#   4. slice_max() examples
#   5. Apply within groups
#   6. Handle ties
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-12
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + county + tea production)
# ---------------------------------------------------------------------------
df <- tibble(
  farm      = paste0("F_", 1:8),
  county    = c("Kericho","Kericho","Bomet","Bomet","Nandi","Nandi","Kericho","Bomet"),
  tea_kg    = c(400, 550, 300, 450, 500, 350, 420, 300)
)

df

# ---------------------------------------------------------------------------
# 3. Select rows with minimum values using slice_min()
# ---------------------------------------------------------------------------
# Row with smallest tea production
df %>%
  slice_min(order_by = tea_kg, n = 1)

# Bottom 2 rows by tea_kg
df %>%
  slice_min(order_by = tea_kg, n = 2)

# Bottom 50% by tea_kg
df %>%
  slice_min(order_by = tea_kg, prop = 0.5)

# ---------------------------------------------------------------------------
# 4. Select rows with maximum values using slice_max()
# ---------------------------------------------------------------------------
# Row with largest tea production
df %>%
  slice_max(order_by = tea_kg, n = 1)

# Top 3 rows by tea_kg
df %>%
  slice_max(order_by = tea_kg, n = 3)

# Top 50% by tea_kg
df %>%
  slice_max(order_by = tea_kg, prop = 0.5)

# ---------------------------------------------------------------------------
# 5. Apply within groups using group_by()
# ---------------------------------------------------------------------------
# Top farm per county
df %>%
  group_by(county) %>%
  slice_max(order_by = tea_kg, n = 1)

# Bottom farm per county
df %>%
  group_by(county) %>%
  slice_min(order_by = tea_kg, n = 1)

# ---------------------------------------------------------------------------
# 6. Handling ties
# ---------------------------------------------------------------------------
# Include all ties (default)
df %>%
  slice_min(order_by = tea_kg, n = 1, with_ties = TRUE)

# Exclude ties
df %>%
  slice_min(order_by = tea_kg, n = 1, with_ties = FALSE)

# ---------------------------------------------------------------------------
# End of script — Experiment with different n, prop, and group combinations!
# ---------------------------------------------------------------------------
# 💡 Tip:
# slice_min()/slice_max() is ideal for selecting top/bottom performers
# by a numeric column, especially in grouped datasets.
###############################################################
