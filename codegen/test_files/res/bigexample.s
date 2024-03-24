# start of generated code
	.data
	.align	2
	.globl	class_nameTab
	.globl	Main_protObj
	.globl	Int_protObj
	.globl	String_protObj
	.globl	bool_const0
	.globl	bool_const1
	.globl	_int_tag
	.globl	_bool_tag
	.globl	_string_tag
_int_tag:
	.word	2
_bool_tag:
	.word	3
_string_tag:
	.word	4
	.globl	_MemMgr_INITIALIZER
_MemMgr_INITIALIZER:
	.word	_NoGC_Init
	.globl	_MemMgr_COLLECTOR
_MemMgr_COLLECTOR:
	.word	_NoGC_Collect
	.globl	_MemMgr_TEST
_MemMgr_TEST:
	.word	0
	.word	-1
str_const47:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const2
	.byte	0	
	.align	2
	.word	-1
str_const46:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const9
	.ascii	"Main"
	.byte	0	
	.align	2
	.word	-1
str_const45:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const4
	.ascii	"Child"
	.byte	0	
	.align	2
	.word	-1
str_const44:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Parent"
	.byte	0	
	.align	2
	.word	-1
str_const43:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const19
	.ascii	"Grandparent"
	.byte	0	
	.align	2
	.word	-1
str_const42:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const9
	.ascii	"Base"
	.byte	0	
	.align	2
	.word	-1
str_const41:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"C"
	.byte	0	
	.align	2
	.word	-1
str_const40:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"B"
	.byte	0	
	.align	2
	.word	-1
str_const39:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"A"
	.byte	0	
	.align	2
	.word	-1
str_const38:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const9
	.ascii	"Blah"
	.byte	0	
	.align	2
	.word	-1
str_const37:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"C2"
	.byte	0	
	.align	2
	.word	-1
str_const36:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"C1"
	.byte	0	
	.align	2
	.word	-1
str_const35:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"P"
	.byte	0	
	.align	2
	.word	-1
str_const34:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"String"
	.byte	0	
	.align	2
	.word	-1
str_const33:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const9
	.ascii	"Bool"
	.byte	0	
	.align	2
	.word	-1
str_const32:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"Int"
	.byte	0	
	.align	2
	.word	-1
str_const31:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"IO"
	.byte	0	
	.align	2
	.word	-1
str_const30:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"Object"
	.byte	0	
	.align	2
	.word	-1
str_const29:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const11
	.ascii	"_prim_slot"
	.byte	0	
	.align	2
	.word	-1
str_const28:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"SELF_TYPE"
	.byte	0	
	.align	2
	.word	-1
str_const27:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"_no_class"
	.byte	0	
	.align	2
	.word	-1
str_const26:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const6
	.ascii	"<basic class>"
	.byte	0	
	.align	2
	.word	-1
str_const25:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const11
	.ascii	"looks ok!\n"
	.byte	0	
	.align	2
	.word	-1
str_const24:
	.word	4
	.word	10
	.word	String_dispTab
	.word	int_const82
	.ascii	"gonna call doThemAll\n"
	.byte	0	
	.align	2
	.word	-1
str_const23:
	.word	4
	.word	9
	.word	String_dispTab
	.word	int_const83
	.ascii	"gonna make a Blah\n"
	.byte	0	
	.align	2
	.word	-1
str_const22:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const26
	.ascii	"an int: "
	.byte	0	
	.align	2
	.word	-1
str_const21:
	.word	4
	.word	14
	.word	String_dispTab
	.word	int_const84
	.ascii	"tested static dispatch and 'new IO'\n"
	.byte	0	
	.align	2
	.word	-1
str_const20:
	.word	4
	.word	12
	.word	String_dispTab
	.word	int_const85
	.ascii	"printed via dynamic dispatch\n"
	.byte	0	
	.align	2
	.word	-1
str_const19:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const6
	.ascii	"hello, world\n"
	.byte	0	
	.align	2
	.word	-1
str_const18:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const22
	.ascii	"bigAttrAccess\n"
	.byte	0	
	.align	2
	.word	-1
str_const17:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const26
	.ascii	"bigCase\n"
	.byte	0	
	.align	2
	.word	-1
str_const16:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const22
	.ascii	"bigStrCompare\n"
	.byte	0	
	.align	2
	.word	-1
str_const15:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"foobar"
	.byte	0	
	.align	2
	.word	-1
str_const14:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"bar"
	.byte	0	
	.align	2
	.word	-1
str_const13:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const0
	.ascii	"foo"
	.byte	0	
	.align	2
	.word	-1
str_const12:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const26
	.ascii	"bigSelf\n"
	.byte	0	
	.align	2
	.word	-1
str_const11:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const11
	.ascii	"bigAssign\n"
	.byte	0	
	.align	2
	.word	-1
str_const10:
	.word	4
	.word	9
	.word	String_dispTab
	.word	int_const83
	.ascii	"assertion failed: "
	.byte	0	
	.align	2
	.word	-1
str_const9:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const26
	.ascii	"bigMath\n"
	.byte	0	
	.align	2
	.word	-1
str_const8:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const1
	.ascii	"\n"
	.byte	0	
	.align	2
	.word	-1
str_const7:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const26
	.ascii	"failed: "
	.byte	0	
	.align	2
	.word	-1
str_const6:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"bigWhile\n"
	.byte	0	
	.align	2
	.word	-1
str_const5:
	.word	4
	.word	6
	.word	String_dispTab
	.word	int_const5
	.ascii	"bigIf\n"
	.byte	0	
	.align	2
	.word	-1
str_const4:
	.word	4
	.word	8
	.word	String_dispTab
	.word	int_const24
	.ascii	"more advanced:\n"
	.byte	0	
	.align	2
	.word	-1
str_const3:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const26
	.ascii	"basics:\n"
	.byte	0	
	.align	2
	.word	-1
str_const2:
	.word	4
	.word	5
	.word	String_dispTab
	.word	int_const3
	.ascii	"Hi"
	.byte	0	
	.align	2
	.word	-1
str_const1:
	.word	4
	.word	7
	.word	String_dispTab
	.word	int_const7
	.ascii	"whassup?!"
	.byte	0	
	.align	2
	.word	-1
