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
        
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "0/150")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        let keyH = app.keys["H"]
        keyH.tap()
        XCTAssertTrue(detailText.waitForExistence(timeout: 5))
        XCTAssertEqual(detailText.label, "1/150")
        
        let keyi = app.keys["i"]
        keyi.tap()
        XCTAssertEqual(detailText.label, "2/150")
    }
    
    func testCharNotGreater() throws {
        let app = XCUIApplication()
        app.launch()
        
        let detailText = app.staticTexts["DetailText"]
        
    }
}
