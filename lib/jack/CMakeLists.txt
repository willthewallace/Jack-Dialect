add_mlir_dialect_library(MLIRJack
        JackDialect.cpp
        JackOps.cpp
        JackTypes.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/include/jack

        DEPENDS
        MLIRJackOpsIncGen

        LINK_LIBS PUBLIC
        MLIRIR
        MLIRInferTypeOpInterface
        MLIRFuncDialect
        )
