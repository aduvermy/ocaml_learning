

let title = "je suis le parser de fichier tabular" ;;


module My_obj = struct
 type t =
  { col1 : string;
    col2         : string;
    col3     : string option;
  }
;;
end

let my_obj_to_string { My_obj.col1  ; My_obj.col2; My_obj.col3 } =
   let base = Printf.sprintf "%s\t%s\t" col1 col2 in
  match col3 with
  | None -> base
  | Some text -> base ^ text
;;

let parser_of line =
  let matches = Re.exec (Re.Posix.compile_pat "([a-zA-Z0-9]+)[\t]+([a-zA-Z0-9]+)[\t]([a-zA-Z0-9]+)?") line in {
      My_obj.col1 = Re.Group.get matches 1;
      My_obj.col2 = Re.Group.get matches 2;
      My_obj.col3 =  match (Re.Group.get matches 3) with 
                          | exception Not_found -> None
                          | text -> Some text;}
;;



let  read_file ic =
    let ic = open_in ic in
        let rec line2list l = 
            match input_line ic with
            | line -> if line.[0] = '!' then line2list l
                      else (parser_of line) :: line2list l;
            | exception End_of_file -> l
        in
    line2list []
    ;;




(* a lot of test are following *)



(*type t = { field1: string; field2: string; field3: string } [@@deriving sexp] ;;*)


(*let get_field =
    let re = Str.regexp "[\t]+" in
    fun s -> Str.split re s


let  read_file ic =
    let ic = open_in ic in
        let rec line2list l = 
            match input_line ic with
            | line ->
                (match get_field line with
                | w1 :: w2 :: w3 :: _ -> line2list ((w1, w2, w3) :: l)
                | _ -> line2list l )
            | exception End_of_file -> List.rev l
        in
    line2list []

(* input : file content -> output :  list of line*)
let parse_line =
    let re = Str.regexp "[\n]+" in
    fun s -> Str.split re s

(* input : line -> output :  list of field sep by tab*)


type gaf_file =
  { field1 : string;
    field2 : float;
    field3 : int;
  }
;;


let parse_field line =
  let matches =
    let pat = "([\t]+)" in
    Re.exec (Re.Posix.compile_pat pat) line
  in
  { field1 = Re.Group.get matches 1;
    field2 = float_of_string (Re.Group.get matches 2);
    field3 = int_of_string (Re.Group.get matches 3);
  }
;;


type 'a with_line_num = { item: 'a; line_num: int }

let parse_lines parser file_contents =  
    let lines = parse_line file_contents in 
    List.mapi (fun line_num line ->
                { item = parser line;
                line_num = line_num + 1;
                }) lines
;;



let read_whole_file filename =
    let ch = open_in filename in
    let s = really_input_string ch (in_channel_length ch) in
    close_in ch;
    s

utop # parse_lines parse_field (rea
(*let parse_lines parse file_contents =
  let lines = parse_line file_contents in  
  List.mapi (fun line_num line ->    
  { item = parse line;      
  line_num = line_num + 1;   }) 
  lines;; *)




type service_info =
  { col1 : string;
    col2         : float;
    col3     : int;
  }


  let parse_lines parse file_contents =
  let lines = parse_line file_contents in
  List.mapi (fun line_num line ->
    { item = parse line;
      line_num = line_num + 1;
    }) lines
;;




let service_info_of_string line =
  let matches =
    let pat = "([a-zA-Z]+)[ \t]+([0-9]+)[ \t]([0-9]+)" in
    Re.exec (Re.Posix.compile_pat pat) line
  in
  { col1 = Re.Group.get matches 1;
    col2 = float_of_string (Re.Group.get matches 2);
    col3 = int_of_string (Re.Group.get matches 3);
  }
;;

type 'a with_line_num = { item: 'a; line_num: int }

parse_lines service_info_of_string "rouge\t1.72\t19\njaune\t3.2\t3\nvert\t0.7\t6"
;;*)





