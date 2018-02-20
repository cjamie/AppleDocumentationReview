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

class InitClassChild: InitClass{
    init(){
        super.init(temperature: 22)
    }
    convenience init(convenience: Int) {
        self.init()
        self.name = "convenient name \(convenience)"
    }
}

class InitClassChild2: InitClassChild{
    override init() {
        super.init()
        self.name = "overriden name"
    }
}

class InitClassDefault{
    var temperature = 32.9
}

class InitClassDefaultChild: InitClassDefault{
    
}

class InitClassDefaultChild2: InitClassDefault{
    var celsius = 9000.1
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


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        
        //NOTE: you MUST provide NEW properties with values before the super.init and MAY customize properties after the super.init
//        self.quantity = 44
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

struct Animal {
    let species: String
    
    //failable init
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

enum TemperatureUnit:String {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}


class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
    init(){
        self.name = "default"
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
    
}

class CartItem2: Product{
    override init(name: String) {
        super.init()
    }
}

class CartItem3: Product{
    override init(name: String) {
        super.init(name: "name: \(name)")!
    }
}

class SomeClass {
    //NOTE: if you use a closure to initialize a property, the rest of the instance has not yet been initiailized so that means you cannot access those properties from within your closure

    
    let someProperty: String = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        let someValue = "some default value for someProperty"
        
        return someValue
    }()
    
    required init() {
        // initializer implementation goes here
    }
}
class SomeChildClass: SomeClass{
    required init(){
    }
}

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
