###############################################################
# Script: 13_dplyr_rename_columns.R
#
# Purpose:
#   Demonstrate how to rename columns using dplyr::rename().
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea farms + county + tea yield)
#     - Rename one or multiple columns
#     - Swap old and new column order (new_name = old_name)
#     - Rename columns programmatically with rename_with()
#     - Apply string functions inside rename_with() (tolower, toupper)
#     - Rename selected columns using tidyselect helpers (starts_with)
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic rename() usage
#   4. Rename multiple columns
#   5. rename_with() for programmatic renaming
#   6. Using tidyselect helpers
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-13
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + county + tea yield)
# ---------------------------------------------------------------------------
df <- tibble(
  farm_id   = paste0("F_", 1:4),
  County    = c("Kericho","Bomet","Nandi","Meru"),
  Tea_Kg    = c(400, 550, 300, 450)
)

df

# ---------------------------------------------------------------------------
# 3. Basic rename(): new_name = old_name
# ---------------------------------------------------------------------------
# Rename County to county (lowercase)
df %>%
  rename(county = County)

# Rename Tea_Kg to tea_production
df %>%
  rename(tea_production = Tea_Kg)

# ---------------------------------------------------------------------------
# 4. Rename multiple columns at once
# ---------------------------------------------------------------------------
df %>%
  rename(
    county         = County,
    tea_production = Tea_Kg
  )

# ---------------------------------------------------------------------------
# 5. rename_with(): Rename using a function
# ---------------------------------------------------------------------------
# Convert all column names to lowercase
df %>%
  rename_with(tolower)

# Convert to uppercase
df %>%
  rename_with(toupper)

# ---------------------------------------------------------------------------
# 6. rename_with() + tidyselect helpers
# ---------------------------------------------------------------------------
# Only convert columns starting with "T" to lowercase
df %>%
  rename_with(tolower, starts_with("T"))

# Add prefix "kg_" to all numeric columns
df %>%
  rename_with(~ paste0("kg_", .x), where(is.numeric))

# ---------------------------------------------------------------------------
# End of script — Try combining helpers and rename_with() for automation!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use rename() when you know exact names, rename_with() for pattern-based changes.
###############################################################
