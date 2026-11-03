/-
A minimal replacement for `Seasawher/mk-exercise` (MIT License, Copyright (c) 2024 Kitamado),
whose package configuration no longer loads on recent Lean versions.

Usage: `lake exe mk_exercise <input_dir> <output_dir>`

Every block of code enclosed by two `-- sorry` lines is replaced by a single `sorry`,
preserving indentation. That is the only marker this repository uses.
-/
open System

/-- Replace each `-- sorry ... -- sorry` block with `sorry`. -/
def extractExercise (lines : Array String) : Except String String := Id.run do
  let mut inside := false
  let mut out := ""
  for line in lines do
    if line.trimAscii.toString == "-- sorry" then
      inside := !inside
      if inside then
        let indent := line.takeWhile (· == ' ')
        out := out ++ indent.toString ++ "sorry\n"
      continue
    if !inside then
      out := out ++ line ++ "\n"
  if inside then
    return .error "unclosed `-- sorry` block"
  return .ok out

partial def leanFiles (dir : FilePath) : IO (Array FilePath) := do
  let mut acc := #[]
  for entry in ← dir.readDir do
    if ← entry.path.isDir then
      acc := acc ++ (← leanFiles entry.path)
    else if entry.path.extension == some "lean" then
      acc := acc.push entry.path
  return acc

def main (args : List String) : IO UInt32 := do
  let [inputDir, outputDir] := args
    | IO.eprintln "usage: mk_exercise <input_dir> <output_dir>"; return 1
  for path in ← leanFiles inputDir do
    let some rel := path.toString.dropPrefix? (inputDir ++ "/") |>.map (·.toString)
      | IO.eprintln s!"unexpected path {path}"; return 1
    match extractExercise (← IO.FS.lines path) with
    | .error e => IO.eprintln s!"{path}: {e}"; return 1
    | .ok content =>
      let outPath := FilePath.mk outputDir / rel
      if let some parent := outPath.parent then
        IO.FS.createDirAll parent
      IO.FS.writeFile outPath content
  return 0
