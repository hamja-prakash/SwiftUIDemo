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
        ScrollView {
            VStack(spacing: 20) {
                Group{
                    CommonNavigationLink(label: "Weather Demo") {
                        ContentView()
                    }
                    
                    CommonNavigationLink(label: "Listview Demo") {
                        ListviewDemo()
                    }
                    
                    CommonNavigationLink(label: "Shapes Demo") {
                        ShapesDemo(count: 100, fruit: .apple)
                    }
                    
                    CommonNavigationLink(label: "Demo1") {
                        Demo1()
                    }
                    
                    CommonNavigationLink(label: "LazyGrid Demo") {
                        LazyGridDemo()
                    }
                    
                    CommonNavigationLink(label: "CoreData Demo") {
                        CoreDataDemo()
                    }
                    
                    CommonNavigationLink(label: "Safearea Demo") {
                        SafeareaDemo()
                    }
                    
                    CommonNavigationLink(label: "ExtractSubview Demo") {
                        ExtractSubViewDemo()
                    }
                    
                    CommonNavigationLink(label: "BindingProperty Demo") {
                        BindingPropertyDemo()
                    }
                    
                    CommonNavigationLink(label: "Animation Demo") {
                        AnimationDemo()
                    }
                }
                
                Group {
                    CommonNavigationLink(label: "Transition Demo") {
                        TransitionDemo()
                    }
                    
                    CommonNavigationLink(label: "API Integration Demo") {
                        API_IntegrationDemo()
                    }
                    
                    CommonNavigationLink(label: "Sheet Demo") {
                        SheetDemo()
                    }
                    
                    CommonNavigationLink(label: "NavigationView Demo") {
                        NavigationViewDemo()
                    }
                }
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    struct CommonNavigationLink<Destination: View>: View {
        let label: String
        let destination: Destination
        
        init(label: String, @ViewBuilder destination: () -> Destination) {
            self.label = label
            self.destination = destination()
        }
        
        var body: some View {
            NavigationLink(destination: destination) {
                Text(label)
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .commonButtonStyle()
            }
        }
    }
}

extension View {
    func commonButtonStyle() -> some View {
        self
            .background(Color(red: 0.0, green: 0.5, blue: 0.0))
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
