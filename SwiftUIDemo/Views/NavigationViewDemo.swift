//
//  NavigationViewDemo.swift
//  SwiftUIDemo
//
//  Created by Parvez Pathan on 24/10/23.
//

import SwiftUI

struct NavigationViewDemo: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello, world!", destination: OtherScreen())
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .navigationTitle("All Inboxes")
//            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct OtherScreen : View {
    
    @State var showalert : Bool = false
    @State var backgroundcolor : Color = .yellow
    @State var alertType : AlertType? = nil
    enum AlertType {
        case Success
        case Error
    }
    
    var body: some View {
        ZStack {
            backgroundcolor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Button("Success") {
                    alertType = .Success
                    showalert.toggle()
                }
                
                Button("Error") {
                    alertType = .Error
                    showalert.toggle()
                }
            }
            .alert(isPresented: $showalert) {
                getAlert()
            }
            
//            Button {
//                showalert.toggle()
//            } label: {
//                Text("Click here..")
//                    .foregroundColor(.black)
//                    .font(.headline)
//                    .padding(10)
//                    .background(Color.white.cornerRadius(10))
//            }
//            .alert(isPresented: $showalert) {
//                getAlert()
//            }

        }
        .navigationBarBackButtonHidden(true)
    }
    
    func getAlert() -> Alert {
        switch alertType {
        case .Success:
            return Alert(title: Text("This is success message"))
        case .Error:
            return Alert(title: Text("This is error message"))
        case nil:
            return Alert(title: Text("Error"))
        }
//        return Alert(
//            title: Text("This is Title"),
//            message: Text("Something went wrong.."),
//            primaryButton: .destructive(Text("OK"), action: {
//                backgroundcolor = .red
//            }),
//            secondaryButton: .cancel())
    }
}

#Preview {
    NavigationViewDemo()
}
