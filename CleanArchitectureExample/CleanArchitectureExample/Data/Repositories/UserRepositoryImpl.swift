//
//  UserRepositoryImpl.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import Foundation
import Combine

class UserRepositoryImpl: UserRepository {
    private let remoteDataSource: UserRemoteDataSource
    
    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func fetchUser() -> AnyPublisher<[User], any Error> {
        return remoteDataSource.fetchUsers()
    }
    
    
}
