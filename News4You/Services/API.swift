//
//  API.swift
//  VKNewsFeed
//
//  Created by Admin on 17.11.2019.
//  Copyright © 2019 Aleksei Kakoulin. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.103"

    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"

}