str_const0:
	.word	4
	.word	12
	.word	String_dispTab
	.word	int_const86
	.ascii	".//test_files//bigexample.cl"
	.byte	0	
	.align	2
	.word	-1
int_const86:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	28
	.word	-1
int_const85:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	29
	.word	-1
int_const84:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	36
	.word	-1
int_const83:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	18
	.word	-1
int_const82:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	21
	.word	-1
int_const81:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	498
	.word	-1
int_const80:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	496
	.word	-1
int_const79:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	468
	.word	-1
int_const78:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	459
	.word	-1
int_const77:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	453
	.word	-1
int_const76:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	444
	.word	-1
int_const75:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	438
	.word	-1
int_const74:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	426
	.word	-1
int_const73:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	417
	.word	-1
int_const72:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	408
	.word	-1
int_const71:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	399
	.word	-1
int_const70:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	390
	.word	-1
int_const69:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	381
	.word	-1
int_const68:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	355
	.word	-1
int_const67:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	353
	.word	-1
int_const66:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	352
	.word	-1
int_const65:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	351
	.word	-1
int_const64:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	350
	.word	-1
int_const63:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	346
	.word	-1
int_const62:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	342
	.word	-1
int_const61:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	341
	.word	-1
int_const60:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	340
	.word	-1
int_const59:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	339
	.word	-1
int_const58:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	327
	.word	-1
int_const57:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	314
	.word	-1
int_const56:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	320
	.word	-1
int_const55:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	313
	.word	-1
int_const54:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	312
	.word	-1
int_const53:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	311
	.word	-1
int_const52:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	310
	.word	-1
int_const51:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	106
	.word	-1
int_const50:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	105
	.word	-1
int_const49:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	104
	.word	-1
int_const48:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	92
	.word	-1
int_const47:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	103
	.word	-1
int_const46:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	102
	.word	-1
int_const45:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	101
	.word	-1
int_const44:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	2116
	.word	-1
int_const43:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	84
	.word	-1
int_const42:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	3114
	.word	-1
int_const41:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	2114
	.word	-1
int_const40:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	116
	.word	-1
int_const39:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	115
	.word	-1
int_const38:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	114
	.word	-1
int_const37:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	16
	.word	-1
int_const36:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	259
	.word	-1
int_const35:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	258
	.word	-1
int_const34:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	257
	.word	-1
int_const33:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	255
	.word	-1
int_const32:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	66
	.word	-1
int_const31:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	65
	.word	-1
int_const30:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	254
	.word	-1
int_const29:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	253
	.word	-1
int_const28:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	251
	.word	-1
int_const27:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	250
	.word	-1
int_const26:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	8
	.word	-1
int_const25:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	7
	.word	-1
int_const24:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	15
	.word	-1
int_const23:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	75
	.word	-1
int_const22:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	14
	.word	-1
int_const21:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	45
	.word	-1
int_const20:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	22
	.word	-1
int_const19:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	11
	.word	-1
int_const18:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	55
	.word	-1
int_const17:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1234
	.word	-1
int_const16:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1000
	.word	-1
int_const15:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	123
	.word	-1
int_const14:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	100
	.word	-1
int_const13:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	12
	.word	-1
int_const12:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	24
	.word	-1
int_const11:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	10
	.word	-1
int_const10:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	34
	.word	-1
int_const9:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	4
	.word	-1
int_const8:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	99
	.word	-1
int_const7:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	9
	.word	-1
int_const6:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	13
	.word	-1
int_const5:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	6
	.word	-1
int_const4:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	5
	.word	-1
int_const3:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	2
	.word	-1
int_const2:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	0
	.word	-1
int_const1:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	1
	.word	-1
int_const0:
	.word	2
	.word	4
	.word	Int_dispTab
	.word	3
	.word	-1
bool_const0:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	0
	.word	-1
bool_const1:
	.word	3
	.word	4
	.word	Bool_dispTab
	.word	1
class_nameTab:
	.word	str_const30
	.word	str_const31
	.word	str_const32
	.word	str_const33
	.word	str_const34
	.word	str_const35
	.word	str_const36
	.word	str_const37
	.word	str_const38
	.word	str_const39
	.word	str_const40
	.word	str_const41
	.word	str_const42
	.word	str_const43
	.word	str_const44
	.word	str_const45
	.word	str_const46
class_objTab:
	.word	Object_protObj
	.word	Object_init
	.word	IO_protObj
	.word	IO_init
	.word	Int_protObj
	.word	Int_init
	.word	Bool_protObj
	.word	Bool_init
	.word	String_protObj
	.word	String_init
	.word	P_protObj
	.word	P_init
	.word	C1_protObj
	.word	C1_init
	.word	C2_protObj
	.word	C2_init
	.word	Blah_protObj
	.word	Blah_init
	.word	A_protObj
	.word	A_init
	.word	B_protObj
	.word	B_init
	.word	C_protObj
	.word	C_init
	.word	Base_protObj
	.word	Base_init
	.word	Grandparent_protObj
	.word	Grandparent_init
	.word	Parent_protObj
	.word	Parent_init
	.word	Child_protObj
	.word	Child_init
	.word	Main_protObj
	.word	Main_init
Object_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
IO_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	IO.out_string
	.word	IO.out_int
	.word	IO.in_string
	.word	IO.in_int
Int_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Bool_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
String_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	String.length
	.word	String.concat
	.word	String.substr
P_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
C1_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
C2_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	C2.getX
	.word	C2.setX
Blah_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Blah.tiny
	.word	Blah.add
	.word	Blah.compare
	.word	Blah.compareEq
	.word	Blah.isv
	.word	Blah.divByZero
	.word	Blah.cmp
	.word	Blah.ng
	.word	Blah.caller
	.word	Blah.callee
	.word	Blah.get_t
	.word	Blah.useLet
	.word	Blah.useIf
	.word	Blah.useWhile
	.word	Blah.useCase
	.word	Blah.useNew
	.word	Blah.doThemAll
	.word	Blah.bigIf
	.word	Blah.bigWhile
	.word	Blah.bail
	.word	Blah.bigMath
	.word	Blah.assert
	.word	Blah.bigAssign
	.word	Blah.setI
	.word	Blah.getI
	.word	Blah.bigSelf
	.word	Blah.bigStrCompare
	.word	Blah.bigCase
	.word	Blah.bigAttrAccess
