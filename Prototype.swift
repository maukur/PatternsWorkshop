//
//  Prototype.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Прототип позволяет создавать объекты путем клонирования существующих объектов, вместо создания новых экземпляров с нуля.

import Foundation

class Animal: NSCopying {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Animal(name: self.name)
    }
}

// Использование:
let originalAnimal = Animal(name: "Dog")
let clonedAnimal = originalAnimal.copy() as! Animal

print(clonedAnimal.name) // Выводит "Dog"
