# Dir-Walk
**Dir-Walk** (`dir_walk.sh`) is a [bash](https://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) script to recursively walk a directory tree and do something useful within each directory. One such example is the generation of an M3U file for any directory that happens to contains OGG audio files (see the script itself for details). This script, as written, just outputs the full path of the current directory from the directory root passed in.

[<img src="https://user-images.githubusercontent.com/10182110/175392693-4124b8eb-f306-4177-abea-c219599728c3.png">](https://commons.wikimedia.org/wiki/File:Sierpinski_pyramid.png)

## [Developed with a Bash Template (BaT)](https://github.com/user/a-bash-template)[<img src="https://user-images.githubusercontent.com/10182110/145758715-b127adfc-710b-49d3-9ede-151adc83ae76.png" width="150" />](https://github.com/user/a-bash-template)

**Dir-Walk** uses a Bash shell template (BaT) called **[A-Bash-Template](https://github.com/user/a-bash-template)** designed to make script development and command line argument management more robust, easier to implement, and easier to maintain. Here are a few of those features:

- Dependencies checker: a routine that checks all external program dependencies (*e.g.*, [jq](https://stedolan.github.io/jq/))
- Arguments and script details--such as script description and syntax--are stored in the [JSON](http://www.json.org/) file format (*i.e.*, `config.json`)
- JSON queries (using [jq](https://stedolan.github.io/jq/)) handled through wrapper functions
- A script banner function automates banner generation, reading directly from `config.json`
- Command line arguments are parsed and tested for completeness using both short and long-format argument syntax (*e.g.*, `-f|--font`)
- Optional command line arguments are permissible and managed through the JSON configuration file
- Template functions organized into libraries (see the [Bash-Lib](https://github.com/user/bash-lib) project for details) to minimize code footprint in the main script

For more details about using a bash template, [check out the BaT sources here](https://github.com/user/a-bash-template).

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

> **Note that the current script simply outputs the current directory "visited" and nothing more. The script also included a line (commented out) that will create an audio M3U file if OGG audio files are found in that directory. Pretty cool!**

## >> A Note on Cloning: This Project Uses Git Submodules

This project uses a Git [submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) project, specifically the `bash-lib` folder to keep project libraries up-to-date without manual intervention.

So, be sure to clone this project with the `--recursive` switch (`git clone --recursive https://github.com/this_project`) so any submodule project(s) will be automatically cloned as well. If you clone into this project without this switch, you'll likely see empty submodule project folders (depending on your version of Git).