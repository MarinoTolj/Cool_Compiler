

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include "semant.h"
#include "utilities.h"
#include "symtab.h"
#include <typeinfo>
#include <vector>
#include <algorithm>


extern int semant_debug;
extern char *curr_filename;

//////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.
//
//////////////////////////////////////////////////////////////////////
static Symbol 
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
    val
    ;
//
// Initializing the predefined symbols.
//
static void initialize_constants(void)
{
    arg         = idtable.add_string("arg");
    arg2        = idtable.add_string("arg2");
    Bool        = idtable.add_string("Bool");
    concat      = idtable.add_string("concat");
    cool_abort  = idtable.add_string("abort");
    copy        = idtable.add_string("copy");
    Int         = idtable.add_string("Int");
    in_int      = idtable.add_string("in_int");
    in_string   = idtable.add_string("in_string");
    IO          = idtable.add_string("IO");
    length      = idtable.add_string("length");
    Main        = idtable.add_string("Main");
    main_meth   = idtable.add_string("main");
    //   _no_class is a symbol that can't be the name of any 
    //   user-defined class.
    No_class    = idtable.add_string("_no_class");
    No_type     = idtable.add_string("_no_type");
    Object      = idtable.add_string("Object");
    out_int     = idtable.add_string("out_int");
    out_string  = idtable.add_string("out_string");
    prim_slot   = idtable.add_string("_prim_slot");
    self        = idtable.add_string("self");
    SELF_TYPE   = idtable.add_string("SELF_TYPE");
    Str         = idtable.add_string("String");
    str_field   = idtable.add_string("_str_field");
    substr      = idtable.add_string("substr");
    type_name   = idtable.add_string("type_name");
    val         = idtable.add_string("_val");
}

SymbolTable<Symbol,class__class> *class_symtab = new SymbolTable<Symbol, class__class>();
SymbolTable<Symbol,tree_node> *feat_symtab = new SymbolTable<Symbol, tree_node>();
SymbolTable<Symbol,attr_class> *attr_symtab = new SymbolTable<Symbol, attr_class>();


bool is_primitive(Symbol val){
    return val == Int || val == Str || val == Bool;
}

bool is_basic_class(Symbol val) {
    return is_primitive(val) || val==IO || val==SELF_TYPE || val==Object;
}

ClassTable::ClassTable(Classes classes) : semant_errors(0) , error_stream(cerr) {

    /* Fill this in */
    class_symtab->enterscope();
    feat_symtab->enterscope();
    attr_symtab->enterscope();


    class__class* current_class;
    Symbol current_name;
    Symbol current_parent;
    Features features;

    install_basic_classes();
    add_feats(class_symtab->probe(Object));
    add_feats(class_symtab->probe(IO));
    add_feats(class_symtab->probe(Str));
    add_feats(class_symtab->probe(Bool));
    add_feats(class_symtab->probe(Int));

    for(int i=classes->first();classes->more(i);i=classes->next(i)){
        current_class=(class__class*)classes->nth(i);
        current_name=current_class->get_name();
        current_parent=current_class->get_parent();    

        if(is_basic_class(current_name)){
            ostream& os =  semant_error(current_class);
            os << "Redifinition of basic class " << current_name << "." << endl;
            continue;
        }else if(is_primitive(current_parent)){
            ostream& os =  semant_error(current_class);
            os << "Class " << current_name << " can't inherit from base Class "<< current_parent << endl;
            continue;
        }else if(class_symtab->probe(current_name)!=NULL){
            ostream& os =  semant_error(current_class);
            os << "Class " << current_name << " was previously defined." << endl;
            continue;
        }

        class_symtab->addid(current_name, current_class);

        add_feats(current_class);
    }

    
    
    if(class_symtab->lookup(Main)==NULL){
        ostream& os =  semant_error(current_class);
        os << "Class Main isn't defined"<< endl;
        
    }else{
        for(int i=classes->first();classes->more(i);i=classes->next(i)){
            current_class=(class__class*)classes->nth(i);
            current_name=current_class->get_name();
            current_parent=current_class->get_parent();  
            if(current_name==Main && current_class->method_map.find(main_meth)==current_class->method_map.end()){
                ostream& os =  semant_error(current_class);
                os << "Class Main doesn't have main method"<< endl;
                continue;
            }

            if(class_symtab->lookup(current_parent)==NULL){
                ostream& os =  semant_error(current_class);
                os << "Class " << current_name << " inherits from undefined Class"<< current_parent << endl;
                continue;
            }else if(class_symtab->probe(current_name)!=NULL && !is_basic_class(current_name)){
                check_feats(current_class);
            }
        }
    }
}


