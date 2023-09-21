//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Admin on 24/08/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    var body: some Scene {
        let persistenceController = PersistenceController.shared
        WindowGroup {
           Loginpage()
                .environment(\.managedObjectContext,
                             persistenceController.container.viewContext)
        }
    }
}
