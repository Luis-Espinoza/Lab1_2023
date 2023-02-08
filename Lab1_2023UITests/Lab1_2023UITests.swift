//
//  Lab1_2023UITests.swift
//  Lab1_2023UITests
//
//  Created by IMD 224 on 2023-01-10.
//

import XCTest

final class Lab1_2023UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharCount() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews.buttons.firstMatch.tap()
        
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "4/150")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        let keyH = app.keys["H"]
        keyH.tap()
        XCTAssertTrue(detailText.waitForExistence(timeout: 5))
        XCTAssertEqual(detailText.label, "5/150")
        
        let keyi = app.keys["i"]
        keyi.tap()
        XCTAssertEqual(detailText.label, "6/150")
        
        let inventoryButton = app.buttons["Inventory"]
        inventoryButton.tap()
    }
    
    func testCharNotGreater() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews.buttons.firstMatch.tap()
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        let keyS = app.keys["S"]
        keyS.tap()
        
        let keys = app.keys["s"]
        
        for _ in 1...153 {
            keys.tap()
        }
        
        let detailText = app.staticTexts["DetailText"]
        XCTAssertTrue(detailText.waitForExistence(timeout: 5))
        XCTAssertEqual(detailText.label, "150/150")
        
        let inventoryButton = app.buttons["Inventory"]
        inventoryButton.tap()
        
    }
    
    func testThree() throws {
        let app = XCUIApplication()
        app.launch()
        
        let toggle = app.buttons["NavigationButton"]
        toggle.tap()
        
        for _ in 1...33 {
            app.steppers["MaxCountStepper"].buttons["Decrement"].tap()
        }
        
        app.terminate()
        app.launch()
        
        app.collectionViews.buttons.firstMatch.tap()
        
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "4/10")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        let keyS = app.keys["S"]
        keyS.tap()
        let keys = app.keys["s"]
        
        for _ in 1...12 {
            keys.tap()
        }
        
        let inventoryButton = app.buttons["Inventory"]
        inventoryButton.tap()
        toggle.tap()
        
        for _ in 1...33 {
            app.steppers["MaxCountStepper"].buttons["Increment"].tap()
        }
        
        for _ in 1...15 {
            app.steppers["MaxCountStepper"].buttons["Decrement"].tap()
        }
    }
    
    func testFour() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews.buttons.firstMatch.tap()
        
        let favouriteToggle = app.switches["Favourite"]
        favouriteToggle.tap()
        
        XCTAssertEqual(favouriteToggle.value as? String, "1") //1 == enabled
        
        let inventoryButton = app.buttons["Inventory"]
        inventoryButton.tap()
        
        let secondEntry = app.collectionViews.buttons.element(boundBy: 1)
        secondEntry.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "0") //1 == enabled
    }
    
    func testAddItems() throws {
        let app = XCUIApplication()
        app.launch()
        
        let navigationBars = app.navigationBars
        
        navigationBars["Inventory"].buttons["PlusButton"].tap()
    }
    
    func testDeleteItems() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
        app.collectionViews.buttons["Delete"].tap()
    }
}