void ClassTable::add_feats(class__class* curr_class) {
    Features features=curr_class->get_features();
    Feature current_feature;
    attr_class* attr_feature;
    method_class* method_feature;
    char* current_name;
    curr_class->attr_symtab->enterscope();


    for(int i=features->first();features->more(i);i=features->next(i)){
        current_feature=features->nth(i);
        
        if(current_feature->get_type()==0){
            method_feature=(method_class*)current_feature;
            Formals formals=method_feature->get_formals();
            formal_class* curr_formal;
            

            method_feature->identifier_symtab->enterscope();

           
            for(int i=formals->first();formals->more(i);i=formals->next(i)){

                curr_formal=(formal_class*)formals->nth(i);
                Identifier* new_identifier=new Identifier(curr_formal->get_name(), curr_formal->get_type_decl());

                if(method_feature->identifier_symtab->probe(new_identifier->get_name())!=NULL){
                    ostream& os =  semant_error(curr_class);
                    os << "Formal parameter "<<new_identifier->get_name()<<" is multiply defined.." << endl;
                    continue;
                }
                if(new_identifier->get_name()==self){
                    ostream& os =  semant_error(curr_class);
                    os << "'self' cannot be the name of a formal parameter." << endl;
                    continue;
                }
                method_feature->identifier_symtab->addid(curr_formal->get_name(), new_identifier);
            }
            curr_class->method_map.insert({method_feature->get_method_name(), method_feature});


            
        }else if(current_feature->get_type()==1){
            
            attr_feature=(attr_class*)current_feature;

            if(attr_feature->get_name()==self){
                ostream& os =  semant_error(curr_class);
                os << "'self' cannot be the name of an attribute." << endl;
                continue;
            }else if(attr_symtab->probe(attr_feature->get_name())!=NULL){
                ostream& os =  semant_error(curr_class);
                
                os << "attribute already defined"<<attr_feature->get_name() << endl;
                continue;
            }

            curr_class->attr_symtab->addid(attr_feature->get_name(), attr_feature);
        }

    }

}

void ClassTable::check_feats(class__class* curr_class){
    Features features=curr_class->get_features();
    Feature current_feature;
    attr_class* attr_feature;
    method_class* method_feature;
    Symbol method_return_type;
    assign_class* curr_assign;
    curr_class->identifier_symtab->enterscope();
    
    for(int i=features->first();features->more(i);i=features->next(i)){

        current_feature=features->nth(i);
            
        if(current_feature->get_type()==0){
            method_feature=(method_class*)current_feature;
            method_return_type=method_feature->get_return_type();
            Formals formals=method_feature->get_formals();
            formal_class* curr_formal;
            class__class* parent=class_symtab->probe(curr_class->get_parent());

            
            for(int i=formals->first();formals->more(i);i=formals->next(i)){
                curr_formal=(formal_class*)formals->nth(i);

                if(class_symtab->probe(curr_formal->get_type_decl())==NULL){
                    ostream& os =  semant_error(curr_class);
                    os <<"Type definition of formal parametar "<< curr_formal->get_name() <<" is not defined"<< endl;
                    continue;
                }


                if(parent){
                    auto parent_method=parent->method_map.find(method_feature->get_method_name());

                    if(parent_method!=parent->method_map.end()){
                        Formals parent_method_formals=parent_method->second->get_formals();
                        formal_class* parent_method_curr_formal;

                        if(formals->len()!=parent_method_formals->len()){
                            ostream& os =  semant_error(curr_class);
                            os <<"In redefined method "<<method_feature->get_method_name()<<" different number of arguments from original method"<< endl;
                            continue;        
                        }else{
                            parent_method_curr_formal=(formal_class*)parent_method_formals->nth(i);
                            if(curr_formal->get_type_decl()!=parent_method_curr_formal->get_type_decl()){
                                ostream& os =  semant_error(curr_class);
                                os <<"In redefined method "<<method_feature->get_method_name() <<", parameter type "
                                <<curr_formal->get_type_decl()<<" is different from original type "<<parent_method_curr_formal->get_type_decl() << endl;
                                continue;                
                            }        
                        }
                        
                    }

                }
            }
            
            if(class_symtab->lookup(method_return_type)==NULL && method_return_type!=SELF_TYPE){
                ostream& os =  semant_error(curr_class);
                os <<"Undefined return type "<< method_return_type<<" in method "<< method_feature->get_method_name()<<"." << endl;
                continue;
            }else check_method(method_feature, curr_class);
            

        }else if(current_feature->get_type()==1){

            attr_feature=(attr_class*)current_feature;
            
            
            if(class_symtab->lookup(attr_feature->get_type_decl())==NULL){
                ostream& os =  semant_error(curr_class);
                os << attr_feature->get_name() <<" can't be of type "<< attr_feature->get_type_decl() << " because is not defined" << endl;
                continue;
            }
            
            check_type(attr_feature, attr_feature->get_expr(), curr_class);
            
            if(!is_subtype(attr_feature->get_expr()->get_type(), attr_feature->get_type_decl())){

                ostream& os =  semant_error(curr_class);
                os << attr_feature->get_name() <<" is of diffrent type than "<< attr_feature->get_type_decl() << endl;
                continue;

            }
            Symbol parent_name=curr_class->get_parent();
            if(!is_basic_class(parent_name)){

                class__class* parent=class_symtab->probe(parent_name);
                if(parent->attr_symtab->probe(attr_feature->get_name())!=NULL){
                    ostream& os =  semant_error(curr_class);
                    os <<"Attribute "<<attr_feature->get_name()<<" is an attribute of an inherited class."  << endl;
                    continue;
                }
            }
        }
    }
}

