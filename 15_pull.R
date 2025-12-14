###############################################################
# Script: 15_dplyr_pull_column.R
#
# Purpose:
#   Demonstrate how to extract a column as a vector using
#   dplyr::pull().
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea farms + county + yield)
#     - Pull a single column as a vector (by name & position)
#     - Pull multiple types of vectors (numeric, character)
#     - Use pull() inside plotting and summary functions
#     - Pull column based on tidyselect helpers
#     - Pull last column, first column, and by index
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic pull() by name/position
#   4. Pull within other functions
#   5. Use helper functions for selection
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-15
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + county + yield)
# ---------------------------------------------------------------------------
df <- tibble(
  farm    = paste0("F_", 1:4),
  county  = c("Kericho","Bomet","Nandi","Meru"),
  tea_kg  = c(400, 550, 300, 450)
)

df

# ---------------------------------------------------------------------------
# 3. pull(): Extract a column as a vector
# ---------------------------------------------------------------------------
# Pull tea production by name
df %>%
  pull(tea_kg)

# Pull tea production by column position
df %>%
  pull(3)

# Pull farm names (vector of characters)
df %>%
  pull(farm)

# ---------------------------------------------------------------------------
# 4. Use pull() within a function
# ---------------------------------------------------------------------------
# Calculate mean tea production
mean(df %>% pull(tea_kg))

# Create a simple barplot
barplot(df %>% pull(tea_kg),
        names.arg = df %>% pull(farm),
        main = "Tea Yield per Farm")

# ---------------------------------------------------------------------------
# 5. Pull using helpers and index
# ---------------------------------------------------------------------------
# Pull last column
df %>%
  pull(last_col())

# Pull numeric column using where()
df %>%
  pull(where(is.numeric))

# Pull column by index (1st column)
df %>%
  pull(1)

# ---------------------------------------------------------------------------
# End of script — Use pull() anytime you need a pure vector!
# ---------------------------------------------------------------------------
# 💡 Tip:
# pull() is ideal when bridging between data frames and base R functions.
###############################################################
