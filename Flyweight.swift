//
//  Flyweight.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Приспособленец позволяет эффективно поддерживать множество мелких объектов, разделяя их общую часть и сохраняя индивидуальные части отдельно. Это позволяет экономить память при работе с большим количеством объектов.

import Foundation

class Car {
    let model: String
    
    init(model: String) {
        self.model = model
    }
    
    func drive() {
        print("Driving \(model)")
    }
}

class CarFactory {
    private var cars: [String: Car] = [:]
    
    func getCar(model: String) -> Car {
        if let car = cars[model] {
            return car
        } else {
            let car = Car(model: model)
            cars[model] = car
            return car
        }
    }
}

// Использование:
let carFactory = CarFactory()

let car1 = carFactory.getCar(model: "Sedan")
car1.drive() // Выводит "Driving Sedan"

let car2 = carFactory.getCar(model: "SUV")
car2.drive() // Выводит "Driving SUV"

let car3 = carFactory.getCar(model: "Sedan")
car3.drive() // Выводит "Driving Sedan" (не создает новый объект)
