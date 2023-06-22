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

include "mlir/IR/OpBase.td"
include "mlir/IR/FunctionInterfaces.td"
include "mlir/IR/SymbolInterfaces.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

// Provide a definition of the 'jack' dialect in the ODS framework so that we
// can define our operations.
def Jack_Dialect : Dialect {
  let name = "jack";
  let cppNamespace = "::mlir::jack";
}

// Base class for jack dialect operations. This operation inherits from the base
// `Op` class in OpBase.td, and provides:
//   * The parent dialect of the operation.
//   * The mnemonic for the operation, or the name without the dialect prefix.
//   * A list of traits for the operation.
class Jack_Op<string mnemonic, list<Trait> traits = []> :
    Op<Jack_Dialect, mnemonic, traits>;

#endif // JACK_OPS
