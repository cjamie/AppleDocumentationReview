//
//  VC+OptionalChaining.swift
//  com.AppleDocumentation
//
//  Created by Admin on 2/19/18.
//  Copyright © 2018 Jamie Chu. All rights reserved.
//

import Foundation

/*
 Optional Chaining is a process for querying and calling properties, methods, and subscripts on an optional that MIGHT currently be nil.
 
 IMPORTANT: if any link in the chain is nil, then it would fail gracefully instead of crashing.
 

 
 */

typealias OptionalChaining = ViewController


extension OptionalChaining{
    
    //main difference: force unwrap (!) would trigger a runtime error whereas (?) will fail gracefully.

    //Section: Optional Chaining as an Alternative to Forced Unwrapping
    func opChainDemo(){
        
        let temp = Person()
        
        //we chained the person instance's residence property by inserting a question mark immediately after the optional value
        let temp1 = temp.residence?.numberOfRooms
        print(temp1) //will return Optional(nil)
        
        //this WILL cause a runtime error if residence was not set:
        temp.residence = Residence()
        let temp2 = temp.residence!.numberOfRooms
        print(temp2)

        //assigning values for the address component
        let temp3 = Address()
        temp.residence?.address = temp3
        print(temp.residence?.address?.buildingIdentifier() ?? "currently both nil")

        temp3.buildingName = "Ernst and Young"
        temp3.buildingNumber = "30E"
        print(temp.residence?.address?.buildingIdentifier() ?? "values have been assigned")

        

        
    }
    //Accessing Properties Through Optional Chaining
    func opChainDemo2(){

        let temp = Person()
        let temp2 = Person()
        let temp3 = Residence()
        
        temp.residence = temp3
        
        //temp2 not called because residence is still nil
        temp.residence?.address = temp3.createAddress() //called
        temp2.residence?.address = temp3.createAddress() //not called

        print(temp.residence?.address ?? "temp no address")
        print(temp2.residence?.address ?? "temp 2 no address")

    }
    
    //Calling Methods Through Optional Chaining
    
    
}

