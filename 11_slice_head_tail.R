###############################################################
# Script: 11_dplyr_slice_head_tail.R
#
# Purpose:
#   Demonstrate how to select the first or last rows of a dataset
#   using dplyr::slice_head() and dplyr::slice_tail().
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea farms + county + tea production)
#     - Select the first n rows using slice_head()
#     - Select the last n rows using slice_tail()
#     - Select a fraction of rows from top or bottom
#     - Apply within groups using group_by()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. slice_head() examples
#   4. slice_tail() examples
#   5. Use fractions instead of fixed n
#   6. Apply within groups
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-11
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
  tea_kg    = c(400, 550, 300, 450, 500, 350, 420, 330)
)

df

# ---------------------------------------------------------------------------
# 3. Select first rows using slice_head()
# ---------------------------------------------------------------------------
# First 3 rows
df %>%
  slice_head(n = 3)

# First 50% of rows
df %>%
  slice_head(prop = 0.5)

# ---------------------------------------------------------------------------
# 4. Select last rows using slice_tail()
# ---------------------------------------------------------------------------
# Last 3 rows
df %>%
  slice_tail(n = 3)

# Last 50% of rows
df %>%
  slice_tail(prop = 0.5)

# ---------------------------------------------------------------------------
# 5. Apply within groups using group_by()
# ---------------------------------------------------------------------------
# Top farm per county by order in dataset
df %>%
  group_by(county) %>%
  slice_head(n = 1)

# Bottom farm per county by order in dataset
df %>%
  group_by(county) %>%
  slice_tail(n = 1)

# ---------------------------------------------------------------------------
# 6. Notes
# ---------------------------------------------------------------------------
# - slice_head() and slice_tail() respect the order of rows in the dataset.
# - For deterministic selection based on a value, use slice_min() or slice_max().
# - Useful for selecting first/last records per group, e.g., earliest/latest measurements.

# ---------------------------------------------------------------------------
# End of script — Try different n and prop values with your dataset!
###############################################################
