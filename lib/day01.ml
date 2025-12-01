type rotation = R of int | L of int

let size = 100

let wrap n =
  let r = n mod size in
  if r < 0 then r + size else r

let parse_line line =
  let len = String.length line in
  if len = 0 then failwith "empty line";
  let dir = line.[0] in
  let num = String.sub line 1 (len - 1) |> int_of_string in
  match dir with
  | 'L' -> L num
  | 'R' -> R num
  | _ -> failwith ("bad line:" ^ line)

let parse input =
  input |> String.split_on_char '\n'
  |> List.filter (fun s -> String.length s > 0)
  |> List.map parse_line

let move r pos = match r with L n -> wrap (pos - n) | R n -> wrap (pos + n)

let count_zeroes rots =
  let initial_pos = 50 in
  let initial_count = 0 in
  List.fold_left
    (fun (count, pos) rot ->
      let pos' = move rot pos in
      let count' = if pos' = 0 then count + 1 else count in
      (count', pos'))
    (initial_count, initial_pos)
    rots

let part1 input =
  let rots = parse input in
  let count, _final_pos = count_zeroes rots in
  string_of_int count

let count_zeroes_in_rotation start_pos rot =
  let steps, step_fn =
    match rot with
    | R n -> (n, fun p -> wrap (p + 1))
    | L n -> (n, fun p -> wrap (p - 1))
  in
  let rec loop i pos hits =
    if i = 0 then (hits, pos)
    else
      let pos' = step_fn pos in
      let hits' = if pos' = 0 then hits + 1 else hits in
      loop (i - 1) pos' hits'
  in
  loop steps start_pos 0

let count_zeroes_during rots =
  let initial_pos = 50 in
  let initial_hits = 0 in
  List.fold_left
    (fun (total_hits, pos) rot ->
      let hits_here, pos' = count_zeroes_in_rotation pos rot in
      (total_hits + hits_here, pos'))
    (initial_hits, initial_pos)
    rots

let part2 input =
  let rots = parse input in
  let hits, _final_pos = count_zeroes_during rots in
  string_of_int hits
