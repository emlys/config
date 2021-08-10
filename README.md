# config
store and sync various config files

## `configs/`
keep all config files in this directory

## `locations`
maps each config file name in `configs/` to the directory it should live in
syntax:
```
config filename: target path
```
for example
```
.bash_profile: ~
```

## setup_symlinks.py
python script to create a symlink of each config file in `configs/` in the target directory given in `locations`:
```
$ python setup_symlinks.py
```