bool ClassTable::check_type(attr_class* attr, Expression expr, class__class* curr_class){
    
    switch (expr->get_expr_type()){
         case Block_Type:
            {
                block_class* block_expr=(block_class*)expr;
                Expressions exprs=block_expr->get_body();
                Expression curr_body_expr;
                
                for(int i=exprs->first();exprs->more(i);i=exprs->next(i)){
                    curr_body_expr=exprs->nth(i);
                    
                    check_type(attr, curr_body_expr, curr_class);
                    
                    if(i==exprs->len()-1){
                        block_expr->set_type(curr_body_expr->get_type());
                    }
                }
                
                break;
            }
        
        case Dispatch_Type:
            {

                dispatch_class* dispatch_expr=(dispatch_class*)expr;
                Symbol dispatch_name=dispatch_expr->get_name();
                Expressions actual=dispatch_expr->get_actual();
                method_class* dispatch_method;
                class__class* class_type;
                check_type(attr, dispatch_expr->get_expr(), curr_class);

                if(dispatch_expr->get_expr()->get_expr_type()==New_Type)
                    class_type=class_symtab->probe(dispatch_expr->get_expr()->get_type());

                else if(is_primitive(dispatch_expr->get_expr()->get_type())) 
                    class_type=class_symtab->probe(dispatch_expr->get_expr()->get_type());

                else if(dispatch_expr->get_expr()->get_type()==SELF_TYPE) 
                    class_type=curr_class;
                else {
                    object_class* object_expr=(object_class*)dispatch_expr->get_expr();
                    if(check_type(attr, object_expr, curr_class))
                        class_type=class_symtab->probe(object_expr->get_type());
                    else{
                        ostream& os =  semant_error(curr_class);
                        os <<object_expr->get_name()<<" is not defined"<< endl;   
                        break;
                    }
                
                }
                

                dispatch_method=find_method(dispatch_name, class_type);
                
                if(dispatch_method){
                    if(dispatch_method->get_return_type()==SELF_TYPE && dispatch_expr->get_expr()->get_type()!=SELF_TYPE){
                        dispatch_expr->set_type(class_type->get_name());
                    }else dispatch_expr->set_type(dispatch_method->get_return_type());
                }else{
                    ostream& os =  semant_error(class_type);
                    os <<dispatch_name<<" is not defined in parent class "<<class_type->get_name()<< endl;   
                    break;
                }
               
                check_actual(actual, dispatch_method, attr, curr_class);
                
                break;

            }
        case Static_Type:
            {

                static_dispatch_class* static_expr=(static_dispatch_class*)expr;
                Symbol dispatch_name=static_expr->get_name();
                Expressions actual=static_expr->get_actual();
                method_class* dispatch_method;
                class__class* class_supertype=class_symtab->probe(static_expr->get_type_name());
                class__class* class_subtype=class_symtab->probe(static_expr->get_type_name());

                check_type(attr, static_expr->get_expr(), curr_class);
                
                if(static_expr->get_expr()->get_expr_type()==New_Type)
                    class_subtype=class_symtab->probe(static_expr->get_expr()->get_type());
                else if(is_primitive(static_expr->get_expr()->get_type())) 
                    class_subtype=class_symtab->probe(static_expr->get_expr()->get_type());
                else if(static_expr->get_expr()->get_type()==SELF_TYPE) 
                    class_subtype=curr_class;
                else {
                    object_class* object_expr=(object_class*)static_expr->get_expr();
                    if(check_type(attr, object_expr, curr_class))
                        class_subtype=class_symtab->probe(object_expr->get_type());
                    else{
                        ostream& os =  semant_error(curr_class);
                        os <<object_expr->get_name()<<" is not defined"<< endl;   
                        break;
                    }
                
                }
                dispatch_method=find_method(dispatch_name, class_supertype);
                if(dispatch_method){
                    if(dispatch_method->get_return_type()==SELF_TYPE){
                        static_expr->set_type(class_subtype->get_name());
                    }else static_expr->set_type(dispatch_method->get_return_type());
                }else{
                    ostream& os =  semant_error(curr_class);
                    os <<dispatch_name<<" is not defined in parent class "<<class_supertype->get_name()<< endl;   
                    break;
                }
                

                if(!is_subtype(class_subtype->get_name(), class_supertype->get_name())){
                   ostream& os =  semant_error(curr_class);
                    os <<"Expression type "<<class_subtype->get_name() <<" does not conform to declared static dispatch type "<<
                    class_supertype->get_name()<<"."<< endl;   
                }

                check_actual(actual, dispatch_method, attr, curr_class);

                break;

            }
        
        case Arith_Type:
            {
                plus_class* arith_expr=(plus_class*)expr;
                Expression e1=arith_expr->get_e1();
                Expression e2=arith_expr->get_e2();
                check_type(attr, e1, curr_class);
                if(e1->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Left hand side of arith operator must be Int." << endl;
                }

                check_type(attr, e2, curr_class);    
                if(e2->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Right hand side of arith operator must be Int." << endl;
                }
                arith_expr->set_type(Int);   
                
                break;
            }
         case Object_Type:
             {
             
                 object_class* object_expr=(object_class*)expr;
                 if(object_expr->get_name()==self){
                     object_expr->set_type(SELF_TYPE);
                 }else check_identifier(curr_class->identifier_symtab,  object_expr, curr_class);

                 break;
             }
        
        
        case New_Type:
            {
                new__class* new_expr=(new__class*)expr;

                if(new_expr->get_type_name()==SELF_TYPE){
                    new_expr->set_type(SELF_TYPE);
                }
                else if(class_symtab->lookup(new_expr->get_type_name())==NULL){
                    ostream& os =  semant_error(curr_class);
                    os <<new_expr->get_type_name()<<" is not defined"<< endl;
                }else{
                    new_expr->set_type(new_expr->get_type_name());
                }
                break;
            }

        case Case_Type:
            {
                typcase_class* case_expr=(typcase_class*)expr;
                object_class* object_expr=(object_class*)case_expr->get_expr();
                std::vector<Symbol> branches;
                
                check_type(attr, object_expr, curr_class);

                Cases cases=case_expr->get_cases();
                branch_class* branch;
                
               
                curr_class->identifier_symtab->enterscope();
                Identifier* new_ident;
                Symbol lub_class;
                
                for(int i=cases->first();cases->more(i);i=cases->next(i)){
                    branch=(branch_class*)cases->nth(i);
                    new_ident=new Identifier(branch->get_name(), branch->get_type_decl());
                    curr_class->identifier_symtab->addid(branch->get_name(), new_ident);
                   
                    if(std::find(branches.begin(), branches.end(), branch->get_type_decl())==branches.end()){
                        branches.push_back(branch->get_type_decl());
                    }else{
                        ostream& os =  semant_error(curr_class);
                        os <<"Duplicate branch "<<branch->get_type_decl()<<" in case statement."<<endl;
                        break;
                    }
                    check_type(attr, branch->get_expr(), curr_class);

                    if(!is_subtype(branch->get_expr()->get_type(), branch->get_type_decl())){
                        ostream& os =  semant_error(curr_class);
                        os <<"Type "<<branch->get_expr()->get_type()<<" doesn't conform to "<<branch->get_type_decl()<<" in case branch."<<i<<endl;
                        break;
                    }
                    if(i==0){
                        lub_class=branch->get_expr()->get_type();
                        
                    }else if(i>=1){
                        lub_class=lub(class_symtab->probe(lub_class), class_symtab->probe(branch->get_expr()->get_type()));
                    }
                    
                }

                case_expr->set_type(lub_class);
                curr_class->identifier_symtab->exitscope();
                break;
            }
        case String_Type:
            {
                expr->set_type(Str);
                
                break;
            }
        case Int_Type:
            {
                expr->set_type(Int);
                break;
            }
        case Bool_Type:
            {
                expr->set_type(Bool);

                break;
            }
        case No_Expr:
                {
                    no_expr_class* no_expr=(no_expr_class*)expr;
                    
                    no_expr->set_type(No_type);
                    break;
                }
        default:
            break;
    }

    return true;
    
}

