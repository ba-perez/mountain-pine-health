### Calculate the number of seeds out of their weight
### Coder: Barbara Araujo
### Date: 2024.09.18.

# The TKG (Tausendkorngewicht) is an established parameter in seed trade
# and indicates the weight of 1000 seeds for a given species
# It will be used to quantify the amount of seeds bought for the study

# IMPORT PACKAGES
import math

# function to calculate number of seeds out of their weight
def quantify_seeds(tree_dict):
    for item in tree_dict:
        tree_name = item[0]
        min_weight = float(item[1])
        max_weight = float(item[2])
        available_weight = float(item[3])
        
        # calculate number of available seeds, rounded down
        max_seed_count = math.floor((available_weight * 1000) / min_weight)
        min_seed_count = math.floor((available_weight * 1000) / max_weight)
        mean_seed_count = math.floor((min_seed_count + max_seed_count) / 2)
        
        print(
            f"For {tree_name}\n"
            f"No. of available seeds: {min_seed_count} - {max_seed_count}\n"
            f"Mean seed count: {mean_seed_count}\n"
        )

# create list with:
# Species' scientific name
# Min. TKG of the species (g)
# Max. TKG of the species (g)
# Available (bought) seed weight (g)
# Source for TGK: gebirgswald.ch, confirmed by Lexica from Schuck et al.
tree_dictionary = [
    ["Picea abies", 4, 8, 100],
    ["Pinus cembra", 150, 300, 2000],
    ["Acer pseudoplatanus", 100, 250, 3000],
    ["Sorbus aucuparia", 3.5, 5, 200]
]

# apply function
quantify_seeds(tree_dictionary)
