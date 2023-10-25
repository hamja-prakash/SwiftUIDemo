//
//  TransitionDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 17/10/23.
//

import SwiftUI

struct TransitionDemo: View {
    @State var isShowView: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button("Tap") {
                    isShowView.toggle()
                }
                
                Spacer()
                
                if isShowView {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                        .transition(AnyTransition.scale.animation(.easeInOut))
                    
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal:AnyTransition.opacity.animation(.easeInOut)))
                        .animation(.easeInOut)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TransitionDemo_Previews: PreviewProvider {
    static var previews: some View {
        TransitionDemo()
    }
}