bool ClassTable::check_type(method_class* method, Expression expr, class__class* curr_class){
    
    switch (expr->get_expr_type()){
         case Block_Type:
            {
                block_class* block_expr=(block_class*)expr;
                Expressions exprs=block_expr->get_body();
                Expression curr_body_expr;
                
                for(int i=exprs->first();exprs->more(i);i=exprs->next(i)){
                    curr_body_expr=exprs->nth(i);
                    
                    check_type(method, curr_body_expr, curr_class);
                    
                    if(i==exprs->len()-1){
                        block_expr->set_type(curr_body_expr->get_type());
                    }
                }
                
                break;
            }
        case Let_Type:
            {
                let_class* let_expr=(let_class*)expr;
                if(let_expr->get_identifier()==self){
                    ostream& os =  semant_error(curr_class);
                    os <<"'self' cannot be bound in a 'let' expression." << endl;
                    
                }

                method->identifier_symtab->enterscope();
                Identifier* new_ident=new Identifier(let_expr->get_identifier(), let_expr->get_type_decl());
                method->identifier_symtab->addid(let_expr->get_identifier(), new_ident);

                check_type(method, let_expr->get_init(), curr_class);
                check_type(method, let_expr->get_body(), curr_class);

                if(!is_subtype(let_expr->get_init()->get_type(), let_expr->get_type_decl())){
                    ostream& os =  semant_error(curr_class);
                    os <<"Wrong type in init. Type "<<let_expr->get_init()->get_type()<<" is different from "
                    <<let_expr->get_type_decl()<<"."<< endl;
                    break;
                }

                let_expr->set_type(let_expr->get_body()->get_type());

                method->identifier_symtab->exitscope();
                break;
            }
        case Dispatch_Type:
            {

                dispatch_class* dispatch_expr=(dispatch_class*)expr;
                Symbol dispatch_name=dispatch_expr->get_name();
                Expressions actual=dispatch_expr->get_actual();
                method_class* dispatch_method;
                class__class* class_type;
                check_type(method, dispatch_expr->get_expr(), curr_class);

                if(dispatch_expr->get_expr()->get_expr_type()==New_Type)
                    class_type=class_symtab->probe(dispatch_expr->get_expr()->get_type());

                else if(is_primitive(dispatch_expr->get_expr()->get_type())) 
                    class_type=class_symtab->probe(dispatch_expr->get_expr()->get_type());

                else if(dispatch_expr->get_expr()->get_type()==SELF_TYPE) 
                    class_type=curr_class;
                else {
                    object_class* object_expr=(object_class*)dispatch_expr->get_expr();
                    if(check_type(method, object_expr, curr_class))
                        class_type=class_symtab->probe(object_expr->get_type());
                    else{
                        ostream& os =  semant_error(curr_class);
                        os <<object_expr->get_name()<<" is not defined"<< endl;   
                        break;
                    }
                
                }
                

                dispatch_method=find_method(dispatch_name, class_type);
                
                if(dispatch_method){
                    
                    if(dispatch_method->get_return_type()==SELF_TYPE && dispatch_expr->get_expr()->get_type()!=SELF_TYPE){
                        dispatch_expr->set_type(class_type->get_name());
                    }else dispatch_expr->set_type(dispatch_method->get_return_type());
                }else{
                    ostream& os =  semant_error(class_type);
                    os <<dispatch_name<<" is not defined in parent class "<<class_type->get_name()<< endl;   
                    break;
                }
               
                
                check_actual(actual, dispatch_method, method, curr_class);
                
                
                break;

            }
        case Static_Type:
            {

                static_dispatch_class* static_expr=(static_dispatch_class*)expr;
                Symbol dispatch_name=static_expr->get_name();
                Expressions actual=static_expr->get_actual();
                method_class* dispatch_method;
                class__class* class_supertype=class_symtab->probe(static_expr->get_type_name());
                class__class* class_subtype=class_symtab->probe(static_expr->get_type_name());

                check_type(method, static_expr->get_expr(), curr_class);
                
                if(static_expr->get_expr()->get_expr_type()==New_Type)
                    class_subtype=class_symtab->probe(static_expr->get_expr()->get_type());
                else if(is_primitive(static_expr->get_expr()->get_type())) 
                    class_subtype=class_symtab->probe(static_expr->get_expr()->get_type());
                else if(static_expr->get_expr()->get_type()==SELF_TYPE) 
                    class_subtype=curr_class;
                else {
                    object_class* object_expr=(object_class*)static_expr->get_expr();
                    if(check_type(method, object_expr, curr_class))
                        class_subtype=class_symtab->probe(object_expr->get_type());
                    else{
                        ostream& os =  semant_error(curr_class);
                        os <<object_expr->get_name()<<" is not defined"<< endl;   
                        break;
                    }
                
                }
                dispatch_method=find_method(dispatch_name, class_supertype);
                if(dispatch_method){
                    if(dispatch_method->get_return_type()==SELF_TYPE){
                        static_expr->set_type(class_subtype->get_name());
                    }else static_expr->set_type(dispatch_method->get_return_type());
                }else{
                    ostream& os =  semant_error(curr_class);
                    os <<dispatch_name<<" is not defined in parent class "<<class_supertype->get_name()<< endl;   
                    break;
                }
                check_actual(actual, dispatch_method, method, curr_class);

                if(!is_subtype(class_subtype->get_name(), class_supertype->get_name())){
                   ostream& os =  semant_error(curr_class);
                    os <<"Expression type "<<class_subtype->get_name() <<" does not conform to declared static dispatch type "<<
                    class_supertype->get_name()<<"."<< endl;   
                }
                break;

            }
        case Assign_Type:
            {
                assign_class* curr_assign=(assign_class*)expr;
                object_class* curr_object=(object_class*)curr_assign;

                check_type(method, curr_assign->get_expr(), curr_class);

                if(check_identifier(method->identifier_symtab, curr_object, curr_class)){

                    if(!is_subtype(curr_assign->get_expr()->get_type(), curr_object->get_type())){
                        ostream& os =  semant_error(curr_class);
                        os <<"Expected " <<curr_object->get_type() <<", but got "<<curr_assign->get_expr()->get_type() << endl;
                        return false;
                    }
                }
                curr_assign->set_type(curr_assign->get_expr()->get_type());
                
                
                break;
            }
        case Arith_Type:
            {
                plus_class* arith_expr=(plus_class*)expr;
                Expression e1=arith_expr->get_e1();
                Expression e2=arith_expr->get_e2();
                check_type(method, e1, curr_class);
                if(e1->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Left hand side of arith operator must be Int." << endl;
                }

                check_type(method, e2, curr_class);    
                if(e2->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Right hand side of arith operator must be Int." << endl;
                }
                arith_expr->set_type(Int);   
                
                break;
            }
        case Object_Type:
            {
             
                object_class* object_expr=(object_class*)expr;
                if(object_expr->get_name()==self){
                    object_expr->set_type(SELF_TYPE);
                }else check_identifier(method->identifier_symtab,  object_expr, curr_class);

                break;
            }
        case EQ_Type:
            {
                eq_class* eq_expr=(eq_class*)expr;
                Expression e1=eq_expr->get_e1();
                Expression e2=eq_expr->get_e2();
                check_type(method, e1, curr_class);                      
                check_type(method, e2, curr_class);                    
                
                if((is_primitive(e1->get_type()) || is_primitive(e2->get_type())) && e1->get_type()!=e2->get_type()){
                    ostream& os =  semant_error(curr_class);
                    os <<"Illegal comparison with a basic type." << endl;
                }
                eq_expr->set_type(Bool);
                break;
            }
        case LT_Type:
            {
                lt_class* curr_lt=(lt_class*)expr;
                check_type(method, curr_lt->get_e1(), curr_class);
                check_type(method, curr_lt->get_e2(), curr_class);
                if(curr_lt->get_e1()->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Left hand side of operator is not Int." << endl;
                    
                }
                if(curr_lt->get_e2()->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Right hand side of operator is not Int." << endl;
                    
                }
                curr_lt->set_type(Bool);
                break;
            }
        case LEQ_Type:
            {
                leq_class* curr_leq=(leq_class*)expr;
                check_type(method, curr_leq->get_e1(), curr_class);
                check_type(method, curr_leq->get_e2(), curr_class);
                if(curr_leq->get_e1()->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Left hand side of operator is not Int." << endl;
                    
                }
                if(curr_leq->get_e2()->get_type()!=Int){
                    ostream& os =  semant_error(curr_class);
                    os <<"Right hand side of operator is not Int." << endl;
                    
                }
                curr_leq->set_type(Bool);

                break;
            }
        case Comp_Type:
            {
                comp_class* curr_comp=(comp_class*)expr;
                check_type(method, curr_comp->get_expr(), curr_class);
                if(curr_comp->get_expr()->get_type()!=Bool){
                    ostream& os =  semant_error(curr_class);
                    os <<"The expression must be of type Bool." << endl;
                }
                curr_comp->set_type(Bool);
                break;
            }
        case IsVoid_Type:
            {
                isvoid_class* isvoid_expr=(isvoid_class*)expr;
                check_type(method, isvoid_expr->get_expr(), curr_class);                       
                isvoid_expr->set_type(Bool);
                break;
            }
        
        case New_Type:
            {
                new__class* new_expr=(new__class*)expr;

                if(new_expr->get_type_name()==SELF_TYPE){
                    new_expr->set_type(SELF_TYPE);
                }
                else if(class_symtab->lookup(new_expr->get_type_name())==NULL){
                    ostream& os =  semant_error(curr_class);
                    os <<new_expr->get_type_name()<<" is not defined"<< endl;
                }else{
                    new_expr->set_type(new_expr->get_type_name());
                }
                break;
            }

        case Neg_Type:
            {
                neg_class* neg_expr=(neg_class*)expr;

                check_type(method, neg_expr->get_expr(), curr_class);

                neg_expr->set_type(neg_expr->get_expr()->get_type());
                break;
            }
        case Loop_Type:
            {
                loop_class* loop_expr=(loop_class*)expr;
                
                check_type(method, loop_expr->get_pred(), curr_class);
                check_type(method, loop_expr->get_body(), curr_class);

                if(loop_expr->get_pred()->get_type()!=Bool){
                    ostream& os =  semant_error(curr_class);
                    os <<"Loop condition does not have type Bool."<< endl;
                    break;
                }
                loop_expr->set_type(Object);
                break;
            
            }
        case Cond_Type:
            {
                cond_class* cond_expr=(cond_class*)expr;
                class__class* c1;
                class__class* c2;
                check_type(method, cond_expr->get_pred(), curr_class);
                check_type(method, cond_expr->get_then(), curr_class);
                check_type(method, cond_expr->get_else(), curr_class);

                if(cond_expr->get_pred()->get_type()!=Bool){
                    ostream& os =  semant_error(curr_class);
                    os <<"Loop condition does not have type Bool."<< endl;
                    break;
                }
                c1=class_symtab->probe(cond_expr->get_then()->get_type());
                c2=class_symtab->probe(cond_expr->get_else()->get_type());

                if(cond_expr->get_then()->get_type()==SELF_TYPE){
                    c1=curr_class;
                }
                if(cond_expr->get_else()->get_type()==SELF_TYPE){
                    c2=curr_class;
                }
               
                Symbol lub_class=lub(c1, c2);
                
                cond_expr->set_type(lub_class);
                break;
            }
        case Case_Type:
            {
                typcase_class* case_expr=(typcase_class*)expr;
                object_class* object_expr=(object_class*)case_expr->get_expr();
                std::vector<Symbol> branches;
                
                check_type(method, object_expr, curr_class);

                Cases cases=case_expr->get_cases();
                branch_class* branch;
                
                method->identifier_symtab->enterscope();

                Identifier* new_ident;
                Symbol lub_class;
                
                for(int i=cases->first();cases->more(i);i=cases->next(i)){
                    branch=(branch_class*)cases->nth(i);
                    new_ident=new Identifier(branch->get_name(), branch->get_type_decl());
                    method->identifier_symtab->addid(branch->get_name(), new_ident);
                   
                    if(std::find(branches.begin(), branches.end(), branch->get_type_decl())==branches.end()){
                        branches.push_back(branch->get_type_decl());
                    }else{
                        ostream& os =  semant_error(curr_class);
                        os <<"Duplicate branch "<<branch->get_type_decl()<<" in case statement."<<endl;
                        break;
                    }
                    check_type(method, branch->get_expr(), curr_class);

                    if(!is_subtype(branch->get_expr()->get_type(), branch->get_type_decl())){
                        ostream& os =  semant_error(curr_class);
                        os <<"Type "<<branch->get_expr()->get_type()<<" doesn't conform to "<<branch->get_type_decl()<<" in case branch."<<i<<endl;
                        break;
                    }
                    if(i==0){
                        lub_class=branch->get_type_decl();
                        
                    }else if(i>=1){
                        lub_class=lub(class_symtab->probe(lub_class), class_symtab->probe(branch->get_type_decl()));
                        
                    }
                }

                case_expr->set_type(lub_class);
                method->identifier_symtab->exitscope();
                break;
            }
        case String_Type:
            {
                expr->set_type(Str);
                
                break;
            }
        case Int_Type:
            {
                expr->set_type(Int);
                break;
            }
        case Bool_Type:
            {
                expr->set_type(Bool);

                break;
            }
        case No_Expr:
                {
                    no_expr_class* no_expr=(no_expr_class*)expr;
                    
                    no_expr->set_type(No_type);
                    break;
                }
        default:
            break;
    }
    return true;
}

