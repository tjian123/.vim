#!/usr/bin/env bash

set -eu

vim -Nu "$PWD/vimrc" -n -es -c 'qa'
