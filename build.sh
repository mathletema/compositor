#/bin/bash

rm build/*
cd build
qmake ../compositor.pro
make
./compositor
