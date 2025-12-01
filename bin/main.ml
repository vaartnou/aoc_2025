open Aoc_2025

let () =
  let input = Common.read_file "data/day01.txt" in

  let ans1 = Day01.part1 input in
  let ans2 = Day01.part2 input in

  Printf.printf "Day 1, part 1: %s\n" ans1;
  Printf.printf "Day 1, part 2: %s\n" ans2
