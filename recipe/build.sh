#!/bin/bash

echo $CC $PREFIX $SRC_DIR

cmake -DCMAKE_C_COMPILER=$CC -DCMAKE_INSTALL_PREFIX=$PREFIX ${SRC_DIR}
make install

(cd python
    cp -r ../src .
    $PYTHON -m pip install .
)


