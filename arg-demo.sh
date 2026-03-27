#!/usr/bin/env bash
#set -euo pipefail
# shellcheck source=./argparse.sh
source "./frameworks/argparse.sh"

arg_desc "Copy files around with style."
#arg_flag <name> <varname> <short> <long> <help>
#arg_opt <name> <varname> <short> <long> <help> [default] [required]
#arg_pos <name> <varname> <help> [default] [required]

verbose=0; threads=""; mode="fast"; src=""; dst=""; rest=()

arg_flag  verbose verbose "-v" "--verbose" "Enable verbose output"
arg_opt   threads threads "-t" "--threads" "Number of worker threads" "" 0
arg_opt   mode    mode    "-m" "--mode"    "Copy mode (fast|safe)"     "fast" 0
arg_pos   src     src     "Source path" "" 1
arg_pos   dst     dst     "Destination path" "" 1
arg_pos   --      rest    "Additional args are passed through" "" 0

arg_parse "$@"

echo "Copying from '$src' to '$dst' with mode=$mode ${threads:+and $threads threads}."
if (( verbose )); then
  echo "VERBOSE on"
  echo "threads=$threads mode=$mode src=$src dst=$dst rest=(${rest[*]-})"
fi
