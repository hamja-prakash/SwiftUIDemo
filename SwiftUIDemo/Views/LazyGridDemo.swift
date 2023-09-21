//
//  LazyGridDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 19/09/23.
//

import SwiftUI

struct LazyGridDemo: View {
    
    let columns : [GridItem] = [
        
        //        It is used when we want to fixed size of Grid
        
        //        GridItem(.fixed(50), spacing: nil, alignment: nil),
        //        GridItem(.fixed(75), spacing: nil, alignment: nil),
        //        GridItem(.fixed(100), spacing: nil, alignment: nil),
        //        GridItem(.fixed(75), spacing: nil, alignment: nil),
        //        GridItem(.fixed(50), spacing: nil, alignment: nil),
        
        //        It is used when we want to flexible Grid means it display depends on the screen width
        
        //        GridItem(.flexible(), spacing: nil, alignment: nil),
        //        GridItem(.flexible(), spacing: nil, alignment: nil),
        //        GridItem(.flexible(), spacing: nil, alignment: nil),
        //        GridItem(.flexible(), spacing: nil, alignment: nil),
        //        GridItem(.flexible(), spacing: nil, alignment: nil),
        
        //        It is used when we want to get a Grid in a single line
        
        //        GridItem(.adaptive(minimum: 10, maximum: 200), spacing: nil, alignment: nil),
        //        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: nil, alignment: nil)
        
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]
    var body: some View {
        ScrollView(showsIndicators: false){
            Rectangle()
                .fill(.white)
                .frame(height: 300)
                .overlay(
                Image("img1")
                    .resizable()
                )
            
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders]) {
                Section(header:
                            Text("Cats")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(.blue)
                ) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(.purple)
                            .frame(height: 150)
                            .overlay(
                                Image("cat")
                                    .resizable()
                            )
                    }
                }
                
                Section(header:
                            Text("Dogs")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(.blue)
                ) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .fill(.green)
                            .frame(height: 150)
                            .overlay(
                                Image("dog")
                                    .resizable()
                            )
                    }
                }
            }
        }
    }
}

struct LazyGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridDemo()
    }
}
