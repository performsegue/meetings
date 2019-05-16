//
//  Meeting.swift
//  Meetings
//
//  Created by Bharath  Raj kumar on 10/02/19.
//  Copyright © 2019 Bharath Raj Kumar. All rights reserved.
//

import Foundation

struct Meeting: Decodable
{
    let title: String
    let Address: String
    let startTime: String
    let endTime: String
}
