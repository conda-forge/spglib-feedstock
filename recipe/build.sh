#!/bin/bash

cmake -DCMAKE_C_COMPILER=$CC -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib ${SRC_DIR}
make install

(cd python
    cp -r ../src .
    $PYTHON -m pip install .
)