bool ClassTable::check_actual(Expressions actual, method_class* dispatch_method, attr_class* attr, class__class* curr_class){
    Expression curr_actual;
    formal_class* formal;
    
    if(actual->len()!=dispatch_method->get_formals()->len()){
        ostream& os =  semant_error(curr_class);
        os <<"Wrong number of parameters in "<<dispatch_method->get_method_name()<< endl;
        return false;
    }
    for(int i=actual->first();actual->more(i);i=actual->next(i)){
        curr_actual=actual->nth(i);
        formal = (formal_class*)dispatch_method->get_formals()->nth(i);
        check_type(attr, curr_actual, curr_class);
        
        if(curr_actual->get_type()==SELF_TYPE){
            if(!is_subtype(curr_class->get_name(), formal->get_type_decl())){
                ostream& os =  semant_error(curr_class);
                os <<"In call of method "<<dispatch_method->get_method_name()<<", type SELF_TYPE of parameter "<<formal->get_name()<<
                " does not conform to declared type "<<formal->get_type_decl()<<"."<< endl;
                return false;
            }
        }
        else if(!is_subtype(curr_actual->get_type(), formal->get_type_decl())){
            ostream& os =  semant_error(curr_class);
            os <<curr_actual->get_type()<<" is of wrong type from defined type in "<<dispatch_method->get_method_name()<< endl;
            return false;
        }
    }
    return true;
}

