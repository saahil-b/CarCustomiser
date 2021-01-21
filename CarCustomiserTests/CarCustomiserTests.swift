//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Rakesh Bahadur on 20/01/2021.
//

import XCTest

class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributesSet(){
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, accelaration: 7.7, handling: 5)
        
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.accelaration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testDisplayStatsFunctionWorks(){
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, accelaration: 7.7, handling: 5)
        
        let string = car.displayStats()
        
        XCTAssertEqual(string, "Make: Mazda\nModel: MX-5\nTop Speed: 125mph\nAccelaration (0-60): 7.7s\nHandling: 5")
    }

}
