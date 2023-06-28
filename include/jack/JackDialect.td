//===- JackDialect.td - Dialect definitions for jack dialect ------*- tablegen -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef JACK_DIALECT
#define JACK_DIALECT

include "mlir/IR/OpBase.td"

def Jack_Dialect : Dialect {
  let name = "jack";
  let cppNamespace = "::mlir::jack";
  let description = [{
	The Jack dialect is a simple dialect created to help me 
	familiarize myself with the MLIR framework.

	It contains a set of basic operations similar in function
	to llvm IR instructions.
  }];
  let hasConstantMaterializer = 1;
  let usePropertiesForAttributes = 1;
}

// Base class for jack dialect operations. This operation inherits from the base
// `Op` class in OpBase.td, and provides:
//   * The parent dialect of the operation.
//   * The mnemonic for the operation, or the name without the dialect prefix.
//   * A list of traits for the operation.
class Jack_Op<string mnemonic, list<Trait> traits = []> :
    Op<Jack_Dialect, mnemonic, traits>;

#endif // JACK_DIALECT
