//===- JackBase.td - Base definitions for jack dialect ------*- tablegen -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef JACK_BASE
#define JACK_BASE
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
#endif // JACK_BASE
