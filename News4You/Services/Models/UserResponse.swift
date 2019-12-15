//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Admin on 01.12.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let firstName: String
    let lastName: String
    let photo100: String?

    var name: String { return firstName + " " + lastName }
}
