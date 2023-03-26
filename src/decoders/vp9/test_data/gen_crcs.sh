#!/bin/bash

# Generates the CRCs for all .vp9 and .ivf files in the current directory using ffmpeg.

for f in `ls *.vp9 *.ivf`; do
	ffmpeg -i $f -pix_fmt nv12 -f framehash -hash crc32 - |grep -v '^#' |awk '{print $6}' >$f.crc
done
