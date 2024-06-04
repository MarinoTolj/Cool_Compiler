; ModuleID = 'CoolLLVM'
source_filename = "CoolLLVM"

%IO = type {}
%Int = type { i16 }
%Bool = type { i16 }
%String = type { i32, i16 }
%Main = type { i32, i32, i32 }
%Test = type {}

define void @IO_init(%IO* %0) {
entry:
  ret void
}

define void @Int_init(%Int* %0) {
entry:
  %1 = getelementptr inbounds %Int, %Int* %0, i32 0, i32 0
  ret void
}

define void @Bool_init(%Bool* %0) {
entry:
  %1 = getelementptr inbounds %Bool, %Bool* %0, i32 0, i32 0
  ret void
}

define void @String_init(%String* %0) {
entry:
  %1 = getelementptr inbounds %String, %String* %0, i32 0, i32 0
  %2 = getelementptr inbounds %String, %String* %0, i32 0, i32 0
  ret void
}

define void @Main_init(%Main* %0) {
entry:
  %1 = getelementptr inbounds %Main, %Main* %0, i32 0, i32 0
  store i32 3, i32* %1, align 4
  %2 = getelementptr inbounds %Main, %Main* %0, i32 0, i32 1
  store i32 4, i32* %2, align 4
  %3 = getelementptr inbounds %Main, %Main* %0, i32 0, i32 2
  store i32 5, i32* %3, align 4
  ret void
}

define void @Test_init(%Test* %0) {
entry:
  ret void
}

define i16 @out_string(%IO* %self, i8* %0) {
entry:
}

define i16 @out_int(%IO* %self, i32 %0) {
entry:
}

define i8* @in_string(%IO* %self) {
entry:
}

define i32 @in_int(%IO* %self) {
entry:
}

define i32 @length(%String* %self) {
entry:
}

define i8* @concat(%String* %self, i8* %0) {
entry:
}

define i8* @substr(%String* %self, i32 %0, i32 %1) {
entry:
}

define i32 @main() {
entry:
  %0 = alloca %Main, align 8
  call void @Main_init(%Main* %0)
  ret i32 3
}

define i32 @test(%Test* %self) {
entry:
}
