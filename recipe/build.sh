#!/bin/bash

mkdir build

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
  DO_CTESTS="OFF"
else
  DO_CTESTS="ON"
fi

cmake "${SRC_DIR}" -B ./build \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DSPGLIB_SHARED_LIBS=ON \
  -DCMAKE_FIND_FRAMEWORK=NEVER \
  -DCMAKE_FIND_APPBUNDLE=NEVER \
  -DSPGLIB_WITH_TESTS=${DO_CTESTS}
cmake --build ./build
# TODO: This should be moved to run_test.sh. Cannot get the appropriate work directory to run these tests
ctest --test-dir ./build
cmake --install ./build

$PYTHON -m pip install .
