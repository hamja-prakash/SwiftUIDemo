//
//  CoreDataDemoViewModel.swift
//  SwiftUIDemo
//
//  Created by Admin on 20/09/23.
//

import Foundation

class CoreDataViewModel : ObservableObject{

    @Published var SearchText:String = ""
    var mUsers : [User] = []
    
//    init(users: [User]) {
//        mUsers = users
//    }
    
//    private var filteredUsers: [User] {
//        let searchTextLowercased = SearchText.lowercased()
//        
//        if searchTextLowercased.isEmpty {
//            return Array(mUsers)
//        } else {
//            let filtered = mUsers.filter { user in
//                let userFirstname = (user.firstname ?? "").lowercased()
//                let userLastname = (user.lastname ?? "").lowercased()
//               
//                return userFirstname.contains(searchTextLowercased) ||
//                       userLastname.contains(searchTextLowercased)
//            }
//            
//            if filtered.isEmpty {
//                return []
//            } else {
//                return Array(filtered)
//            }
//        }
//    }
}
