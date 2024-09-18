### Calculate the number of seeds out of their weight
### Coder: Barbara Araujo
### 2024.01.31.

# The TGK (Tausendkorngewicht) is an established parameter in seed trade
# and indicates the mass of 1000 seeds for a given species.

# function to calculate number of seeds out of their weight
quantify_seeds <- function(tree_dict) {
  total_seeds <- 0

  for (item in tree_dict) {
    tree_name <- item[[1]]
    min_weight <- as.numeric(item[[2]])
    max_weight <- as.numeric(item[[3]])
    available_weight <- as.numeric(item[[4]])
    
    # calculate number of available seeds, rounded down
    max_seed_count <- floor((available_weight * 1000) / (min_weight))
    min_seed_count <- floor((available_weight * 1000) / (max_weight))
    mean_seed_count <- floor(mean(c(min_seed_count, max_seed_count)))
      
    cat(
      "For", tree_name,
      "\nNo. of available seeds:", min_seed_count, "-", max_seed_count,
      "\nMean seed count:", mean_seed_count, "\n\n"
    )
  }
}

# create dictionary with:
# Species' scientific name
# Min. TGK of the species (g)
# Max. TGK of the species (g)
# Available (bought) seed weight (g)
# Source for TGK: gebirgswald.ch, confirmed by Lexica from Schuck et al.
tree_dictionary <- list(
  c("Picea abies", 4, 8, 100),
  c("Pinus cembra", 150, 300, 2000),
  c("Acer pseudoplatanus", 100, 250, 3000),
  c("Sorbus aucuparia", 3.5, 5, 200)
)

# apply function
quantify_seeds(tree_dictionary)
