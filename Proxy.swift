//
//  Proxy.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Заместитель предоставляет замену другому объекту и контролирует доступ к нему. Позволяет добавлять дополнительную логику при доступе к объекту.

import Foundation

protocol Image {
    func display()
}

class RealImage: Image {
    private let filename: String
    
    init(filename: String) {
        self.filename = filename
        loadFromDisk()
    }
    
    func display() {
        print("Displaying image: \(filename)")
    }
    
    private func loadFromDisk() {
        print("Loading image from disk: \(filename)")
    }
}

class ProxyImage: Image {
    private let filename: String
    private var realImage: RealImage?
    
    init(filename: String) {
        self.filename = filename
    }
    
    func display() {
        if realImage == nil {
            realImage = RealImage(filename: filename)
        }
        realImage?.display()
    }
}

// Использование:
let image = ProxyImage(filename: "image.jpg")

image.display() // Загружает и отображает изображение
image.display() // Отображает изображение (не загружает снова)
