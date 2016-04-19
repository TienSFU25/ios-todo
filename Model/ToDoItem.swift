//
//  ToDoItem.swift
//  ToAssDo
//
//  Created by MSFTCambie on 4/18/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import Foundation

struct ToDoItem : Equatable {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?

    init(title: String,
         itemDescription: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {

        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    return (lhs.title == rhs.title
        && lhs.itemDescription == rhs.itemDescription
        && lhs.timestamp == rhs.timestamp
        && lhs.location == rhs.location)
}