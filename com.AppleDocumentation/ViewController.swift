//
//  ViewController.swift
//  com.AppleDocumentation
//
//  Created by Admin on 2/17/18.
//  Copyright © 2018 Jamie Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("VDL")
        initDemo8()
    }


}

typealias Initialization = ViewController
extension Initialization{
/*
    KEY POINTS:
    Initialization is the process of preparing an instance of a class, structure, or enum for use
    Classes and structures must set all of their stored properties to a appropriate value
     
*/
    func initDemo1(){
        //class convenience init with no parameters
        let a1 = InitClass()
        print("a1's temperature is \(a1.temperature)")
        print("optionals are not required in init: a.name's default is \(String(describing: a1.name))")

        //second class init
        let a2 = InitClass(temperature: 22)
        print("a2's temperature is \(a2.temperature)")
        print("a2's status is \(a2.status)")
        
        //swift gives structures a default memberwise init if they do not define their own
        let b1 = InitStruct(temperature: 11)
        print("b's temperature is \(b1.temperature)")
        
        //you can provide a default value (they would not be included in the memberwise init)
        let b2 = InitStructDefault(param2: 33.0)
        print("temperature is \(b2.temperature) and is not included in the memberwise initializer ")
        
    }
    
    
    func initDemo2(){
        //init may vary as long as it provides values for all stored non-optional properties
        _ = Color(red: 1, green: 1, blue: 1) // magenta
        _ = Color(white: 0.5) //halfgrey
       
        //Color has constants as its properties. It may be set during initialization but may not be modified afterwards
    }
    
    

    func initDemo3(){
        //if you want your custom value type to be initializable with default, memberwise, custom, then write your custom in an extension.

        //WITHOUT EXTENSION (Size)
        _ = Size(width: 1, height: 2)
        //Initializer delegation- call other initializers to avoid duplicating code across multiple initializers
        _ = Size(custom: 3.2)
        _ = Size()
        
        //WITH EXTENSION (Rect)
        //another example of initializer delegation
        let temp = Size(width: 1, height: 2)
        _ = Rect(onlySize: temp)
        _ = Rect()
    }
    
    
    //Class inheritance and initialization
    func initDemo4(){
        //Swift defines two types of initializers: designated and convenience
        //designated
        _ = InitClass(temperature: 9001)
        //convenience (must call a designated init)
        _ = InitClass()
        
        // subclasses of a class MUST call the DESIGNATED initializer. They may not call the convenience.
        //Designated init delegate UP, Convenience init delegate ACROSS
        _ = InitClassChild()
        
    }
    //Two-phase initialization
    /*
     1. each stored property is given a value
     1.1 designated/convenience init is called on a class
     1.2 memory for instance is allocated but the memory is not yet initialized
     1.3 designated init ensure all stored properties have a value; the memory is now initialized
     1.3.1 this continues up the inheritance tree until the top is reached
     1.3.2 if you reached the top and all checks are passed, then phase 1 is complete
     
     2. each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use.
     2.1 Working down from the top of the chain, each designated init has the option to customize the instance further
     2.2 if it was called with a convenience init, the convenience init may customize further; we are at the end
     
     */
    func initDemo5(){
        _ = InitClassChild(convenience: 33)
        /*
         1) <InitClassChild>'s convenience init will call its designated init
         2) <InitClassChild>'s designated init will call the parent's designated init.
         3) It's base class is simply <InitClass> and it is confirmed that it all stored properties have a stored value.
         4) We start working down to the child's designated init, and customize the properties if specified
         5) We finally finish back where we start, at <InitClassChild>'s convenience init and customize if specified.
         */
        
    }
    
    //Initializer Inheritance and overriding
    //CAUTION: Subclasses in Swift do not inherit it's superclass initializers by default.
    //note: you cannot override convenience init because the child classes can't access them (directly).
    
    func initDemo6(){
        let temp  = InitClassChild2()
        print(temp.name ?? "There was nothing")
        
        //Subclasses may modify existing VARIABLE properties but may not change constant properties.
    }
    
    //Automatic Initializer Inheritance
    /*
     subclases do not inherit their superclass initializers by default but superclass inits are AUTOMATICALLY inherited if 2 conditions are met:
     
     1)the subclass does NOT define any designated inits
     2)the subclass provides an implementation of all of its superclass designated initializers

    */
    func initDemo7(){
        //temp1 and temp2 both satisfies rule 1 and 2
        let temp = InitClassDefaultChild()
        print(temp.temperature)
        
        let temp2 = InitClassDefaultChild2()
        print(temp2.celsius)
    }
    
    //Designated and Convenience Initializers in Action
    
    /*
     general: classes do not have a default memberwise init (like structs) so classes must provide their own designated init
     
     */
    func initDemo8(){
        //RecipeIngredient's quantity property MUST be initialized BEFORE super.init call
        //parent properties may be customized AFTER designated super.init call
        let temp = RecipeIngredient(name: "something")
        let temp2 = RecipeIngredient(name: "something else ", quantity: 22)
        
        print("temp \(temp.quantity) \(temp.name) ")
        print("temp2 \(temp2.quantity) \(temp2.name) ")
    }
    
    
    
}
