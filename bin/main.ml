open Aoc_2025

let () =
  let input = Common.read_file "data/day01.txt" in
  let input2 = Common.read_file "data/day02.txt" in

  let ans1 = Day01.part1 input in
  let ans2 = Day01.part2 input in
  let day2ans1 = Day02.part1 input2 in

  Printf.printf "Day 1, part 1: %s\n" ans1;
  Printf.printf "Day 1, part 2: %s\n" ans2;
  Printf.printf "Day 2, part 1 : %s\n" day2ans1
