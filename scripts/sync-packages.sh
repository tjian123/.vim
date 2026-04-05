#!/usr/bin/env bash

set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
START_DIR="$ROOT_DIR/pack/vendor/start"
OPT_DIR="$ROOT_DIR/pack/vendor/opt"

mkdir -p "$START_DIR" "$OPT_DIR"

sync_list() {
  list_file=$1
  target_dir=$2

  [ -f "$list_file" ] || return 0

  while IFS= read -r repo || [ -n "$repo" ]; do
    case "$repo" in
      ''|'#'*) continue ;;
    esac

    name=${repo##*/}
    dest="$target_dir/$name"
    url="https://github.com/$repo.git"

    if [ -d "$dest/.git" ]; then
      git -C "$dest" pull --ff-only
    else
      git clone --depth 1 "$url" "$dest"
    fi
  done < "$list_file"
}

sync_list "$ROOT_DIR/packages/start.txt" "$START_DIR"
sync_list "$ROOT_DIR/packages/opt.txt" "$OPT_DIR"
