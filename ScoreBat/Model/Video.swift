//
//  Video.swift
//  ScoreBat
//
//  Created by teneocto on 06/07/2021.
//

import Foundation

struct Video: Codable {
    var title: String
    var thumbnail: String
    var embed: String
    var competition: Competition
    var date: String
}

struct Competition: Codable {
    var id: Int
    var name: String
}
