//
//  Demo1.swift
//  SwiftUIDemo
//
//  Created by Admin on 19/09/23.
//

import SwiftUI

struct Demo1: View {
    var body: some View {
        let data: [String] = ["Hi", "Hello", "Test", "Data"]
        
        ScrollView(.vertical, showsIndicators: false){
        LazyVStack(spacing : 10){
            ForEach(data.indices, id: \.self) { index in
                Text("\(index): \(data[index])")
                        .font(.system(size: 20,weight: .bold))
            }
            
            ForEach(0..<5) { index in
                ScrollView(.horizontal, showsIndicators: false,content: {
                    LazyHStack{
                        ForEach(0..<20) { inx in
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .overlay(
                                    Image((index < 2 && inx < 10) ? "cloudy" : "rainy-day")
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fit)
                                )
                                
                        }
                    }
                })
            }
            Spacer()
        }
        }

    }
}

struct Demo1_Previews: PreviewProvider {
    static var previews: some View {
        Demo1()
    }
}
