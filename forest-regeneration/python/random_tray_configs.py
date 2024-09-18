### Randomise seed and control placement in propagation trays -- Python version
### Coder: Barbara Araujo
### Date: 2024.09.18.

# IMPORT PACKAGES

# randomiser
import random
random.seed(69)

# output design
from rich.console import Console
from rich.table import Table

# CONTROL STATION
TEST = True # Test version ON/OFF (will only produce one plate)

# define objects and their counts
# 3 control pots ('C') have soil but no seeds, 5 pots for each of the 4 species in the experiment
objects = ['C']*3 + ['P. abies']*5 + ['P. cembra']*5 + ['A. pseudoplatanus']*5 + ['S. aucuparia']*5
num_plates = 72
plate_size = (4, 6)

# fix position of microclimate logger 'L' in plate
position_L = (2, 2)

# generate plate with random positions
def generate_plate():
    # empty plate
    plate = [['' for _ in range(plate_size[1])] for _ in range(plate_size[0])]
    
    # fix position of 'L'
    plate[position_L[0]][position_L[1]] = 'L'
     
    # randomly shuffle and assign other positions
    available_positions = [(r, c) for r in range(plate_size[0]) for c in range(plate_size[1]) if (r, c) != position_L]
    random.shuffle(available_positions)
    for obj, (r, c) in zip(objects, available_positions):
        plate[r][c] = obj

    return plate

# display plate
def display_plate(plate, plate_number):
    console = Console()
    table = Table(show_header=False, show_lines=True, border_style='black')

    for _ in range(plate_size[1]):
        table.add_column(justify="center")

    # rename objects for visualisation
    symbol_map = {
        'C': '[black]control[/black]',
        'L': '[black]logger[/black]',
        'P. abies': '[bright_blue]Piab[/bright_blue]',
        'P. cembra': '[green4]Pice[/green4]',
        'A. pseudoplatanus': '[bright_red]Acps[/bright_red]',
        'S. aucuparia': '[gold3]Soau[/gold3]'
    }

    # populate and print table
    for row in plate:
        table.add_row(*[symbol_map[cell] for cell in row])

    console.print(f"Plate {plate_number}")
    console.print(table)

# generate one plate for testing
if TEST:

    test_plate = generate_plate()
    display_plate(test_plate, "test plate")

# generate all 72 plates
if not TEST:

    plates = [generate_plate() for _ in range(num_plates)]
    for i, plate in enumerate(plates, start=1):
        display_plate(plate, i)
