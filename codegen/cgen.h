#include <assert.h>
#include <stdio.h>
#include <vector>
#include <algorithm>
#include "emit.h"
#include "cool-tree.h"
#include "symtab.h"

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Type.h"
#include <llvm/IR/Verifier.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Value.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Transforms/Scalar.h>
#include <llvm/Transforms/Scalar/GVN.h>
#include "llvm/ADT/StringRef.h"

enum Basicness
{
   Basic,
   NotBasic
};
#define TRUE 1
#define FALSE 0

class CgenClassTable;
typedef CgenClassTable *CgenClassTableP;

class CgenNode;
typedef CgenNode *CgenNodeP;

typedef std::vector<std::pair<Symbol, Symbol>> vecNameName;
typedef std::vector<std::pair<Symbol, Symbol>>::iterator vecNameNameIter;

typedef std::vector<Feature_class *> vecFeature;
typedef std::vector<Feature_class *>::iterator vecFeatureIter;

typedef std::unique_ptr<llvm::LLVMContext> Context;
typedef std::unique_ptr<llvm::IRBuilder<>> Builder;
typedef std::unique_ptr<llvm::Module> Module;

int tag_cnt = 0;
int label_cnt = 0;
int tmp_cnt = 0;
CgenNodeP cur_node;
CgenClassTableP class_table;
SymbolTable<Symbol, int> tmp_table;

class CgenClassTable : public SymbolTable<Symbol, CgenNode>
{
private:
   List<CgenNode> *nds;
   ostream &str;
   int stringclasstag;
   int intclasstag;
   int boolclasstag;
   Context ctx;
   Module module;
   Builder builder;

   void module_init()
   {
      ctx = std::make_unique<llvm::LLVMContext>();
      module = std::make_unique<llvm::Module>("CoolLLVM", *ctx);
      builder = std::make_unique<llvm::IRBuilder<>>(*ctx);
   }
   void save_module_to_file(const std::string &filename)
   {
      std::error_code error_code;
      llvm::raw_fd_ostream outLL(filename, error_code);

      module->print(outLL, nullptr);
   }

   void code_class(CgenNode *cool_class);
   llvm::Type *get_llvm_type(Symbol cool_type);

   // The following methods emit code for
   // constants and global declarations.

   void code_global_data();
   void code_global_text();
   void code_bools(int);
   void code_select_gc();
   void code_constants();
   void code_class_name_table();
   void code_class_name(CgenNodeP node);
   void code_class_objects_table();
   void code_class_objects(CgenNodeP node);
   void code_fill_features(CgenNodeP node);
   void code_dispatch_tables(CgenNodeP node);
   void code_prototype_objects(CgenNodeP node);
   void code_object_initializers(CgenNodeP node);
   void llvm_code_object_initializers(CgenNodeP node);
   void code_class_methods(CgenNodeP node);

   // The following creates an inheritance graph from
   // a list of classes.  The graph is implemented as
   // a tree of `CgenNode', and class names are placed
   // in the base class symbol table.

   void install_basic_classes();
   void install_class(CgenNodeP nd);
   void install_classes(Classes cs);
   void build_inheritance_tree();
   void set_relations(CgenNodeP nd);

public:
   CgenClassTable(Classes, ostream &str);
   void code();
   CgenNodeP root();
};

class CgenNode : public class__class
{
private:
   CgenNodeP parentnd;       // Parent of class
   List<CgenNode> *children; // Children of class
   Basicness basic_status;   // `Basic' if class is basic
                             // `NotBasic' otherwise
   llvm::StructType *struct_type;

public:
   int tag;
   vecNameName methods;
   vecFeature attributes;

   CgenNode(Class_ c,
            Basicness bstatus,
            CgenClassTableP class_table);

   void add_child(CgenNodeP child);
   List<CgenNode> *get_children() { return children; }
   void set_parentnd(CgenNodeP p);
   CgenNodeP get_parentnd() { return parentnd; }
   int basic() { return (basic_status == Basic); }

   int get_meth_offset(Symbol meth_name);
   int get_attr_offset(Symbol attr_name);

   llvm::StructType *get_struct_type() { return struct_type; }
   void set_struct_type(llvm::StructType *type) { struct_type = type; }
};

class BoolConst
{
private:
   int val;

public:
   BoolConst(int);
   void code_def(ostream &, int boolclasstag);
   void code_ref(ostream &) const;
};
