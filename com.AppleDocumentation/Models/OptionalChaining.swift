//
//  File.swift
//  com.AppleDocumentation
//
//  Created by Admin on 2/19/18.
//  Copyright © 2018 Jamie Chu. All rights reserved.
//

import Foundation


class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
    var address: Address?
    
    func createAddress() -> Address {
        print("Function was called.")
        
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        
        return someAddress
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
    
}
