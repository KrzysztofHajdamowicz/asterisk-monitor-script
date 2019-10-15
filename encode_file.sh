#!/bin/bash

INFILE="${1}"
OUTFILE="${2}"
LAME=/usr/lame-3.99.5/bin/lame

$LAME -S --abr 16 -mm ${INFILE} "${OUTFILE}"
