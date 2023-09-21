//
//  AddUser.swift
//  CoreData_SwiftUI
//
//  Created by Admin on 31/08/23.
//

import SwiftUI
import CoreData

struct AddUser: View {
    var user: User?
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    @State private var phoneno: String = ""
    var title: String = ""

    init(usr: User?) {
        user = usr
        _firstname = State(initialValue: user?.firstname ?? "")
        _lastname = State(initialValue: user?.lastname ?? "")
        _email = State(initialValue: user?.email ?? "")
        _phoneno = State(initialValue: user?.mobileno ?? "")
        if user == nil {
            title = "Add User"
        } else {
            title = "Edit User"
        }
    }
    
    var body: some View {
            VStack(alignment:.leading,spacing: 20) {
                Label(title, systemImage: "")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 26, weight: .bold))
                
                TextField("First Name", text: $firstname)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                TextField("Last Name", text: $lastname)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                TextField("Email", text: $email)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .onChange(of: email) { newEmail in
                        email = newEmail.lowercased()
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                TextField("Phone no", text: $phoneno)
                    .keyboardType(.numberPad)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                Button {
                    saveOrUpdateUser()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity, minHeight: 40)
                }
                .background(Color.secondary)
                .cornerRadius(10)
            }
            .padding()
            Spacer()
        
    }

    private func saveOrUpdateUser() {
            if let existingUser = user {
                existingUser.firstname = firstname
                existingUser.lastname = lastname
                existingUser.email = email
                existingUser.mobileno = phoneno
            } else {
                let newUser = User(context: viewContext)
                newUser.firstname = firstname
                newUser.lastname = lastname
                newUser.email = email
                newUser.mobileno = phoneno
            }
            do {
                try viewContext.save()
                
            } catch {
                print("Failed to save user: \(error)")
            }
        }
}

struct AddUser_Previews: PreviewProvider {
    static var previews: some View {
        AddUser(usr: nil)
    }
}
