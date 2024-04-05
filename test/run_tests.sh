#!/usr/bin/env bash

# get BUILD_DIR from argument, or default to build
BUILD_DIR=${1:-build}

cd $BUILD_DIR
printf "testing plthook_test(open)\n"
./plthook_test open
printf "testing plthook_test(open_by_handle)\n"
./plthook_test open_by_handle
printf "testing plthook_test(open_by_address)\n"
./plthook_test open_by_address
