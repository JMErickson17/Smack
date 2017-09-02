//
//  Channel.swift
//  Smack
//
//  Created by Justin Erickson on 9/2/17.
//  Copyright © 2017 Justin Erickson. All rights reserved.
//
// The Channel struct conforms to the Decodable protocol which makes it possible to encode and decode JSON objects in native Swift
// The data structure must mirror the JSON object that it is encoding or decoding

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int!
}
