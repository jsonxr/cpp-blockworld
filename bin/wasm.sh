#!/bin/bash

# emscripten
libs/emsdk/emsdk install 4.0.20
libs/emsdk/emsdk activate 4.0.20
source libs/emsdk/emsdk_env.sh

conan install . -pr profiles/emscripten -s build_type=Debug --output-folder=build-wasm --build missing
emcmake cmake -S . -B build-wasm -DCMAKE_TOOLCHAIN_FILE=build-wasm/conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Debug
cmake --build build-wasm
