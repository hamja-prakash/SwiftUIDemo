//
//  FavoriteView.swift
//  SwiftUIDemo
//
//  Created by Admin on 23/09/23.
//

import SwiftUI

struct FavoriteView: View {
    
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
            Text("Favorite View")
            Spacer()
        }
        .padding(.horizontal, 24)
    }
}
