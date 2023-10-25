//
//  SheetDemo.swift
//  SwiftUIDemo
//
//  Created by Parvez Pathan on 24/10/23.
//

import SwiftUI

struct SheetDemo: View {
    
    @State var showsheet : Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea(.all)
            
            VStack {
                Button {
                    showsheet.toggle()
                } label: {
                    Text("Click here..")
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(10)
                        .background(Color.white.cornerRadius(10))
                }
                Spacer()
            }
            
            //                    Method - 1 => Sheet
            
            //                    .sheet(isPresented: $showsheet) {
            //                        secondScreen(showSheet: $showsheet)
            //                    }
            
            //        .fullScreenCover(isPresented: $showsheet, content: {
            //            secondScreen()
            //        })
            
            
            //            Method - 2 => Transition
            //            if showsheet {
            //                secondScreen(showSheet: $showsheet)
            //                    .transition(.move(edge: .bottom))
            //                    .animation(.spring())
            //            }
            
            //            Method - 3 => Animation offset
            secondScreen(showSheet: $showsheet)
                .offset(y: showsheet ? 0 : UIScreen.main.bounds.height)
                .animation(.spring())
            
        }
    }
}

struct secondScreen : View {
    //    @Environment(\.presentationMode) var PresentationMode
    @Binding var showSheet: Bool
    var body: some View {
        ZStack(alignment: .center){
            Color.black
                .opacity(0.5)
                .ignoresSafeArea(.all)
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Button {
                        showSheet.toggle()
                        // PresentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(10)
                    }
                }
                Spacer()
            }
            .frame(height: 300)
            .background(.gray)
            .padding(20)
        }
    }
}

#Preview {
    SheetDemo()
}
