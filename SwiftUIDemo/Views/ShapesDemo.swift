import SwiftUI

struct ShapesDemo: View {
    @Environment(\.presentationMode) var presentationMode
    let backgroundcolor : Color?
    let count : Int?
    let title : String?
    
    init(count: Int?, fruit: Fruits?) {
        //self.backgroundcolor = backgroundcolor
        self.count = count
        switch fruit {
            case .apple:
                self.backgroundcolor = .red
                self.title = "Apple"
            case .orange:
                self.backgroundcolor = .purple
                self.title = "Orange"
            case .none:
                self.backgroundcolor = nil
                self.title = nil
            }
    }
    
    var body: some View {
            VStack {
                HStack(){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("gear button clicked")
                    }) {
                        Image(systemName: "gear")
                            .font(.title)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .font(.title)
                .padding(.horizontal,20)
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
                    .padding(.vertical,10)
                    .padding(.bottom,10)
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.horizontal)
                
                ScrollView (showsIndicators: false){
                    
                VStack(alignment: .center, spacing: 20) {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("CustomColor"))
                        .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: 10, y: -10)
                        .frame(width: 300, height: 100)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(LinearGradient(
                            colors: [.red ,.blue],
                            startPoint: .leading,
                            endPoint: .trailing))
                        .frame(width: 300, height: 100)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.red, .blue]),
                            center: .center,
                            startRadius: 5,
                            endRadius: 100))
                        .frame(width: 300, height: 100)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(AngularGradient(
                            colors: [.orange, .green],
                            center: .center,
                            angle: .degrees(0))
                        )
                        .frame(width: 300, height: 100)
                    
                    Circle()
                        .fill(Color.pink)
                        .frame(width: 100, height: 100, alignment: .center)
                        .overlay(
                            Text("1")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                        )
                        .background(
                            Circle()
                                .foregroundColor(.purple)
                                .frame(width: 110, height: 110, alignment: .center)
                        )
                    
                    Spacer(minLength: 20) // Add spacer between the Circle and Image
                    
                    Image("rainy-day")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .background(
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 120, height: 120, alignment: .center)
                        )
                    
                    Spacer(minLength: 20)
                    
                    VStack{
                        Text("\(count ?? 0)")
                            .font(.largeTitle)
                            .underline()
                        Text("\(title ?? "")")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                    .background(backgroundcolor)
                    .cornerRadius(10)
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct ShapesDemo_Previews: PreviewProvider {
    static var previews: some View {
            ShapesDemo(count: nil, fruit: nil)
        }
    }

