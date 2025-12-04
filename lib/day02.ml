let check n =
  let s = string_of_int n in
  match s with
  | _ when String.length s mod 2 <> 0 -> false
  | _ ->
      let half = String.length s / 2 in
      let a = String.sub s 0 half in
      let b = String.sub s half half in
      a = b

let add_check_range (a, b) =
  let rec loop current sum =
    if current > b then sum
    else
      let sum' = if check current then sum + current else sum in
      loop (current + 1) sum'
  in
  loop a 0

let split_range s =
  Printf.printf "%s \n" s;
  match String.split_on_char '-' s with
  | [ a; b ] -> (int_of_string a, int_of_string b)
  | _ -> failwith "not a range"

let check_range_string s = s |> split_range |> add_check_range

let split_into_ranges s =
  s |> String.split_on_char ','
  |> List.filter (fun s -> String.length s > 0)
  |> List.map String.trim

let part1 input =
  let ranges = split_into_ranges input in
  List.fold_left (fun acc range -> acc + check_range_string range) 0 ranges
  |> string_of_int

let part2 input = input
