//
//  UserRepository.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import Foundation
import Combine

protocol UserRepository {
    func fetchUser() -> AnyPublisher<[User], Error>
}
