
let a = 12;;


(* /!!\ function unused *)
(*let file_exists name =
  try Unix.access name [Unix.F_OK]; true
  with
  | (Unix.Unix_error (Unix.ENOENT, _, _)) -> false
  | _ -> true ;;*)

let rec aux_count_lines ic n =  
    match input_line ic with
    | _ -> aux_count_lines ic (n + 1) 
    | exception End_of_file -> n 

let count_lines fn = 
    let ic = open_in fn in 
    let n = aux_count_lines ic 0 in 
    close_in ic ; n 




                