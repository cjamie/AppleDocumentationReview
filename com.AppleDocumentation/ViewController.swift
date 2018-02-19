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
        initDemo14()
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
        
        //(simple) Food convenience init travels to Food designated init and back
        let temp4 = Food()
        print("temp4 name: \(temp4.name)")
        
        // ShoppingListItems always start off with purchased = false
        // ShoppingListItems defines no designated inits and provides a default value for all of its properties so it inherits all designated and convenience inits from superclass
        let temp5 = ShoppingListItem(name: "shop5", quantity: 15)
        let temp6 = ShoppingListItem()
        let temp7 = ShoppingListItem(name: "shop7")
        
        print(temp5.description) //using RecipeIngredient designated init
        print(temp6.description) //using Food convenience init
        print(temp7.description) //using RecipeIngredient convenience init

    }
    
    //Failable Initializers
    //to write an init that may fail, place a question mark after the init keyword
    //note: you may not declare a failable and nonfailable init with same parameter list
    //failable init returns an optional
    func initDemo9(){
        if let temp = Animal(species: ""){
            print(temp.species)
        }else{
            //temp == nil
            print("failed init")
        }
        
        guard let temp2 = Animal(species: "bear") else {return}
        print("init succeeded: \(temp2.species)")
    }
    
    //Failable Initializers for Enumerations
    //Failable inits may be used with enums to select appropriate input for given input
    
    func initDemo10(){
        guard let temp = TemperatureUnit(symbol: "K") else {return}
        guard let temp2 = TemperatureUnit(symbol: "F") else {return}
        guard let temp3 = TemperatureUnit(symbol: "C") else {return}
        var temp5: [TemperatureUnit] = [temp, temp2, temp3]
        
        if let temp4 = TemperatureUnit(symbol: "L") {
            print("L is not defined so this will fail to append")
            temp5.append(temp4)
        }else{ print("this will print because it failed") }
        print("temp5 print:")
        temp5.forEach{ print($0.rawValue) }

        
        //Failable Initializers for Enumerations with Raw Values
        //raw-value enums AUTOMATICALLY receive a failable initializer: init?(rawValue: )

        guard let temp6 = TemperatureUnit(rawValue: "kelvin") else {return}
        guard let temp7 = TemperatureUnit(rawValue: "fahrenheit") else {return}
        guard let temp8 = TemperatureUnit(rawValue: "celsius") else {return}

        let temp9 = [temp6, temp7, temp8]
        print("temp9 print:")
        temp9.forEach{
            print($0.rawValue)
        }
        
    }
    

    //Propagation of Initialization Failure
    func initDemo11(){
        //init will fail if quantity is less than 1
        if let _ = CartItem(name: "anything", quantity: 0){
            print("this will not print")
        }else{
            print("quantity < 1 so the entire initialization process fails immediately @ CartItem")
        }
        guard let _ = CartItem(name: "", quantity: 20) else {
            print("This passes the quantity < 1 check but will fail at Product init because of empty string")
            return
        }
        
    }
    
    //Overriding a Failable Initializer
    //Note: you can override a failable with non-failable but not the other was around.
    
    func initDemo12(){
        //CartItem2's init?(name:) method overrides init?(name:) and is now non-failable
        _ = CartItem2(name: "does not matter")
        
        //you can force unwrap your init so that it should always succeed.
        _ = CartItem3(name: "Bread")
    }
    
    //Required Initializers
    
    func initDemo13(){
        //required keyword indicates that all subclasses must implement this initializer.
        //you do not write override on a required designated initalizer
        _ = SomeClass()
        _ = SomeChildClass()
        
    }
    
    //Setting a Default Property Value with a Closure or Function
    func initDemo14(){
        //if a stored value's default property requires customization, you can use a closure or global function. these closures create a temporary value of the same type as property
        
        let temp = SomeClass()
        print(temp.someProperty)
        
        
        //Chessboard's boardColors property is set during initialization and may be accessed through it's squareIsBlackAt(row: column:) utility function
        let temp2 = Chessboard()
        print(temp2.squareIsBlackAt(row: 2, column: 1))
        print(temp2.squareIsBlackAt(row: 2, column: 2))

    }
    
}
