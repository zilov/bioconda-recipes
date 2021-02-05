#!/bin/sh

set -euxo pipefail

if [[ $OSTYPE == "darwin"* ]]; then
  export HOME="/Users/distiller"
fi

mkdir -p $PREFIX/bin

# Dependencies
nimble install -y --verbose argparse docopt terminaltables iterutils readfq

# Build program
nim c --threads:on -p:lib --opt:speed -d:release -o:$PREFIX/bin/seqfu src/sfu.nim

# Accessory utils
for SOURCE in src/fu_*.nim;
do
	NAME=$(basename $SOURCE | sed 's/_/-/'  |cut -f1 -d.)
	THREADS=""
	if [[ $(grep thread "$UTIL")  ]]; then
  	 THREADS=" --threads:on "
 	fi
	echo "$SOURCE -> $NAME"
	nim c $THREADS -p:lib --opt:speed -d:release -o:"$PREFIX/bin/${NAME}" "$SOURCE" || true
done
