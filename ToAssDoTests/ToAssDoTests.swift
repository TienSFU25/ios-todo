//
//  ToAssDoTests.swift
//  ToAssDoTests
//
//  Created by MSFTCambie on 4/18/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import XCTest
@testable import ToAssDo

class ToAssDoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testInit_ShouldTakeTitle() {
        let item = ToDoItem(title: "Test title")
        XCTAssertEqual(item.title, "Test title", "No title")
    }
    
    func testInit_ShouldTakeTitleAndDescription() {
        let item = ToDoItem(title: "whatever",
                     itemDescription: "some description")
        
        XCTAssertEqual(item.itemDescription, "some description", "No description")
    }
    
    func testInit_ShouldSetTitleAndDescriptionAndTimestamp() {
        let item = ToDoItem(title: "test title",
                            itemDescription: "whatever",
                            timestamp: 0.0)
        
        XCTAssertEqual(0.0, item.timestamp, "No timestamp")
    }
    
    func testInit_ShouldSetLocation() {
        let location = Location(name: "whatever")
        
        let item = ToDoItem(title: "test title",
                            itemDescription: "whatever",
                            timestamp: 0.0,
                            location: location)
        
        XCTAssertEqual(location.name, item.location?.name, "No location")
    }
    
    func testEqualItems_ShouldBeEqual() {
        let first = ToDoItem(title: "first")
        let second = ToDoItem(title: "first")
        
        XCTAssertEqual(first, second, "should be eq")
    }
    
    func testWhenLocationDiffers_ShouldNotBeEqual() {
        let first = ToDoItem(title: "first",
                             itemDescription: "desc",
                             location: Location(name: "homy"))
        
        let second = ToDoItem(title: "first",
                             itemDescription: "desc",
                             location: Location(name: "nothomy"))
        
        XCTAssertNotEqual(first, second, "should neq")
    }
}
