#!/bin/sh
#
# Poly2Tri Copyright (c) 2009-2013, Poly2Tri Contributors
# http://code.google.com/p/poly2tri/
#
# poly2tri.js (JavaScript port) (c) 2009-2013, Poly2Tri Contributors
# https://github.com/r3mi/poly2tri.js
# 
# Build script for for the emscripten build of poly2tri.js
# Rémi Turboult, 01/2014
# 
# All rights reserved.
# 
# Distributed under the 3-clause BSD License, see LICENSE.txt
#/

here=`dirname $0`
src=${here}/poly2tri.cpp/poly2tri
build=${here}/../build

mkdir -p ${build}

# emscripten shall be in PATH
em++ \
    -I ${src} \
    -O2 \
    --closure 1 \
    --llvm-lto 3 \
    -s FORCE_ALIGNED_MEMORY=1 \
    -s CLOSURE_ANNOTATIONS=1 \
    --bind \
    ${src}/common/*.cc ${src}/sweep/*.cc ${here}/bindings.cpp -o ${build}/cpp.js 

# -s EXPORT_NAME='CDTModule';
# -s LIBRARY_DEBUG=1 \
# -s VERBOSE=1


