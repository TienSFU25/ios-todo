//
//  LocationTests.swift
//  ToAssDo
//
//  Created by MSFTCambie on 4/18/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import XCTest
@testable import ToAssDo
import CoreLocation

class LocationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldSetNameAndCoordinate() {
        let coordy = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordy)
        
        XCTAssertEqual(location.coordinate?.latitude,
                       coordy.latitude,
                       "dcm lat")
        
        XCTAssertEqual(location.coordinate?.longitude,
                       coordy.longitude,
                       "dcm long")
    }
    
    func testInit_ShouldSetName() {
        let location = Location(name: "something")
        
        XCTAssertEqual(location.name, "something", "No name")
    }
    
    func testEqualLocs_ShouldBeEqual() {
        let first = Location(name: "home")
        let second = Location(name: "home")
        
        XCTAssertEqual(first, second, "should be eq")
    }
    
    func testWhenLatitudeDiff_ShouldNotBeEqual() {
        performNotEqualTestWithLocationProperties ("Home",
                                                   secondName: "Home",
                                                   firstLongLat: (1.0, 0.0),
                                                   secondLongLat: (0.0, 0.0))
    }

    func testWhenLongitudeDiff_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home",
                                                  secondName: "Home",
                                                  firstLongLat: (0.0, 1.0),
                                                  secondLongLat: (0.0, 0.0))
    }
    
    func performNotEqualTestWithLocationProperties(firstName: String,
                                                   secondName: String,
                                                   firstLongLat: (Double, Double)?,
                                                   secondLongLat: (Double, Double)?,
                                                   line: UInt = #line) {
        
        let firstCoord: CLLocationCoordinate2D?
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(
                latitude: firstLongLat.0,
                longitude: firstLongLat.1)
        } else {
            firstCoord = nil
        }
        let firstLocation = Location(name: firstName,
                                     coordinate: firstCoord)
        
        let secondCoord: CLLocationCoordinate2D?
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(
                latitude: secondLongLat.0,
                longitude: secondLongLat.1)
        } else {
            secondCoord = nil
        }
        let secondLocation = Location(name: secondName,
                                      coordinate: secondCoord)
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
    
    func testWhenOneHasCoordinateAndTheOtherDoesnt_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home",
                                                  secondName: "Home",
                                                  firstLongLat: (0.0, 0.0),
                                                  secondLongLat: nil)
    }
    
    func testWhenNameDiff_ShouldBeNotEqual() {
        performNotEqualTestWithLocationProperties("Home",
                                                  secondName: "Office",
                                                  firstLongLat: nil,
                                                  secondLongLat: nil)
    }
    
    func testWhenOneLocationIsNilAndTheOtherIsnt_ShouldBeNotEqual() {
        var firstItem = ToDoItem(title: "First title",
                                 itemDescription: "First description",
                                 timestamp: 0.0,
                                 location: nil)
        var secondItem = ToDoItem(title: "First title",
                                  itemDescription: "First description",
                                  timestamp: 0.0,
                                  location: Location(name: "Office"))
        
        XCTAssertNotEqual(firstItem, secondItem)
        
        firstItem = ToDoItem(title: "First title",
                             itemDescription: "First description",
                             timestamp: 0.0,
                             location: Location(name: "Home"))
        secondItem = ToDoItem(title: "First title",
                              itemDescription: "First description",
                              timestamp: 0.0,
                              location: nil)

        XCTAssertNotEqual(firstItem, secondItem)
    }
    
    func testWhenTimestampDiff_ShouldBeNotEqual() {
        let firstItem = ToDoItem(title: "First title",
                                 itemDescription: "First description",
                                 timestamp: 1.0)
        let secondItem = ToDoItem(title: "First title",
                                  itemDescription: "First description",
                                  timestamp: 0.0)
        
        XCTAssertNotEqual(firstItem, secondItem)
    }
}
