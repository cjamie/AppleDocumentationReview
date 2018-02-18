//
//  Initialization.swift
//  com.AppleDocumentation
//
//  Created by Admin on 2/17/18.
//  Copyright © 2018 Jamie Chu. All rights reserved.
//

import Foundation

//Helpers for Initialization
class InitClass{

    var temperature: Double
    var status: String {
        switch self.temperature{
        case let x where x < 0:
            return "below freezing"
        case 1..<30:
            return "Cold"
        case 30..<70:
            return "Normal"
        case 70..<100:
            return "Hot"
        default:
            return "Hell"
        }
    }
    
    var name: String?
    
    convenience init(){
        self.init(temperature:40)
    }
    
    init(temperature: Double) {
        self.temperature = temperature
    }

}

class InitClassDefault{
    var temperature = 32.1
}

struct InitStruct{
    let temperature: Double
}

struct InitStructDefault{
    let temperature = 32.1
    let param2: Double
}


struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

struct Size {
    var width = 0.0, height = 0.0
    
    
    init(){
        self.width = 2.2
        self.height = 2.1
    }
    init(width: Double, height: Double){
        self.width = width
        self.height = height
    }
    init(custom num: Double){
        self.init(width: num, height: num/2)
    }
}

struct Rect{
    lazy var size: Size = Size(width: 0, height: 0)
    var type: String = ""
}
extension Rect{
    init(onlySize: Size){
        self.init(size: onlySize, type: "custom")
    }
}


