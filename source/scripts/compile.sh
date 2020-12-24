#!/bin/bash
myTime="/usr/bin/time -f %U sh -c"

timeIt(){
    name="$(basename -s .cpp $1)"
    echo "Preprocess"
    $myTime "g++ -E src/$name.cpp > compileTests/1_$name.cpp"
    echo "Compile"
    $myTime "g++ -S -o compileTests/2_$name.s compileTests/1_$name.cpp"
    echo "Assemble"
    $myTime "g++ -c compileTests/2_$name.s -o compileTests/3_$name.o"
    echo "Link"
    $myTime "g++ -o bin/4_$name compileTests/3_$name.o"
    echo "Total (independent)"
    $myTime "g++ -o bin/5_$name src/$name.cpp"
}

timeIt $1
