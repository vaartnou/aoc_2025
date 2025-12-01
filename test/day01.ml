open Alcotest
open Aoc_2025

let test_sample () =
  let input = Common.read_file "data/day01_sample.txt" in
  let expected = "3" in
  let actual = Day01.part1 input in
  check string "same result" actual expected

let suite = [ ("expected sample", `Quick, test_sample) ]
let () = Alcotest.run "sample" [ ("sample", suite) ]
