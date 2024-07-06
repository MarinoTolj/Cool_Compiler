; ModuleID = 'CoolLLVM'
source_filename = "CoolLLVM"

%IO = type {}
%Int = type { i32 }
%Bool = type { i1 }
%String = type { %Int, i8* }
%Main = type { %Int, %Int }

define void @IO_init(%IO* %0) {
entry:
  ret void
}

define void @Int_init(%Int* %0) {
entry:
  %1 = getelementptr inbounds %Int, %Int* %0, i32 0, i32 0
  store i32 0, i32* %1, align 4
  ret void
}

define void @Bool_init(%Bool* %0) {
entry:
  ret void
}

define void @String_init(%String* %0) {
entry:
  ret void
}

define void @Main_init(%Main* %0) {
entry:
  %1 = getelementptr inbounds %Main, %Main* %0, i32 0, i32 0
  call void @Int_init(%Int* %1)
  %2 = getelementptr inbounds %Int, %Int* %1, i32 0, i32 0
  store i32 5, i32* %2, align 4
  %3 = getelementptr inbounds %Main, %Main* %0, i32 0, i32 1
  call void @Int_init(%Int* %3)
  %4 = getelementptr inbounds %Int, %Int* %3, i32 0, i32 0
  store i32 10, i32* %4, align 4
  ret void
}

define i32 @main() {
entry:
  %0 = alloca %Main, align 8
  call void @Main_init(%Main* %0)
  %main_struct_ptr = getelementptr inbounds %Main, %Main* %0, i32 0, i32 0
  %1 = getelementptr inbounds %Int, %Int* %main_struct_ptr, i32 0, i32 0
  %2 = load i32, i32* %1, align 4
  %addtmp = add i32 100, %2
  %3 = alloca %Int, align 8
  %4 = getelementptr inbounds %Int, %Int* %3, i32 0, i32 0
  store i32 %addtmp, i32* %4, align 4
  %main_struct_ptr1 = getelementptr inbounds %Main, %Main* %0, i32 0, i32 1
  %5 = getelementptr inbounds %Int, %Int* %main_struct_ptr1, i32 0, i32 0
  %6 = load i32, i32* %5, align 4
  %addtmp2 = add i32 %addtmp, %6
  %7 = alloca %Int, align 8
  %8 = getelementptr inbounds %Int, %Int* %7, i32 0, i32 0
  store i32 %addtmp2, i32* %8, align 4
  ret i32 %addtmp2
}
