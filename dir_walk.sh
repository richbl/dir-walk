#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# -----------------------------------------------------------------------------
# Copyright (C) Business Learning Incorporated (businesslearninginc.com)
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License at
# <http://www.gnu.org/licenses/> for more details.
#
# -----------------------------------------------------------------------------
#
# Dir Walk (dir_walk): recurse into directory(s) and do something interesting
#
# requirements:
#  --jq program installed: used to parse /data/config.json
#
# inputs:
#  --full path of directory root to recurse into
#
# outputs:
#  --notification of script success/failure
#  --side-effect(s): for demo, outputs path of each recursed directory
#

#
# NOTE:
#   The string '[user-config]' is an indication that some user configuration
#   may be needed to customize this script
#

# -----------------------------------------------------------------------------
# script library sources and declarations
#
EXEC_DIR="$(dirname "$(readlink -f "$0")")"
source "${EXEC_DIR}/bash-lib/general"
source "${EXEC_DIR}/bash-lib/args"

# [user-config] set any external program dependencies here
declare -a REQ_PROGRAMS=('jq')

# -----------------------------------------------------------------------------
# perform script configuration, arguments parsing, and validation
#
check_program_dependencies "${REQ_PROGRAMS[@]}"
display_banner
scan_for_args "$@"
check_for_args_completeness

# -----------------------------------------------------------------------------
# [user-config] any code from this point on is custom code, using
# the sevices and variables available through the template
#

# declare script arguments (see config.json)
arg_dir_root="$(get_config_arg_value directory)"
readonly arg_dir_root

# verify existence of arg_dir_root
exist_directory "$arg_dir_root"

# set Internal Field Separator to newline (ignore whitespace in names)
IFS=$'\n'

dir_list=$(find "$arg_dir_root" -mindepth 1 -type d)

# recursively loop through dir_list results and do something moderately useful
# in each directory

for d in $dir_list; do

  # a simple demo: output the full pathname of a directory in dir_list
  echo "$d"

  # something much more interesting... creating a M3U file for OGG audio files,
  # one M3U file for each directory containing audio files
  # ls -1v "$d" | grep .ogg >/tmp/1.m3u && mv /tmp/1.m3u "$d"/"$("basename" "$d")".m3u

done

unset IFS
