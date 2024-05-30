; ModuleID = 'CoolLLVM'
source_filename = "CoolLLVM"

%IO = type {}
%String = type { i32, i16 }
%Main = type { i32, i8*, i1 }

define i16 @out_string() {
entry:
  %mainInstance = alloca %IO, align 8
}

define i16 @out_int() {
entry:
  %mainInstance = alloca %IO, align 8
}

define i8* @in_string() {
entry:
  %mainInstance = alloca %IO, align 8
}

define i32 @in_int() {
entry:
  %mainInstance = alloca %IO, align 8
}

define i32 @length() {
entry:
  %mainInstance = alloca %String, align 8
}

define i8* @concat() {
entry:
  %mainInstance = alloca %String, align 8
}

define i8* @substr() {
entry:
  %mainInstance = alloca %String, align 8
}

define i8* @main() {
entry:
  %mainInstance = alloca %Main, align 8
}

define i32 @test() {
entry:
  %mainInstance = alloca %Main, align 8
}
