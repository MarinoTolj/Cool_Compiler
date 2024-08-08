
//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully. Make sure to
//    initialize the base class tags in
//       `CgenClassTable::CgenClassTable'
//
//    Add the label for the dispatch tables to
//       `IntEntry::code_def'
//       `StringEntry::code_def'
//       `BoolConst::code_def'
//
//    Add code to emit everyting else that is needed
//       in `CgenClassTable::code'
//
//
// The files as provided will produce code to begin the code
// segments, declare globals, and emit constants.  You must
// fill in the rest.
//
//**************************************************************

#include "cgen.h"
#include "cgen_gc.h"
#include <map>
extern void emit_string_constant(ostream &str, char *s);
extern int cgen_debug;

//
// Three symbols from the semantic analyzer (semant.cc) are used.
// If e : No_type, then no code is generated for e.
// Special code is generated for new SELF_TYPE.
// The name "self" also generates code different from other references.
//
//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
Symbol
    arg,
    arg2,
    Bool,
    concat,
    cool_abort,
    copy,
    Int,
    in_int,
    in_string,
    IO,
    length,
    Main,
    main_meth,
    No_class,
    No_type,
    Object,
    out_int,
    out_string,
    prim_slot,
    self,
    SELF_TYPE,
    Str,
    str_field,
    substr,
    type_name,
    val;
//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
    arg = idtable.add_string("arg");
    arg2 = idtable.add_string("arg2");
    Bool = idtable.add_string("Bool");
    concat = idtable.add_string("concat");
    cool_abort = idtable.add_string("abort");
    copy = idtable.add_string("copy");
    Int = idtable.add_string("Int");
    in_int = idtable.add_string("in_int");
    in_string = idtable.add_string("in_string");
    IO = idtable.add_string("IO");
    length = idtable.add_string("length");
    Main = idtable.add_string("Main");
    main_meth = idtable.add_string("main");
    //   _no_class is a symbol that can't be the name of any
    //   user-defined class.
    No_class = idtable.add_string("_no_class");
    No_type = idtable.add_string("_no_type");
    Object = idtable.add_string("Object");
    out_int = idtable.add_string("out_int");
    out_string = idtable.add_string("out_string");
    prim_slot = idtable.add_string("_prim_slot");
    self = idtable.add_string("self");
    SELF_TYPE = idtable.add_string("SELF_TYPE");
    Str = idtable.add_string("String");
    str_field = idtable.add_string("_str_field");
    substr = idtable.add_string("substr");
    type_name = idtable.add_string("type_name");
    val = idtable.add_string("_val");
}

static char *gc_init_names[] =
    {"_NoGC_Init", "_GenGC_Init", "_ScnGC_Init"};
static char *gc_collect_names[] =
    {"_NoGC_Collect", "_GenGC_Collect", "_ScnGC_Collect"};

//  BoolConst is a class that implements code generation for operations
//  on the two booleans, which are given global names here.
BoolConst falsebool(FALSE);
BoolConst truebool(TRUE);

int max(int a, int b) { return a >= b ? a : b; }
int new_label() { return label_cnt++; }

// lookup name in locals and current class's attrs
std::pair<char *, int> lookup_var(Symbol name)
{
    int *loc = tmp_table.lookup(name);
    if (loc == NULL)
        return std::make_pair((char *)SELF, cur_node->get_attr_offset(name));
    else
        return std::make_pair((char *)FP, *loc);
}

// lookup name in locals and current class's attrs.
std::tuple<bool, llvm::Value *, int> llvm_lookup_var(Symbol name)
{
    llvm::Value **loc = llvm_tmp_table.lookup(name);

    if (loc == NULL)
        return std::make_tuple(true, nullptr, cur_node->get_llvm_attr_offset(name));
    else
        return std::make_tuple(false, *loc, 0);
}
// Handles the creation of primitive Basic classees(Int, Str, Bool).
// For Str class you will need to update length field manually.
llvm::Value *get_primitive(Symbol primitiveName, Builder &builder, Module &module, llvm::Value *value)
{
    llvm::Function *malloc = module->getFunction("malloc");
    if (primitiveName == Int)
    {
        auto int_init = module->getFunction((std::string) "Int" + CLASSINIT_SUFFIX);

        // class size:
        //  class tag: 4 + Object size: 4 + Disp Table: 8 + int_field: 4=20
        llvm::Value *mallocCall = builder->CreateCall(malloc, builder->getInt32(20));
        llvm::Value *intClassInstance = builder->CreateBitCast(mallocCall, int_init->getArg(0)->getType());
        builder->CreateCall(int_init, intClassInstance);

        auto int_field = builder->CreateStructGEP(intClassInstance->getType()->getPointerElementType(), intClassInstance, 0 + DEFAULT_OBJFIELDS);
        builder->CreateStore(value, int_field);
        return intClassInstance;
    }
    else if (primitiveName == Str)
    {
        auto str_init = module->getFunction((std::string) "String" + CLASSINIT_SUFFIX);
        // class size
        //  class tag: 4 + Object size: 4 + Disp Table: 8 + ptr_to_Int: 8 + ptr_to_chars: 8=32
        llvm::Value *mallocCall = builder->CreateCall(malloc, builder->getInt32(32));
        llvm::Value *strClassInstance = builder->CreateBitCast(mallocCall, str_init->getArg(0)->getType());
        builder->CreateCall(str_init, strClassInstance);
        llvm::Value *str_field = builder->CreateStructGEP(strClassInstance->getType()->getPointerElementType(), strClassInstance, 1 + DEFAULT_OBJFIELDS);

        builder->CreateStore(value, str_field);

        return strClassInstance;
    }
    else if (primitiveName == Bool)
    {
        auto bool_init = module->getFunction((std::string) "Bool" + CLASSINIT_SUFFIX);
        // class size
        //  class tag: 4 + Object size: 4 + Disp Table: 8 + i1_field=17
        llvm::Value *mallocCall = builder->CreateCall(malloc, builder->getInt32(17));
        llvm::Value *boolClassInstance = builder->CreateBitCast(mallocCall, bool_init->getArg(0)->getType());
        builder->CreateCall(bool_init, boolClassInstance);

        auto bool_field = builder->CreateStructGEP(boolClassInstance->getType()->getPointerElementType(), boolClassInstance, 0 + DEFAULT_OBJFIELDS);
        builder->CreateStore(value, bool_field);
        return boolClassInstance;
    }
}

//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emmitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************

void program_class::cgen(ostream &os)
{
    // spim wants comments to start with '#'
    os << "# start of generated code\n";

    initialize_constants();
    CgenClassTable *codegen_classtable = new CgenClassTable(classes, os);

    os << "\n# end of generated code\n";
}

//////////////////////////////////////////////////////////////////////////////
//
//  emit_* procedures
//
//  emit_X  writes code for operation "X" to the output stream.
//  There is an emit_X for each opcode X, as well as emit_ functions
//  for generating names according to the naming conventions (see emit.h)
//  and calls to support functions defined in the trap handler.
//
//  Register names and addresses are passed as strings.  See `emit.h'
//  for symbolic names you can use to refer to the strings.
//
//////////////////////////////////////////////////////////////////////////////

static void emit_load(char *dest_reg, int offset, char *source_reg, ostream &s)
{
    s << LW << dest_reg << " " << offset * WORD_SIZE << "(" << source_reg << ")"
      << endl;
}

static void emit_store(char *source_reg, int offset, char *dest_reg, ostream &s)
{
    s << SW << source_reg << " " << offset * WORD_SIZE << "(" << dest_reg << ")"
      << endl;
}

static void emit_load_imm(char *dest_reg, int val, ostream &s)
{
    s << LI1 << dest_reg << " " << val << endl;
}

static void emit_load_address(char *dest_reg, char *address, ostream &s)
{
    s << LA << dest_reg << " " << address << endl;
}

static void emit_partial_load_address(char *dest_reg, ostream &s)
{
    s << LA << dest_reg << " ";
}

static void emit_load_bool(char *dest, const BoolConst &b, ostream &s)
{
    emit_partial_load_address(dest, s);
    b.code_ref(s);
    s << endl;
}

static void emit_load_string(char *dest, StringEntry *str, ostream &s)
{
    emit_partial_load_address(dest, s);
    str->code_ref(s);
    s << endl;
}

static void emit_load_int(char *dest, IntEntry *i, ostream &s)
{
    emit_partial_load_address(dest, s);
    i->code_ref(s);
    s << endl;
}

static void emit_move(char *dest_reg, char *source_reg, ostream &s)
{
    s << MOVE << dest_reg << " " << source_reg << endl;
}

static void emit_neg(char *dest, char *src1, ostream &s)
{
    s << NEG << dest << " " << src1 << endl;
}

static void emit_add(char *dest, char *src1, char *src2, ostream &s)
{
    s << ADD << dest << " " << src1 << " " << src2 << endl;
}

static void emit_addu(char *dest, char *src1, char *src2, ostream &s)
{
    s << ADDU << dest << " " << src1 << " " << src2 << endl;
}

static void emit_addiu(char *dest, char *src1, int imm, ostream &s)
{
    s << ADDIU << dest << " " << src1 << " " << imm << endl;
}

static void emit_div(char *dest, char *src1, char *src2, ostream &s)
{
    s << DIV << dest << " " << src1 << " " << src2 << endl;
}

static void emit_mul(char *dest, char *src1, char *src2, ostream &s)
{
    s << MUL << dest << " " << src1 << " " << src2 << endl;
}

static void emit_sub(char *dest, char *src1, char *src2, ostream &s)
{
    s << SUB << dest << " " << src1 << " " << src2 << endl;
}

static void emit_sll(char *dest, char *src1, int num, ostream &s)
{
    s << SLL << dest << " " << src1 << " " << num << endl;
}

static void emit_jalr(char *dest, ostream &s)
{
    s << JALR << "\t" << dest << endl;
}

static void emit_jal(char *address, ostream &s)
{
    s << JAL << address << endl;
}

static void emit_return(ostream &s)
{
    s << RET << endl;
}

static void emit_gc_assign(ostream &s)
{
    s << JAL << "_GenGC_Assign" << endl;
}

static void emit_disptable_ref(Symbol sym, ostream &s)
{
    s << sym << DISPTAB_SUFFIX;
}

static void emit_init_ref(Symbol sym, ostream &s)
{
    s << sym << CLASSINIT_SUFFIX;
}

static void emit_label_ref(int l, ostream &s)
{
    s << "label" << l;
}

static void emit_protobj_ref(Symbol sym, ostream &s)
{
    s << sym << PROTOBJ_SUFFIX;
}

static void emit_method_ref(Symbol classname, Symbol methodname, ostream &s)
{
    s << classname << METHOD_SEP << methodname;
}

static void emit_label_def(int l, ostream &s)
{
    emit_label_ref(l, s);
    s << ":" << endl;
}

