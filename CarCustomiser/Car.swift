//
//  Car.swift
//  CarCustomiser
//
//  Created by Rakesh Bahadur on 20/01/2021.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var accelaration: Double
    var handling: Int
    
    func displayStats() -> String{
        return "Make: \(make)\nModel: \(model)\nTop Speed: \(topSpeed)mph\nAccelaration (0-60): \(accelaration)s\nHandling: \(handling)"
    }
}
