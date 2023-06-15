//
//  Some.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/15/23.
//

import Foundation

struct Wallet {
    let money: Int
    
    func addMoney(money: Int) -> Wallet {
        Wallet(money: self.money + money)
    }
}
