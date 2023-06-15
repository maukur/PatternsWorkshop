//
//  Builder.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Строитель позволяет создавать сложные объекты пошагово. Он абстрагирует процесс конструирования объекта от его представления.

import Foundation

class Pizza {
    var dough: String?
    var sauce: String?
    var toppings: [String] = []
    
    func describe() {
        print("Pizza with \(dough ?? "") dough, \(sauce ?? "") sauce, and toppings: \(toppings.joined(separator: ", "))")
    }
}

protocol PizzaBuilder {
    func setDough()
    func setSauce()
    func setToppings()
    func getPizza() -> Pizza
}

class MargheritaBuilder: PizzaBuilder {
    private var pizza = Pizza()
    
    func setDough() {
        pizza.dough = "Thin"
    }
    
    func setSauce() {
        pizza.sauce = "Tomato"
    }
    
    func setToppings() {
        pizza.toppings = ["Cheese", "Basil"]
    }
    
    func getPizza() -> Pizza {
        return pizza
    }
}

class Director {
    private var builder: PizzaBuilder
    
    init(builder: PizzaBuilder) {
        self.builder = builder
    }
    
    func constructPizza() -> Pizza {
        builder.setDough()
        builder.setSauce()
        builder.setToppings()
        return builder.getPizza()
    }
}

// Использование:
let margheritaBuilder = MargheritaBuilder()
let director = Director(builder: margheritaBuilder)
let margheritaPizza = director.constructPizza()
margheritaPizza.describe() // Выводит "Pizza with Thin dough, Tomato sauce, and toppings: Cheese, Basil"