bool ClassTable::check_actual(Expressions actual, method_class* dispatch_method, method_class* method, class__class* curr_class){
    Expression curr_actual;
    formal_class* formal;
    
    if(actual->len()!=dispatch_method->get_formals()->len()){
        ostream& os =  semant_error(curr_class);
        os <<"Wrong number of parameters in "<<dispatch_method->get_method_name()<< endl;
        return false;
    }
    for(int i=actual->first();actual->more(i);i=actual->next(i)){
        curr_actual=actual->nth(i);
        formal = (formal_class*)dispatch_method->get_formals()->nth(i);
        check_type(method, curr_actual, curr_class);
        
        if(curr_actual->get_type()==SELF_TYPE){
            if(!is_subtype(curr_class->get_name(), formal->get_type_decl())){
                ostream& os =  semant_error(curr_class);
                os <<"In call of method "<<dispatch_method->get_method_name()<<", type SELF_TYPE of parameter "<<formal->get_name()<<
                " does not conform to declared type "<<formal->get_type_decl()<<"."<< endl;
                return false;
            }
        }
        else if(!is_subtype(curr_actual->get_type(), formal->get_type_decl())){
            ostream& os =  semant_error(curr_class);
            os <<curr_actual->get_type()<<" is of wrong type from defined type in "<<dispatch_method->get_method_name()<< endl;
            return false;
        }
    }

    return true;
}

