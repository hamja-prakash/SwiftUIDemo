//
//  PersistenceController.swift
//  CoreData_SwiftUI
//
//  Created by Admin on 31/08/23.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Users")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
    
    func SaveEditUser(firstname:String, LastName:String,Email:String,Phoneno:String)
        {
                let user = User(context: container.viewContext)
                user.firstname = firstname
                user.lastname = LastName
                user.email = Email
                user.mobileno = Phoneno
            
            do{
                try container.viewContext.save()
            }catch{
                print("failed to saved user \(error)")
            }
            
        }
    
    func deleteUser(_ user: User) {
        container.viewContext.delete(user)
        do {
            try container.viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
}
