//
//  APIViewModel.swift
//  SwiftUIDemo
//
//  Created by Admin on 18/10/23.
//

import Foundation

class APIViewModel : ObservableObject{
    @Published var clients = [Client]()
    
    init(){
        getUsers { [weak self] clients in
                    self?.clients = clients
                }
    }
    
    func getUsers(completion:@escaping ([Client]) -> ()){
        guard let url = URL(string: "https://api.github.com/users") else {
                    print("Invalid url...")
                    return
                }
                URLSession.shared.dataTask(with: url) { data, response, error in
                    let client = try! JSONDecoder().decode([Client].self, from: data!)
                    print(client)
                    DispatchQueue.main.async {
                        completion(client)
                    }
                }.resume()
    }
}