A_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	A.e
	.word	A.f
	.word	A.g
	.word	A.i
	.word	A.j
B_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	B.e
	.word	A.f
	.word	B.g
	.word	A.i
	.word	A.j
	.word	B.h
	.word	B.k
C_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	C.e
	.word	A.f
	.word	B.g
	.word	C.i
	.word	A.j
	.word	C.h
	.word	B.k
	.word	C.ell
Base_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Grandparent_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Parent_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Child_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
Main_dispTab:
	.word	Object.abort
	.word	Object.type_name
	.word	Object.copy
	.word	Main.main
	.globl	heap_start
heap_start:
	.word	0
	.text
	.globl	Main_init
	.globl	Int_init
	.globl	String_init
	.globl	Bool_init
	.globl	Main.main
	.word	-1
Object_protObj:
	.word	0
	.word	30
	.word	Object_dispTab
	.word	-1
IO_protObj:
	.word	1
	.word	30
	.word	IO_dispTab
	.word	-1
Int_protObj:
	.word	2
	.word	31
	.word	Int_dispTab
	.word	0
	.word	-1
Bool_protObj:
	.word	3
	.word	31
	.word	Bool_dispTab
	.word	0
	.word	-1
String_protObj:
	.word	4
	.word	32
	.word	String_dispTab
	.word	int_const2
	.word	0
	.word	-1
P_protObj:
	.word	5
	.word	31
	.word	P_dispTab
	.word	int_const2
	.word	-1
C1_protObj:
	.word	6
	.word	31
	.word	C1_dispTab
	.word	int_const2
	.word	-1
C2_protObj:
	.word	7
	.word	31
	.word	C2_dispTab
	.word	int_const2
	.word	-1
Blah_protObj:
	.word	8
	.word	38
	.word	Blah_dispTab
	.word	int_const2
	.word	bool_const0
	.word	str_const47
	.word	int_const2
	.word	bool_const0
	.word	str_const47
	.word	0
	.word	0
	.word	-1
A_protObj:
	.word	9
	.word	30
	.word	A_dispTab
	.word	-1
B_protObj:
	.word	10
	.word	30
	.word	B_dispTab
	.word	-1
C_protObj:
	.word	11
	.word	30
	.word	C_dispTab
	.word	-1
Base_protObj:
	.word	12
	.word	33
	.word	Base_dispTab
	.word	int_const2
	.word	str_const47
	.word	bool_const0
	.word	-1
Grandparent_protObj:
	.word	13
	.word	36
	.word	Grandparent_dispTab
	.word	int_const2
	.word	str_const47
	.word	bool_const0
	.word	0
	.word	int_const2
	.word	0
	.word	-1
Parent_protObj:
	.word	14
	.word	39
	.word	Parent_dispTab
	.word	int_const2
	.word	str_const47
	.word	bool_const0
	.word	0
	.word	int_const2
	.word	0
	.word	0
	.word	int_const2
	.word	bool_const0
	.word	-1
Child_protObj:
	.word	15
	.word	313
	.word	Child_dispTab
	.word	int_const2
	.word	str_const47
	.word	bool_const0
	.word	0
	.word	int_const2
	.word	0
	.word	0
	.word	int_const2
	.word	bool_const0
	.word	0
	.word	0
	.word	0
	.word	str_const47
	.word	-1
Main_protObj:
	.word	16
	.word	30
	.word	Main_dispTab
Object_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
IO_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Int_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Bool_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
String_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
P_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	la	$a0 int_const0
	sw	$a0 12($s0)
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C1_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	P_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C2_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	P_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah_init:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	bne	$a0 $zero label0
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label0:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 24($s0)
	la	$a0 bool_const1
	sw	$a0 28($s0)
	move	$a0 $s0
	bne	$a0 $zero label1
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label1:
	la	$t1 Blah_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const1
	sw	$a0 32($s0)
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	sw	$a0 36($s0)
	move	$a0 $s0
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
A_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
B_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	A_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	B_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Base_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Grandparent_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Base_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Parent_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Grandparent_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Child_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Parent_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main_init:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	jal	Object_init
	move	$a0 $s0
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C2.getX:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C2.setX:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($fp)
	sw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.tiny:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const2
	la	$a0 bool_const0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.add:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.compare:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label2
	la	$a0 bool_const0
label2:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.compareEq:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label3
	jal	equality_test
label3:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.isv:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const1
	move	$t1 $a0
	la	$a0 bool_const1
	beqz	$t1 label4
	la	$a0 bool_const0
label4:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.divByZero:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.cmp:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 bool_const1
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label5
	la	$a0 bool_const0
