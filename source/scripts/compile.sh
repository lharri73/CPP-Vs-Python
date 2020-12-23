#!/bin/bash
myTime="/usr/bin/time -f %U sh -c"
$myTime "g++ -E src/preprocess.cpp > compileTests/postproc.cpp"
$myTime "g++ -S -o compileTests/postAssemble.s compileTests/postproc.cpp"
$myTime "g++ -c compileTests/postAssemble.s -o compileTests/postassemble.o"
$myTime "g++ -o bin/linked compileTests/postassemble.o"
