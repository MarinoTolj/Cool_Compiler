#1
_class
  IO
  Object
  "<basic class>"
  (
  #1
  _method
    out_string
    #1
    _formal
      arg
      String
    SELF_TYPE
    #1
    _no_expr
    : _no_type
  #1
  _method
    out_int
    #1
    _formal
      arg
      Int
    SELF_TYPE
    #1
    _no_expr
    : _no_type
  #1
  _method
    in_string
    String
    #1
    _no_expr
    : _no_type
  #1
  _method
    in_int
    Int
    #1
    _no_expr
    : _no_type
  )
#1
_class
  Int
  Object
  "<basic class>"
  (
  #1
  _attr
    _val
    _prim_slot
    #1
    _no_expr
    : _no_type
  )
#1
_class
  Bool
  Object
  "<basic class>"
  (
  #1
  _attr
    _val
    _prim_slot
    #1
    _no_expr
    : _no_type
  )
#1
_class
  String
  Object
  "<basic class>"
  (
  #1
  _attr
    _val
    Int
    #1
    _no_expr
    : _no_type
  #1
  _attr
    _str_field
    _prim_slot
    #1
    _no_expr
    : _no_type
  #1
  _method
    length
    Int
    #1
    _no_expr
    : _no_type
  #1
  _method
    concat
    #1
    _formal
      arg
      String
    String
    #1
    _no_expr
    : _no_type
  #1
  _method
    substr
    #1
    _formal
      arg
      Int
    #1
    _formal
      arg2
      Int
    String
    #1
    _no_expr
    : _no_type
  )
#1
_class
  Main
  Object
  "./hello_world.cl"
  (
  #1
  _attr
    x
    Int
    #1
    _int
      3
    : Int
  #1
  _method
    main
    Int
    #1
    _object
      x
    : Int
  )
