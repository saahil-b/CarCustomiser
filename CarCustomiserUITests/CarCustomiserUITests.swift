//
//  CarCustomiserUITests.swift
//  CarCustomiserUITests
//
//  Created by Rakesh Bahadur on 20/01/2021.
//

import XCTest

class CarCustomiserUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenTiresAndExhaustBoughtEngineIsDisabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tableQueries = app.tables
        tableQueries.switches["Exhaust Package (500)"].tap()
        tableQueries.switches["Tires Package (500)"].tap()
        
        XCTAssertEqual(tableQueries.switches["Engine Package (1,000)"].isEnabled, false)
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testWhenChangeCarDisplayIsReset() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tableQueries = app.tables
        tableQueries.switches["Exhaust Package (500)"].tap()
        tableQueries.switches["Tires Package (500)"].tap()
        tableQueries.buttons["Next Car"].tap()
        
        XCTAssertEqual(tableQueries.switches["Exhaust Package (500)"].isEnabled, true)
        XCTAssertEqual(tableQueries.switches["Tires Package (500)"].isEnabled, true)
        XCTAssertEqual(tableQueries.switches["Engine Package (1,000)"].isEnabled, true)

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
