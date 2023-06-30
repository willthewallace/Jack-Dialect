//===- JackOps.td - Jack dialect operation definitions ----------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Defines the operations of the Jack dialect.
//
//===----------------------------------------------------------------------===//

#ifndef JACK_OPS
#define JACK_OPS

include "jack/JackTypes.td"
include "mlir/IR/OpBase.td"
include "mlir/IR/FunctionInterfaces.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def ConstantOp : Jack_Op<"constant", [Pure]> {
  // Provide a summary and description for this operation. This can be used to
  // auto-generate documentation of the operations within our dialect.
  let summary = "constant";
  let description = [{
    Constant operation turns a literal into an SSA value. The data is attached
    to the operation as an attribute. For example:

    ```mlir
      %0 = "jack.constant"()
	{ value = 1.0 : F64ElementsAttr }
                        : () -> F64>
    ```
  }];

  // The constant operation takes an attribute as the only input.
  // TODO: Can we generalize this OP for any constant value type
  //       that the Jack language can declare?
  let arguments = (ins F64ElementsAttr:$value);

  // The constant operation returns a single 64 bit float.
  let results = (outs F64);

  // Indicate that the operation has a custom parser and printer method.
  let hasCustomAssemblyFormat = 1;

  // Add custom build methods for the constant operation. These method populates
  // the `state` that MLIR uses to create operations, i.e. these are used when
  // using `builder.create<ConstantOp>(...)`.
  let builders = [ 
    // Build a constant with a given constant tensor value.
    OpBuilder<(ins "DenseElementsAttr":$value), [{
      build($_builder, $_state, value.getType(), value);
    }]>,

    // Build a constant with a given constant floating-point value.
    OpBuilder<(ins "double":$value)>
  ];  

  // Indicate that additional verification for this operation is necessary.
  let hasVerifier = 1;
}


#endif // JACK_OPS
