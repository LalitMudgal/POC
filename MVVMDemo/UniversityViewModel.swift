//
//  UniversityViewModel.swift
//  MVVMDemo
//
//  Created by Lalit on 02/03/19.
//  Copyright © 2018 Tutorial. All rights reserved.
//

import Foundation

struct UniversityViewModel: Codable {
    let university_name: String
    let description: String?
    let created_at: String
    let university_image: String
    
    init(university_name : String, description : String, created_at : String, university_image : String) {
        self.university_name = university_name
        self.description = description
        self.created_at = created_at
        self.university_image = university_image
    }

}
