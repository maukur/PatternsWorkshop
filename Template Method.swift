//
//  Template Method.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//

//Шаблонный метод определяет скелет алгоритма в суперклассе, позволяя подклассам переопределить некоторые шаги алгоритма, но оставляя основную структуру неизменной.

import Foundation

class Game {
    func play() {
        startGame()
        playGame()
        endGame()
    }
    
    func startGame() {
        fatalError("startGame() должен быть переопределен в подклассе")
    }
    
    func playGame() {
        fatalError("playGame() должен быть переопределен в подклассе")
    }
    
    func endGame() {
        print("Игра завершена")
    }
}

class Chess: Game {
    override func startGame() {
        print("Начинаем игру в шахматы")
    }
    
    override func playGame() {
        print("Играем в шахматы")
    }
}

// Использование:
let chess = Chess()
chess.play()
