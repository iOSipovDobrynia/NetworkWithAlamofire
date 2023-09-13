//
//  Course.swift
//  NetworkWithAlamofire
//
//  Created by Goodwasp on 12.09.2023.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: String
    let numberOfLessons: Int
    let numberOfTests: Int
}
