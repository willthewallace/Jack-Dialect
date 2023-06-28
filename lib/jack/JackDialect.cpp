//===----------------------------------------------------------------------===//
//
// This file implements the dialect for the Jack IR: custom type parsing and
// operation verification.
//
//===----------------------------------------------------------------------===//

#include "jack/JackDialect.h"
#include "jack/JackOps.h"
#include "jack/JackTypes.h"


#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/FunctionImplementation.h"
#include "mlir/IR/OpImplementation.h"

using namespace mlir;
using namespace mlir::jack;

#include "jack/JackOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// JackDialect
//===----------------------------------------------------------------------===//

void JackDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "jack/JackOps.cpp.inc"
      >();
}

//TODO: Consider moving Jack Operations to its own file
//===----------------------------------------------------------------------===//
// Jack Operations
//===----------------------------------------------------------------------===//

