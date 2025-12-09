###############################################################
# Script: 10_dplyr_slice_sample.R
#
# Purpose:
#   Demonstrate how to randomly sample rows from a dataset using
#   dplyr::slice_sample().
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea farms + county + tea production)
#     - Randomly sample a fixed number of rows
#     - Randomly sample a fraction of rows
#     - Ensure reproducibility with set.seed()
#     - Sample within groups (grouped sampling)
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Random sample of fixed number of rows
#   4. Random sample a fraction of rows
#   5. Set seed for reproducibility
#   6. Sample within groups using group_by()
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-10
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + county + production)
# ---------------------------------------------------------------------------
df <- tibble(
  farm      = paste0("F_", 1:8),
  county    = c("Kericho","Kericho","Bomet","Bomet","Nandi","Nandi","Kericho","Bomet"),
  tea_kg    = c(400, 550, 300, 450, 500, 350, 420, 330)
)

df

# ---------------------------------------------------------------------------
# 3. Randomly sample a fixed number of rows
# ---------------------------------------------------------------------------
# Sample 3 random rows
df %>%
  slice_sample(n = 3)

# ---------------------------------------------------------------------------
# 4. Randomly sample a fraction of rows
# ---------------------------------------------------------------------------
# Sample 50% of the rows
df %>%
  slice_sample(prop = 0.5)

# ---------------------------------------------------------------------------
# 5. Ensure reproducibility with set.seed()
# ---------------------------------------------------------------------------
set.seed(248)
df %>%
  slice_sample(n = 3)

# Running this again with the same seed gives the same rows
set.seed(248)
df %>%
  slice_sample(n = 3)
# ---------------------------------------------------------------------------
# 6. Sample within groups (grouped sampling)
# ---------------------------------------------------------------------------
# Sample 1 farm per county
df %>%
  group_by(county) %>%
  slice_sample(n = 1)

# Sample 50% of farms per county
df %>%
  group_by(county) %>%
  slice_sample(prop = 0.5)

# ---------------------------------------------------------------------------
# End of script — Try different n, prop, and group combinations!
# ---------------------------------------------------------------------------
# 💡 Tip:
# slice_sample() is useful for quick random sampling, cross-validation,
# or exploratory analysis of large datasets.
###############################################################
