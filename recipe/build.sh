#!/bin/bash

export CMAKE_GENERATOR="Ninja"

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
  DO_CTESTS="OFF"
else
  DO_CTESTS="ON"
fi

cmake "${SRC_DIR}" -B ./build \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DSPGLIB_SHARED_LIBS=ON \
  -DSPGLIB_WITH_Fortran=ON \
  -DCMAKE_FIND_FRAMEWORK=NEVER \
  -DCMAKE_FIND_APPBUNDLE=NEVER \
  -DSPGLIB_WITH_TESTS=${DO_CTESTS}
cmake --build ./build
# TODO: This should be moved to run_test.sh. Cannot get the appropriate work directory to run these tests
ctest --test-dir ./build --no-tests=ignore
cmake --install ./build

$PYTHON -m pip install .
