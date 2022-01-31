(********   TESTS FONCTION PART   ********)
open OUnit2;;




let test_count_line _ = 
   assert_equal 0 (Lib.Misc.count_lines "/home/arnaud/projet_morgane/tests/empty_file.txt") ~printer:string_of_int ~msg: "Case empty file" ;
   assert_equal 4 (Lib.Misc.count_lines "/home/arnaud/projet_morgane/tests/unempty_file.txt") ~printer:string_of_int ~msg: "Case unempty" 

(*let test_parser_of line_tabFile _ =  
   assert_equal 0 (List.length(Lib.TabularFile_parser.parser_of line "")) ~printer:string_of_int ~msg: "Case empty string" ;
   assert_equal 2 (List.length(Lib.TabularFile_parser.parser_of line "a b\tc")) ~printer:string_of_int ~msg: "Case complexe string" ;
   assert_equal 1 (List.length(Lib.TabularFile_parser.parser_of line "a")) ~printer:string_of_int ~msg: "Case singleton"*)


let misc = "Misc library " >::: ["test_count_line" >:: test_count_line];;

(*let TabularFile_parser = "GAF parser library " >::: ["test_parser_of_line_tabFile" >:: test_get_field_tabFile ];;*)


Printf.printf "%s" "Misc library tests"
let _ = run_test_tt_main misc ;;

(*Printf.printf "\n%s" "Gaf parser library tests"
let _ = run_test_tt_main TabularFile_parser*)


(*
(*let test_file = ("./lib/tests/pombase.gaf")*)
(*let%test_unit "Count lines" = (count_lines test_file) ~expect:4*)
let%test _ = count_lines "/home/arnaud/projet_morgane/lib/tests/unempty_file.txt" = 4;;
let%test _ = count_lines "/home/arnaud/projet_morgane/lib/tests/empty_file.tx" = 0;;
*)
