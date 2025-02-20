//
//  PhotoInfo.swift
//  About-me
//
//  Created by Trần Quang Tuấn on 28/7/24.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
}


