import os
import sys


# read in source filename: target directory pairs from locations file
config_map = {}
with open('locations') as locations_file:
    for line in locations_file:
        source_filename, target_dir = line.strip().split(': ')
        config_map[source_filename] = target_dir

for config_filename in os.listdir('configs'):
    try:
        target_dir = config_map[config_filename]
    except KeyError:
        print(f'ERROR: {config_filename} in configs/ not listed in locations')
        sys.exit(1)

    source_path = os.path.abspath(os.path.join('configs', config_filename))
    target_path = os.path.abspath(os.path.expanduser(
        os.path.join(target_dir, config_filename)))

    # delete the target if it already exists
    try:
        os.remove(target_path)
    except FileNotFoundError:
        pass

    os.symlink(source_path, target_path)
    print(f'Created symlink from {source_path} to {target_path}')
