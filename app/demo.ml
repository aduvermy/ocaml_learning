(*     *************************  Learn how works ocaml  **********************   *)

(* input channel *)
Printf.printf "Input file: %s\n" (Sys.argv.(1));;

let () =  
  let len = Array.length Sys.argv in 
  (* checking if the user has given an argument *)
  if len > 1 then  
      (* checking if the file exists*)
      if Sys.file_exists(Sys.argv.(1)) == true then 
        let file = Sys.argv.(1) in Printf.printf "Lines number: %d\n" (Lib.Misc.count_lines file) ;
      else raise (Invalid_argument "Your file does not exist")
  else raise (Invalid_argument "You must write a filename");;

(*let ic = (Sys.argv.(1));;

if (Lib.Misc.file_exists ic) = false then 
    raise (Invalid_argument "You must write an existing filename")
else
    Printf.printf "File exist: %B\n" (Lib.Misc.file_exists ic) ;;
    (* Print number of ligne in input channel *)
    Printf.printf "Lines number: %d\n" (Lib.Misc.count_lines ic) ;;*)


(*********************             GAF file parser        ****************************)


(* Test call library TabularFile_parser *)
(*Printf.printf "\n\n%s\n" (Lib.TabularFile_parser.title) ;;
List.map (Printf.printf "%s\n") (Lib.TabularFile_parser.get_field "a b\tc") ;;
Printf.printf "%d\n" (List.length(Lib.TabularFile_parser.get_field "a b\tc")) ;;*)


let file = (Sys.argv.(1));;

Printf.printf "%s\n" "\n\nFile content:";;

let file_content = 
    List.iter (Printf.printf "%s\n") (List.map (Lib.TabularFile_parser.my_obj_to_string) (Lib.TabularFile_parser.read_file file));;
    (*List.map (Lib.TabularFile_parser.my_obj_to_string) (Lib.TabularFile_parser.read_file file);;*)

  

(*let rec print_tuples =
  function
  | [] -> ()
  | (a,b,c) :: rest ->
    Printf.printf "%s, %s, %s\n" a b c ;
    print_tuples rest*)


(*let () =
  print_tuples (Lib.TabularFile_parser.read_file "tests/test_dev.tab" ) ;;*)







