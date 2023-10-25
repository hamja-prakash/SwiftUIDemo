import SwiftUI

struct HomeView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image("menu")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .padding(.leading, 16)
                Spacer()
                
            }
            .frame(height: 50)
            .background(Color.gray.opacity(0.3))

            Spacer()
            
            Text("Home View")
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}
