//
//  Decorator.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Декоратор позволяет добавлять дополнительное поведение или функциональность объекту, не изменяя его основной структуры.

import Foundation

protocol CoffeeDecorator {
    func getCost() -> Double
    func getDescription() -> String
}

class SimpleCoffee: CoffeeDecorator {
    func getCost() -> Double {
        return 1.0
    }
    
    func getDescription() -> String {
        return "Простой кофе"
    }
}

class CoffeeDecorator: CoffeeDecorator {
    private let coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func getCost() -> Double {
        return coffee.getCost()
    }
    
    func getDescription() -> String {
        return coffee.getDescription()
    }
}

class MilkDecorator: CoffeeDecorator {
    override func getCost() -> Double {
        return super.getCost() + 0.5
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", молоко"
    }
}

class SugarDecorator: CoffeeDecorator {
    override func getCost() -> Double {
        return super.getCost() + 0.2
    }
    
    override func getDescription() -> String {
        return super.getDescription() + ", сахар"
    }
}

// Использование:
let simpleCoffee = SimpleCoffee()
print(simpleCoffee.getCost()) // Выводит "1.0"
print(simpleCoffee.getDescription()) // Выводит "Простой кофе"

let coffeeWithMilk = MilkDecorator(coffee: simpleCoffee)
print(coffeeWithMilk.getCost()) // Выводит "1.5"
print(coffeeWithMilk.getDescription()) // Выводит "Простой кофе, молоко"

let coffeeWithMilkAndSugar = SugarDecorator(coffee: coffeeWithMilk)
print(coffeeWithMilkAndSugar.getCost()) // Выводит "1.7"
print(coffeeWithMilkAndSugar.getDescription()) // Выводит "Простой кофе, молоко, сахар"
