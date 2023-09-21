//
//  HomePage.swift
//  SwiftUIDemo
//
//  Created by Admin on 11/09/23.
//

import SwiftUI

struct HomePage: View {
    @State private var isActive : Bool = false
        var body: some View {
                VStack(spacing: 20) {
                    NavigationLink(destination: ContentView(), isActive: $isActive) {
                        EmptyView()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .opacity(0) // Hide the navigation link view
                    Button(action: {
                        isActive = true // Navigate to Page 1
                    }) {
                        Text("Weather Demo")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .background(Color(red: 0.0, green: 0.5, blue: 0.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)

                    NavigationLink(destination: ListviewDemo()) {
                        Text("Listview Demo")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .background(Color(red: 0.0, green: 0.5, blue: 0.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    
                    NavigationLink(destination: ShapesDemo(count: 100, fruit: .apple)) {
                        Text("Shapes Demo")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .background(Color(red: 0.0, green: 0.5, blue: 0.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    
                    NavigationLink(destination: Demo1()) {
                        Text("Demo1")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .background(Color(red: 0.0, green: 0.5, blue: 0.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    
                    NavigationLink(destination: LazyGridDemo()) {
                        Text("LazyGrid Demo")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .background(Color(red: 0.0, green: 0.5, blue: 0.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                    
                    NavigationLink(destination: CoreDataDemo()) {
                        Text("CoreData Demo")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, minHeight: 40)
                    }
                    .background(Color(red: 0.0, green: 0.5, blue: 0.0))
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
    }

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