label5:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.ng:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const4
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.caller:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const6
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label6
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label6:
	la	$t1 Blah_dispTab
	lw	$t1 48($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label7
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label7:
	la	$t1 Blah_dispTab
	lw	$t1 48($t1)
	jalr		$t1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.callee:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 24
	jr	$ra	
Blah.get_t:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 32($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.useLet:
	addiu	$sp $sp -28
	sw	$fp 28($sp)
	sw	$s0 24($sp)
	sw	$ra 20($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	sw	$a0 0($fp)
	la	$a0 int_const8
	sw	$a0 4($fp)
	lw	$a0 24($s0)
	sw	$a0 8($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	lw	$fp 28($sp)
	lw	$s0 24($sp)
	lw	$ra 20($sp)
	addiu	$sp $sp 28
	jr	$ra	
Blah.useIf:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label10
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label10:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	lw	$t1 12($a0)
	beqz	$t1 label8
	move	$a0 $s0
	bne	$a0 $zero label11
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label11:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	b	label9
label8:
	move	$a0 $s0
	bne	$a0 $zero label12
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label12:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
label9:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.useWhile:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
label13:
	move	$a0 $s0
	bne	$a0 $zero label15
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label15:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	lw	$t1 12($a0)
	beq	$t1 $zero label14
	move	$a0 $s0
	bne	$a0 $zero label16
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label16:
	lw	$t1 8($a0)
	lw	$t1 52($t1)
	jalr		$t1
	b	label13
label14:
	move	$a0 $zero
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.useCase:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $s0
	bne	$a0 $zero label18
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label18:
	lw	$t2 0($a0)
	blt	$t2 5 label19
	bgt	$t2 7 label19
	sw	$a0 0($fp)
	la	$a0 int_const0
	b	label17
label19:
	lw	$t2 0($a0)
	blt	$t2 11 label20
	bgt	$t2 11 label20
	sw	$a0 0($fp)
	la	$a0 int_const9
	b	label17
label20:
	lw	$t2 0($a0)
	blt	$t2 8 label21
	bgt	$t2 8 label21
	sw	$a0 0($fp)
	la	$a0 int_const4
	b	label17
label21:
	jal	_case_abort
label17:
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.useNew:
	addiu	$sp $sp -16
	sw	$fp 16($sp)
	sw	$s0 12($sp)
	sw	$ra 8($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 Int_protObj
	jal	Object.copy
	jal	Int_init
	la	$a0 bool_const0
	la	$a0 C_protObj
	jal	Object.copy
	jal	C_init
	la	$a0 Main_protObj
	jal	Object.copy
	jal	Main_init
	la	$t1 class_objTab
	lw	$t2 0($s0)
	sll	$t2 $t2 3
	addu	$t1 $t1 $t2
	move	$t3 $t1
	lw	$a0 0($t1)
	jal	Object.copy
	lw	$t1 4($t3)
	jalr		$t1
	lw	$fp 16($sp)
	lw	$s0 12($sp)
	lw	$ra 8($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.doThemAll:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label22
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label22:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label23
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label23:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label24
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label24:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label25
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label25:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label26
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label26:
	lw	$t1 8($a0)
	lw	$t1 24($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label27
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label27:
	lw	$t1 8($a0)
	lw	$t1 28($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label28
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label28:
	lw	$t1 8($a0)
	lw	$t1 36($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label29
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label29:
	lw	$t1 8($a0)
	lw	$t1 40($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label30
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label30:
	lw	$t1 8($a0)
	lw	$t1 44($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label31
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label31:
	lw	$t1 8($a0)
	lw	$t1 48($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label32
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label32:
	lw	$t1 8($a0)
	lw	$t1 52($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label33
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label33:
	lw	$t1 8($a0)
	lw	$t1 56($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label34
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label34:
	lw	$t1 8($a0)
	lw	$t1 60($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label35
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label35:
	lw	$t1 8($a0)
	lw	$t1 64($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label36
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label36:
	lw	$t1 8($a0)
	lw	$t1 68($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label37
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label37:
	lw	$t1 8($a0)
	lw	$t1 72($t1)
	jalr		$t1
	la	$a0 str_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label38
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label38:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label39
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label39:
	lw	$t1 8($a0)
	lw	$t1 80($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label40
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label40:
	lw	$t1 8($a0)
	lw	$t1 92($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label41
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label41:
	lw	$t1 8($a0)
	lw	$t1 100($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label42
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label42:
	lw	$t1 8($a0)
	lw	$t1 84($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label43
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label43:
	lw	$t1 8($a0)
	lw	$t1 112($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label44
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label44:
	lw	$t1 8($a0)
	lw	$t1 116($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label45
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label45:
	lw	$t1 8($a0)
	lw	$t1 120($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label46
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label46:
	lw	$t1 8($a0)
	lw	$t1 124($t1)
	jalr		$t1
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.bigIf:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label47
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label47:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 bool_const1
	lw	$t1 12($a0)
	beqz	$t1 label48
	la	$a0 bool_const0
	lw	$t1 12($a0)
	beqz	$t1 label50
	move	$a0 $s0
	bne	$a0 $zero label52
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label52:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
	b	label51
label50:
	la	$a0 int_const2
label51:
	b	label49
label48:
	move	$a0 $s0
	bne	$a0 $zero label53
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label53:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
label49:
	la	$a0 bool_const0
	lw	$t1 12($a0)
	beqz	$t1 label54
	move	$a0 $s0
	bne	$a0 $zero label56
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label56:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
	b	label55
label54:
	la	$a0 bool_const0
	lw	$t1 12($a0)
	beqz	$t1 label57
	move	$a0 $s0
	bne	$a0 $zero label59
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label59:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
	b	label58
label57:
	la	$a0 int_const2
label58:
label55:
	la	$a0 bool_const1
	lw	$t1 12($a0)
	beqz	$t1 label60
	la	$a0 bool_const1
	lw	$t1 12($a0)
	beqz	$t1 label62
	la	$a0 int_const2
	b	label63
label62:
	move	$a0 $s0
	bne	$a0 $zero label64
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label64:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
label63:
	b	label61
label60:
	move	$a0 $s0
	bne	$a0 $zero label65
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label65:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
label61:
	la	$a0 bool_const0
	lw	$t1 12($a0)
	beqz	$t1 label66
	move	$a0 $s0
	bne	$a0 $zero label68
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label68:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
	b	label67
label66:
	la	$a0 bool_const1
	lw	$t1 12($a0)
	beqz	$t1 label69
	la	$a0 int_const2
	b	label70
label69:
	move	$a0 $s0
	bne	$a0 $zero label71
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label71:
	la	$t1 Object_dispTab
	lw	$t1 0($t1)
	jalr		$t1
label70:
label67:
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.bigWhile:
	addiu	$sp $sp -40
	sw	$fp 40($sp)
	sw	$s0 36($sp)
	sw	$ra 32($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const6
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label72
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label72:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const10
	sw	$a0 0($fp)
	la	$a0 int_const2
	sw	$a0 4($fp)
label73:
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label75
	la	$a0 bool_const0
label75:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label76
	la	$a0 bool_const0
label76:
	lw	$t1 12($a0)
	beq	$t1 $zero label74
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($fp)
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 4($fp)
	b	label73
label74:
	move	$a0 $zero
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label79
	jal	equality_test
label79:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label80
	la	$a0 bool_const0
label80:
	lw	$t1 12($a0)
	beqz	$t1 label77
	move	$a0 $s0
	bne	$a0 $zero label81
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label81:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	b	label78
label77:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const12
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label84
	jal	equality_test
label84:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label85
	la	$a0 bool_const0
label85:
	lw	$t1 12($a0)
	beqz	$t1 label82
	move	$a0 $s0
	bne	$a0 $zero label86
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label86:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	b	label83
label82:
	move	$a0 $s0
label83:
label78:
	la	$a0 int_const2
	sw	$a0 0($fp)
	la	$a0 int_const2
	sw	$a0 4($fp)
	la	$a0 int_const2
	sw	$a0 8($fp)
	la	$a0 int_const2
	sw	$a0 12($fp)
	la	$a0 int_const2
	sw	$a0 16($fp)
	la	$a0 int_const2
	sw	$a0 20($fp)
	la	$a0 int_const2
	sw	$a0 0($fp)
label87:
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label89
	la	$a0 bool_const0
label89:
	lw	$t1 12($a0)
	beq	$t1 $zero label88
	la	$a0 int_const2
	sw	$a0 4($fp)
label90:
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label92
	la	$a0 bool_const0
label92:
	lw	$t1 12($a0)
	beq	$t1 $zero label91
	la	$a0 int_const2
	sw	$a0 8($fp)
label93:
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label95
	la	$a0 bool_const0
label95:
	lw	$t1 12($a0)
	beq	$t1 $zero label94
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 8($fp)
	lw	$a0 20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 20($fp)
	b	label93
label94:
	move	$a0 $zero
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 4($fp)
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 16($fp)
	b	label90
label91:
	move	$a0 $zero
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($fp)
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 12($fp)
	b	label87
label88:
	move	$a0 $zero
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label96
	jal	equality_test
label96:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const13
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label97
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label97:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const14
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label98
	jal	equality_test
label98:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const15
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label99
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label99:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 20($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const16
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label100
	jal	equality_test
label100:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const17
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label101
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label101:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 40($sp)
	lw	$s0 36($sp)
	lw	$ra 32($sp)
	addiu	$sp $sp 40
	jr	$ra	
Blah.bail:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const7
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label102
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label102:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label103
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label103:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label104
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label104:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label105
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label105:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.bigMath:
	addiu	$sp $sp -48
	sw	$fp 48($sp)
	sw	$s0 44($sp)
	sw	$ra 40($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label108
	jal	equality_test
label108:
	lw	$t1 12($a0)
	beqz	$t1 label106
	la	$a0 int_const2
	b	label107
label106:
	la	$a0 int_const18
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label109
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label109:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label107:
	la	$a0 str_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label110
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label110:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label113
	jal	equality_test
label113:
	lw	$t1 12($a0)
	beqz	$t1 label111
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label116
	jal	equality_test
label116:
	lw	$t1 12($a0)
	beqz	$t1 label114
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label119
	jal	equality_test
label119:
	lw	$t1 12($a0)
	beqz	$t1 label117
	la	$a0 int_const19
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const20
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label122
	jal	equality_test
label122:
	lw	$t1 12($a0)
	beqz	$t1 label120
	la	$a0 int_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const19
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label125
	jal	equality_test
label125:
	lw	$t1 12($a0)
	beqz	$t1 label123
	la	$a0 int_const21
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const22
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const23
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const14
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label128
	jal	equality_test
label128:
	lw	$t1 12($a0)
	beqz	$t1 label126
	la	$a0 int_const14
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	div	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label131
	jal	equality_test
label131:
	lw	$t1 12($a0)
	beqz	$t1 label129
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label134
	jal	equality_test
label134:
	lw	$t1 12($a0)
	beqz	$t1 label132
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const24
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label137
	jal	equality_test
label137:
	lw	$t1 12($a0)
	beqz	$t1 label135
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const7
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const18
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label140
	jal	equality_test
label140:
	lw	$t1 12($a0)
	beqz	$t1 label138
	la	$a0 bool_const1
	b	label139
label138:
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label141
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label141:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label139:
	b	label136
label135:
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label142
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label142:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label136:
	b	label133
label132:
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label143
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label143:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label133:
	b	label130
label129:
	la	$a0 int_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label144
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label144:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label130:
	b	label127
label126:
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label145
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label145:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label127:
	b	label124
label123:
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label146
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label146:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label124:
	b	label121
label120:
	la	$a0 int_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label147
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label147:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label121:
	b	label118
label117:
	la	$a0 int_const26
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label148
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label148:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label118:
	b	label115
label114:
	la	$a0 int_const7
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label149
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label149:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label115:
	b	label112
label111:
	la	$a0 int_const11
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label150
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label150:
	lw	$t1 8($a0)
	lw	$t1 88($t1)
	jalr		$t1
label112:
	la	$a0 bool_const0
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label151
	la	$a0 bool_const0
label151:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const27
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label152
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label152:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 bool_const1
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label153
	la	$a0 bool_const0
label153:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label154
	la	$a0 bool_const0
label154:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const28
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label155
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label155:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label156
	la	$a0 bool_const0
label156:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const29
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label157
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label157:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label158
	la	$a0 bool_const0
label158:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label159
	la	$a0 bool_const0
label159:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const30
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label160
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label160:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const31
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const32
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label161
	la	$a0 bool_const0
label161:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const33
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label162
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label162:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const31
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const31
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	ble	$t1 $t2 label163
	la	$a0 bool_const0
label163:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const33
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label164
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label164:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const3
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label165
	jal	equality_test
label165:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const34
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label166
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label166:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const3
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	la	$a0 bool_const1
	blt	$t1 $t2 label167
	la	$a0 bool_const0
label167:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const35
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label168
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label168:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const2
	jal	Object.copy
	lw	$t1 12($a0)
	neg	$t1 $t1
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label169
	jal	equality_test
label169:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const36
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label170
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label170:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 48($sp)
	lw	$s0 44($sp)
	lw	$ra 40($sp)
	addiu	$sp $sp 48
	jr	$ra	
Blah.assert:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 16($fp)
	lw	$t1 12($a0)
	beqz	$t1 label171
	la	$a0 bool_const1
	b	label172
label171:
	la	$a0 str_const10
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label173
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label173:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label174
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label174:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label175
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label175:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	move	$a0 $s0
	bne	$a0 $zero label176
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label176:
	lw	$t1 8($a0)
	lw	$t1 0($t1)
	jalr		$t1
label172:
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 20
	jr	$ra	
Blah.bigAssign:
	addiu	$sp $sp -28
	sw	$fp 28($sp)
	sw	$s0 24($sp)
	sw	$ra 20($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	sw	$a0 0($fp)
	la	$a0 int_const2
	sw	$a0 4($fp)
	la	$a0 int_const2
	sw	$a0 8($fp)
	la	$a0 str_const11
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label177
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label177:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label178
	jal	equality_test
label178:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label179
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label179:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label180
	jal	equality_test
label180:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label181
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label181:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const2
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label182
	jal	equality_test
label182:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label183
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label183:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const1
	sw	$a0 0($fp)
	la	$a0 int_const3
	sw	$a0 4($fp)
	la	$a0 int_const0
	sw	$a0 8($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label184
	jal	equality_test
label184:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label185
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label185:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label186
	jal	equality_test
label186:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label187
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label187:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label188
	jal	equality_test
label188:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label189
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label189:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const1
	sw	$a0 8($fp)
	la	$a0 int_const3
	sw	$a0 4($fp)
	la	$a0 int_const0
	sw	$a0 0($fp)
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label190
	jal	equality_test
label190:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const22
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label191
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label191:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label192
	jal	equality_test
label192:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const24
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label193
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label193:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label194
	jal	equality_test
label194:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const37
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label195
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label195:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const5
	sw	$a0 4($fp)
	sw	$a0 0($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label196
	jal	equality_test
label196:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const38
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label197
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label197:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const5
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label198
	jal	equality_test
label198:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const39
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label199
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label199:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label200
	jal	equality_test
label200:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const40
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label201
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label201:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	sub	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 4($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	mul	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const22
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 8($fp)
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 4($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const11
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label202
	jal	equality_test
label202:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const41
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label203
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label203:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const26
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label204
	jal	equality_test
label204:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const42
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label205
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label205:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const43
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label206
	jal	equality_test
label206:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const44
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label207
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label207:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($fp)
	lw	$a0 8($fp)
	sw	$a0 4($fp)
	lw	$a0 0($fp)
	sw	$a0 8($fp)
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const26
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label208
	jal	equality_test
label208:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const45
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label209
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label209:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const43
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label210
	jal	equality_test
label210:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const46
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label211
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label211:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const26
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label212
	jal	equality_test
label212:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const47
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label213
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label213:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	jal	Object.copy
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	lw	$t1 12($t1)
	lw	$t2 12($a0)
	add	$t1 $t1 $t2
	sw	$t1 12($a0)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const48
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label214
	jal	equality_test
label214:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const49
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label215
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label215:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const26
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label216
	jal	equality_test
label216:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const50
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label217
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label217:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const43
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label218
	jal	equality_test
label218:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const51
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label219
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label219:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 28($sp)
	lw	$s0 24($sp)
	lw	$ra 20($sp)
	addiu	$sp $sp 28
	jr	$ra	
Blah.setI:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($fp)
	sw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 16
	jr	$ra	
Blah.getI:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	lw	$a0 12($s0)
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Blah.bigSelf:
	addiu	$sp $sp -28
	sw	$fp 28($sp)
	sw	$s0 24($sp)
	sw	$ra 20($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	move	$a0 $zero
	sw	$a0 0($fp)
	move	$a0 $s0
	sw	$a0 4($fp)
	la	$a0 Blah_protObj
	jal	Object.copy
	jal	Blah_init
	sw	$a0 8($fp)
	la	$a0 str_const12
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label220
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label220:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 0($fp)
	move	$t1 $a0
	la	$a0 bool_const1
	beqz	$t1 label221
	la	$a0 bool_const0
label221:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const52
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label222
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label222:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label223
	jal	equality_test
label223:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label224
	la	$a0 bool_const0
label224:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const53
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label225
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label225:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label226
	jal	equality_test
label226:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label227
	la	$a0 bool_const0
label227:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const54
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label228
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label228:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label229
	jal	equality_test
label229:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label230
	la	$a0 bool_const0
label230:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const55
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label231
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label231:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label232
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label232:
	lw	$t1 8($a0)
	lw	$t1 104($t1)
	jalr		$t1
	la	$a0 int_const9
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label233
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label233:
	lw	$t1 8($a0)
	lw	$t1 104($t1)
	jalr		$t1
	lw	$a0 4($fp)
	bne	$a0 $zero label234
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label234:
	lw	$t1 8($a0)
	lw	$t1 108($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label235
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label235:
	lw	$t1 8($a0)
	lw	$t1 108($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label236
	jal	equality_test
label236:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label237
	la	$a0 bool_const0
label237:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const56
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label238
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label238:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	move	$a0 $s0
	sw	$a0 8($fp)
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label239
	jal	equality_test
label239:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const57
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label240
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label240:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	bne	$a0 $zero label241
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label241:
	lw	$t1 8($a0)
	lw	$t1 104($t1)
	jalr		$t1
	la	$a0 int_const5
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label242
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label242:
	lw	$t1 8($a0)
	lw	$t1 104($t1)
	jalr		$t1
	lw	$a0 4($fp)
	bne	$a0 $zero label243
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label243:
	lw	$t1 8($a0)
	lw	$t1 108($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label244
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label244:
	lw	$t1 8($a0)
	lw	$t1 108($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label245
	jal	equality_test
label245:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const58
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label246
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label246:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 28($sp)
	lw	$s0 24($sp)
	lw	$ra 20($sp)
	addiu	$sp $sp 28
	jr	$ra	
Blah.bigStrCompare:
	addiu	$sp $sp -36
	sw	$fp 36($sp)
	sw	$s0 32($sp)
	sw	$ra 28($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 str_const13
	sw	$a0 0($fp)
	la	$a0 str_const14
	sw	$a0 4($fp)
	la	$a0 str_const15
	sw	$a0 8($fp)
	la	$a0 str_const47
	sw	$a0 12($fp)
	la	$a0 str_const47
	sw	$a0 16($fp)
	la	$a0 str_const16
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label247
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label247:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label248
	jal	equality_test
label248:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label249
	la	$a0 bool_const0
label249:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const59
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label250
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label250:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 0($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const13
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label251
	jal	equality_test
label251:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const60
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label252
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label252:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const14
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label253
	jal	equality_test
label253:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const61
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label254
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label254:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label255
	jal	equality_test
label255:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const62
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label256
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label256:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label257
	jal	equality_test
label257:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label258
	la	$a0 bool_const0
label258:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const63
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label259
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label259:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const2
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label260
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label260:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 12($fp)
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 8($fp)
	bne	$a0 $zero label261
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label261:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 16($fp)
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 16($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label262
	jal	equality_test
label262:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label263
	la	$a0 bool_const0
label263:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const64
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label264
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label264:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label265
	jal	equality_test
label265:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const65
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label266
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label266:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label267
	jal	equality_test
label267:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const66
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label268
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label268:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 12($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 4($fp)
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label269
	jal	equality_test
label269:
	lw	$t1 12($a0)
	la	$a0 bool_const1
	beqz	$t1 label270
	la	$a0 bool_const0
label270:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const67
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label271
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label271:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label272
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label272:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label273
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label273:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label274
	jal	equality_test
label274:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const68
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label275
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label275:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 36($sp)
	lw	$s0 32($sp)
	lw	$ra 28($sp)
	addiu	$sp $sp 36
	jr	$ra	
Blah.bigCase:
	addiu	$sp $sp -48
	sw	$fp 48($sp)
	sw	$s0 44($sp)
	sw	$ra 40($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 A_protObj
	jal	Object.copy
	jal	A_init
	sw	$a0 0($fp)
	la	$a0 B_protObj
	jal	Object.copy
	jal	B_init
	sw	$a0 4($fp)
	la	$a0 C_protObj
	jal	Object.copy
	jal	C_init
	sw	$a0 8($fp)
	la	$a0 P_protObj
	jal	Object.copy
	jal	P_init
	sw	$a0 12($fp)
	la	$a0 C1_protObj
	jal	Object.copy
	jal	C1_init
	sw	$a0 16($fp)
	la	$a0 C2_protObj
	jal	Object.copy
	jal	C2_init
	sw	$a0 20($fp)
	la	$a0 int_const2
	sw	$a0 24($fp)
	move	$a0 $zero
	sw	$a0 28($fp)
	la	$a0 str_const17
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label276
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label276:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label278
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label278:
	lw	$t2 0($a0)
	blt	$t2 9 label279
	bgt	$t2 11 label279
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label277
label279:
	lw	$t2 0($a0)
	blt	$t2 6 label280
	bgt	$t2 6 label280
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label277
label280:
	lw	$t2 0($a0)
	blt	$t2 7 label281
	bgt	$t2 7 label281
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label277
label281:
	lw	$t2 0($a0)
	blt	$t2 0 label282
	bgt	$t2 16 label282
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label277
label282:
	jal	_case_abort
label277:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label283
	jal	equality_test
label283:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const69
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label284
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label284:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label286
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label286:
	lw	$t2 0($a0)
	blt	$t2 9 label287
	bgt	$t2 11 label287
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label285
label287:
	lw	$t2 0($a0)
	blt	$t2 5 label288
	bgt	$t2 7 label288
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label285
label288:
	lw	$t2 0($a0)
	blt	$t2 7 label289
	bgt	$t2 7 label289
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label285
label289:
	lw	$t2 0($a0)
	blt	$t2 0 label290
	bgt	$t2 16 label290
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label285
label290:
	jal	_case_abort
label285:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label291
	jal	equality_test
label291:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const70
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label292
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label292:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 20($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label294
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label294:
	lw	$t2 0($a0)
	blt	$t2 9 label295
	bgt	$t2 11 label295
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label293
label295:
	lw	$t2 0($a0)
	blt	$t2 5 label296
	bgt	$t2 7 label296
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label293
label296:
	lw	$t2 0($a0)
	blt	$t2 7 label297
	bgt	$t2 7 label297
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label293
label297:
	lw	$t2 0($a0)
	blt	$t2 0 label298
	bgt	$t2 16 label298
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label293
label298:
	jal	_case_abort
label293:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label299
	jal	equality_test
label299:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const71
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label300
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label300:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 28($fp)
	lw	$a0 4($fp)
	bne	$a0 $zero label302
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label302:
	lw	$t2 0($a0)
	blt	$t2 9 label303
	bgt	$t2 11 label303
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label301
label303:
	lw	$t2 0($a0)
	blt	$t2 6 label304
	bgt	$t2 6 label304
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label301
label304:
	lw	$t2 0($a0)
	blt	$t2 7 label305
	bgt	$t2 7 label305
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label301
label305:
	lw	$t2 0($a0)
	blt	$t2 0 label306
	bgt	$t2 16 label306
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label301
label306:
	jal	_case_abort
label301:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label307
	jal	equality_test
label307:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const72
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label308
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label308:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label310
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label310:
	lw	$t2 0($a0)
	blt	$t2 9 label311
	bgt	$t2 11 label311
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label309
label311:
	lw	$t2 0($a0)
	blt	$t2 10 label312
	bgt	$t2 11 label312
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label309
label312:
	lw	$t2 0($a0)
	blt	$t2 11 label313
	bgt	$t2 11 label313
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label309
label313:
	jal	_case_abort
label309:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label314
	jal	equality_test
label314:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const73
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label315
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label315:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label317
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label317:
	lw	$t2 0($a0)
	blt	$t2 9 label318
	bgt	$t2 11 label318
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label316
label318:
	lw	$t2 0($a0)
	blt	$t2 10 label319
	bgt	$t2 11 label319
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label316
label319:
	lw	$t2 0($a0)
	blt	$t2 11 label320
	bgt	$t2 11 label320
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label316
label320:
	lw	$t2 0($a0)
	blt	$t2 0 label321
	bgt	$t2 16 label321
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label316
label321:
	jal	_case_abort
label316:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label322
	jal	equality_test
label322:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const74
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label323
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label323:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 16($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label325
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label325:
	lw	$t2 0($a0)
	blt	$t2 9 label326
	bgt	$t2 11 label326
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label324
label326:
	lw	$t2 0($a0)
	blt	$t2 10 label327
	bgt	$t2 11 label327
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label324
label327:
	lw	$t2 0($a0)
	blt	$t2 11 label328
	bgt	$t2 11 label328
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label324
label328:
	lw	$t2 0($a0)
	blt	$t2 0 label329
	bgt	$t2 16 label329
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label324
label329:
	jal	_case_abort
label324:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label330
	jal	equality_test
label330:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const75
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label331
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label331:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$a0 4($fp)
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label333
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label333:
	lw	$t2 0($a0)
	blt	$t2 0 label334
	bgt	$t2 16 label334
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label332
label334:
	jal	_case_abort
label332:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label335
	jal	equality_test
label335:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const76
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label336
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label336:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 bool_const1
	sw	$a0 28($fp)
	lw	$a0 28($fp)
	bne	$a0 $zero label338
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label338:
	lw	$t2 0($a0)
	blt	$t2 3 label339
	bgt	$t2 3 label339
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label337
label339:
	lw	$t2 0($a0)
	blt	$t2 10 label340
	bgt	$t2 11 label340
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label337
label340:
	lw	$t2 0($a0)
	blt	$t2 11 label341
	bgt	$t2 11 label341
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label337
label341:
	jal	_case_abort
label337:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const1
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label342
	jal	equality_test
label342:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const77
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label343
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label343:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const3
	sw	$a0 28($fp)
	la	$a0 int_const0
	bne	$a0 $zero label345
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label345:
	lw	$t2 0($a0)
	blt	$t2 0 label346
	bgt	$t2 16 label346
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label344
label346:
	jal	_case_abort
label344:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const9
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label347
	jal	equality_test
label347:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const78
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label348
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label348:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 str_const15
	sw	$a0 28($fp)
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 str_const15
	bne	$a0 $zero label351
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label351:
	lw	$t1 8($a0)
	lw	$t1 20($t1)
	jalr		$t1
	bne	$a0 $zero label350
	la	$a0 str_const0
	li	$t1 1
	jal	_case_abort2
label350:
	lw	$t2 0($a0)
	blt	$t2 3 label352
	bgt	$t2 3 label352
	sw	$a0 32($fp)
	la	$a0 int_const1
	b	label349
label352:
	lw	$t2 0($a0)
	blt	$t2 4 label353
	bgt	$t2 4 label353
	sw	$a0 32($fp)
	la	$a0 int_const3
	b	label349
label353:
	lw	$t2 0($a0)
	blt	$t2 11 label354
	bgt	$t2 11 label354
	sw	$a0 32($fp)
	la	$a0 int_const0
	b	label349
label354:
	lw	$t2 0($a0)
	blt	$t2 0 label355
	bgt	$t2 16 label355
	sw	$a0 32($fp)
	la	$a0 int_const9
	b	label349
label355:
	jal	_case_abort
label349:
	sw	$a0 24($fp)
	lw	$a0 24($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const3
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label356
	jal	equality_test
label356:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const79
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label357
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label357:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 48($sp)
	lw	$s0 44($sp)
	lw	$ra 40($sp)
	addiu	$sp $sp 48
	jr	$ra	
Blah.bigAttrAccess:
	addiu	$sp $sp -20
	sw	$fp 20($sp)
	sw	$s0 16($sp)
	sw	$ra 12($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 C2_protObj
	jal	Object.copy
	jal	C2_init
	sw	$a0 0($fp)
	la	$a0 str_const18
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 36($s0)
	bne	$a0 $zero label358
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label358:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 0($fp)
	bne	$a0 $zero label359
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label359:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const0
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label360
	jal	equality_test
label360:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const80
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label361
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label361:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	la	$a0 int_const4
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label362
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label362:
	lw	$t1 8($a0)
	lw	$t1 16($t1)
	jalr		$t1
	lw	$a0 0($fp)
	bne	$a0 $zero label363
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label363:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const4
	addiu	$sp $sp 4
	lw	$t1 0($sp)
	move	$t2 $a0
	la	$a1 bool_const0
	la	$a0 bool_const1
	beq	$t1 $t2 label364
	jal	equality_test
label364:
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	la	$a0 int_const81
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	move	$a0 $s0
	bne	$a0 $zero label365
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label365:
	lw	$t1 8($a0)
	lw	$t1 96($t1)
	jalr		$t1
	lw	$fp 20($sp)
	lw	$s0 16($sp)
	lw	$ra 12($sp)
	addiu	$sp $sp 20
	jr	$ra	
A.e:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A.f:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A.g:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A.i:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
A.j:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
B.e:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
B.g:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
B.h:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
B.k:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C.e:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C.h:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C.i:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
C.ell:
	addiu	$sp $sp -12
	sw	$fp 12($sp)
	sw	$s0 8($sp)
	sw	$ra 4($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 int_const2
	lw	$fp 12($sp)
	lw	$s0 8($sp)
	lw	$ra 4($sp)
	addiu	$sp $sp 12
	jr	$ra	
Main.main:
	addiu	$sp $sp -24
	sw	$fp 24($sp)
	sw	$s0 20($sp)
	sw	$ra 16($sp)
	addiu	$fp $sp 4
	move	$s0 $a0
	la	$a0 IO_protObj
	jal	Object.copy
	jal	IO_init
	sw	$a0 0($fp)
	move	$a0 $zero
	sw	$a0 4($fp)
	la	$a0 str_const19
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label366
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label366:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const20
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label367
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label367:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const21
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label368
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label368:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 int_const0
	sw	$a0 8($fp)
	la	$a0 str_const22
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label369
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label369:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 8($fp)
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label370
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label370:
	la	$t1 IO_dispTab
	lw	$t1 16($t1)
	jalr		$t1
	la	$a0 str_const8
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label371
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label371:
	la	$t1 IO_dispTab
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 str_const23
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label372
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label372:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	la	$a0 Blah_protObj
	jal	Object.copy
	jal	Blah_init
	sw	$a0 4($fp)
	la	$a0 str_const24
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label373
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label373:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$a0 4($fp)
	bne	$a0 $zero label374
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label374:
	lw	$t1 8($a0)
	lw	$t1 76($t1)
	jalr		$t1
	la	$a0 str_const25
	sw	$a0 0($sp)
	addiu	$sp $sp -4
	lw	$a0 0($fp)
	bne	$a0 $zero label375
	la	$a0 str_const0
	li	$t1 1
	jal	_dispatch_abort
label375:
	lw	$t1 8($a0)
	lw	$t1 12($t1)
	jalr		$t1
	lw	$fp 24($sp)
	lw	$s0 20($sp)
	lw	$ra 16($sp)
	addiu	$sp $sp 24
	jr	$ra	

# end of generated code
