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
//        initDemo1()
        initDemo2()
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
    
    func initDemo4(){
        
    }
    
}
