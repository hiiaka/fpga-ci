#!/bin/sh

set -x

cd $(dirname $0)

docker build --no-cache --rm -t tethys/xilinx-fpga-ci .

exit $?

