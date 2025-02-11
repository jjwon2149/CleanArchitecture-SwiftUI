//
//  User.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var email: String
}
