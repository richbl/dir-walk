# Dir-Walk
**Dir-Walk** (`dir_walk.sh`) is a [bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) script to recursively walk a directory tree and do something useful within each directory.

One such example is the generation of an [M3U file](https://en.wikipedia.org/wiki/M3U) for any directory that contains [OGG audio files](https://en.wikipedia.org/wiki/Ogg#Ogg_codecs) (see the script itself for details). This script however, as written, just outputs the full path of the current directory from the directory root passed in.

<picture><source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/10182110/175392693-4124b8eb-f306-4177-abea-c219599728c3.png"><source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/10182110/175392693-4124b8eb-f306-4177-abea-c219599728c3.png"><img src="https://user-images.githubusercontent.com/10182110/175392693-4124b8eb-f306-4177-abea-c219599728c3.png"></picture>

## [<img src="https://github.com/user-attachments/assets/4dc1e16e-3fd3-481c-9a43-b027c029dd27" width="150" />](https://github.com/richbl/a-bash-template)[Developed with a Bash Template (BaT)](https://github.com/richbl/a-bash-template)

**Dir-Walk** uses a Bash shell template (BaT) called **[A-Bash-Template](https://github.com/richbl/a-bash-template)** designed to make script development and command line argument management more robust, easier to implement, and easier to maintain. Here are a few of those features:

- Dependencies checker: a routine that checks all external program dependencies (*e.g.*, [jq](https://stedolan.github.io/jq/))
- Arguments and script details--such as script description and syntax--are stored in the [JSON](http://www.json.org/) file format (*i.e.*, `config.json`)
- JSON queries (using [jq](https://stedolan.github.io/jq/)) handled through wrapper functions
- A script banner function automates banner generation, reading directly from `config.json`
- Command line arguments are parsed and tested for completeness using both short and long-format argument syntax (*e.g.*, `-f|--font`)
- Optional command line arguments are permissible and managed through the JSON configuration file
- Template functions organized into libraries (see the [Bash-Lib](https://github.com/richbl/bash-lib) project for details) to minimize code footprint in the main script

For more details about using a bash template, [check out the BaT sources here](https://github.com/richbl/a-bash-template).

## Requirements

- An operational [Bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) environment (Bash 5.1.8 used during development)
- One additional external program:
  - [jq](https://stedolan.github.io/jq/), for parsing the `config.json` file

While this package was initially written and tested under Linux (Ubuntu 21.10), there should be no reason why this won't work under other shells or Unix-like operating systems that support the `gsettings` application.

## Basic Usage
**Dir-Walk** is run through a command line interface, so all of the command options are made available there.

Here's the default response when running `dir_walk.sh` with no arguments:

	$ ./dir_walk.sh

	 |
	 |  Dir Walk: recurse into directory(s) and do something interesting
	 |    1.0.0
	 |
	 |  Usage:
	 |    dir_walk.sh -d directory
	 |
	 |  -d, --directory  directory root to recurse into
	 |

	Error: directory argument (-d|--directory) missing.

In this example, the program responds by indicating that the required script arguments must be set before proper operation.

When arguments are correctly passed, the script provides feedback on the success or failure of the script actions:

	$ ./dir_walk.sh -d ~/music

	 |
	 |  Dir Walk: recurse into directory(s) and do something interesting
	 |    1.0.0
	 |
	 |  Usage:
	 |    dir_walk.sh -d directory
	 |
	 |  -d, --directory  directory root to recurse into
	 |

    /home/user/music/A Flock of Seagulls
    /home/user/music/A Flock of Seagulls/A Flock of Seagulls
    /home/user/music/Alanis Morissette
    /home/user/music/Alanis Morissette/Jagged Little Pill
    /home/user/music/Alanis Morissette/Supposed Former Infatuation Junkie
    /home/user/music/Alan Parsons
    /home/user/music/Alan Parsons/Try Anything Once

## IMPORTANT: This Project Uses Git Submodules <picture><source media="(prefers-color-scheme: dark)" srcset="https://user-images.githubusercontent.com/10182110/208980142-08d4cf6e-20ac-4243-ac69-e056258b0315.png" width="150"><source media="(prefers-color-scheme: light)" srcset="https://user-images.githubusercontent.com/10182110/208980142-08d4cf6e-20ac-4243-ac69-e056258b0315.png" width="150"><img src="https://user-images.githubusercontent.com/10182110/208980142-08d4cf6e-20ac-4243-ac69-e056258b0315.png" width="150"></picture>

This project uses [Git submodule project(s)](https://git-scm.com/book/en/v2/Git-Tools-Submodules) (located in the `bash-lib` folder) to keep this project up-to-date without manual intervention.

**Be sure to clone this project with the `--recursive` switch** (`git clone --recursive https://github.com/richbl/this_project`) so any submodule project(s) will be automatically cloned as well. If you clone into this project without this switch, you'll likely see empty submodule project folders (depending on your version of Git).
