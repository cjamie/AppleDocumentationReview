//
//  VC+Deinitialization.swift
//  com.AppleDocumentation
//
//  Created by Admin on 2/19/18.
//  Copyright © 2018 Jamie Chu. All rights reserved.
//

import Foundation

/*
 A deinitializer is called immediately before a CLASS instance is deallocated. It is not available to structs or enums - only classes.
 
 the deinit{} function is called when no other properties or variables are referencing it.

 */

typealias Deinitialization = ViewController
extension Deinitialization{
    func deinitDemo(){
        
        var temp = Player(coins: 200)//bank just distributed 200 coins via init
        print(Bank.coinsInBank)  // 10000 - 200 = 9800
        
        temp.win(coins: 300) //bank distributes another 300 coins
        print(Bank.coinsInBank) //9800-300 = 9500
        
        temp = Player(coins: 0) //9500-> 10000 - 0 = 10000
        print(Bank.coinsInBank) //previous player no longer referenced so de-init is called. new player takes no coins so 10000

        //-------------------
        
        var temp1:Player? = Player(coins: 100) //10000 - 100 = 9900
        var temp2:Player? = Player(coins: 250) // 9900 - 250 = 9650
        
        _ = Player(coins: 300) //player has been initialized but deinit has also been called because there are no references to it
        //9650 - 0 = 9650
        print(Bank.coinsInBank)
        print("\(temp1?.coinsInPurse ?? -9001) \(temp2?.coinsInPurse ?? -9001)")

        temp1 = nil //9650 + 100 = 9750
        temp2 = nil //9750 + 250 = 10000
        print(Bank.coinsInBank)
        
        
    }
}


