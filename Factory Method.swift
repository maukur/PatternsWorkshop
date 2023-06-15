//
//  Factory Method.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Фабричный метод предоставляет интерфейс для создания объектов в суперклассе, позволяя подклассам изменять тип создаваемых объектов.


import Foundation

protocol Animal {
    func makeSound()
}

class Dog: Animal {
    func makeSound() {
        print("Woof!")
    }
}

class Cat: Animal {
    func makeSound() {
        print("Meow!")
    }
}

protocol AnimalFactory {
    func createAnimal() -> Animal
}

class DogFactory: AnimalFactory {
    func createAnimal() -> Animal {
        return Dog()
    }
}

class CatFactory: AnimalFactory {
    func createAnimal() -> Animal {
        return Cat()
    }
}

// Использование:
let dogFactory = DogFactory()
let dog = dogFactory.createAnimal()
dog.makeSound() // Выводит "Woof!"

let catFactory = CatFactory()
let cat = catFactory.createAnimal()
cat.makeSound() // Выводит "Meow!"
