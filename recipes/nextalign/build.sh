#!/bin/bash

mkdir -p $PREFIX/bin

cd $SRC_DIR
cmake $SRC_DIR
INSTALL_DIR=$PREFIX make prod

exit 0