//
//  ContentView.swift
//  CleanArchitectureExample
//
//  Created by 정종원 on 2/11/25.
//

import SwiftUI
import Combine

struct UserListView: View {
    @StateObject var viewModel: UserListVIewModel
    
    var body: some View {
        NavigationView{
            List(viewModel.users) { user in
                UserRowView(user: user)
            }
            .navigationTitle("Users")
            .overlay (
                Group {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                    }
                }
            )
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

struct UserRowView: View {
    let user: User

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

//
//#Preview {
//    UserListView()
//}
