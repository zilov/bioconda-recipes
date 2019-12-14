#!/bin/bash
set -eu -o pipefail

./configure SAMTOOLS=${PREFIX}/include HTSLIB=${PREFIX}/include
make
make install