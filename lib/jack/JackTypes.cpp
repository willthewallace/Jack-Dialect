//===- JackTypes.cpp - Jack dialect types -----------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "jack/JackTypes.h"

#include "jack/JackDialect.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir::jack;

#define GET_TYPEDEF_CLASSES
#include "jack/JackOpsTypes.cpp.inc"

// TODO: Type support
/*void JackDialect::registerTypes() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "jack/JackOpsTypes.cpp.inc"
      >();
}*/
