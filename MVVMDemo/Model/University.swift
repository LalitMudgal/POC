//
//  University.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import Foundation
struct Universities: Codable {
    let records: [University]
}

struct University: Codable {
    let university_name: String
    let description: String?
    let created_at: Date
    let university_image: String
}
