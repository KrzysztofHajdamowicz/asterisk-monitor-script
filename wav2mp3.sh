#!/bin/bash

export BASEDIR=/var/spool/asterisk
export SOURCEDIR="${BASEDIR}/monitor"
export DESTDIR="${BASEDIR}/mixed/$(date --iso-8601)"
export oldpwd="${PWD}"

mkdir -p "${DESTDIR}"
cd "${SOURCEDIR}"
find ./ -type f -name \*.wav.wav -print0 | xargs -0 -n 1 -P $(nproc --all) -i bash -c 'export file="{}"; export SOURCEFILE="${SOURCEDIR}/${file}"; export DESTFILE="${DESTDIR}/${file//wav/mp3}"; /usr/local/bin/encode_file.sh "${SOURCEFILE}" "${DESTFILE}"; if [[ -f "${DESTFILE}" ]]; then rm -f "${SOURCEFILE}"; fi'

cd "${oldpwd}"