method_class* ClassTable::find_method(Symbol method_name, class__class*curr_class){
    auto curr_method=curr_class->method_map.find(method_name);

    if(curr_method!=curr_class->method_map.end()){
        return curr_method->second;
    }else if(curr_class->get_name()==Object){
        return NULL;
    }
    else{
        return find_method(method_name, class_symtab->probe(curr_class->get_parent()));
    }
}

bool ClassTable::check_identifier(SymbolTable<Symbol, Identifier>* identifier_symtab, object_class* object_expr,class__class*curr_class){
    Identifier* curr_identifier=identifier_symtab->probe(object_expr->get_name());
    
    if(curr_identifier==NULL){
        curr_identifier=identifier_symtab->lookup(object_expr->get_name());
    }

    if(curr_identifier!=NULL){
        object_expr->set_type(curr_identifier->get_type_decl());
        
    }else{
            attr_class* curr_attr=curr_class->attr_symtab->probe(object_expr->get_name());

            if(curr_attr==NULL){
                curr_attr=curr_class->attr_symtab->lookup(object_expr->get_name());
            }
            if(curr_attr==NULL){
                Symbol parent_name=curr_class->get_parent();

                if(parent_name!=Object && parent_name!=IO){
                    class__class* parent=class_symtab->probe(parent_name);
                    return check_identifier(identifier_symtab, object_expr, parent);
                }else{
                    ostream& os =  semant_error(curr_class);
                    os << object_expr->get_name() <<" is not defined" << endl;
                    object_expr->set_type(No_type);
                    return false;

                }
                
                
            }else{
                object_expr->set_type(curr_attr->get_type_decl());
            }
        
    }
    return true;
}


void ClassTable::check_method(method_class* method, class__class* curr_class){
    Expression curr_expr=method->get_expr();
    Symbol method_return_type=method->get_return_type();
    Formals formals=method->get_formals();

    if(check_type(method, curr_expr, curr_class)){
        if(!is_subtype(curr_expr->get_type(), method_return_type)){
            ostream& os =  semant_error(curr_class);
            os <<"Expected " <<method_return_type<<" as return type" <<", but got "<< curr_expr->get_type()<< endl;
        }
    }

}

