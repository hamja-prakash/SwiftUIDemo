//
//  BindingPropertyDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 22/09/23.
//

import SwiftUI

struct BindingPropertyDemo: View {
    
    @State var background : Color = .green
    @State var title: String = "Hello"
    var body: some View {
        ZStack{
            background
            VStack{
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                ButtonView(background: $background, title: $title)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
}

struct ButtonView: View{
    
    @Binding var background: Color
    @State var btncolor: Color = .blue
    @Binding var title: String
    
    var body: some View{
        Button {
            background = .red
            btncolor = .orange
            title = "Another Page"
        } label: {
            Text("Press")
                .foregroundColor(.white)
                .padding()
                .background(btncolor)
                .cornerRadius(10)
        }
    }
}

struct BindingPropertyDemo_Previews: PreviewProvider {
    static var previews: some View {
        BindingPropertyDemo()
    }
}
