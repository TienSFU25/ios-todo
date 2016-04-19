//
//  ItemListViewControllerTests.swift
//  ToAssDo
//
//  Created by MSFTCambie on 4/18/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import XCTest
@testable import ToAssDo

class ItemListViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        let sut = ItemListViewController()
        
        _ = sut.view
        XCTAssertNotNil(sut.tableView)
    }
}
