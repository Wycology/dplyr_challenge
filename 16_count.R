###############################################################
# Script: 16_dplyr_count.R
#
# Purpose:
#   Demonstrate how to count observations using dplyr::count().
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea farms + county + grade)
#     - Count observations for a single column
#     - Count multiple grouping columns
#     - Sort counts automatically using sort = TRUE
#     - Add weighted counts using wt = column
#     - Compare count() with tally() after group_by()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic count() examples
#   4. Count by two columns
#   5. Sorting and weighting counts
#   6. tally() vs count() comparison
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-16
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + county + tea grade)
# ---------------------------------------------------------------------------
df <- tibble(
  farm   = paste0("F_", 1:7),
  county = c("Kericho","Bomet","Nandi","Kericho","Kericho","Bomet","Nandi"),
  grade  = c("BP","BP","PF","PD","BP","PF","PD"),
  tea_kg = c(400, 550, 300, 430, 510, 390, 350)
)

df

# ---------------------------------------------------------------------------
# 3. Basic count(): Count farms per county
# ---------------------------------------------------------------------------
df %>%
  count(county)

# Count farms per tea grade
df %>%
  count(grade)

# ---------------------------------------------------------------------------
# 4. Count by two columns
# ---------------------------------------------------------------------------
df %>%
  count(county, grade)

# ---------------------------------------------------------------------------
# 5. Sorting and weighting counts
# ---------------------------------------------------------------------------
# Sort results by frequency
df %>%
  count(county, sort = TRUE)

# Weighted count — total tea_kg per county
df %>%
  count(county, wt = tea_kg)

# Weighted count across county + grade
df %>%
  count(county, grade, wt = tea_kg)

# ---------------------------------------------------------------------------
# 6. tally() vs count()
# ---------------------------------------------------------------------------
# tally() after group_by() (equivalent to count())
df %>%
  group_by(county) %>%
  tally()

# Weighted tally
df %>%
  group_by(county) %>%
  tally(wt = tea_kg)

# ---------------------------------------------------------------------------
# End of script — Use count() for quick summaries and frequency tables!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use count() for quick exploration, and tally() when already grouped.
###############################################################
