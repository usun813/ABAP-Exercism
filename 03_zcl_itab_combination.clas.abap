CLASS zcl_itab_combination DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.

    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.

    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

    METHODS perform_combination
      IMPORTING
        alphas             TYPE alphas
        nums               TYPE nums
      RETURNING
        VALUE(combined_data) TYPE combined_data.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_itab_combination IMPLEMENTATION.

  METHOD perform_combination.
     combined_data = value #( for temp in alphas index into i
                             let num = nums[ i ]  in
                            ( colx = |{ temp-cola }{ num-col1 }|
                              coly = |{ temp-colb }{ num-col2 }|
                              colz = |{ temp-colc }{ num-col3 }| ) ). 
                          "|{ }|중괄호 {}는 문자열 안에 변수의 값을 삽입하는 데 사용됨. 두 문자열이 이어져서 나옴 
  ENDMETHOD.

ENDCLASS.