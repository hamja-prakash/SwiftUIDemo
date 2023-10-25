//
//  ExtractSubViewDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 22/09/23.
//

import SwiftUI

struct ExtractSubViewDemo: View {
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea(edges:.bottom)
            contentView
        }
    }
    
    var contentView: some View{
        HStack{
            CommonView(cnt: 1, title: "Apple", clr: .red)
            CommonView(cnt: 2, title: "Orange", clr: .orange)
            CommonView(cnt: 3, title: "Banana", clr: .yellow)
        }
    }
}

struct ExtractSubViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewDemo()
    }
}

struct CommonView: View {
    
    let cnt: Int
    let title: String
    let clr: Color
    
    var body: some View {
        VStack{
            Text("\(cnt)")
            Text(title)
        }
        .padding()
        .background(clr
            .cornerRadius(10))
    }
}
