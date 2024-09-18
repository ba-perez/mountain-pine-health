### Randomise seed and control placement in propagation trays -- R Version
### Coder: Barbara Araujo
### Date: 2024.09.18.

# IMPORT PACKAGES

library(dplyr)
library(tidyr)
library(purrr)
library(stringr)
library(glue)
library(knitr)

# CONTROL STATION
TEST <- TRUE # Test version ON/OFF (will only produce one plate)

# define objects and their counts
# 3 control pots ('C') have soil but no seeds, 5 pots for each of the 4 species in the experiment
objects <- c(rep('C', 3), rep('P. abies', 5), rep('P. cembra', 5), rep('A. pseudoplatanus', 5), rep('S. aucuparia', 5))
num_plates <- 72
plate_size <- c(4, 6)

# fix position of microclimate logger 'L' in plate
position_L <- c(2, 2)

# generate plate with random positions
generate_plate <- function() {
  # empty plate
  plate <- matrix('', nrow = plate_size[1], ncol = plate_size[2])
  
  # fix position of 'L'
  plate[position_L[1], position_L[2]] <- 'L'
  
  # randomly shuffle and assign other positions
  available_positions <- expand.grid(row = 1:plate_size[1], col = 1:plate_size[2]) %>%
    filter(!(row == position_L[1] & col == position_L[2]))
  available_positions <- available_positions[sample(nrow(available_positions)),]
  for (i in seq_along(objects)) {
    pos <- available_positions[i,]
    plate[pos$row, pos$col] <- objects[i]
  }
  
  return(plate)
}

# display plate
display_plate <- function(plate, plate_number) {
  symbol_map <- c(
    'C' = 'control',  
    'L' = 'logger',  
    'P. abies' = 'Piab',  
    'P. cembra' = 'Pice',  
    'A. pseudoplatanus' = 'Acps',  
    'S. aucuparia' = 'Soau'
  )
  
  shuffled_plate <- plate %>% as.data.frame() %>%
    mutate(across(everything(), ~ symbol_map[.])) %>%
    as.matrix()
  
  cat(glue("Plate {plate_number}\n"))
  
  # remove unnecessary row names
  plate_df <- as.data.frame(shuffled_plate)
  rownames(plate_df) <- NULL

  print(kable(plate_df, format = "pipe", align = "c", col.names = NULL))
  cat("\n")
}

# generate plates
if (TEST) {
  num_plates <- 1 # Test mode: produce only one plate
} else {
  num_plates <- 72 # Normal mode: produce all plates
}

plates <- replicate(num_plates, generate_plate(), simplify = FALSE)
