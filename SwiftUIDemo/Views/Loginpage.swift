//
//  Loginpage.swift
//  SwiftUIDemo
//
//  Created by Admin on 28/08/23.
//

import SwiftUI

struct Loginpage: View {
    @State private var userName : String = String()
    @State private var userPassword : String = String()
    @State private var isActive : Bool = false
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue,.white]), startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20){
                    Text("Login")
                        .font(.system(size: 32,weight: .bold))
                        .foregroundColor(.white)
                    
                    TextField("", text: $userName)
                        .placeholder(when: userName.isEmpty) {
                            Text("User Name").foregroundColor(.white)}
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .frame(height: 50)
                        .font(.system(size:16, weight:.medium))
                        .foregroundColor(.white)
                    
                    SecureField("", text: $userPassword)
                        .placeholder(when: userPassword.isEmpty) {
                            Text("Password")
                            .foregroundColor(.white)}
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                        )
                        .font(.system(size:16, weight:.medium))
                        .foregroundColor(.white)
                        .frame(height: 50)
                    
                    Button {
                        isActive = true
                    }
                label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .frame(maxWidth: .infinity, minHeight: 50)
                }
                .background(.secondary)
                .cornerRadius(10)
                    
                    NavigationLink(destination: HomePage(), isActive: $isActive) {EmptyView()}
                }.padding()
            }
        }
    }
}

struct Loginpage_Previews: PreviewProvider {
    static var previews: some View {
        Loginpage()
    }
}

