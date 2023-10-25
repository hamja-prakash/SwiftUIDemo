//
//  AnimationDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 17/10/23.
//

import SwiftUI

struct AnimationDemo: View {
    @State var isAnimate : Bool = false
    @State var isAnimating : Bool = false
    
    var body: some View {
        VStack{
            Button("Click") {
//                withAnimation(Animation.default.delay(2.0)){
//                withAnimation(Animation.default.repeatCount(5, autoreverses: false)){
                isAnimate.toggle()
            }
            RoundedRectangle(cornerRadius: isAnimate ? 50 : 25)
                .fill(isAnimate ? Color.red : Color.blue)
                .frame(
                    width: isAnimate ? 100 : 200,
                    height: isAnimate ? 100 : 200)
                .rotationEffect(Angle(degrees: isAnimate ? 360 : 0))
                .offset(y: isAnimate ? 100 : 0)
                .animation(.default.repeatForever(autoreverses:true), value: isAnimate)
            
            
            Button("Animate") {
                isAnimating.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 300 : 50, height: 100)
                .animation(.spring(response: 1.0, dampingFraction: 0.5, blendDuration: 1.0), value: isAnimating)
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 300 : 50, height: 100)
//                .animation(.linear(duration: 5), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 300 : 50, height: 100)
//                .animation(.easeIn(duration: 5), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 300 : 50, height: 100)
//                .animation(.easeInOut(duration: 5), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 300 : 50, height: 100)
//                .animation(.easeInOut(duration: 5), value: isAnimating)
            
            Spacer()
        }
    }
}

struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
