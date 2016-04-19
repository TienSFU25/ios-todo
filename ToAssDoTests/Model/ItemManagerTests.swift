//
//  ItemManagerTests.swift
//  ToAssDo
//
//  Created by MSFTCambie on 4/18/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import XCTest
@testable import ToAssDo

class ItemManagerTests: XCTestCase {
    var sut: ItemManager!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testToDoCount_Init_Zero() {
        XCTAssertEqual(sut.toDoCount, 0, "initial count should be zero")
    }
    
    func testToDoCount_AfterAddingOneItem_IsOne() {
        sut.addItem(ToDoItem(title: "whatever"))
        
        XCTAssertEqual(sut.toDoCount, 1, "count should be one")
    }
    
    func testItemAtIndex_ShouldReturnPrevAddedItem() {
        let item = ToDoItem(title: "whatever")
        sut.addItem(item)
        
        let returnedItem = sut.itemAtIndex(0)
        
        XCTAssertEqual(item.title,
                       returnedItem.title,
                       "not same item")
    }
    
    func testCheckItem_ChangeCountToDo() {
        sut.addItem(ToDoItem(title: "First"))
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.toDoCount, 0, "todocount should be 0")
        XCTAssertEqual(sut.doneCount, 1, "donecount should be 1")
    }
    
    func testCheckItem_RemovesFromToDoList() {
        let firstItem = ToDoItem(title: "first")
        let secondItem = ToDoItem(title: "second")
        
        sut.addItem(firstItem)
        sut.addItem(secondItem)
        
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.itemAtIndex(0).title, secondItem.title)
    }
    
    func testDoneItemAtIndex_ShouldReturnPrevCheckedItem() {
        let item = ToDoItem(title: "whatever")
        sut.addItem(item)
        sut.checkItemAtIndex(0)
        
        let returnedItem = sut.doneItemAtIndex(0)
        
        XCTAssertEqual(item.title, returnedItem.title, "not same item")
    }
    
    func testRemoveAllItems_ShouldResultInCountsBeZero() {
        sut.addItem(ToDoItem(title: "First"))
        sut.addItem(ToDoItem(title: "Second"))
        sut.checkItemAtIndex(0)
        
        XCTAssertEqual(sut.toDoCount, 1,
                       "toDoCount should be 1")
        XCTAssertEqual(sut.doneCount, 1,
                       "doneCount should be 1")
        
        sut.removeAllItems()
        
        XCTAssertEqual(sut.toDoCount, 0, "toDoCount should be 0")
        XCTAssertEqual(sut.doneCount, 0, "doneCount should be 0")
    }
    
    func testAddingTheSameItem_DoesNotIncreaseCount() {
        sut.addItem(ToDoItem(title: "First"))
        sut.addItem(ToDoItem(title: "First"))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
}
