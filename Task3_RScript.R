# Data Transformation

Load libaries.
library(nycsflights13)
library(tidyverse)

Loading tydiverse displays a message that dplyr overwrites some functions in base R. To get rid of the message, one uses stats::filter() and stats::lag()

## dplyr basics

filter(): pack observations by their values
arrange(): Reording rows()
select(): pick variables by their names
mutate():creating new variables with functions of existing variables.
summarise(): summary of values

group_by() instead of operating the entire dataset, group_by helps to just operate on the dataset group by group.

### Helper functions that one can use within select():

- starts_with("abc"): matches names that begin with "abc"
- ends_with("xyz"): matches names that end with "xyz".
- contains("ijk"): matches names that contain "ijk".
- matches("(.)\\1"): selects variables that match a regular expression. This particular function will match variables that contain repeated characters.
###num_range("x",1:3); matches x1, x2, and x3
### instead of using select() to rename variables, it is better to use rename()
### rename(dataset, oldname = newname)
### Transmute(): is used when one wants to keep only the new variables.

# Examples of Questions that Data Can Answer




