# An out-of-tree MLIR dialect

The Jack dialect is a simple MLIR dialect I created to teach myself mlir. 
The name is a reference to the Jack programming language used in the Nand to Tetris online course.

The dialect contains basic operations intended to be capable of fully representing code written in the 
Jack programming language.

To build this project as part of an LLVM build using 'LLVM_EXTERNAL_PROJECTS':
```sh
mkdir build && cd build
cmake -G Ninja `$LLVM_SRC_DIR/llvm` \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD=host
    -DLLVM_ENABLE_PROJECTS=mlir \
    -DLLVM_EXTERNAL_PROJECTS=jack-dialect -DLLVM_EXTERNAL_JACK_DIALECT_SOURCE_DIR=../
cmake --build . --target check-standalone
```

