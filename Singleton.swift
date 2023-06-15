//
//  Singleton.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Одиночка гарантирует, что класс имеет только один экземпляр и предоставляет глобальную точку доступа к этому экземпляру.



import Foundation

class Singleton {
    static let shared = Singleton()
    private init() {}
    
    func doSomething() {
        print("Singleton: Do something")
    }
}

// Использование:
let singleton = Singleton.shared
singleton.doSomething() // Выводит "Singleton: Do something"