static void emit_beqz(char *source, int label, ostream &s)
{
    s << BEQZ << source << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_beq(char *src1, char *src2, int label, ostream &s)
{
    s << BEQ << src1 << " " << src2 << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_bne(char *src1, char *src2, int label, ostream &s)
{
    s << BNE << src1 << " " << src2 << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_bleq(char *src1, char *src2, int label, ostream &s)
{
    s << BLEQ << src1 << " " << src2 << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_blt(char *src1, char *src2, int label, ostream &s)
{
    s << BLT << src1 << " " << src2 << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_blti(char *src1, int imm, int label, ostream &s)
{
    s << BLT << src1 << " " << imm << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_bgti(char *src1, int imm, int label, ostream &s)
{
    s << BGT << src1 << " " << imm << " ";
    emit_label_ref(label, s);
    s << endl;
}

static void emit_branch(int l, ostream &s)
{
    s << BRANCH;
    emit_label_ref(l, s);
    s << endl;
}

//
// Push a register on the stack. The stack grows towards smaller addresses.
//
static void emit_push(char *reg, ostream &str)
{
    emit_store(reg, 0, SP1, str);
    emit_addiu(SP1, SP1, -4, str);
}

static void emit_pop(char *reg, ostream &str)
{
    emit_addiu(SP1, SP1, 4, str);
    emit_load(reg, 0, SP1, str);
}

//
// Fetch the integer value in an Int object.
// Emits code to fetch the integer value of the Integer object pointed
// to by register source into the register dest
//
static void emit_fetch_int(char *dest, char *source, ostream &s)
{
    emit_load(dest, DEFAULT_OBJFIELDS, source, s);
}

static void emit_fetch_bool(char *dest, char *source, ostream &s)
{
    emit_load(dest, DEFAULT_OBJFIELDS, source, s);
}

//
// Emits code to store the integer value contained in register source
// into the Integer object pointed to by dest.
//
static void emit_store_int(char *source, char *dest, ostream &s)
{
    emit_store(source, DEFAULT_OBJFIELDS, dest, s);
}

static void emit_test_collector(ostream &s)
{
    emit_push(ACC, s);
    emit_move(ACC, SP1, s);  // stack end
    emit_move(A11, ZERO, s); // allocate nothing
    s << JAL << gc_collect_names[cgen_Memmgr] << endl;
    emit_addiu(SP1, SP1, 4, s);
    emit_load(ACC, 0, SP1, s);
}

static void emit_gc_check(char *source, ostream &s)
{
    if (source != (char *)A11)
        emit_move(A11, source, s);
    s << JAL << "_gc_check" << endl;
}

static void emit_method_call(Symbol cls, Symbol meth, ostream &s)
{
    s << JAL;
    emit_method_ref(cls, meth, s);
    s << endl;
}

///////////////////////////////////////////////////////////////////////////////
//
// coding strings, ints, and booleans
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type StringEntry.  StringEntry methods are defined both for String
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Strings
//
void StringEntry::code_ref(ostream &s)
{
    s << STRCONST_PREFIX << index;
}

//
// Emit code for a constant String.
// You should fill in the code naming the dispatch table.
//

void StringEntry::code_def(ostream &s, int stringclasstag)
{
    IntEntryP lensym = inttable.add_int(len);

    // Add -1 eye catcher
    s << WORD << "-1" << endl;

    code_ref(s);
    s << LABEL                                                              // label
      << WORD << stringclasstag << endl                                     // tag
      << WORD << (DEFAULT_OBJFIELDS + STRING_SLOTS + (len + 4) / 4) << endl // size
      << WORD;

    /***** Add dispatch information for class String ******/
    emit_disptable_ref(Str, s);
    s << endl; // dispatch table
    s << WORD;
    lensym->code_ref(s);
    s << endl;                    // string length
    emit_string_constant(s, str); // ascii string
    s << ALIGN1;                  // align to word
}

//
// StrTable::code_string
// Generate a string object definition for every string constant in the
// stringtable.
//
void StrTable::code_string_table(ostream &s, int stringclasstag)
{
    for (List<StringEntry> *l = tbl; l; l = l->tl())
        l->hd()->code_def(s, stringclasstag);
}

//
// Ints
//
void IntEntry::code_ref(ostream &s)
{
    s << INTCONST_PREFIX << index;
}

//
// Emit code for a constant Integer.
// You should fill in the code naming the dispatch table.
//

void IntEntry::code_def(ostream &s, int intclasstag)
{
    // Add -1 eye catcher
    s << WORD << "-1" << endl;

    code_ref(s);
    s << LABEL                                           // label
      << WORD << intclasstag << endl                     // class tag
      << WORD << (DEFAULT_OBJFIELDS + INT_SLOTS) << endl // object size
      << WORD;

    /***** Add dispatch information for class Int ******/
    emit_disptable_ref(Int, s);
    s << endl;                // dispatch table
    s << WORD << str << endl; // integer value
}

//
// IntTable::code_string_table
// Generate an Int object definition for every Int constant in the
// inttable.
//
void IntTable::code_string_table(ostream &s, int intclasstag)
{
    for (List<IntEntry> *l = tbl; l; l = l->tl())
        l->hd()->code_def(s, intclasstag);
}

//
// Bools
//
BoolConst::BoolConst(int i) : val(i) { assert(i == 0 || i == 1); }

void BoolConst::code_ref(ostream &s) const
{
    s << BOOLCONST_PREFIX << val;
}

//
// Emit code for a constant Bool.
// You should fill in the code naming the dispatch table.
//

void BoolConst::code_def(ostream &s, int boolclasstag)
{
    // Add -1 eye catcher
    s << WORD << "-1" << endl;

    code_ref(s);
    s << LABEL                                            // label
      << WORD << boolclasstag << endl                     // class tag
      << WORD << (DEFAULT_OBJFIELDS + BOOL_SLOTS) << endl // object size
      << WORD;

    /***** Add dispatch information for class Bool ******/
    emit_disptable_ref(Bool, s);
    s << endl;                // dispatch table
    s << WORD << val << endl; // value (0 or 1)
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//***************************************************
//
//  Emit code to start the .data segment and to
//  declare the global names.
//
//***************************************************

void CgenClassTable::code_global_data()
{
    Symbol main = idtable.lookup_string(MAINNAME);
    Symbol string = idtable.lookup_string(STRINGNAME);
    Symbol integer = idtable.lookup_string(INTNAME);
    Symbol boolc = idtable.lookup_string(BOOLNAME);

    str << "\t.data\n"
        << ALIGN1;
    //
    // The following global names must be defined first.
    //
    str << GLOBAL << CLASSNAMETAB << endl;
    str << GLOBAL;
    emit_protobj_ref(main, str);
    str << endl;
    str << GLOBAL;
    emit_protobj_ref(integer, str);
    str << endl;
    str << GLOBAL;
    emit_protobj_ref(string, str);
    str << endl;
    str << GLOBAL;
    falsebool.code_ref(str);
    str << endl;
    str << GLOBAL;
    truebool.code_ref(str);
    str << endl;
    str << GLOBAL << INTTAG << endl;
    str << GLOBAL << BOOLTAG << endl;
    str << GLOBAL << STRINGTAG << endl;

    //
    // We also need to know the tag of the Int, String, and Bool classes
    // during code generation.
    //
    str << INTTAG << LABEL
        << WORD << intclasstag << endl;
    str << BOOLTAG << LABEL
        << WORD << boolclasstag << endl;
    str << STRINGTAG << LABEL
        << WORD << stringclasstag << endl;
}

//***************************************************
//
//  Emit code to start the .text segment and to
//  declare the global names.
//
//***************************************************

void CgenClassTable::code_global_text()
{
    str << GLOBAL << HEAP_START << endl
        << HEAP_START << LABEL
        << WORD << 0 << endl
        << "\t.text" << endl
        << GLOBAL;
    emit_init_ref(idtable.add_string("Main"), str);
    str << endl
        << GLOBAL;
    emit_init_ref(idtable.add_string("Int"), str);
    str << endl
        << GLOBAL;
    emit_init_ref(idtable.add_string("String"), str);
    str << endl
        << GLOBAL;
    emit_init_ref(idtable.add_string("Bool"), str);
    str << endl
        << GLOBAL;
    emit_method_ref(idtable.add_string("Main"), idtable.add_string("main"), str);
    str << endl;
}

void CgenClassTable::code_bools(int boolclasstag)
{
    falsebool.code_def(str, boolclasstag);
    truebool.code_def(str, boolclasstag);
}

void CgenClassTable::code_select_gc()
{
    //
    // Generate GC choice constants (pointers to GC functions)
    //
    str << GLOBAL << "_MemMgr_INITIALIZER" << endl;
    str << "_MemMgr_INITIALIZER:" << endl;
    str << WORD << gc_init_names[cgen_Memmgr] << endl;
    str << GLOBAL << "_MemMgr_COLLECTOR" << endl;
    str << "_MemMgr_COLLECTOR:" << endl;
    str << WORD << gc_collect_names[cgen_Memmgr] << endl;
    str << GLOBAL << "_MemMgr_TEST" << endl;
    str << "_MemMgr_TEST:" << endl;
    str << WORD << (cgen_Memmgr_Test == GC_TEST) << endl;
}

//********************************************************
//
// Emit code to reserve space for and initialize all of
// the constants.  Class names should have been added to
// the string table (in the supplied code, is is done
// during the construction of the inheritance graph), and
// code for emitting string constants as a side effect adds
// the string's length to the integer table.  The constants
// are emmitted by running through the stringtable and inttable
// and producing code for each entry.
//
//********************************************************

void CgenClassTable::code_constants()
{
    //
    // Add constants that are required by the code generator.
    //
    stringtable.add_string("");
    inttable.add_string("0");

    stringtable.code_string_table(str, stringclasstag);
    inttable.code_string_table(str, intclasstag);
    code_bools(boolclasstag);
}

void set_tags(CgenNodeP node)
{
    if (cgen_debug)
        cout << "tag: " << tag_cnt << " - " << node->name << endl;

    node->tag = tag_cnt++;
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
    {
        set_tags(cld->hd());
    }
}

// TODO: pocetak
/*
    radi sve:
        abort
        assignment-val
        basicinit
        bigexpr
        bool
        calls
        dynamic dispatch
        sequence



*/

CgenClassTable::CgenClassTable(Classes classes, ostream &s) : nds(NULL), str(s)
{

    enterscope();
    llvm_tmp_table.enterscope();
    module_init();
    module->setTargetTriple("x86_64-pc-linux-gnu");

    if (cgen_debug)
        cout << "Building CgenClassTable" << endl;
    install_basic_classes();
    install_classes(classes);
    build_inheritance_tree();

    set_tags(root());
    stringclasstag = probe(Str)->tag; /* Change to your String class tag here */
    intclasstag = probe(Int)->tag;    /* Change to your Int class tag here */
    boolclasstag = probe(Bool)->tag;  /* Change to your Bool class tag here */

    code();
    class_table = this;

    // For llvm
    ofstream out("./llvm/hello_world.out");
    code_extern_fn();
    std::vector<llvm::Constant *> strings;
    llvm_code_class_name(root(), strings);

    llvm::ArrayType *ArrayType = llvm::ArrayType::get(builder->getInt8PtrTy(), strings.size());
    llvm::Constant *ArrayConstant = llvm::ConstantArray::get(ArrayType, strings);

    new llvm::GlobalVariable(*module.get(), ArrayType, true, llvm::GlobalValue::PrivateLinkage, ArrayConstant, ".str_array");

    llvm_code_prototype_objects(root());
    llvm_code_class_methods(root());
    llvm_code_class_to_structs(root());

    llvm_code_dispatch_tables(root());
    llvm_code_object_initializers(root());

    // Object methods
    code_abort();
    code_type_name();
    code_copy();
    // IO methods
    code_out_string();
    code_out_int();
    code_in_string();
    code_in_int();
    // String methods
    code_length();
    code_concat();
    // TODO: fix edge case with substr.
    code_substring();

    llvm_code_class(root(), &out);

    save_module_to_file("./llvm/hello_world.ll");
    exitscope();
    llvm_tmp_table.exitscope();
}
void CgenClassTable::code_extern_fn()

{
    // malloc
    llvm::Function::Create(llvm::FunctionType::get(builder->getInt8PtrTy(), builder->getInt32Ty(), false),
                           llvm::Function::ExternalLinkage, "malloc", module.get());
    // memcpy
    llvm::Function::Create(llvm::FunctionType::get(builder->getInt8PtrTy(),
                                                   {builder->getInt8PtrTy(), builder->getInt8PtrTy(), builder->getInt32Ty()}, false),
                           llvm::Function::ExternalLinkage, "memcpy", module.get());
    // printf
    llvm::Function::Create(llvm::FunctionType::get(builder->getInt32Ty(),
                                                   {builder->getInt8PtrTy()}, true),
                           llvm::Function::ExternalLinkage, "printf", module.get());
    // scanf
    llvm::Function::Create(llvm::FunctionType::get(builder->getInt32Ty(),
                                                   {builder->getInt8PtrTy()}, true),
                           llvm::Function::ExternalLinkage, "scanf", module.get());
    // strlen
    llvm::Function::Create(llvm::FunctionType::get(builder->getInt32Ty(),
                                                   {builder->getInt8PtrTy()}, false),
                           llvm::Function::ExternalLinkage, "strlen", module.get());
    // exit
    llvm::Function::Create(llvm::FunctionType::get(builder->getVoidTy(),
                                                   {builder->getInt32Ty()}, false),
                           llvm::Function::ExternalLinkage, "exit", module.get());
};
void CgenClassTable::llvm_code_class_name(CgenNodeP node, std::vector<llvm::Constant *> &strings)
{

    auto className = module->getNamedGlobal(node->get_name()->get_string());
    llvm::Constant *Zero = llvm::ConstantInt::get(builder->getInt32Ty(), 0);
    strings.push_back(llvm::ConstantExpr::getInBoundsGetElementPtr(className->getValueType(), className, llvm::ArrayRef<llvm::Constant *>{Zero, Zero}));
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
    {
        llvm_code_class_name(cld->hd(), strings);
    }
}
void CgenClassTable::llvm_code_class_to_structs(CgenNodeP node)
{

    std::vector<llvm::Type *> classFields;
    auto structType = node->get_struct_type();
    auto vtable = node->get_vtable();

    // Class Tag
    classFields.push_back(builder.get()->getInt32Ty());
    // Object Size
    classFields.push_back(builder.get()->getInt32Ty());
    // Dispatch ptr
    classFields.push_back(vtable->getPointerTo());
    std::vector<llvm::Type *> vtableFields;

    for (auto &name : node->methods)
    {
        llvm::FunctionType *voidType = llvm::FunctionType::get(builder->getVoidTy(), false);
        vtableFields.push_back(module->getFunction(name.second->get_string() + (std::string) "." + name.first->get_string())->getType());
    }
    vtable->setBody(vtableFields);

    Symbol className = node->get_name();
    if (className->equal_string("Int", 3))
    {
        classFields.push_back(builder.get()->getInt32Ty());
    }
    else if (className->equal_string("Bool", 4))
    {
        classFields.push_back(builder.get()->getInt1Ty());
    }
    else if (className->equal_string("String", 6))
    {
        // attr: val
        classFields.push_back(get_llvm_type(Int, Int)->getPointerTo());
        // attr: str_field
        classFields.push_back(builder.get()->getInt8PtrTy());
    }
    else
    {
        int index = 0;
        for (vecFeatureIter Iter = node->attributes.begin();
             Iter != node->attributes.end(); ++Iter)
        {

            node->set_llvm_atrr_offset((*Iter)->get_name(), index);
            classFields.push_back(get_llvm_type((*Iter)->get_type(), className)->getPointerTo());
            index++;
        }
    }

    structType->setBody(classFields);

    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        llvm_code_class_to_structs(cld->hd());
}
void CgenClassTable::llvm_code_prototype_objects(CgenNodeP node)
{

    std::string className = node->get_name()->get_string();

    Features fs = node->get_features();

    llvm::StructType *currStructType = node->get_struct_type();

    // Create function which will initialize class.
    llvm::FunctionType *classInitType = llvm::FunctionType::get(builder->getVoidTy(), currStructType->getPointerTo(), false);

    llvm::Function *classInit = llvm::Function::Create(classInitType, llvm::Function::ExternalLinkage, className + CLASSINIT_SUFFIX, module.get());

    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        llvm_code_prototype_objects(cld->hd());
}
void CgenClassTable::llvm_code_dispatch_tables(CgenNodeP node)
{
    std::vector<llvm::Constant *> functions;
    auto vtable = node->get_vtable();

    for (vecNameNameIter Iter = node->methods.begin();
         Iter != node->methods.end(); ++Iter)
    {

        auto function = module.get()->getFunction((*Iter).second->get_string() + (std::string) "." + (*Iter).first->get_string());

        functions.push_back(function);
    }
    llvm::Constant *vtableInit = llvm::ConstantStruct::get(vtable, functions);
    new llvm::GlobalVariable(*module.get(), vtable, true, llvm::GlobalValue::ExternalLinkage, vtableInit, (std::string)node->get_name()->get_string() + DISPTAB_SUFFIX);
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        llvm_code_dispatch_tables(cld->hd());
}
void CgenClassTable::llvm_code_object_initializers(CgenNodeP node)
{

    llvm_tmp_table.enterscope();

    std::string className = node->get_name()->get_string();

    Features fs = node->get_features();

    llvm::StructType *currStructType = node->get_struct_type();

    llvm::AllocaInst *classInstance = nullptr;
    llvm::ArrayRef<llvm::Type *> structFields = currStructType->elements();

    int index = 0;
    llvm::Function *classInit = module->getFunction(className + CLASSINIT_SUFFIX);

    llvm::BasicBlock *entry = llvm::BasicBlock::Create(*ctx.get(), "entry", classInit);
    builder->SetInsertPoint(entry);

    llvm::Function *malloc = module->getFunction("malloc");

    llvm::Value *stackClass = builder->CreateAlloca(currStructType->getPointerTo());
    builder->CreateStore(classInit->getArg(0), stackClass);
    llvm::Value *loadedClass = builder->CreateLoad(stackClass->getType()->getPointerElementType(), stackClass);

    llvm::Value *tag_ptr = builder->CreateStructGEP(currStructType, loadedClass, TAG_OFFSET);
    builder->CreateStore(builder->getInt32(node->tag), tag_ptr);

    llvm::Value *size_ptr = builder->CreateStructGEP(currStructType, loadedClass, SIZE_OFFSET);
    builder->CreateStore(builder->getInt32(DEFAULT_OBJFIELDS + node->attributes.size()), size_ptr);

    llvm::Value *dispatch_ptr = builder->CreateStructGEP(currStructType, loadedClass, DISPTABLE_OFFSET);
    builder->CreateStore(module->getGlobalVariable((std::string)node->get_name()->get_string() + DISPTAB_SUFFIX), dispatch_ptr);

    if (className == "Int")
    {
        llvm::Value *ptr = builder->CreateStructGEP(currStructType, loadedClass, 0 + DEFAULT_OBJFIELDS);
        builder->CreateStore(builder->getInt32(0), ptr);
    }
    else if (className == "Bool")
    {
        llvm::Value *ptr = builder->CreateStructGEP(currStructType, loadedClass, 0 + DEFAULT_OBJFIELDS);
        builder->CreateStore(builder->getInt1(0), ptr);
    }
    else if (className == "String")
    {
        llvm::Value *length_field = builder->CreateStructGEP(currStructType, loadedClass, 0 + DEFAULT_OBJFIELDS);
        llvm::Value *intClassInstance = get_primitive(Int, builder, module, builder->getInt32(0));

        // auto load_int = builder->CreateLoad(intClassInstance->getType()->getPointerElementType(), intClassInstance);
        builder->CreateStore(intClassInstance, length_field);

        llvm::Value *str_field = builder->CreateStructGEP(currStructType, loadedClass, 1 + DEFAULT_OBJFIELDS);
        llvm::Value *emptyStr = builder->CreateGlobalStringPtr("", "emptyStr");
        builder->CreateStore(emptyStr, str_field);
    }
    else
    {
        for (vecFeatureIter Iter = node->attributes.begin();
             Iter != node->attributes.end(); ++Iter)
        {
            llvm_tmp_table.enterscope();
            llvm::Value *ptr = builder->CreateStructGEP(currStructType, loadedClass, index + DEFAULT_OBJFIELDS);

            index++;

            Expression expr = (*Iter)->get_expr();
            std::string attr_type = (*Iter)->get_type()->get_string();
            if (expr->is_no_expr() && (attr_type == "Bool" || attr_type == "String" || attr_type == "Int"))
            {
                // TODO: class size: 32 since Str class is largest
                llvm::Value *mallocCall = builder->CreateCall(malloc, builder->getInt32(32));
                llvm::Value *newPrimitive = builder->CreateBitCast(mallocCall, get_llvm_type((*Iter)->get_type(), (*Iter)->get_type())->getPointerTo());

                // builder->CreateCall(classInit, classInstance);
                //  llvm::Value *new_primitive = builder->CreateAlloca(get_llvm_type((*Iter)->get_type(), node->get_name()));
                builder->CreateCall(module->getFunction(attr_type + CLASSINIT_SUFFIX), newPrimitive);
                builder->CreateStore(newPrimitive, ptr);
                continue;
            }
            else if (expr->is_no_expr())
            {
                builder->CreateStore(llvm::Constant::getNullValue(ptr->getType()->getPointerElementType()), ptr);
                continue;
            }
            llvm::Value *attribute = expr->llvm_code(builder, module);

            if (attribute)
            {

                // if (attribute->getType()->isPointerTy())
                // {

                //     auto load = builder->CreateLoad(attribute->getType()->getPointerElementType(), attribute);
                //     builder->CreateStore(load, ptr);
                // }
                // else
                // {

                //     builder->CreateStore(attribute, ptr);
                // }
                builder->CreateStore(attribute, ptr);
            }
            llvm_tmp_table.exitscope();
        }
    }
    // Return void
    builder->CreateRet(nullptr);
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        llvm_code_object_initializers(cld->hd());
}
void CgenClassTable::llvm_code_class_methods(CgenNodeP node)
{
    std::string className = node->get_name()->get_string();

    llvm::StructType *currStructType = node->get_struct_type();

    Features fs = node->get_features();

    for (vecNameNameIter Iter = node->methods.begin();
         Iter != node->methods.end(); ++Iter)
    {

        Feature_class *f = nullptr;
        for (int i = fs->first(); fs->more(i); i = fs->next(i))
        {
            Feature_class *foo = fs->nth(i);

            if (foo->is_method() && foo->get_name()->equal_string((*Iter).first->get_string(), (*Iter).first->get_len()))
            {
                f = foo;
                break;
            }
        }
        std::string method_name = (*Iter).second->get_string() + (std::string) "." + (*Iter).first->get_string();

        // If we didn't found method, it means that it was inherited but not overriden. So we just continue because method is already defined.
        if (f == nullptr)
        {
            continue;
        }

        method_class *f_method = dynamic_cast<method_class *>(f);
        std::vector<llvm::Type *>
            llvm_args;

        llvm_args.push_back(currStructType->getPointerTo());

        Formals fms = f_method->get_formals();
        for (int i = fms->first(); fms->more(i); i = fms->next(i))
        {
            formal_class *formal_param = (formal_class *)fms->nth(i);
            llvm_args.push_back(get_llvm_type(formal_param->get_type_decl(), node->get_name()));
        }

        llvm::FunctionType *currFunctionType = llvm::FunctionType::get(get_llvm_type(f_method->return_type, node->get_name()), llvm_args, false);
        llvm::Function *currFunction = llvm::Function::Create(currFunctionType, llvm::Function::ExternalLinkage, method_name, module.get());
        llvm::BasicBlock *entry = llvm::BasicBlock::Create(*ctx.get(), "entry", currFunction);
        builder->SetInsertPoint(entry);

        if (className == "Main" && f_method->get_name()->equal_string("main", 4))
        {
            // Since LLVM requires function called main to be entry point, create it and call Main.main function.

            llvm::FunctionType *mainFunctionType = llvm::FunctionType::get(builder->getVoidTy(), false);

            llvm::Function *mainFunction = llvm::Function::Create(mainFunctionType, llvm::Function::ExternalLinkage, "main", module.get());
            llvm::BasicBlock *entry = llvm::BasicBlock::Create(*ctx.get(), "entry", mainFunction);
            builder->SetInsertPoint(entry);
            // Allocate main class and call init function.

            llvm::Function *malloc = module->getFunction("malloc");
            // TODO: class size
            llvm::Value *mallocCall = builder->CreateCall(malloc, builder->getInt32(256));
            llvm::Value *mainClass = builder->CreateBitCast(mallocCall, currStructType->getPointerTo());
            // llvm::AllocaInst *classInstance = builder->CreateAlloca(currStructType, nullptr);
            llvm::Function *classInit = module->getFunction(className + CLASSINIT_SUFFIX);

            builder->CreateCall(classInit, mainClass);
            builder->CreateCall(currFunction, mainClass);

            builder->CreateRet(nullptr);
            llvm::verifyFunction(*mainFunction);
        }

        currFunction->getArg(0)->setName("self");
    }

    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        llvm_code_class_methods(cld->hd());
}
void CgenClassTable::code_abort()
{
    llvm::Function *abort_fn = module->getFunction("Object.abort");
    llvm::BasicBlock *entry = &abort_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Function *type_name_fn = module->getFunction("Object.type_name");
    llvm::Function *printf = module->getFunction("printf");
    llvm::Function *exit = module->getFunction("exit");
    auto type_name = builder->CreateCall(type_name_fn, abort_fn->getArg(0));
    auto abort_spec = builder->CreateGlobalStringPtr("%s %s\n", "abort_format");
    auto abort_msg = builder->CreateGlobalStringPtr("Abort called from class", "abort_msg");
    builder->CreateCall(printf, {abort_spec, abort_msg, builder->CreateExtractValue(type_name, 1 + DEFAULT_OBJFIELDS)});
    auto init_obj = module->getFunction((std::string) "Object" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_obj = builder->CreateAlloca(init_obj->getArg(0)->getType()->getPointerElementType());
    builder->CreateCall(exit, builder->getInt32(1));

    builder->CreateRet(builder->CreateLoad(new_obj->getType()->getPointerElementType(), new_obj));
    llvm::verifyFunction(*abort_fn);
}
void CgenClassTable::code_type_name()
{
    llvm::Function *type_name_fn = module->getFunction("Object.type_name");
    llvm::BasicBlock *entry = &type_name_fn->getEntryBlock();
    builder->SetInsertPoint(entry);
    auto selfptr = type_name_fn->getArg(0);
    auto offset = builder->CreateStructGEP(selfptr->getType()->getPointerElementType(), selfptr, TAG_OFFSET);
    auto loaded_offset = builder->CreateLoad(offset->getType()->getPointerElementType(), offset);
    auto strArray = module->getNamedGlobal(".str_array");
    llvm::Value *GEP1 = builder->CreateInBoundsGEP(strArray->getValueType(), strArray, {builder->getInt32(0), loaded_offset});
    llvm::Value *Load1 = builder->CreateLoad(GEP1->getType()->getPointerElementType(), GEP1);
    auto strClassInst = get_primitive(Str, builder, module, Load1);

    llvm::Function *strlen = module->getFunction("strlen");
    auto new_length = builder->CreateCall(strlen, Load1);
    llvm::Value *length_field = builder->CreateStructGEP(strClassInst->getType()->getPointerElementType(), strClassInst, 0 + DEFAULT_OBJFIELDS);

    auto loaded_field = builder->CreateLoad(length_field->getType()->getPointerElementType(), length_field);
    builder->CreateStore(new_length, builder->CreateStructGEP(loaded_field->getType()->getPointerElementType(), loaded_field, 0 + DEFAULT_OBJFIELDS));

    builder->CreateRet(builder->CreateLoad(strClassInst->getType()->getPointerElementType(), strClassInst));
    llvm::verifyFunction(*type_name_fn);
}
void CgenClassTable::code_copy()
{
    llvm::Function *copy_fn = module->getFunction("Object.copy");
    llvm::BasicBlock *entry = &copy_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Function *memcpy = module->getFunction("memcpy");
    llvm::Function *malloc = module->getFunction("malloc");

    // TODO: class size
    auto malloc_call = builder->CreateCall(malloc, builder->getInt32(256));
    auto self_to_i8 = builder->CreateBitCast(copy_fn->getArg(0), builder->getInt8PtrTy());
    builder->CreateCall(memcpy, {malloc_call, self_to_i8, builder->getInt32(256)});
    auto newClass = builder->CreateBitCast(malloc_call, copy_fn->getArg(0)->getType());
    builder->CreateRet(newClass);
    llvm::verifyFunction(*copy_fn);
}
void CgenClassTable::code_out_string()
{
    llvm::Function *out_string_fn = module->getFunction("IO.out_string");
    llvm::BasicBlock *entry = &out_string_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Value *self = out_string_fn->getArg(0);
    llvm::Value *string_to_print = out_string_fn->getArg(1);

    llvm::Function *printf = module->getFunction("printf");
    llvm::Value *printf_call = builder->CreateCall(printf, builder->CreateExtractValue(string_to_print, 1 + DEFAULT_OBJFIELDS));

    builder->CreateRet(self);
    llvm::verifyFunction(*out_string_fn);
}
void CgenClassTable::code_out_int()
{
    llvm::Function *out_int_fn = module->getFunction("IO.out_int");
    llvm::BasicBlock *entry = &out_int_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Value *self = out_int_fn->getArg(0);
    llvm::Value *int_to_print = out_int_fn->getArg(1);

    llvm::Function *printf = module->getFunction("printf");
    llvm::Value *format_int = builder->CreateGlobalStringPtr("%d", "format_int");
    llvm::Value *printf_call = builder->CreateCall(printf, {format_int, builder->CreateExtractValue(int_to_print, 0 + DEFAULT_OBJFIELDS)});

    builder->CreateRet(self);
    llvm::verifyFunction(*out_int_fn);
}

void CgenClassTable::code_in_string()
{
    llvm::Function *in_string_fn = module->getFunction("IO.in_string");
    llvm::BasicBlock *entry = &in_string_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Value *self = in_string_fn->getArg(0);

    llvm::Function *scanf = module->getFunction("scanf");
    llvm::Function *malloc = module->getFunction("malloc");
    llvm::Function *strlen = module->getFunction("strlen");

    auto init_string = module->getFunction((std::string) "String" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_string = builder->CreateAlloca(init_string->getArg(0)->getType()->getPointerElementType());
    llvm::Value *bufferSize = builder->getInt32(1026);
    llvm::Value *buffer = builder->CreateAlloca(builder->getInt8Ty(), bufferSize, "buffer");

    llvm::Value *new_string_length_field = builder->CreateStructGEP(new_string->getType()->getPointerElementType(), new_string, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *new_string_str_field = builder->CreateStructGEP(new_string->getType()->getPointerElementType(), new_string, 1 + DEFAULT_OBJFIELDS);
    builder->CreateStore(buffer, new_string_str_field);

    llvm::Value *format_string = builder->CreateGlobalStringPtr("%s", "format_string");

    llvm::Value *scanf_call = builder->CreateCall(scanf, {format_string, builder->CreateLoad(new_string_str_field->getType()->getPointerElementType(), new_string_str_field)});

    auto int_init = module->getFunction((std::string) "Int" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_length = builder->CreateAlloca(int_init->getArg(0)->getType()->getPointerElementType(), nullptr);
    llvm::Value *new_length_field = builder->CreateStructGEP(new_length->getType()->getPointerElementType(), new_length, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *strlen_call = builder->CreateCall(strlen, {builder->CreateLoad(new_string_str_field->getType()->getPointerElementType(), new_string_str_field)});
    builder->CreateStore(strlen_call, new_length_field);
    builder->CreateStore(new_length, new_string_length_field);

    builder->CreateRet(builder->CreateLoad(new_string->getType()->getPointerElementType(), new_string));
    llvm::verifyFunction(*in_string_fn);
}
void CgenClassTable::code_in_int()
{
    llvm::Function *in_int_fn = module->getFunction("IO.in_int");
    llvm::BasicBlock *entry = &in_int_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Value *self = in_int_fn->getArg(0);

    llvm::Function *scanf = module->getFunction("scanf");

    auto int_init = module->getFunction((std::string) "Int" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_int = builder->CreateAlloca(int_init->getArg(0)->getType()->getPointerElementType(), nullptr);
    llvm::Value *new_int_i32_field = builder->CreateStructGEP(new_int->getType()->getPointerElementType(), new_int, 0 + DEFAULT_OBJFIELDS);
    // TODO: figure out how to use pointer cast.
    llvm::Value *format_int = builder->CreatePointerCast(module->getNamedGlobal("format_int"), builder->getInt8PtrTy());

    llvm::Value *scanf_call = builder->CreateCall(scanf, {format_int, new_int_i32_field});

    builder->CreateRet(builder->CreateLoad(new_int->getType()->getPointerElementType(), new_int));
    llvm::verifyFunction(*in_int_fn);
}
void CgenClassTable::code_length()
{
    llvm::Function *string_length_fn = module->getFunction("String.length");
    llvm::BasicBlock *length_entry = &string_length_fn->getEntryBlock();
    builder->SetInsertPoint(length_entry);

    llvm::Value *string_self_length = string_length_fn->getArg(0);
    llvm::Value *length_field = builder->CreateStructGEP(string_self_length->getType()->getPointerElementType(), string_self_length, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *loaded_length_field = builder->CreateLoad(length_field->getType()->getPointerElementType(), length_field);
    builder->CreateRet(builder->CreateLoad(loaded_length_field->getType()->getPointerElementType(), loaded_length_field));

    llvm::verifyFunction(*string_length_fn);
}

void CgenClassTable::code_concat()
{
    llvm::Function *string_concat_fn = module->getFunction("String.concat");
    llvm::BasicBlock *concat_entry = &string_concat_fn->getEntryBlock();
    builder->SetInsertPoint(concat_entry);

    llvm::Value *string_self_concat = string_concat_fn->getArg(0);
    llvm::Value *str_field_self = builder->CreateStructGEP(string_self_concat->getType()->getPointerElementType(), string_self_concat, 1 + DEFAULT_OBJFIELDS);
    llvm::Value *s = string_concat_fn->getArg(1);

    auto init_string = module->getFunction((std::string) "String" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_string = builder->CreateAlloca(init_string->getArg(0)->getType()->getPointerElementType(), nullptr);

    llvm::Value *new_string_length_field = builder->CreateStructGEP(new_string->getType()->getPointerElementType(), new_string, 0 + DEFAULT_OBJFIELDS);

    auto int_init = module->getFunction((std::string) "Int" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_length = builder->CreateAlloca(int_init->getArg(0)->getType()->getPointerElementType(), nullptr);
    llvm::Value *new_length_field = builder->CreateStructGEP(new_length->getType()->getPointerElementType(), new_length, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *bar = builder->CreateStructGEP(string_self_concat->getType()->getPointerElementType(), string_self_concat, 0 + DEFAULT_OBJFIELDS);

    llvm::Value *baz = builder->CreateLoad(bar->getType()->getPointerElementType(), bar);
    llvm::Value *foo = builder->CreateStructGEP(baz->getType()->getPointerElementType(), baz, 0 + DEFAULT_OBJFIELDS);

    llvm::Value *self_string_length = builder->CreateLoad(foo->getType()->getPointerElementType(), foo);

    llvm::Value *s_foo = builder->CreateExtractValue(s, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *s_string_length = builder->CreateStructGEP(s_foo->getType()->getPointerElementType(), s_foo, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *s_string_length_i32 = builder->CreateLoad(s_string_length->getType()->getPointerElementType(), s_string_length);
    llvm::Value *new_length_value = builder->CreateAdd(
        self_string_length, s_string_length_i32);

    builder->CreateStore(new_length_value, new_length_field);

    builder->CreateStore(new_length, new_string_length_field);

    llvm::Function *malloc = module->getFunction("malloc");
    llvm::Value *malloc_call = builder->CreateCall(malloc, new_length_value);

    llvm::Function *memcpy = module->getFunction("memcpy");
    builder->CreateCall(memcpy, {malloc_call, builder->CreateLoad(str_field_self->getType()->getPointerElementType(), str_field_self), self_string_length});

    llvm::Value *EndOfFirstStr = builder->CreateGEP(malloc_call->getType()->getPointerElementType(), malloc_call, self_string_length, "endOfFirstStr");

    // Copy the second string to the new allocated space, starting after the first string
    builder->CreateCall(memcpy, {EndOfFirstStr, builder->CreateExtractValue(s, 1 + DEFAULT_OBJFIELDS), s_string_length_i32});

    llvm::Value *str_field = builder->CreateStructGEP(new_string->getType()->getPointerElementType(), new_string, 1 + DEFAULT_OBJFIELDS);
    builder->CreateStore(malloc_call, str_field);

    builder->CreateRet(builder->CreateLoad(new_string->getType()->getPointerElementType(), new_string));
    llvm::verifyFunction(*string_concat_fn);
}
void CgenClassTable::code_substring()
{
    llvm::Function *string_substring_fn = module->getFunction("String.substr");
    llvm::BasicBlock *entry = &string_substring_fn->getEntryBlock();
    builder->SetInsertPoint(entry);

    llvm::Value *string_self = string_substring_fn->getArg(0);
    llvm::Value *str_field_self = builder->CreateStructGEP(string_self->getType()->getPointerElementType(), string_self, 1 + DEFAULT_OBJFIELDS);
    llvm::Value *index = string_substring_fn->getArg(1);
    llvm::Value *length = string_substring_fn->getArg(2);

    auto init_string = module->getFunction((std::string) "String" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_string = builder->CreateAlloca(init_string->getArg(0)->getType()->getPointerElementType(), nullptr);

    llvm::Value *new_string_length_field = builder->CreateStructGEP(new_string->getType()->getPointerElementType(), new_string, 0 + DEFAULT_OBJFIELDS);
    auto int_init = module->getFunction((std::string) "Int" + CLASSINIT_SUFFIX);
    llvm::AllocaInst *new_length_int = builder->CreateAlloca(int_init->getArg(0)->getType()->getPointerElementType(), nullptr);
    llvm::Value *new_length_field = builder->CreateStructGEP(new_length_int->getType()->getPointerElementType(), new_length_int, 0 + DEFAULT_OBJFIELDS);
    llvm::Value *new_length_value = builder->CreateExtractValue(length, 0 + DEFAULT_OBJFIELDS);

    builder->CreateStore(new_length_value, new_length_field);

    builder->CreateStore(new_length_int, new_string_length_field);

    llvm::Function *malloc = module->getFunction("malloc");
    llvm::Value *malloc_call = builder->CreateCall(malloc, new_length_value);

    llvm::Function *memcpy = module->getFunction("memcpy");
    llvm::Value *load_str_field_self = builder->CreateLoad(str_field_self->getType()->getPointerElementType(), str_field_self);
    llvm::Value *string_at_index = builder->CreateGEP(load_str_field_self->getType()->getPointerElementType(), load_str_field_self, builder->CreateExtractValue(index, 0 + DEFAULT_OBJFIELDS), "string_at_index");

    builder->CreateCall(memcpy, {malloc_call, string_at_index, new_length_value});

    llvm::Value *str_field = builder->CreateStructGEP(new_string->getType()->getPointerElementType(), new_string, 1 + DEFAULT_OBJFIELDS);
    builder->CreateStore(malloc_call, str_field);

    builder->CreateRet(builder->CreateLoad(new_string->getType()->getPointerElementType(), new_string));
    llvm::verifyFunction(*string_substring_fn);
}
// TODO: llvm code
void CgenClassTable::llvm_code_class(CgenNodeP node, std::ofstream *out)
{
    node->dump_with_types(*out, 0);

    std::string className = node->get_name()->get_string();
    cout << "Classname: " << className << endl;

    llvm::StructType *currStructType = node->get_struct_type();

    llvm::Value *res = nullptr;
    Features fs = node->get_features();

    if (node->basic() == false)
    {
        for (vecNameNameIter Iter = node->methods.begin();
             Iter != node->methods.end(); ++Iter)
        {

            Feature_class *f = nullptr;
            for (int i = fs->first(); fs->more(i); i = fs->next(i))
            {
                Feature_class *foo = fs->nth(i);

                if (foo->is_method() && foo->get_name()->equal_string((*Iter).first->get_string(), (*Iter).first->get_len()))
                {
                    f = foo;
                    break;
                }
            }
            // If we didn't found method, it means that it was inherited but not overriden. So we just continue because method is already defined.
            if (f == nullptr)
            {
                continue;
            }
            method_class *f_method = dynamic_cast<method_class *>(f);
            cur_node = node;
            std::string method_name = (*Iter).second->get_string() + (std::string) "." + (*Iter).first->get_string();

            llvm::Function *currFunction = module->getFunction(method_name);
            llvm::BasicBlock *entry = &currFunction->getEntryBlock();
            builder->SetInsertPoint(entry);

            llvm::Value *stackClass = builder->CreateAlloca(currStructType->getPointerTo());
            builder->CreateStore(currFunction->getArg(0), stackClass);
            llvm::Value *loadedClass = builder->CreateLoad(stackClass->getType()->getPointerElementType(), stackClass);
            llvm_tmp_table.enterscope();
            auto bar = new llvm::Value *(loadedClass);
            llvm_tmp_table.addid(self, bar);
            Formals fms = f_method->get_formals();
            auto it = currFunction->arg_begin(); // Get the iterator to the first argument
            auto end = currFunction->arg_end();  // Get the iterator to the end of the arguments

            if (it != end)
            {
                ++it; // Skip the first argument since it pointer to struct.
            }

            int index = 0;
            for (; it != end; ++it)
            {
                formal_class *formal_param = (formal_class *)fms->nth(index);
                auto foo = (llvm::Value *)currFunction->getArg(index + 1);
                auto bar = new llvm::Value *(foo);
                llvm_tmp_table.addid(formal_param->get_name(), bar);
                index++;
            }
            res = f_method->get_expr()->llvm_code(builder, module);

            if (res != nullptr)
            {
                cout << "Res:" << endl;

                // TODO : figure out Object return type
                if (res->getType() != currFunction->getReturnType())
                {
                    res = builder->CreateBitCast(res, currFunction->getReturnType()->getPointerTo());
                }
                if (f_method->get_type() != SELF_TYPE && res->getType()->isPointerTy())
                {
                    res = builder->CreateLoad(res->getType()->getPointerElementType(), res);
                }
                builder->CreateRet(res);
                res = nullptr;
            }
            else
            {
                builder->CreateRet(nullptr);
            }
            llvm::verifyFunction(*currFunction);
            llvm_tmp_table.exitscope();
        }
    }

    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        llvm_code_class(cld->hd(), out);
}

// TODO: LLVM type
llvm::Type *CgenClassTable::get_llvm_type(Symbol cool_type, Symbol className)
{

    std::vector<llvm::StructType *> structTypes = module->getIdentifiedStructTypes();
    bool is_self_type = false;
    if (cool_type == SELF_TYPE)
    {
        cool_type = className;
        is_self_type = true;
    }

    for (List<CgenNode> *cld = nds; cld != NULL; cld = cld->tl())

    {
        if (cld->hd()->get_name()->equal_string(cool_type->get_string(), cool_type->get_len()))
        {
            if (is_self_type)
                return cld->hd()->get_struct_type()->getPointerTo();
            return cld->hd()->get_struct_type();
        }
    }
    cout << "Cool type: " << cool_type << endl;

    return builder->getInt16Ty();
}

void CgenClassTable::install_basic_classes()
{

    // The tree package uses these globals to annotate the classes built below.
    // curr_lineno  = 0;
    Symbol filename = stringtable.add_string("<basic class>");

    //
    // A few special class names are installed in the lookup table but not
    // the class list.  Thus, these classes exist, but are not part of the
    // inheritance hierarchy.
    // No_class serves as the parent of Object and the other special classes.
    // SELF_TYPE is the self class; it cannot be redefined or inherited.
    // prim_slot is a class known to the code generator.
    //
    addid(No_class,
          new CgenNode(class_(No_class, No_class, nil_Features(), filename),
                       Basic, this));
    addid(SELF_TYPE,
          new CgenNode(class_(SELF_TYPE, No_class, nil_Features(), filename),
                       Basic, this));
    addid(prim_slot,
          new CgenNode(class_(prim_slot, No_class, nil_Features(), filename),
                       Basic, this));

    //
    // The Object class has no parent class. Its methods are
    //        cool_abort() : Object    aborts the program
    //        type_name() : Str        returns a string representation of class name
    //        copy() : SELF_TYPE       returns a copy of the object
    //
    // There is no need for method bodies in the basic classes---these
    // are already built in to the runtime system.
    //
    install_class(
        new CgenNode(
            class_(Object,
                   No_class,
                   append_Features(
                       append_Features(
                           single_Features(method(cool_abort, nil_Formals(), Object, no_expr())),
                           single_Features(method(type_name, nil_Formals(), Str, no_expr()))),
                       single_Features(method(copy, nil_Formals(), SELF_TYPE, no_expr()))),
                   filename),
            Basic, this));

    //
    // The IO class inherits from Object. Its methods are
    //        out_string(Str) : SELF_TYPE          writes a string to the output
    //        out_int(Int) : SELF_TYPE               "    an int    "  "     "
    //        in_string() : Str                    reads a string from the input
    //        in_int() : Int                         "   an int     "  "     "
    //
    install_class(
        new CgenNode(
            class_(IO,
                   Object,
                   append_Features(
                       append_Features(
                           append_Features(
                               single_Features(method(out_string, single_Formals(formal(arg, Str)),
                                                      SELF_TYPE, no_expr())),
                               single_Features(method(out_int, single_Formals(formal(arg, Int)),
                                                      SELF_TYPE, no_expr()))),
                           single_Features(method(in_string, nil_Formals(), Str, no_expr()))),
                       single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
                   filename),
            Basic, this));

    //
    // The Int class has no methods and only a single attribute, the
    // "val" for the integer.
    //
    install_class(
        new CgenNode(
            class_(Int,
                   Object,
                   single_Features(attr(val, prim_slot, no_expr())),
                   filename),
            Basic, this));

    //
    // Bool also has only the "val" slot.
    //
    install_class(
        new CgenNode(
            class_(Bool, Object, single_Features(attr(val, prim_slot, no_expr())), filename),
            Basic, this));

    //
    // The class Str has a number of slots and operations:
    //       val                                  ???
    //       str_field                            the string itself
    //       length() : Int                       length of the string
    //       concat(arg: Str) : Str               string concatenation
    //       substr(arg: Int, arg2: Int): Str     substring
    //
    install_class(
        new CgenNode(
            class_(Str,
                   Object,
                   append_Features(
                       append_Features(
                           append_Features(
                               append_Features(
                                   single_Features(attr(val, Int, no_expr())),
                                   single_Features(attr(str_field, prim_slot, no_expr()))),
                               single_Features(method(length, nil_Formals(), Int, no_expr()))),
                           single_Features(method(concat,
                                                  single_Formals(formal(arg, Str)),
                                                  Str,
                                                  no_expr()))),
                       single_Features(method(substr,
                                              append_Formals(single_Formals(formal(arg, Int)),
                                                             single_Formals(formal(arg2, Int))),
                                              Str,
                                              no_expr()))),
                   filename),
            Basic, this));
}

// CgenClassTable::install_class
// CgenClassTable::install_classes
//
// install_classes enters a list of classes in the symbol table.
// TODO: install class
void CgenClassTable::install_class(CgenNodeP nd)
{
    Symbol name = nd->get_name();

    if (probe(name))
    {
        return;
    }

    // The class name is legal, so add it to the list of classes
    // and the symbol table.
    nds = new List<CgenNode>(nd, nds);

    llvm::StructType *currStructType = llvm::StructType::create(*ctx.get(), name->get_string());
    llvm::StructType *vTable = llvm::StructType::create(*ctx.get(), (std::string)name->get_string() + DISPTAB_SUFFIX);
    builder->CreateGlobalString(name->get_string(), name->get_string(), 0, module.get());

    nd->set_struct_type(currStructType);
    nd->set_vtable(vTable);
    addid(name, nd);
}

void CgenClassTable::install_classes(Classes cs)
{
    for (int i = cs->first(); cs->more(i); i = cs->next(i))
        install_class(new CgenNode(cs->nth(i), NotBasic, this));
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree()
{
    for (List<CgenNode> *l = nds; l; l = l->tl())
        set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNodeP nd)
{
    CgenNode *parent_node = probe(nd->get_parent());
    nd->set_parentnd(parent_node);
    parent_node->add_child(nd);
}

void CgenNode::add_child(CgenNodeP n)
{
    children = new List<CgenNode>(n, children);
}

void CgenNode::set_parentnd(CgenNodeP p)
{
    assert(parentnd == NULL);
    assert(p != NULL);
    parentnd = p;
}

// Vecina koda ispod je novo.
void CgenClassTable::code_class_name_table()
{
    str << CLASSNAMETAB << LABEL;
    code_class_name(root());
}

void CgenClassTable::code_class_name(CgenNodeP node)
{
    str << WORD;
    stringtable.lookup_string(node->get_name()->get_string())->code_ref(str);
    str << endl;
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
    {
        code_class_name(cld->hd());
    }
}

void CgenClassTable::code_class_objects_table()
{
    str << CLASSOBJTAB << LABEL;
    code_class_objects(root());
}

void CgenClassTable::code_class_objects(CgenNodeP node)
{
    Symbol name = node->get_name();
    str << WORD;
    emit_protobj_ref(name, str);
    str << endl;
    str << WORD;
    emit_init_ref(name, str);
    str << endl;
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
    {
        code_class_objects(cld->hd());
    }
}

void CgenClassTable::code_fill_features(CgenNodeP node)
{
    // from parent
    if (node->get_name() != Object)
    {
        CgenNodeP pnode = node->get_parentnd();
        for (vecNameNameIter Iter = pnode->methods.begin();
             Iter != pnode->methods.end(); ++Iter)
            node->methods.push_back(*Iter);
        for (vecFeatureIter Iter = pnode->attributes.begin();
             Iter != pnode->attributes.end(); ++Iter)
            node->attributes.push_back(*Iter);
    }
    Features fs = node->get_features();
    for (int i = fs->first(); fs->more(i); i = fs->next(i))
    {
        Feature_class *f = fs->nth(i);
        if (f->is_method())
        {
            // override?
            bool found = false;
            for (vecNameNameIter Iter = node->methods.begin();
                 Iter != node->methods.end(); ++Iter)
                if (Iter->first == f->get_name())
                {
                    Iter->second = node->get_name();
                    found = true;
                }
            if (found == false)
                node->methods.push_back(
                    std::make_pair(f->get_name(), node->get_name()));
        }
        else
            node->attributes.push_back(f);
    }
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        code_fill_features(cld->hd());
}

void CgenClassTable::code_dispatch_tables(CgenNodeP node)
{
    emit_disptable_ref(node->get_name(), str);
    str << LABEL;
    for (vecNameNameIter Iter = node->methods.begin();
         Iter != node->methods.end(); ++Iter)
    {
        str << WORD;
        emit_method_ref(Iter->second, Iter->first, str);
        str << endl;
    }
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        code_dispatch_tables(cld->hd());
}

void CgenClassTable::code_prototype_objects(CgenNodeP node)
{
    str << WORD << "-1" << endl; // eyecatcher
    emit_protobj_ref(node->get_name(), str);
    str << LABEL;
    str << WORD << node->tag << endl;
    str << WORD << DEFAULT_OBJFIELDS << node->attributes.size() << endl;
    str << WORD;
    emit_disptable_ref(node->get_name(), str);
    str << endl;
    for (vecFeatureIter Iter = node->attributes.begin();
         Iter != node->attributes.end(); ++Iter)
    {
        str << WORD;
        if ((*Iter)->get_type() == Int)
            inttable.lookup_string("0")->code_ref(str);
        else if ((*Iter)->get_type() == Str)
            stringtable.lookup_string("")->code_ref(str);
        else if ((*Iter)->get_type() == Bool)
            falsebool.code_ref(str);
        else
            str << 0;
        str << endl;
    }
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        code_prototype_objects(cld->hd());
}

static void emit_func_before(int tmps, ostream &s)
{
    emit_addiu(SP1, SP1, -(3 + tmps) * WORD_SIZE, s);
    emit_store(FP, 3 + tmps, SP1, s);
    emit_store(SELF, 2 + tmps, SP1, s);
    emit_store(RA, 1 + tmps, SP1, s);
    emit_addiu(FP, SP1, WORD_SIZE, s);
    emit_move(SELF, ACC, s);
}

static void emit_func_after(int tmps, int fms, ostream &s)
{
    emit_load(FP, 3 + tmps, SP1, s);
    emit_load(SELF, 2 + tmps, SP1, s);
    emit_load(RA, 1 + tmps, SP1, s);
    emit_addiu(SP1, SP1, (3 + tmps + fms) * WORD_SIZE, s);
    emit_return(s);
}

void CgenClassTable::code_object_initializers(CgenNodeP node)
{
    // pronađi maksimalni broj privremenih varijabli za inicijalizaciju atributa
    int tmps = 0;
    for (vecFeatureIter Iter = node->attributes.begin();
         Iter != node->attributes.end(); ++Iter)
    {
        tmps = max(tmps, (*Iter)->get_expr()->cnt_max_tmps());
    }
    emit_init_ref(node->get_name(), str);
    str << LABEL;
    emit_func_before(tmps, str);
    // pozovi inicijalizaciju nadređene klase
    if (node->get_name() != Object)
    {
        str << JAL;
        emit_init_ref(node->get_parentnd()->get_name(), str);
        str << endl;
    }
    // inicijaliziram sve atribute
    int offset = DEFAULT_OBJFIELDS - 1;
    for (vecFeatureIter Iter = node->attributes.begin();
         Iter != node->attributes.end(); ++Iter)
    {
        ++offset;
        // no init or already in parent's init
        if ((*Iter)->get_expr()->is_no_expr())
            continue;

        vecFeature pnt_attrs = node->get_parentnd()->attributes;
        if (std::find(pnt_attrs.begin(), pnt_attrs.end(), *Iter) != pnt_attrs.end())
            continue;

        // before codegen
        cur_node = node;
        tmp_table.enterscope();
        tmp_cnt = 0;

        (*Iter)->get_expr()->code(str);

        if (cgen_debug)
        {
            cout << "\t- " << node->name << "." << (*Iter)->get_name() << endl;
        }

        tmp_table.exitscope();

        emit_store(ACC, offset, SELF, str);
    }
    emit_move(ACC, SELF, str);
    emit_func_after(tmps, 0, str);

    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        code_object_initializers(cld->hd());
}

void CgenClassTable::code_class_methods(CgenNodeP node)
{
    // generiraj metode osim za temeljnu klasu

    if (node->basic() == false)
    {
        Features fs = node->get_features();
        for (int i = fs->first(); fs->more(i); i = fs->next(i))
        {
            // preskačem atribute
            if (fs->nth(i)->is_method() == false)
                continue;

            method_class *f = dynamic_cast<method_class *>(fs->nth(i));
            int tmps = f->get_expr()->cnt_max_tmps();
            // ispiši ime
            emit_method_ref(node->get_name(), f->get_name(), str);
            str << LABEL;

            // obavljam posao prije poziva funkcije???
            emit_func_before(tmps, str);

            // prije generiranja koda
            cur_node = node;
            tmp_table.enterscope();
            tmp_cnt = 0;

            // radim tablicu offseta za formalne parametre
            Formals fms = f->get_formals();
            // stack: High[fm1, fm2, fp, so, ra, tmp2, tmp1(new_fp)]Low(top)
            int offset = fms->len() + tmps + 2;
            for (int i = fms->first(); fms->more(i); i = fms->next(i))
            {
                int *pint = new int;
                *pint = offset--;
                tmp_table.addid(fms->nth(i)->get_name(), pint);
            }
            if (cgen_debug)
            {
                cout << "\t- " << node->name << "." << f->get_name() << endl;
            }

            // kodiraj parametre
            f->get_expr()->code(str);

            tmp_table.exitscope();

            // emitiraj funkciju
            emit_func_after(tmps, fms->len(), str);
        }
    }
    for (List<CgenNode> *cld = node->get_children(); cld != NULL; cld = cld->tl())
        code_class_methods(cld->hd());
}

// TODO: code
void CgenClassTable::code()
{
    if (cgen_debug)
        cout << "coding global data" << endl;
    code_global_data();

    if (cgen_debug)
        cout << "choosing gc" << endl;
    code_select_gc();

    if (cgen_debug)
        cout << "coding constants" << endl;
    code_constants();

    //                 Add your code to emit
    //                   - prototype objects
    //                   - class_nameTab
    //                   - dispatch tables

    if (cgen_debug)
        cout << "coding class name table" << endl;
    code_class_name_table();

    if (cgen_debug)
        cout << "coding class objects table" << endl;
    code_class_objects_table();

    if (cgen_debug)
        cout << "coding - filling class features" << endl;
    code_fill_features(root());

    if (cgen_debug)
        cout << "coding dispatch tables" << endl;
    code_dispatch_tables(root());

    if (cgen_debug)
        cout << "coding global text" << endl;
    code_global_text();

    if (cgen_debug)
        cout << "coding prototype objects" << endl;
    code_prototype_objects(root());

    //                 Add your code to emit
    //                   - object initializer
    //                   - the class methods
    //                   - etc...

    // globalna varijabla, koja će mi tribat u code funkcijama
    class_table = this;

    if (cgen_debug)
        cout << "coding object initializers" << endl;
    code_object_initializers(root());

    if (cgen_debug)
        cout << "coding class methods" << endl;
    code_class_methods(root());
}

CgenNodeP CgenClassTable::root()
{
    return probe(Object);
}

///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTableP ct) : class__class((const class__class &)*nd),
                                                                       parentnd(NULL),
                                                                       children(NULL),
                                                                       basic_status(bstatus)
{
    stringtable.add_string(name->get_string()); // Add class name to string table
    tag = 0;
}

int CgenNode::get_meth_offset(Symbol meth_name)
{
    // in disptable
    int offset = 0;
    for (vecNameNameIter Iter = this->methods.begin();
         Iter != this->methods.end(); ++Iter)
    {
        if ((*Iter).first == meth_name)
            return offset;
        else
            ++offset;
    }
    return -1; // not found
}

int CgenNode::get_attr_offset(Symbol attr_name)
{
    // in stack
    int offset = DEFAULT_OBJFIELDS;
    for (vecFeatureIter Iter = this->attributes.begin();
         Iter != this->attributes.end(); ++Iter)
    {
        if ((*Iter)->get_name() == attr_name)
            return offset;
        else
            ++offset;
    }
    return -1; // not found
}

//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.h'  Sample code for
//   constant integers, strings, and booleans are provided.
//
//*****************************************************************
llvm::Value *assign_class::llvm_code(Builder &builder, Module &module)
{
    cout << "Assign begin\n";
    llvm::Value *rhs_expr = expr->llvm_code(builder, module);
    auto offset = llvm_lookup_var(name);
    llvm::Function *fn = builder->GetInsertBlock()->getParent();
    cout << "name: " << name << endl;

    if (std::get<0>(offset))
    {

        llvm::Value *id = builder->CreateStructGEP(fn->getArg(0)->getType()->getPointerElementType(), fn->getArg(0), std::get<2>(offset));
        if (rhs_expr->getType() != id->getType()->getPointerElementType())
            rhs_expr = builder->CreateBitCast(rhs_expr, id->getType()->getPointerElementType());

        builder->CreateStore(rhs_expr, id);
        return id;
    }

    auto new_value = new llvm::Value *(rhs_expr);
    llvm_tmp_table.addid(name, new_value);
    cout << "Assign done\n";
    return *llvm_tmp_table.lookup(name);
}
void assign_class::code(ostream &s)
{
    // prvo izračunam vrijednost izraza
    expr->code(s);
    // onda potrežim u tablici na kojoj adresi mi je varijabla
    std::pair<char *, int> pr = lookup_var(name);
    // onda spremim vrijednost na tu adresu
    emit_store(ACC, pr.second, pr.first, s);
}
int assign_class::cnt_max_tmps() { return expr->cnt_max_tmps(); }
llvm::Value *static_dispatch_class::llvm_code(Builder &builder, Module &module) {}
void static_dispatch_class::code(ostream &s)
{
    for (int i = actual->first(); actual->more(i); i = actual->next(i))
    {
        actual->nth(i)->code(s);
        emit_push(ACC, s);
    }
    expr->code(s);
    // void?
    int ok = new_label();
    emit_bne(ACC, ZERO, ok, s);
    // call abort
    // filename in a0
    emit_load_string(
        ACC, stringtable.lookup_string(cur_node->get_filename()->get_string()),
        s);
    // line number in t1
    emit_load_imm(T11, cur_node->get_line_number(), s);
    emit_jal("_dispatch_abort", s);
    emit_label_def(ok, s);
    // load static disptable
    s << LA << T11 << " ";
    emit_disptable_ref(type_name, s);
    s << endl;
    // lookup method offset in disptable
    int offset =
        class_table->probe(this->type_name)->get_meth_offset(this->name);
    emit_load(T11, offset, T11, s);
    // call it
    emit_jalr(T11, s);
}
int static_dispatch_class::cnt_max_tmps()
{
    int cnt = expr->cnt_max_tmps();
    for (int i = actual->first(); actual->more(i); i = actual->next(i))
        cnt = max(cnt, actual->nth(i)->cnt_max_tmps());
    return cnt;
}
llvm::Value *dispatch_class::llvm_code(Builder &builder, Module &module)
{

    Symbol tp = expr->get_type();
    tp = tp == SELF_TYPE ? cur_node->get_name() : tp;
    cout << "tp: " << tp->get_string() << endl;
    auto node = class_table->probe(tp);

    int offset = node->get_meth_offset(this->name);

    std::vector<llvm::Value *> args;
    llvm::Function *fn = builder->GetInsertBlock()->getParent();

    llvm::Value *first_arg = expr->llvm_code(builder, module);
    llvm::Value *dispatch_table_ptr = builder->CreateStructGEP(first_arg->getType()->getPointerElementType(), first_arg, DISPTABLE_OFFSET);

    llvm::Value *dispatch_table = builder->CreateLoad(dispatch_table_ptr->getType()->getPointerElementType(), dispatch_table_ptr);

    auto callee_ptr = builder->CreateStructGEP(dispatch_table->getType()->getPointerElementType(), dispatch_table, offset);

    llvm::Value *callee = builder->CreateLoad(callee_ptr->getType()->getPointerElementType(), callee_ptr, this->name->get_string());

    llvm::FunctionType *calleeType = llvm::dyn_cast<llvm::FunctionType>(callee->getType()->getPointerElementType());

    auto castedCallee = (llvm::Function *)builder->CreateBitCast(callee, llvm::PointerType::getUnqual(calleeType), this->name->get_string());

    if (calleeType->getFunctionParamType(0) != first_arg->getType())
    {
        first_arg = builder->CreateBitCast(first_arg, calleeType->getFunctionParamType(0));
    }
    // TODO: handle case for chaining methods. ...concat(...).length()

    args.push_back(first_arg);
    for (int i = actual->first(); actual->more(i); i = actual->next(i))
    {
        auto value = actual->nth(i)->llvm_code(builder, module);
        if (value->getType()->isPointerTy())
        {
            args.push_back(builder->CreateLoad(value->getType()->getPointerElementType(), value));
        }
        else
        {
            args.push_back(value);
        }
    }

    auto function_call = builder->CreateCall(calleeType, castedCallee, args);

    return function_call;
}
void dispatch_class::code(ostream &s)
{
    // kodiram argumente
    for (int i = actual->first(); actual->more(i); i = actual->next(i))
    {
        actual->nth(i)->code(s);
        emit_push(ACC, s);
    }

    // kodiram objekt za koji je funkcija pozvana
    expr->code(s);

    // provjeri je li funkcija void?
    int ok = new_label();
    // ako je onda prekini poziv
    emit_bne(ACC, ZERO, ok, s);
    // kodiram ime datoteke
    emit_load_string(
        ACC, stringtable.lookup_string(cur_node->get_filename()->get_string()),
        s);
    // kodiram broj linije
    emit_load_imm(T11, cur_node->get_line_number(), s);
    // pozivam runtime funkciju za prekid poziva
    emit_jal("_dispatch_abort", s);

    // nije void - nastavljam izvršenje
    emit_label_def(ok, s);
    // učitavam tablicu poziva
    emit_load(T11, DISPTABLE_OFFSET, ACC, s);
    // koja je klasa objekt?
    Symbol tp = expr->get_type();
    tp = tp == SELF_TYPE ? cur_node->get_name() : tp;
    // tražim funkciju unutar tablice poziva
    CgenNode *node = class_table->probe(tp);

    int offset = node->get_meth_offset(this->name);

    emit_load(T11, offset, T11, s);
    // poziv same funkcije
    emit_jalr(T11, s);
}

int dispatch_class::cnt_max_tmps()
{
    int cnt = expr->cnt_max_tmps();
    for (int i = actual->first(); actual->more(i); i = actual->next(i))
        cnt = max(cnt, actual->nth(i)->cnt_max_tmps());
    return cnt;
}
llvm::Value *cond_class::llvm_code(Builder &builder, Module &module)
{
    cout << "IF start\n";
    llvm::Function *fn = builder->GetInsertBlock()->getParent();
    llvm::BasicBlock *thenBlock = llvm::BasicBlock::Create(builder->getContext(), "thenBlock", fn);
    llvm::BasicBlock *elseBlock = llvm::BasicBlock::Create(builder->getContext(), "elseBlock");
    llvm::BasicBlock *mergeBlock = llvm::BasicBlock::Create(builder->getContext(), "endBlock");

    llvm::Value *pred_val = pred->llvm_code(builder, module);
    pred_val->dump();

    // maybe or maybe not neccessary.
    //  CondV = Builder->CreateFCmpONE(
    //    CondV, ConstantFP::get(*TheContext, APFloat(0.0)), "ifcond");
    if (pred_val->getType() != builder->getInt1Ty())
    {
        llvm::Value *ptr_to_bool = builder->CreateStructGEP(pred_val->getType()->getPointerElementType(), pred_val, 0 + DEFAULT_OBJFIELDS);
        pred_val = builder->CreateLoad(ptr_to_bool->getType()->getPointerElementType(), ptr_to_bool);
    }
    builder->CreateCondBr(pred_val, thenBlock, elseBlock);

    fn->getBasicBlockList().push_back(thenBlock);
    builder->SetInsertPoint(thenBlock);
    llvm::Value *thenValue = then_exp->llvm_code(builder, module);
    builder->CreateBr(mergeBlock);

    // Generate code for the false block
    fn->getBasicBlockList().push_back(elseBlock);
    builder->SetInsertPoint(elseBlock);
    llvm::Value *elseValue = else_exp->llvm_code(builder, module);
    builder->CreateBr(mergeBlock);

    // Merge block
    fn->getBasicBlockList().push_back(mergeBlock);
    builder->SetInsertPoint(mergeBlock);
    llvm::PHINode *phi = builder->CreatePHI(thenValue->getType(), 2, "iftmp");

    phi->addIncoming(thenValue, thenBlock);
    phi->addIncoming(elseValue, elseBlock);

    cout << "IF done\n";

    // builder->CreateRet(phi);
    return phi;
}
void cond_class::code(ostream &s)
{
    // radim nove labele za els i end
    int else_lbl = new_label();
    int end = new_label();

    // najprije kodiram predikat
    pred->code(s);
    // ovisno o vrijednosti skačem
    emit_fetch_bool(T11, ACC, s);
    emit_beqz(T11, else_lbl, s);
    // onda kodiram then
    then_exp->code(s);
    emit_branch(end, s);
    emit_label_def(else_lbl, s);
    // pa kodiram else
    else_exp->code(s);
    emit_label_def(end, s);
}
int cond_class::cnt_max_tmps()
{
    return max(pred->cnt_max_tmps(),
               max(then_exp->cnt_max_tmps(), else_exp->cnt_max_tmps()));
}
llvm::Value *loop_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Function *fn = builder->GetInsertBlock()->getParent();
    llvm::BasicBlock *condBlock = llvm::BasicBlock::Create(builder->getContext(), "condBlock", fn);
    llvm::BasicBlock *startBlock = llvm::BasicBlock::Create(builder->getContext(), "startBlock");
    llvm::BasicBlock *endBlock = llvm::BasicBlock::Create(builder->getContext(), "endBlock");

    builder->CreateBr(condBlock);

    fn->getBasicBlockList().push_back(condBlock);
    builder->SetInsertPoint(condBlock);
    llvm::Value *pred_val = pred->llvm_code(builder, module);
    if (pred_val->getType() != builder->getInt1Ty())
    {
        llvm::Value *ptr_to_bool = builder->CreateStructGEP(pred_val->getType()->getPointerElementType(), pred_val, 0 + DEFAULT_OBJFIELDS);
        pred_val = builder->CreateLoad(ptr_to_bool->getType()->getPointerElementType(), ptr_to_bool);
    }

    builder->CreateCondBr(pred_val, startBlock, endBlock);

    fn->getBasicBlockList().push_back(startBlock);
    builder->SetInsertPoint(startBlock);
    llvm::Value *startValue = body->llvm_code(builder, module);
    builder->CreateBr(condBlock);

    fn->getBasicBlockList().push_back(endBlock);
    builder->SetInsertPoint(endBlock);
    // TODO: what to return after while loop? void(nullptr)?
    // return nullptr;
}
void loop_class::code(ostream &s)
{
    // napravi labele za početak i kraj
    int start = new_label();
    int end = new_label();
    emit_label_def(start, s);
    // kodiraj predikat
    pred->code(s);
    // provjeri mu vrijednost i granaj
    emit_fetch_bool(T11, ACC, s);
    emit_beq(T11, ZERO, end, s);
    // kodiraj tijelo
    body->code(s);
    emit_branch(start, s);
    emit_label_def(end, s);
    emit_move(ACC, ZERO, s); // void
}
int loop_class::cnt_max_tmps()
{
    return max(pred->cnt_max_tmps(), body->cnt_max_tmps());
}
llvm::Value *typcase_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *expr0 = expr->llvm_code(builder, module);

    if (expr0 == NULL)
    {
        // TODO  : handle void case
    }
}
void typcase_class::code(ostream &s)
{
    int end = new_label();
    int cur = new_label(), nxt;
    // kodiraj izraz
    expr->code(s);
    // je li void?
    emit_bne(ACC, ZERO, cur, s);
    // filename in a0
    emit_load_string(
        ACC, stringtable.lookup_string(cur_node->get_filename()->get_string()),
        s);
    // line number in t1
    emit_load_imm(T11, cur_node->get_line_number(), s);
    // ako je void abort
    emit_jal("_case_abort2", s);

    // sortiraj grane prema tagovima
    std::vector<int> nths;
    for (int i = cases->first(); cases->more(i); i = cases->next(i))
        nths.push_back(i);

    for (unsigned int i = 0; i < nths.size() - 1; ++i)
    {
        for (unsigned int j = i + 1; j < nths.size(); ++j)
        {
            branch_class *cas1 = dynamic_cast<branch_class *>(cases->nth(i));
            branch_class *cas2 = dynamic_cast<branch_class *>(cases->nth(j));
            int tag1 = class_table->probe(cas1->get_type())->tag;
            int tag2 = class_table->probe(cas2->get_type())->tag;
            if (tag1 > tag2)
            {
                int tmp;
                tmp = nths[i];
                nths[i] = nths[j];
                nths[j] = tmp;
            }
        }
    }

    // kodiraj svaku pojedinu granu
    for (unsigned int i = 0; i < nths.size(); ++i)
    {
        tmp_table.enterscope();
        branch_class *cas = dynamic_cast<branch_class *>(cases->nth(i));
        nxt = new_label();
        emit_label_def(cur, s);
        // koji je tag?
        emit_load(T21, 0, ACC, s);
        // min and max tag??
        CgenNode *nd = class_table->probe(cas->get_type());
        int min_tag = nd->tag;
        // tag najdesnijeg
        while (nd->get_children())
            for (List<CgenNode> *c = nd->get_children(); c; c = c->tl())
                nd = c->hd();
        int max_tag = nd->tag;
        emit_blti(T21, min_tag, nxt, s);
        emit_bgti(T21, max_tag, nxt, s);
        // tag se podudara, dodaj u tmp tablicu
        int *pint = new int;
        *pint = tmp_cnt++;
        tmp_table.addid(cas->get_name(), pint);
        std::pair<char *, int> pr = lookup_var(cas->get_name());
        emit_store(ACC, pr.second, pr.first, s);
        // kodiraj case
        cas->get_expr()->code(s);
        // skoči na kraj
        emit_branch(end, s);
        cur = nxt;
        tmp_table.exitscope();
        --tmp_cnt;
    }
    // default case
    emit_label_def(nxt, s);
    emit_jal("_case_abort", s);
    emit_label_def(end, s);
}
int typcase_class::cnt_max_tmps()
{
    int cnt = expr->cnt_max_tmps();
    for (int i = cases->first(); cases->more(i); i = cases->next(i))
        cnt = max(cnt, cases->nth(i)->get_expr()->cnt_max_tmps() + 1);
    return cnt;
}
llvm::Value *block_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *res = nullptr;
    for (int i = body->first(); body->more(i); i = body->next(i))
    {

        res = body->nth(i)->llvm_code(builder, module);

        // llvm::AllocaInst *ptr = builder->CreateAlloca(res->getType(), res, "expr");
    }

    return res;
}
void block_class::code(ostream &s)
{
    // izvršavam jednu po jednu naredbu
    for (int i = body->first(); body->more(i); i = body->next(i))
        body->nth(i)->code(s);
}
int block_class::cnt_max_tmps()
{
    int cnt = 0;
    for (int i = body->first(); body->more(i); i = body->next(i))
        cnt = max(cnt, body->nth(i)->cnt_max_tmps());
    return cnt;
}
llvm::Value *let_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *init_expr;
    if (init->is_no_expr())
    {
        // TODO: let init values
        //  // default value
        //  if (type_decl == Int)
        //      emit_load_int(ACC, inttable.lookup_string("0"), s);
        //  else if (type_decl == Bool)
        //      emit_load_bool(ACC, falsebool, s);
        //  else if (type_decl == Str)
        //      emit_load_string(ACC, stringtable.lookup_string(""), s);
        //  else
        //      emit_move(ACC, ZERO, s); // void
    }
    else
        init_expr = init->llvm_code(builder, module);

    llvm_tmp_table.enterscope();
    auto bar = new llvm::Value *(init_expr);
    llvm_tmp_table.addid(identifier, bar);

    llvm::Value *result_of_body = body->llvm_code(builder, module);

    llvm_tmp_table.exitscope();
    return result_of_body;
}
void let_class::code(ostream &s)
{
    // ako nema inicijalizacije varijablu postavljam na default vrijednost
    if (init->is_no_expr())
    {
        // default value
        if (type_decl == Int)
            emit_load_int(ACC, inttable.lookup_string("0"), s);
        else if (type_decl == Bool)
            emit_load_bool(ACC, falsebool, s);
        else if (type_decl == Str)
            emit_load_string(ACC, stringtable.lookup_string(""), s);
        else
            emit_move(ACC, ZERO, s); // void
    }
    else
        init->code(s);

    // ulazim u doseg
    tmp_table.enterscope();
    // dodajem novu varijablu
    int *pint = new int;
    *pint = tmp_cnt++;

    tmp_table.addid(identifier, pint);
    std::pair<char *, int> pr = lookup_var(identifier);
    // pohranjujem vrijednost
    emit_store(ACC, pr.second, pr.first, s);

    // izvršavam tijelo leta
    body->code(s);

    // izlasim iz dosega i ispravljam vrijendost brojača varijabli
    tmp_table.exitscope();
    --tmp_cnt;
}
int let_class::cnt_max_tmps()
{
    return max(init->cnt_max_tmps(), 1 + body->cnt_max_tmps());
}
llvm::Value *plus_class::llvm_code(Builder &builder, Module &module)
{
    cout << "Plus begin\n";
    llvm::Value *L = e1->llvm_code(builder, module);

    llvm::Value *L_val = nullptr;

    // If we get literal insted of object.
    if (L->getType() == builder->getInt32Ty())
    {
        L_val = (llvm::LoadInst *)L;
    }
    // For args
    else if (L->getType()->isStructTy())
    {
        L_val = builder->CreateExtractValue(L, 0 + DEFAULT_OBJFIELDS);
    }
    // For attr
    else
    {
        auto L_pointer = builder->CreateStructGEP(L->getType()->getPointerElementType(), L, 0 + DEFAULT_OBJFIELDS);

        L_val = builder->CreateLoad(builder->getInt32Ty(), L_pointer);
    }

    llvm::Value *R = e2->llvm_code(builder, module);
    llvm::Value *R_val = nullptr;
    if (R->getType() == builder->getInt32Ty())
    {
        R_val = (llvm::LoadInst *)R;
    }
    else if (R->getType()->isStructTy())
    {
        R_val = builder->CreateExtractValue(R, 0 + DEFAULT_OBJFIELDS);
    }
    else
    {
        auto R_pointer = builder->CreateStructGEP(R->getType()->getPointerElementType(), R, 0 + DEFAULT_OBJFIELDS);

        R_val = builder->CreateLoad(builder->getInt32Ty(), R_pointer);
    }

    llvm::Value *addtmp = builder->CreateAdd(L_val, R_val, "addtmp");
    llvm::Value *intClassInstance = get_primitive(Int, builder, module, addtmp);
    cout << "Plus done\n";
    return intClassInstance;
}
void plus_class::code(ostream &s)
{
    // izračunaj livi operator
    e1->code(s);
    // pohrani u akumulator
    emit_push(ACC, s);
    // izračunaj desni operator
    e2->code(s);
    // iskopiraj ga ka novi objekt ????
    emit_method_call(Object, ::copy, s);
    emit_pop(T11, s);
    emit_fetch_int(T11, T11, s);
    emit_fetch_int(T21, ACC, s);
    emit_add(T11, T11, T21, s);
    emit_store_int(T11, ACC, s);
}
int plus_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *sub_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *L = e1->llvm_code(builder, module);

    llvm::Value *R = e2->llvm_code(builder, module);

    return builder->CreateSub(L, R, "subtmp");
}

void sub_class::code(ostream &s)
{
    e1->code(s);
    emit_push(ACC, s);
    e2->code(s);
    emit_method_call(Object, ::copy, s);
    emit_pop(T11, s);
    emit_fetch_int(T11, T11, s);
    emit_fetch_int(T21, ACC, s);
    emit_sub(T11, T11, T21, s);
    emit_store_int(T11, ACC, s);
}
int sub_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *mul_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *L = e1->llvm_code(builder, module);

    llvm::Value *R = e2->llvm_code(builder, module);

    return builder->CreateMul(L, R, "multmp");
}
void mul_class::code(ostream &s)
{
    e1->code(s);
    emit_push(ACC, s);
    e2->code(s);
    emit_method_call(Object, ::copy, s);
    emit_pop(T11, s);
    emit_fetch_int(T11, T11, s);
    emit_fetch_int(T21, ACC, s);
    emit_mul(T11, T11, T21, s);
    emit_store_int(T11, ACC, s);
}
int mul_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *divide_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *L = e1->llvm_code(builder, module);

    llvm::Value *R = e2->llvm_code(builder, module);

    return builder->CreateUDiv(L, R, "divtmp");
}
void divide_class::code(ostream &s)
{
    e1->code(s);
    emit_push(ACC, s);
    e2->code(s);
    emit_method_call(Object, ::copy, s);
    emit_pop(T11, s);
    emit_fetch_int(T11, T11, s);
    emit_fetch_int(T21, ACC, s);
    emit_div(T11, T11, T21, s);
    emit_store_int(T11, ACC, s);
}
int divide_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *neg_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *L = e1->llvm_code(builder, module);

    return builder->CreateNeg(L, "negtmp");
}
void neg_class::code(ostream &s)
{
    e1->code(s);
    emit_method_call(Object, ::copy, s);
    emit_fetch_int(T11, ACC, s);
    emit_neg(T11, T11, s);
    emit_store_int(T11, ACC, s);
}
int neg_class::cnt_max_tmps() { return e1->cnt_max_tmps(); }
llvm::Value *lt_class::llvm_code(Builder &builder, Module &module)
{
    cout << "LT start\n";
    llvm::Value *L = e1->llvm_code(builder, module);
    llvm::Value *L_val;
    if (L->getType() == builder->getInt32Ty())
    {
        L_val = (llvm::LoadInst *)L;
    }
    // For args
    else if (L->getType()->isStructTy())
    {
        L_val = builder->CreateExtractValue(L, 0 + DEFAULT_OBJFIELDS);
    }
    // For attr
    else
    {
        auto L_pointer = builder->CreateStructGEP(L->getType()->getPointerElementType(), L, 0 + DEFAULT_OBJFIELDS);

        L_val = builder->CreateLoad(builder->getInt32Ty(), L_pointer);
    }

    llvm::Value *R = e2->llvm_code(builder, module);

    llvm::Value *R_val;
    if (R->getType() == builder->getInt32Ty())
    {
        R_val = (llvm::LoadInst *)R;
    }
    // For args
    else if (R->getType()->isStructTy())
    {
        R_val = builder->CreateExtractValue(R, 0 + DEFAULT_OBJFIELDS);
    }
    // For attr
    else
    {
        auto R_pointer = builder->CreateStructGEP(R->getType()->getPointerElementType(), R, 0 + DEFAULT_OBJFIELDS);

        R_val = builder->CreateLoad(builder->getInt32Ty(), R_pointer);
    }
    llvm::Value *boolClassInstance = get_primitive(Bool, builder, module, builder->CreateICmpULT(L_val, R_val, "lttmp"));

    cout << "LT done\n";
    // Integer Compare UnSigned Less Than
    return boolClassInstance;
}
void lt_class::code(ostream &s)
{
    // kodiram livi operand
    e1->code(s);
    emit_push(ACC, s);
    // kodiram desni operand
    e2->code(s);
    emit_pop(T11, s);
    emit_fetch_int(T11, T11, s);
    emit_fetch_int(T21, ACC, s);
    // vraćam true ili false
    int lbl = new_label();
    emit_load_bool(ACC, truebool, s);
    emit_blt(T11, T21, lbl, s);
    emit_load_bool(ACC, falsebool, s);
    emit_label_def(lbl, s);
}
int lt_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *eq_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *L = e1->llvm_code(builder, module);

    llvm::Value *R = e2->llvm_code(builder, module);

    return builder->CreateICmpEQ(L, R, "eqtmp");
}
void eq_class::code(ostream &s)
{
    // kodiraj livi izraz
    e1->code(s);
    // baci ga u akumulator
    emit_push(ACC, s);
    // kodiraj desni izraz
    e2->code(s);
    // baci ga na stog
    emit_pop(T11, s);
    emit_move(T21, ACC, s);

    // ovisno o rezultatu vrati vrijednost
    int ok = new_label();
    emit_load_bool(A11, falsebool, s);
    emit_load_bool(ACC, truebool, s);
    emit_beq(T11, T21, ok, s);
    emit_jal("equality_test", s);
    emit_label_def(ok, s);
}
int eq_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *leq_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *L = e1->llvm_code(builder, module);

    llvm::Value *R = e2->llvm_code(builder, module);
    // Integer Compare UnSigned Less Than or Equal
    return builder->CreateICmpULE(L, R, "leqtmp");
}
void leq_class::code(ostream &s)
{
    e1->code(s);
    emit_push(ACC, s);
    e2->code(s);
    emit_pop(T11, s);
    emit_fetch_int(T11, T11, s);
    emit_fetch_int(T21, ACC, s);
    int lbl = new_label();
    emit_load_bool(ACC, truebool, s);
    emit_bleq(T11, T21, lbl, s);
    emit_load_bool(ACC, falsebool, s);
    emit_label_def(lbl, s);
}
int leq_class::cnt_max_tmps()
{
    return max(e1->cnt_max_tmps(), 1 + e2->cnt_max_tmps());
}
llvm::Value *comp_class::llvm_code(Builder &builder, Module &module)
{
    cout << "Inside Comp Class" << endl;
}
void comp_class::code(ostream &s)
{
    e1->code(s);
    emit_fetch_bool(T11, ACC, s);
    emit_load_bool(ACC, truebool, s);
    int lbl = new_label();
    emit_beqz(T11, lbl, s);
    emit_load_bool(ACC, falsebool, s);
    emit_label_def(lbl, s);
}
int comp_class::cnt_max_tmps() { return e1->cnt_max_tmps(); }

llvm::Value *int_const_class::llvm_code(Builder &builder, Module &module)
{
    int real_int = atoi(inttable.lookup_string(token->get_string())->get_string());

    return get_primitive(Int, builder, module, llvm::ConstantInt::get(builder->getContext(), llvm::APInt(32, real_int)));
}

void int_const_class::code(ostream &s)
{
    //
    // Need to be sure we have an IntEntry *, not an arbitrary is
    //
    emit_load_int(ACC, inttable.lookup_string(token->get_string()), s);
}
int int_const_class::cnt_max_tmps() { return 0; }
llvm::Value *string_const_class::llvm_code(Builder &builder, Module &module)
{
    StringEntry *string_literal = stringtable.lookup_string(token->get_string());

    llvm::Value *strClassInstance = get_primitive(Str, builder, module, builder->CreateGlobalStringPtr(string_literal->get_string()));

    llvm::Value *length_field = builder->CreateStructGEP(strClassInstance->getType()->getPointerElementType(), strClassInstance, 0 + DEFAULT_OBJFIELDS);

    auto loaded_field = builder->CreateLoad(length_field->getType()->getPointerElementType(), length_field);
    builder->CreateStore(builder->getInt32(string_literal->get_len()), builder->CreateStructGEP(loaded_field->getType()->getPointerElementType(), loaded_field, 0 + DEFAULT_OBJFIELDS));

    return strClassInstance;
}
void string_const_class::code(ostream &s)
{
    emit_load_string(ACC, stringtable.lookup_string(token->get_string()), s);
}
int string_const_class::cnt_max_tmps() { return 0; }
llvm::Value *bool_const_class::llvm_code(Builder &builder, Module &module)
{
    return get_primitive(Bool, builder, module, builder->getInt1(val));
}
void bool_const_class::code(ostream &s)
{
    emit_load_bool(ACC, BoolConst(val), s);
}
int bool_const_class::cnt_max_tmps() { return 0; }
llvm::Value *new__class::llvm_code(Builder &builder, Module &module)
{
    llvm::Function *classInit = module->getFunction((std::string)type_name->get_string() + CLASSINIT_SUFFIX);
    llvm::Function *malloc = module->getFunction("malloc");
    // TODO: class size
    llvm::Value *mallocCall = builder->CreateCall(malloc, builder->getInt32(256));
    llvm::Value *classInstance = builder->CreateBitCast(mallocCall, classInit->getArg(0)->getType());

    builder->CreateCall(classInit, classInstance);
    return classInstance;
}
void new__class::code(ostream &s)
{
    if (type_name == SELF_TYPE)
    {
        // ako je selftype
        emit_load_address(T11, CLASSOBJTAB, s);
        emit_load(T21, 0, SELF, s);
        emit_sll(T21, T21, 3, s);    // tag at offset 8
        emit_addu(T11, T11, T21, s); // the addr of probtobj
        emit_move(T3, T11, s);
        emit_load(ACC, 0, T11, s);
        emit_method_call(Object, ::copy, s);
        emit_load(T11, 1, T3, s); // addr of init
        emit_jalr(T11, s);
    }
    else if (type_name == Bool)
        // ako je bool
        emit_load_bool(ACC, falsebool, s);
    else
    {
        // inače...
        // la $a0 X_protObj
        s << LA << ACC << " ";
        emit_protobj_ref(type_name, s);
        s << endl;
        // jal Object.copy
        emit_method_call(Object, ::copy, s);
        // jal X_init
        s << JAL;
        emit_init_ref(type_name, s);
        s << endl;
    }
}
int new__class::cnt_max_tmps() { return 1; }
llvm::Value *isvoid_class::llvm_code(Builder &builder, Module &module)
{
    llvm::Value *expr = e1->llvm_code(builder, module);

    llvm::Value *is_null = builder->CreateIsNull(expr);

    return get_primitive(Bool, builder, module, is_null);
}
void isvoid_class::code(ostream &s)
{
    // najprije kodiram i pohranjujem izraz
    e1->code(s);
    emit_move(T11, ACC, s);

    // onda ovisno o rezultatu učitavam ispravnu vrijednost
    emit_load_bool(ACC, truebool, s);
    int lbl = new_label();
    emit_beqz(T11, lbl, s);
    emit_load_bool(ACC, falsebool, s);
    emit_label_def(lbl, s);
}
int isvoid_class::cnt_max_tmps() { return e1->cnt_max_tmps(); }
llvm::Value *no_expr_class::llvm_code(Builder &builder, Module &module)
{
    return nullptr;
}
void no_expr_class::code(ostream &s)
{
    // prazno
}
int no_expr_class::cnt_max_tmps() { return 0; }
llvm::Value *object_class::llvm_code(Builder &builder, Module &module)
{

    auto offset = llvm_lookup_var(name);

    llvm::Function *fn = builder->GetInsertBlock()->getParent();
    if (name == self)
    {
        return std::get<1>(offset);
    }
    if (std::get<0>(offset))
    {
        llvm::Value *object = builder->CreateStructGEP(fn->getArg(0)->getType()->getPointerElementType(), fn->getArg(0), std::get<2>(offset), "selfPtr");
        return builder->CreateLoad(object->getType()->getPointerElementType(), object);
    }
    return std::get<1>(offset);
}
void object_class::code(ostream &s)
{
    // je li self?
    if (name == self)
        emit_move(ACC, SELF, s);
    else
    {
        std::pair<char *, int> pr = lookup_var(name);
        emit_load(ACC, pr.second, pr.first, s);
    }
}
int object_class::cnt_max_tmps() { return 0; }
