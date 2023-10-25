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
