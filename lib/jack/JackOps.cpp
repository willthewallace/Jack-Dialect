//===- JackOps.cpp - Jack dialect ops ---------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "jack/JackDialect.h"
#include "jack/JackOps.h"

#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/FunctionImplementation.h"
#include "mlir/IR/OpImplementation.h"

using namespace mlir;
using namespace mlir::jack;

#define GET_OP_CLASSES
#include "jack/JackOps.cpp.inc"

//===----------------------------------------------------------------------===//
// ConstantOp
//===----------------------------------------------------------------------===//

// TODO: Do we need this builder? Is it correct?
/// Build a constant operation.
/// The builder is passed as an argument, so is the state that this method is
/// expected to fill in order to build the operation.
void ConstantOp::build(mlir::OpBuilder &builder, mlir::OperationState &state,
                       double value) {
  auto dataType = RankedTensorType::get({}, builder.getF64Type());
  auto dataAttribute = DenseElementsAttr::get(dataType, value);
  ConstantOp::build(builder, state, dataType, dataAttribute);
}

mlir::ParseResult ConstantOp::parse(mlir::OpAsmParser &parser,
                                    mlir::OperationState &result) {
  mlir::DenseElementsAttr value;
  if (parser.parseOptionalAttrDict(result.attributes) ||
      parser.parseAttribute(value, "value", result.attributes))
    return failure();

  result.addTypes(value.getType());
  return success();
}

void ConstantOp::print(mlir::OpAsmPrinter &printer) {
  printer << " ";
  printer.printOptionalAttrDict((*this)->getAttrs(), /*elidedAttrs=*/{"value"});
  printer << getValue();
}

// Will need to be revisited when we decide how to implement ConstantOp properly.
// For now takes a tensor attribute input but forces it to be unranked
// i.e. a regular float
mlir::LogicalResult ConstantOp::verify() {
  auto attrType = llvm::dyn_cast<mlir::RankedTensorType>(getValue().getType());
  if (attrType) {
    return emitOpError("attribute type must be unranked tensor "
                       "attribute: ")
           << attrType.getRank();
  }

  return mlir::success();
}
