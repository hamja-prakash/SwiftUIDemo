//
//  SafeareaDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 21/09/23.
//

import SwiftUI

struct SafeareaDemo: View {
    
    @State var title : String =  "this is title"
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea(edges:.bottom)
            
            contentLayer

        }
    }
    
    var contentLayer: some View{
        VStack(spacing:20){
            Text(title)
                .foregroundColor(.white)
            
            Button("Press 1") {
                displayTitle(buttonTapped: .button1)
//                    self.title = "Button 1 was Pressed"
            }
            .accentColor(.red)
            
            Button(action: {
                displayTitle(buttonTapped: .button2)
//                    self.title = "Button 2 was Pressed"
            }) {
                Text("Press 2")
                    .foregroundColor(.black)
                    .padding()
                    .background(
                        Color.white
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            
            Button(action: {
                displayTitle(buttonTapped: .button3)
//                    self.title = "Button 3 was Pressed"
            }) {
                Text("Press 3")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Capsule()
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
        }
    }
    
    func displayTitle(buttonTapped:ButtonTapped) {
        switch buttonTapped{
        case .button1:
            self.title = "Button 1 was Pressed"
        case .button2:
            self.title = "Button 2 was Pressed"
        case .button3:
            self.title = "Button 3 was Pressed"
        }
    }
    
    //       VStack{
    //            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //                .padding(.top,40)
    //            Spacer()
    //        }
    //            .ignoresSafeArea(edges:.top)
    //            .frame(maxWidth: .infinity , maxHeight: .infinity)
    //            .background(.red)
    //
    //    }
    //}
}

struct SafeareaDemo_Previews: PreviewProvider {
    static var previews: some View {
        SafeareaDemo()
    }
}
