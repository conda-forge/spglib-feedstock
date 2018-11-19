#!/bin/bash

echo $CC $PREFIX $SRC_DIR

cmake -DCMAKE_C_COMPILER=$CC -DCMAKE_INSTALL_PREFIX=$PREFIX ${SRC_DIR}
make install

(cd python
    $PYTHON -m pip install .
    #$PYTHON setup.py install --single-version-externally-managed --record record.txt 
)


