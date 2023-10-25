//
//  WhetherButton.swift
//  SwiftUIDemo
//
//  Created by Admin on 25/08/23.
//

import SwiftUI

struct wheatherButtonView : View{
    var btntext : String
    var backgroundcolor : Color
    var textcolor : Color
    var body: some View{
        Text(btntext)
            .frame(width: 300, height: 50)
            .background(backgroundcolor)
            .foregroundColor(textcolor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct SearchBar : View{
    @Binding var searchText : String
    var searchType : String
    var body: some View{
    HStack{
        Image(systemName:"magnifyingglass")
            .foregroundColor(.gray)
        
        TextField("Search \(searchType)",text:$searchText)
            .foregroundColor(Color.black)
        
        Image(systemName:"xmark.circle.fill")
            .padding()
            .offset(x: 20)
            .foregroundColor(.secondary)
            .opacity(searchText.isEmpty ? 0 : 1)
            .onTapGesture{ searchText = ""}
    }
    .frame(height: 40)
    .font(.headline)
    .padding(.horizontal,10)
    .background(
        RoundedRectangle(cornerRadius:10)
            .stroke(Color.gray, lineWidth: 1)
            .shadow(color: .secondary.opacity(0.15), radius: 10, x: 0, y: 0)
    )
    .padding(.horizontal,10)
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

enum Fruits{
    case apple
    case orange
}

enum ButtonTapped {
    case button1
    case button2
    case button3
}

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case favorite
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .favorite:
            return "heart"
        case .chat:
            return "chat"
        case .profile:
            return "resume"
        }
    }
}
