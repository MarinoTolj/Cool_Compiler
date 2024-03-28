#ifndef SEMANT_H_
#define SEMANT_H_

#include <assert.h>
#include <iostream>  
#include "cool-tree.h"
#include "stringtab.h"
#include "symtab.h"
#include "list.h"

#define TRUE 1
#define FALSE 0

class ClassTable;
typedef ClassTable *ClassTableP;

// This is a structure that may be used to contain the semantic
// information such as the inheritance graph.  You may use it or not as
// you like: it is only here to provide a container for the supplied
// methods.

class ClassTable {
private:
  int semant_errors;
  void install_basic_classes();
  ostream& error_stream;

public:
  ClassTable(Classes);
  int errors() { return semant_errors; }
  ostream& semant_error();
  ostream& semant_error(Class_ c);
  ostream& semant_error(Symbol filename, tree_node *t);
  void add_feats(class__class* curr_class);
  void check_feats(class__class* curr_class);
  void check_method(method_class* method, class__class* curr_class);
  bool check_type(method_class* method, Expression expr, class__class* curr_class);
  bool check_type(attr_class* attr, Expression expr, class__class* curr_class);
  bool check_identifier(SymbolTable<Symbol, Identifier>* symtable, object_class* object_expr,class__class*curr_class);
  method_class* find_method(Symbol method_name, class__class*curr_class);
  Symbol lub(class__class* c1, class__class* c2);
  bool check_actual(Expressions actual, method_class* dispatch_method,method_class* method, class__class* curr_class);
  bool check_actual(Expressions actual, method_class* dispatch_method,attr_class* attr, class__class* curr_class);
  bool is_subtype(Symbol subtype, Symbol supertype);
  
};


#endif

