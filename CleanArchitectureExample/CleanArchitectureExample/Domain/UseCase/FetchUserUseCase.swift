//
//  FetchUserUseCase.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import Foundation
import Combine

class FetchUserUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[User], Error> {
        return repository.fetchUser()
    }
}
