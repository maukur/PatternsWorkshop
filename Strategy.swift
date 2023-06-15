//
//  Strategy.swift
//  Patterns Workshop
//
//  Created by Artem Tischenko on 6/7/23.
//


//Стратегия - это как выбор головного убора на каждый день. Вам может понадобиться шапка, когда холодно, или кепка, когда солнечно. Паттерн Стратегия позволяет вам выбирать алгоритмы на ходу и менять их как свои головные уборы. Это гибкое и удобное решение, которое позволяет адаптироваться к разным ситуациям.

import Foundation

protocol PaymentStrategy {
    func pay(amount: Double)
}

class CreditCardPaymentStrategy: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid $\(amount) with Credit Card. Don't forget to collect cashback points!")
    }
}

class PayPalPaymentStrategy: PaymentStrategy {
    func pay(amount: Double) {
        print("Paid $\(amount) with PayPal. Easy and secure, just a few clicks!")
    }
}

class PaymentContext {
    private var strategy: PaymentStrategy
    
    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }
    
    func setPaymentStrategy(strategy: PaymentStrategy) {
        self.strategy = strategy
    }
    
    func makePayment(amount: Double) {
        strategy.pay(amount: amount)
    }
}

// Использование:
let creditCardStrategy = CreditCardPaymentStrategy()
let paymentContext = PaymentContext(strategy: creditCardStrategy)
paymentContext.makePayment(amount: 100.0) // Выводит "Paid $100.0 with Credit Card. Don't forget to collect cashback points!"

let paypalStrategy = PayPalPaymentStrategy()
paymentContext.setPaymentStrategy(strategy: paypalStrategy)
paymentContext.makePayment(amount: 50.0) 
