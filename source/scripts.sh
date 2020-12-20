#!/bin/bash

myTime="/usr/bin/time -f %U sh -c"

$myTime "g++ -o bin/simple src/1a_simple.cpp && ./bin/simple > /dev/null" 2> tmp
A=`cat tmp`
$myTime "./bin/simple > /dev/null" 2> tmp
B=`cat tmp`
$myTime "python3 src/1b_simple.py > /dev/null" 2> tmp
C=`cat tmp`

echo "newgraph" > graphs/1.jgr
echo "xaxis size 2" >> graphs/1.jgr
echo "min 0.1 max 3.9 hash 1 mhash 0 shash 0" >> graphs/1.jgr
echo "label : Words" >> graphs/1.jgr
echo "hash_label at 1 : Compile &\\" >> graphs/1.jgr
echo "Run" >> graphs/1.jgr
echo "hash_label at 2 : C++" >> graphs/1.jgr
echo "hash_label at 3 : Python" >> graphs/1.jgr
echo "yaxis min 0 max .04 size 2" >> graphs/1.jgr
echo "newcurve marktype xbar cfill 1 1 0" >> graphs/1.jgr
echo "    marksize .8 .02" >> graphs/1.jgr
echo "    label : Compile/Run Time" >> graphs/1.jgr
echo "      pts" >> graphs/1.jgr
echo "      1 $A" >> graphs/1.jgr
echo "      2 $B" >> graphs/1.jgr
echo "      3 $C" >> graphs/1.jgr


echo "Compile & run"
$myTime "g++ -o bin/loop src/2a_loop.cpp && ./bin/loop > /dev/null"
echo "Run"
$myTime "./bin/loop > /dev/null"
echo "Python"
$myTime "python3 src/2b_loop.py > /dev/null"

rm -f bin/* tmp

i=0
for graph in graphs/*.jgr; do
    ((i=i+1))
    jgraph -P $graph | ps2pdf - images/$i.pdf 
done
