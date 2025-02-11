//
//  UserRemoteDataSource.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import Foundation
import Combine

class UserRemoteDataSource {
    
    func fetchUsers() -> AnyPublisher<[User], Error> {
        guard let url = URL(string: Endpoints.users) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
