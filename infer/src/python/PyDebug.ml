(*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *)

open! IStd
module F = Format

(* Custom verbose flag, while I'm still building this front end.
   I'll move to Logging once it's done. *)
let debug = ref false

let debug_level = ref 0

(* Inspired by PulseFormula.Debug. Check there for plugging it into Logging too *)
let dummy_formatter = F.make_formatter (fun _ _ _ -> ()) (fun () -> ())

let p ?(level = 0) fmt =
  if !debug && level <= !debug_level then F.kasprintf (fun s -> F.printf "%s" s) fmt
  else F.ifprintf dummy_formatter fmt


let enable_debug () = debug := true

let disable_debug () = debug := false
