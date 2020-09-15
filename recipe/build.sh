#!/bin/bash

echo $CC 
echo $PREFIX 
echo $SRC_DIR

cmake -DCMAKE_C_COMPILER=$CC -DCMAKE_INSTALL_PREFIX=$PREFIX ${SRC_DIR}
make 
make DESTDIR=$PREFIX/lib install

ls -l $PREFIX/lib

(cd python
    cp -r ../src .
    $PYTHON -m pip install .
)