Symbol ClassTable::lub(class__class* c1, class__class* c2){
    Symbol class_name;

    if(c1->get_name()==Object || c2->get_name()==Object)
        return Object;
    if(c1->get_name()==c2->get_name())
        return class_name=c1->get_name();
    else if(c1->get_parent()==c2->get_parent())
        return class_name=c1->get_parent();

    else if(is_subtype(c1->get_name(), c2->get_name()))
        return class_name=c2->get_name();
    else if(is_subtype(c2->get_name(), c1->get_name()))
        return class_name=c1->get_name();

    class_name=lub(class_symtab->probe(c1->get_parent()), c2);

    return class_name;
}

bool ClassTable::is_subtype(Symbol subtype, Symbol supertype){
    if(supertype==Object || subtype==supertype || subtype==No_type || subtype==SELF_TYPE){
        return true;
    }

    class__class* class_subtype=class_symtab->probe(subtype);
    class__class* class_supertype=class_symtab->probe(supertype);

    if(class_subtype==NULL || class_supertype==NULL){
        return false;
    }

    if(class_subtype->get_parent()==class_supertype->get_name()){
        return true;
    }else{
        return is_subtype(class_subtype->get_parent(), supertype);
    }

    return false;
}

void ClassTable::install_basic_classes() {

    // The tree package uses these globals to annotate the classes built below.
   //   = 0;
    Symbol filename = stringtable.add_string("<basic class>");
    
    // The following demonstrates how to create dummy parse trees to
    // refer to basic Cool classes.  There's no need for method
    // bodies -- these are already built into the runtime system.
    
    // IMPORTANT: The results of the following expressions are
    // stored in local variables.  You will want to do something
    // with those variables at the end of this method to make this
    // code meaningful.

    // 
    // The Object class has no parent class. Its methods are
    //        abort() : Object    aborts the program
    //        type_name() : Str   returns a string representation of class name
    //        copy() : SELF_TYPE  returns a copy of the object
    //
    // There is no need for method bodies in the basic classes---these
    // are already built in to the runtime system.

    Class_ Object_class =
	class_(Object, 
	       No_class,
	       append_Features(
			       append_Features(
					       single_Features(method(cool_abort, nil_Formals(), Object, no_expr())),
					       single_Features(method(type_name, nil_Formals(), Str, no_expr()))),
			       single_Features(method(copy, nil_Formals(), SELF_TYPE, no_expr()))),
	       filename);
        

    // 
    // The IO class inherits from Object. Its methods are
    //        out_string(Str) : SELF_TYPE       writes a string to the output
    //        out_int(Int) : SELF_TYPE            "    an int    "  "     "
    //        in_string() : Str                 reads a string from the input
    //        in_int() : Int                      "   an int     "  "     "
    //
    Class_ IO_class = 
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
	       filename);  

    //
    // The Int class has no methods and only a single attribute, the
    // "val" for the integer. 
    //
    Class_ Int_class =
	class_(Int, 
	       Object,
	       single_Features(attr(val, prim_slot, no_expr())),
	       filename);

    //
    // Bool also has only the "val" slot.
    //
    Class_ Bool_class =
	class_(Bool, Object, single_Features(attr(val, prim_slot, no_expr())),filename);

    //
    // The class Str has a number of slots and operations:
    //       val                                  the length of the string
    //       str_field                            the string itself
    //       length() : Int                       returns length of the string
    //       concat(arg: Str) : Str               performs string concatenation
    //       substr(arg: Int, arg2: Int): Str     substring selection
    //       
    Class_ Str_class =
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
	       filename);
           
           class_symtab->addid(Object, (class__class*)Object_class);
           class_symtab->addid(IO, (class__class*)IO_class);
           class_symtab->addid(Int, (class__class*)Int_class);
           class_symtab->addid(Bool, (class__class*)Bool_class);
           class_symtab->addid(Str, (class__class*)Str_class);
           
}

////////////////////////////////////////////////////////////////////
//
// semant_error is an overloaded function for reporting errors
// during semantic analysis.  There are three versions:
//
//    ostream& ClassTable::semant_error()                
//
//    ostream& ClassTable::semant_error(Class_ c)
//       print line number and filename for `c'
//
//    ostream& ClassTable::semant_error(Symbol filename, tree_node *t)  
//       print a line number and filename
//
///////////////////////////////////////////////////////////////////

ostream& ClassTable::semant_error(Class_ c)
{                                                             
    return semant_error(c->get_filename(),c);
}    

ostream& ClassTable::semant_error(Symbol filename, tree_node *t)
{
    error_stream << filename << ":" << t->get_line_number() << ": ";
    return semant_error();
}

ostream& ClassTable::semant_error()                  
{                                                 
    semant_errors++;                            
    return error_stream;
} 



/*   This is the entry point to the semantic checker.

     Your checker should do the following two things:

     1) Check that the program is semantically correct
     2) Decorate the abstract syntax tree with type information
        by setting the `type' field in each Expression node.
        (see `tree.h')

     You are free to first do 1), make sure you catch all semantic
     errors. Part 2) can be done in a second stage, when you want
     to build mycoolc.
 */
void program_class::semant()
{
    initialize_constants();

    /* ClassTable constructor may do some semantic analysis */
    ClassTable *classtable = new ClassTable(classes);

    /* some semantic analysis code may go here */



    if (classtable->errors()) {
	cerr << "Compilation halted due to static semantic errors." << endl;
	exit(1);
    }
}


