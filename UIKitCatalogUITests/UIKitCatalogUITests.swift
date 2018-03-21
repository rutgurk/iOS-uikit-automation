//
//  UIKitCatalogUITests.swift
//  UIKitCatalogUITests
//
//  Created by Rutger on 21/03/2018.
//  Copyright © 2018 Apple. All rights reserved.
//

import XCTest

class UIKitCatalogUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRecording() {
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Alert Controller"]/*[[".cells.staticTexts[\"Alert Controller\"]",".staticTexts[\"Alert Controller\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Simple"]/*[[".cells.staticTexts[\"Simple\"]",".staticTexts[\"Simple\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["A Short Title is Best"].buttons["OK"].tap()
    }
    
}
