//
//  Adapter.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Адаптер позволяет объектам с несовместимыми интерфейсами работать вместе. Преобразует интерфейс одного класса в интерфейс, ожидаемый клиентом.

import Foundation

protocol Duck {
    func quack()
    func fly()
}

class MallardDuck: Duck {
    func quack() {
        print("Quack!")
    }
    
    func fly() {
        print("Flying")
    }
}

protocol Turkey {
    func gobble()
    func fly()
}

class WildTurkey: Turkey {
    func gobble() {
        print("Gobble gobble!")
    }
    
    func fly() {
        print("Flying short distance")
    }
}

class TurkeyAdapter: Duck {
    private let turkey: Turkey
    
    init(turkey: Turkey) {
        self.turkey = turkey
    }
    
    func quack() {
        turkey.gobble()
    }
    
    func fly() {
        for _ in 1...5 {
            turkey.fly()
        }
    }
}

// Использование:
let mallardDuck = MallardDuck()
mallardDuck.quack() // Выводит "Quack!"
mallardDuck.fly() // Выводит "Flying"

let wildTurkey = WildTurkey()
let turkeyAdapter = TurkeyAdapter(turkey: wildTurkey)
turkeyAdapter.quack() // Выводит "Gobble gobble!"
turkeyAdapter.fly() // Выводит "Flying short distance" (5 раз)
