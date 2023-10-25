//
//  ChatView.swift
//  SwiftUIDemo
//
//  Created by Admin on 23/09/23.
//

import SwiftUI

struct ChatView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            
            Spacer()
            Text("Chat View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
