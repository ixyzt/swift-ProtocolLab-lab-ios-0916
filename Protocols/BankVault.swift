//
//  BankVault.swift
//  Protocols
//
//  Created by Papa Roach on 8/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//


class BankVault {
    
    let name: String
    let address: String
    var amount: Double = 0.0
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
    
}

protocol ProvideAccess {
    func allowEntryWithPassword(_ password: [Int]) -> Bool
}


//If the person calling on this function doesn't enter in any digits (empty array), then we should return false.
//If the total numbers of digits entered (items in the array) exceed 10, then we should return false.
//In order to allow access (return true), every other digit (starting with the first digit) must be even. The first digit entered is the first element in the array.
extension BankVault {
    func allowEntryWithPassword(_ password: [Int]) -> Bool {
        var click: [Bool] = []
        switch password.isEmpty || password.count > 10 {
        case true:
            return false
        default:
            for (index,value) in password.enumerated() {
                switch (index == 0 || index % 2 == 0) {
                case true:
                    if value % 2 == 0 {
                        click += [true]
                    } else {
                        click += [false]
                    }
                default:
                    break
                }
            }
        }
        return !click.contains(false)
    }
}




