//
//  UserListVIewModel.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import Foundation
import Combine

class UserListVIewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let fetchUserUserCase: FetchUserUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchUserUserCase: FetchUserUseCase) {
        self.fetchUserUserCase = fetchUserUserCase
        fetchUsers()
    }
    
    func fetchUsers() {
        isLoading = true
        fetchUserUserCase.execute()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] users in
                self?.users = users
            })
            .store(in: &cancellables)
    }
}
