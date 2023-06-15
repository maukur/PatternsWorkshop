//
//  Abstract Factory.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Абстрактная фабрика предоставляет интерфейс для создания семейств связанных или взаимозависимых объектов, без указания их конкретных классов.


import Foundation

protocol Animal {
    func makeSound()
}

protocol AnimalFactory {
    func createDog() -> Animal
    func createCat() -> Animal
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

class PetAnimalFactory: AnimalFactory {
    func createDog() -> Animal {
        return Dog()
    }
    
    func createCat() -> Animal {
        return Cat()
    }
}

// Использование:
let petFactory = PetAnimalFactory()
let dog = petFactory.createDog()
dog.makeSound() // Выводит "Woof!"

let cat = petFactory.createCat()
cat.makeSound() // Выводит "Meow!"
