//===- JackTypes.td - Jack dialect types -------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef JACK_TYPES
#define JACK_TYPES

include "mlir/IR/AttrTypeBase.td"
include "jack/JackDialect.td"

//===----------------------------------------------------------------------===//
// Jack type definitions
//===----------------------------------------------------------------------===//

class Jack_Type<string name, string typeMnemonic, list<Trait> traits = []>
    : TypeDef<Jack_Dialect, name, traits> {
  let mnemonic = typeMnemonic;
}

def Jack_CustomType : Jack_Type<"Custom", "custom"> {
    let summary = "Jack custom type";
    let description = "Custom type in jack dialect";
    let parameters = (ins StringRefParameter<"the custom value">:$value);
    let assemblyFormat = "`<` $value `>`";
}

#endif // JACK_TYPES
